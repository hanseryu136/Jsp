<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>forward2</title>
	</head>
	<body>
		<h3>포워드 페이지2</h3>
		<%
			// 포워드는 서버 내의 자원간 처리 이동이기 때문에 타 서버 자원으로 이동 안 됨
			pageContext.forward("http://naver.com");
		
		
		%>
		
	</body>
</html>