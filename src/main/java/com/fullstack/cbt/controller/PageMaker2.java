package com.fullstack.cbt.controller;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker2 {
	
	
	private int page;
	private int perPageNum;
	private int pageStart;
	private int totalCount; // 전체 개수
	private int startPage; // 시작 페이지
	private int endPage; // 끝페이지
	private boolean prev; // 이전 여부
	private boolean next; // 다음 여부

	private int displayPageNum = 10;

	private int tempEndPage; // 마지막 페이지

	// 검색처리 추가
	private String ib_status;	
	private String ib_searchOption;
	private String ib_keyword;

	public PageMaker2() {
		this.page = 1; // 초기 페이지는 1
		this.perPageNum = 10; // limit 10 개씩 보여준다.
	}

	public void setPage(int page) {
		// 페이지 번호가 0이거나 0보다 작으면 1페이지로 한다.
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	
	public int getPageStart() {
		// 시작 데이터 번호 = (페이지 번호 -1 ) * 페이지당 보여지는 개수
		this.pageStart = (this.page - 1) * perPageNum;
		return this.pageStart;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		endPage = (int) (Math.ceil(page / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		tempEndPage = (int) (Math.ceil(totalCount / (double) perPageNum));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * perPageNum >= totalCount ? false : true;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", perPageNum).build();
		return uriComponents.toUriString();
	}


	
	// 검색 추가 페이지 파라미터
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.queryParam("ib_status", ib_status)
				.queryParam("ib_searchOption", ib_searchOption)
				.queryParam("ib_keyword", ib_keyword).build();
		return uriComponents.toUriString();
	}

	

	
	// 검색 추가 페이징  출력
	public String paginationHtml(String url) {
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append("<div class='pagination'>");
		if (prev) {
			sBuffer.append("<a href='" + url + makeSearch(1) + "'>&laquo;&laquo;</a>");
		}

		if (prev) {
			sBuffer.append("<a href='" + url + makeSearch(startPage - 1) + "'>&laquo;</a>");
		}

		String active = "";
		for (int i = startPage; i <= endPage; i++) {
			if (page == i) {
				active = "class=active";
			} else {
				active = "";
			}
			sBuffer.append("<a href='" + url + makeSearch(i) + "'  "+active+" >" + i + "</a>");			
		}

		if (next && endPage > 0) {
			sBuffer.append("<a href='" + url + makeSearch(endPage + 1) + "'>&raquo;</a>");
		}

		if (next && endPage > 0) {
			sBuffer.append("<a href='" + url + makeSearch(tempEndPage) + "'>&raquo;&raquo;</a>");
		}

		sBuffer.append("</div>");
		return sBuffer.toString();
	}
	
	
	public String paginationHtml2(String url) {
		StringBuffer sBuffer = new StringBuffer();
		sBuffer.append("<div class='pagination'>");
		if (prev) {
			sBuffer.append("<a href='#' data-href='" + url + makeSearch(1) + "'  class='paginationA' >&laquo;&laquo;</a>");
		}

		if (prev) {
			sBuffer.append("<a href='#' data-href='" + url + makeSearch(startPage - 1) + "' class='paginationA' >&laquo;</a>");
		}

		String active = "";
		for (int i = startPage; i <= endPage; i++) {
			if (page == i) {
				active = "class=active paginationA";
			} else {
				active = "class=paginationA ";
			}
			sBuffer.append("<a href='#' data-href='" + url + makeSearch(i) + "'  "+active+"   >" + i + "</a>");			
		}

		if (next && endPage > 0) {
			sBuffer.append("<a href='#' data-href='" + url + makeSearch(endPage + 1) + "'  class='paginationA'  >&raquo;</a>");
		}

		if (next && endPage > 0) {
			sBuffer.append("<a href='#' data-href='" + url + makeSearch(tempEndPage) + "' class='paginationA' >&raquo;&raquo;</a>");
		}

		sBuffer.append("</div>");
		return sBuffer.toString();
	}

	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}

	public String getIb_status() {
		return ib_status;
	}

	public void setIb_status(String ib_status) {
		this.ib_status = ib_status;
	}

	public String getIb_searchOption() {
		return ib_searchOption;
	}

	public void setIb_searchOption(String ib_searchOption) {
		this.ib_searchOption = ib_searchOption;
	}

	public String getIb_keyword() {
		return ib_keyword;
	}

	public void setIb_keyword(String ib_keyword) {
		this.ib_keyword = ib_keyword;
	}

	
	@Override
	public String toString() {
		return "PageMaker [page=" + page + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + ", totalCount="
				+ totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", displayPageNum=" + displayPageNum + ", tempEndPage=" + tempEndPage + ", ib_status=" + ib_status
				+ ", ib_searchOption=" + ib_searchOption + ", ib_keyword=" + ib_keyword + "]";
	}

	
	
	

}
