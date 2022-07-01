<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	.tg  {border-collapse:collapse;border-spacing:0;}
	.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg2{background-color:#efefef;font-weight:bold;text-align:center;vertical-align:top}
	.tg .tg1{background-color:#efefef;border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
	.tg .tg3{text-align:left;vertical-align:top}
	textarea {resize: none;}
</style>
</head>
<body>
<!-- jsp 파일 최상인이 만듬 -->	
	<h2>이의제기 관리</h2>
  		<table class="tg">
  			
    		<thead>
				<tr>
				  	<th class="tg-zlqz">아이디</th>
				  	<th class="tg-zlqz">
				  		<input type="hidden" name="oj_idx" value="${objectionList.oj_idx}"/>
				  		<input type="text" name="mb_id" value="${objectionDetail.mb_id}" readonly/>
				  	</th>
				</tr>
    		</thead>
    		<tbody>
				<tr>
					<td class="tg-3xi5">문제</td>
					<td class="tg-c3ow">
						<input type="text" name="problem" value="${objectionDetail.problem}" readonly/>
					</td>
				</tr>
				<tr>
				  	<td class="tg-3xi5">이의제기 내용</td>
				  	<td class="tg-c3ow">내용</td>
				</tr>
				<tr>
				  	<td class="tg-3xi5">이의제기 일자</td>
				  	<td class="tg-c3ow">date</td>
				</tr>
   			 </tbody>
  		</table>
	<h2>이의제기 처리사항</h2>
  		<table class="tg">
    		<thead>
      			<tr>
        			<th class="tg-zlqz">처리자 아이디</th>
       				<th class="tg-zlqz">아이디</th>
     			 </tr>
    		</thead>
    		<tbody>
      			<tr>
        			<td class="tg-3xi5">관리자 메모</td>
        			<td class="tg-c3ow"><input type="text"/></td>
      			</tr>
      			<tr>
        			<td class="tg-3xi5">이의제기 처리일자</td>
        			<td class="tg-c3ow">date</td>
      			</tr>
      			<tr>
       			 	<td class="tg-3xi5">이의제기 처리상태</td>
         			<td class="tg-c3ow">
           				<select>
             				<option>처리대기</option>
             				<option>처리중</option>
             				<option>처리완료</option>
           				</select>
         			</td>
       			</tr>
	 		</tbody>
		</table>
	   	<input type="button" value="등록"/>
		<input type="button" value="목록"/>   
</body>
</html>