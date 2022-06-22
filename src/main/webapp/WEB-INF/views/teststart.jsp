<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	h3,p,form {text-align: center;}
    input[type="submit"]:hover {background-color: green;}
</style>
</head>
<body>
<h3>응시하고 싶은 과목을 선택해 주세요</h3>
    <p>시험은 랜덤으로 총 10문제 출제되며, 제한시간(10분)이 초과되면 자동 제출됩니다.</p>
    
    <form action="test.do" method="get"> 
        <select name="selectbox"> <!--파라메터를 name으로 받는대-->
            <option value="">응시과목선택</option>
            <option value="JAVA">JAVA</option>
            <option value="js/jQuery">js/jQuery</option>
            <option value="MariaDB(MySQL)">MariaDB(MySQL)</option>
        </select>
        <input type="submit" value="시험시작"/> 
    </form>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	$('input[type="submit"]').on("click",function(){
	    //var option = $("#selectbox option:selected").val();
	    var option = $("select[name=selectbox]").val();
		if(option == ""){
			alert("과목을 선택해 주세요");
		}
	});
	</script>
</html>