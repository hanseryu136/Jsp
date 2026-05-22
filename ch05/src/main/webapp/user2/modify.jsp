<%@page import="sub1.User2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// 전송 데이터 수신
	String userid = request.getParameter("userid");
	
	// 수정 데이터 선언
	User2 user2 = null;

	// ----------------------------------
	// 데이터베이스 작업 - 수정 데이터 조회
	// ----------------------------------
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "hanseryu136";
	String pass = "1234";
	
	try {
		// 1) 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2) 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3) SQL 실행 객체 생성
		String sql = "SELECT * FROM `User2` WHERE `userid` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, userid);

		// 4) SQL 실행
		ResultSet rs = psmt.executeQuery();

		// 5) 결과셋처리
		if(rs.next()){
			user2 = new User2();
			user2.setUserid(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setHp(rs.getString(3));
			user2.setAge(rs.getInt(4));
		}

		// 6) 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2::수정</title>
	</head>
	<body>
		<h3>User2 수정</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user2/list.jsp">목록</a>
		
		<form action="/ch05/user2/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" value="<%= user2.getUserid() %>" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= user2.getName() %>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= user2.getHp() %>"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="<%= user2.getAge() %>"></td>
				</tr>
				<tr>					
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>			
			</table>		
		</form>		
	</body>
</html>