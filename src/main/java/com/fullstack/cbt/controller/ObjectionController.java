package com.fullstack.cbt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fullstack.cbt.dto.ProblemDTO;
import com.fullstack.cbt.service.ObjectionService;

@Controller
public class ObjectionController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ObjectionService service;
	
	//이의제기페이지 이동
	//tt_idx 같이 가지고올수있어여? 가져와서 model에 담아서 뷰로 가져가면되는데
	// 그냥 String tt_idx 파라메터 가져온다고 적어넣고 찍어볼까 
	// test에선 model에 담아서 잘됐던건가 model에 담아서 가능했나봄 
	
	//정리 
	//그럼 내가응시한 시험 상세보기에서 tt_idx를 model 에 담고 난 파라메터로 가져오고 ++ 추가하기! 
	// 그리고 objection viewd에도 취소 링크에 써주면 됨 
	@RequestMapping(value = "/objection.do")
	public String cbtTestDetail(Model model,@RequestParam String pc_idx, String tt_idx) {
		logger.info("이의제기 문제 고유번호 : " + pc_idx);
		logger.info("시험 고유번호 : " + tt_idx);
	
		ProblemDTO problemDto = service.problemDto(pc_idx);
		if(problemDto != null) {
			model.addAttribute("problemdto", problemDto);
		}
		
		return "objection";
	}
}
