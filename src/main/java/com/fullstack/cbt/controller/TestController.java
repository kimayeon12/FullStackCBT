
package com.fullstack.cbt.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fullstack.cbt.dto.PageMakerDTO;
import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.dto.SubjectChapterDTO;
import com.fullstack.cbt.dto.SubjectDTO;
import com.fullstack.cbt.dto.TestDTO;
import com.fullstack.cbt.service.TestService;

@Controller
public class TestController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired TestService service;
	
	@RequestMapping(value = "/testStart.do", method = RequestMethod.GET)
	public String testStart(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			logger.info("등록된 과목 가져오기");
			ArrayList<SubjectDTO> subjectList =service.subjectList();
			logger.info("등록된 과목 :" +subjectList.size());
			  
			if(subjectList.size() > 0) {
				 model.addAttribute("subjectList", subjectList);
			}
		} else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		  
		return "testStart";
	}	
	
	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public String test(Model model, @RequestParam String su_idx, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			logger.info("과목 선택하기");
			logger.info("선택한 과목 고유번호 : " + su_idx);
			
			ArrayList<SubjectChapterDTO> subjChap = service.subjectChapterList(su_idx);//선택한 과목에 대한 과목 단원수(단, 출제된 문제 데이터가 있을 경우) 가져오기
			
			/* 시험문제 출제 알고리즘 - 랜덤 방식, 과목 단원 및 난이도별로 문제 출제, 기존에 출제되었던 문제는 빈도를 낮추어 총 10문제가 출제되어야 한다.
			 * 랜덤 방식 - SQL 랜덤으로 가져오는 방식 적용(랜덤으로 가져와야 우선순위가 계속 변동된다)
			 * 과목 단원별 출제 - 사용자가 선택한 과목의 총 과목 단원수를 구해와서 출제할 총 문제수(10개)를 나눔(그래야 골고루 출제가 된다.)
			 * 난이도별 출제 - 난이도는 상/중/하로 나누어 각각 3/3/4로 균등하게 출제할 수 있다.
			 * 기존에 출제되었던 문제는 일단 제외 시키는 로직이다. 해당 단원에서 3회 추가 문제 출제 요청을 한다.(추가 문제 출제도 없을 경우 난이도는 변경 없이 다음 단원으로 넘어간다)
			 */
			
			ArrayList<ProblemDTO> problemList = new ArrayList<ProblemDTO>();//출제될 문제 목록
			session.setAttribute("testStart", service.getCurrentTimestamp());
			
			//초기 문제의 난이도는 상/중/하 중 랜덤으로 설정하기 위해서
			Random rd = new Random();
	        String randomLevel = "상중하";
			char problemLevel = randomLevel.charAt(rd.nextInt(randomLevel.length()));
			
			//문제출제를 위한 무한반복문
			while(problemList.size() < 10) {
				for(int i=0; i<(int) Math.ceil(10 / subjChap.size()); i++) {
					//문제수 초과 방지 코드
					if(problemList.size() >= 10) {
						break;
					}
					
					//선택한 과목의 과목단원별로 등록된 문제 데이터 가져오기
					for(int j=0; j<subjChap.size(); j++) {
						//문제수 초과 방지 코드
						if(problemList.size() >= 10) {
							break;
						}
						
						try {
							//서비스에 요청하기 위한 해시맵 생성
							HashMap<String, Object> map = new HashMap<String, Object>();
							map.put("su_idx", su_idx);
							map.put("sc_idx", subjChap.get(j).getSc_idx());
							map.put("pc_difficulty", problemLevel);
							
							List<Integer> idx = new ArrayList<Integer>();
							for (ProblemDTO item : problemList) {
								if(item != null) {
									idx.add(item.getPc_idx());
								}
							}
							map.put("problemList", idx);
							
							//과목단원/난이도에 맞는 문제 데이터를 랜덤으로 가져오기
							ProblemDTO problem = service.getProblem(map);
							
							//아래 로직은 출제되었던 문제 빈도수를 낮추기 위한 로직이다
							int k = 0;
							while(k<3) {
								k++;
								
								//이전에 출제되었던 문제인지 확인하기
								int isBeforeCnt = service.isBeforeProblem(problem.getPc_idx(), loginId);
								
								if(isBeforeCnt < 1) {//출제되었던 문제가 아니라면
									break;//계속 진행
								} else {//출제된 문제라면
									idx.add(problem.getPc_idx());
									map.put("problemList", idx);//해당 문제를 제외하기
									
									problem = service.getProblem(map);//서비스에 문제출제 재요청
								}
							}
							
							//출제될 문제 목록에 삽입
							if(problem != null) {
								problemList.add(problem);
							}
							
							//난이도별 출제를 위해서 다음 문제의 난이도 설정하는 부분
							switch(problemLevel) {
							case '상':
								problemLevel = '중';
								break;
								
							case '중':
								problemLevel = '하';
								break;
								
							case '하':
								problemLevel = '상';
								break;
								
							default:
								break;
							}
						} catch (NullPointerException e) {
							continue;
						}
						
					}
				}
				
				//문제출제 알고리즘에 의한 필터를 거친 로직에 의존하면 출제할 문제가 부족하기 때문에 부족한 문제만큼 추가로 출제하는 로직이 필요하다.
				for(int i=0; i<10-problemList.size(); i++) {
					//서비스에 요청하기 위한 해시맵 생성
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("su_idx", su_idx);
					List<Integer> idx = new ArrayList<Integer>();
					
					for (ProblemDTO item : problemList) {
						if(item != null) {
							idx.add(item.getPc_idx());
						}
					}
					
					map.put("problemList", idx);
					
					ProblemDTO problem = service.getProblem(map);
					
					if(problem != null) {
						problemList.add(problem);
					}
				}
			}
			
			model.addAttribute("su_idx", su_idx);
			model.addAttribute("problemList", problemList);
		} else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		return "test";
	}
	
	@RequestMapping(value = "/testReg.do", method = RequestMethod.POST)
	public String testReg(Model model, @RequestParam HashMap<String, Object> params, HttpSession session) {
		String mb_id = (String) session.getAttribute("loginId");
		
		if(mb_id != null) {
			int su_idx = Integer.parseInt(String.valueOf(params.get("su_idx")));//과목 고유번호
			
			int tt_times = service.getTestTimes(su_idx, mb_id);
			int tt_score = 0;//점수
			
			//시험 채점(점수 계산)
			for(int i=1; i<=10; i++) {
				if(params.get("pc_answer"+i) != null) {
					int choiceNo = (int) Integer.parseInt(String.valueOf(params.get("pc_answer"+i)));
					int answer = service.getProblemAnswer((int) Integer.parseInt(String.valueOf(params.get("idx"+i))));
					
					if(choiceNo == answer) {
						tt_score += 10;
					}
				}
			}
			
			String tt_status = "제출완료";//제출상태
			
			params.put("tt_times", tt_times);
			params.put("tt_score", tt_score);
			
			Timestamp tt_start_date = Timestamp.valueOf((String) session.getAttribute("testStart"));
			params.put("tt_start_date", tt_start_date);
			
			params.put("tt_status", tt_status);
			params.put("mb_id", mb_id);
			
			int tt_idx = service.testReg(params);//시험 고유번호
			
			if(tt_idx > 0) {
				//시험 답안 제출
				for(int i=1; i<=10; i++) {
					int choiceNo = params.get("pc_answer"+i) != null ? (int) Integer.parseInt(String.valueOf(params.get("pc_answer"+i))) : 0;
					int answer = service.getProblemAnswer((int) Integer.parseInt(String.valueOf(params.get("idx"+i))));
					char isAnswer = choiceNo == answer ? 'O' : 'X';
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					
					map.put("ta_problem_no", i);
					map.put("ta_choice_no", choiceNo);
					map.put("ta_is_answer", isAnswer);
					map.put("pc_idx", params.get("idx"+i));
					map.put("tt_idx", tt_idx);
					
					boolean result = service.testAnswerReg(map);
				}
				
				model.addAttribute("tt_idx", tt_idx);
			}
		} else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		return "redirect:/testResult.do";
	}
	
	
	//결과 
	@RequestMapping(value = "/testResult.do")
	public String testResult(Model model, @RequestParam String tt_idx, HttpSession session) {  
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			logger.info("시험 결과 페이지 이동");
			logger.info("시험 고유번호 : " + tt_idx );
			
			TestDTO testResult = service.testResult(tt_idx);
			if(testResult != null) {
				model.addAttribute("testResult", testResult);
			}
		} else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		return "testResult";
	}	
	
	//내가 응시한 시험 
	@RequestMapping(value = "/myTestList.do", method= RequestMethod.GET)
	public String myTestList(Model model, HttpSession session, Criteria cri, @RequestParam HashMap<String, Object> params) {
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			logger.info("내가 응시한 시험 페이지");
			
			//select 과목명 가져오기
			ArrayList<SubjectDTO> subjectList =service.subjectList();
			logger.info("등록된 과목 가져오기 : " + subjectList.size());
			
			if(subjectList.size()>0) {
				model.addAttribute("subjectList", subjectList);
			}
			
			// 사용자가 선택 후 값을 고정해주기 위해 model에 저장
			if(params.get("su_idx") != null) {
				model.addAttribute("su_idx", params.get("su_idx"));
			}
			if(params.get("tt_status") != null) {
				model.addAttribute("tt_status", params.get("tt_status"));
			}
			
			int pageNum = 1;
			if(params.get("pageNum") != null) {
				pageNum = (int) Integer.parseInt(String.valueOf(params.get("pageNum")));
			}
			int skip = (pageNum -1) * 10;
			
			params.put("skip", skip);
			params.put("mb_id", loginId);
			
			//뷰 전체에 시험리스트 뿌려줌
			ArrayList<TestDTO> testdto = service.myTestList(params);
			model.addAttribute("listCnt", testdto.size());
			
			if(testdto.size()>0) {
				model.addAttribute("testdto", testdto);
			}
			
			int total = service.myTestTotal(params);
			model.addAttribute("listCnt", total);
			logger.info("게시글 수 : " + total);
			
			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMaker);
		} else {
			model.addAttribute("msg", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		return "myTestList";
	}
	
	
	//상세보기 
	@RequestMapping(value = "/myTestView.do", method= RequestMethod.GET)
	public String myTestView(Model model, @RequestParam String tt_idx, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			logger.info("시험 고유번호 : " +tt_idx);
			
			//시험고유번호가 1인 과목명, 회차, 시험시작일자,제출일자, 점수, 상태 
			TestDTO testInfo = service.testInfo(tt_idx);
			if(testInfo != null) {
				model.addAttribute("testInfo", testInfo);
			}
			
			//시험고유번호가 1인 문제출제고유번호, 문제1~10, 사용자답안1~10, 정답오답여부10개 , 문제출제 고유번호에 따른 정답(10개)과 각 사지선다 문항(10)
			ArrayList<ProblemDTO> testDetail = service.testDetail(tt_idx, (String) session.getAttribute("loginId")); 
			logger.info("데이터 개수 : " + testDetail.size());
			if(testDetail.size()>0) {
				model.addAttribute("testDetail", testDetail);
			}
		} else {
			model.addAttribute("loginId", "로그인 후 이용해 주세요.");
			
			return "login";
		}
		
		return "myTestView";
	}
	
	//문제보관
	@RequestMapping(value = "problemSave.ajax")
	@ResponseBody
	public HashMap<String, Object> problemSave(@RequestParam int pc_idx, @RequestParam boolean isSave, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) {
			String msg = "실패";
			
			if(isSave == true) {
				if(service.problemSave(pc_idx, loginId) == true) {
					msg = "성공";
				}
			} else {
				if(service.problemDelete(pc_idx, loginId) == true) {
					msg = "성공";
				}
			}
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			result.put("msg", msg);
			
			return result;
		} else {
			return null;
		}
	}
	
}

