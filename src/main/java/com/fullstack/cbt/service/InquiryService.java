package com.fullstack.cbt.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.fullstack.cbt.controller.Criteria;
import com.fullstack.cbt.controller.PageMaker2;
import com.fullstack.cbt.dao.InquiryDAO;
import com.fullstack.cbt.dto.InquiryAttachDTO;
import com.fullstack.cbt.dto.InquiryDTO;



@Service
public class InquiryService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired InquiryDAO dao;
	
	public void adUpdate(HashMap<String, String> params, HttpSession session) {
		String ib_admin_id = (String) session.getAttribute("loginId");
		
		params.put("ib_admin_id", ib_admin_id);
		
		logger.info(params+" 서비스 수정 요청 서비스 ");
		
		int row =dao.adUpdate(params);
		logger.info("서비스 수정된 데이터수" +row);
		
	}
	
	
	
	

	public String write(MultipartFile[] files, HashMap<String, String> params, HttpSession session) {
		
		InquiryDTO dto =new InquiryDTO();
		dto.setIb_subject(params.get("ib_subject"));
		dto.setIb_content(params.get("ib_content"));
		dto.setMb_id((String)session.getAttribute("loginId"));
			int row =dao.write(dto);
		
		int ib_idx =dto.getIb_idx();
		logger.info("방금 넣은 글번호" +ib_idx);
		if(row>0) {
			fileSave(files,ib_idx);
		}
		return "redirect:inquiryList.go";
	}
	private void fileSave(MultipartFile[] files, int ib_idx) {
		int i = 0;
		
		for (MultipartFile file : files) {
			i++;
			
			String ba_org_name= file.getOriginalFilename();//파일명 추출
			if(!ba_org_name.equals("")) {
				logger.info("업로드 진행");
				//확장자 분리
				String ba_ext = ba_org_name
						.substring(ba_org_name.lastIndexOf(".")).toLowerCase();			
				// 새 이름 만들기
				String ba_new_name = i+System.currentTimeMillis()+ba_ext;
				
				logger.info(ba_org_name+" => "+ba_new_name);
								
				//파일 받아서 저장하기
				try {
					byte[] arr = file.getBytes();
					Path path = Paths.get("C:/upload/"+ba_new_name);
					Files.write(path, arr);
					logger.info(ba_new_name+" save ok");
					dao.fileWrite(ba_org_name,ba_new_name,ib_idx);
					
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		}
		
	}


	
	public void inquiryDetail(Model model, String ib_idx) {
		InquiryDTO dto =dao.inquiryDetail(ib_idx);
		ArrayList<InquiryAttachDTO> list =dao.photoList(ib_idx);
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
	
	}

	public void inquiryDelte(String ib_idx) {
		ArrayList<InquiryAttachDTO> photolist =dao.photoList(ib_idx);
		logger.info(ib_idx+" 번 게시물에 업로드된 사진 수 "+photolist.size());
		
		if(dao.del2(ib_idx)>=0) {//자식테이블
		 
			for (InquiryAttachDTO file : photolist) {
				File f = new File("C:/upload/"+file.getBa_new_name());
				
				if(f.exists()) {
					boolean success = f.delete();
					logger.info(file.getBa_new_name()+"삭제 여부 : "+success);
				
				}
			}
			dao.del(ib_idx);//부모테이블
		}		
				

	}
	public void adminInquiryDetail(Model model, String ib_idx) {
		InquiryDTO dto =dao.adminInquiryDetail(ib_idx);
		ArrayList<InquiryAttachDTO> list =dao.adminPhotoList(ib_idx);
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		
	}

	public String update(MultipartFile[] files, HashMap<String, String> params, String ba_idx) {
		
		int ib_idx = Integer.parseInt(params.get("ib_idx"));
		
		
		String[] arr = ba_idx.split(",");
		for (int i = 0; i < arr.length; i++){
			
			ArrayList<InquiryAttachDTO> photolist =dao.photoList2(arr[i]);
			logger.info("첨부파일번호"+arr[i]);
			
			if(dao.del3(arr[i])>=0) {
			 
				for (InquiryAttachDTO file : photolist) {
					File f = new File("C:/upload/"+file.getBa_new_name());
					
					if(f.exists()) {
						boolean success = f.delete();
						logger.info(file.getBa_new_name()+"삭제 여부 : "+success);
					}
				}
			}		
		}
	
		
		int row =dao.update(params);
		
		if(row>0) {
			fileSave(files,ib_idx);
			
		}
		return"redirect:/inquiryDetail?ib_idx="+ib_idx;
	}
	public String adDelete(String ib_idx) {
		String[] arr = ib_idx.split(",");
		for (int i = 0; i < arr.length; i++){
			ArrayList<InquiryAttachDTO> photolist =dao.photoList(arr[i]);
		
			if(dao.del2(arr[i])>=0) {//자식테이블
			 
				for (InquiryAttachDTO file : photolist) {
					File f = new File("C:/upload/"+file.getBa_new_name());
					
					if(f.exists()) {
						boolean success = f.delete();
						logger.info(file.getBa_new_name()+"삭제 여부 : "+success);
					
					}
				}
				dao.del(arr[i]);//부모테이블
			}		
		
		
		}
		
		return "redirect:adminInquiryList.go";
	}

	public int listPageCount(PageMaker2 pageMaker) {
		
		return dao.listPageCount(pageMaker);
	}
	public ArrayList<InquiryDTO> inquirySearch(PageMaker2 pageMaker) {
		
		return dao.inquirySearch(pageMaker);
	}

	public int adListPageCount(PageMaker2 pageMaker) {
		
		return dao.adListPageCount(pageMaker);
	}

	public ArrayList<InquiryDTO> adInquirySearch(PageMaker2 pageMaker) {
		
		return dao.adInquirySearch(pageMaker);
	}
	



	
	
	


	
	

	
	
}
