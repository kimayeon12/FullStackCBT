<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            </div>
        </div>
	</body>
	<script>
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>