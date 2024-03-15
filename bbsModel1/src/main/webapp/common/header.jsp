<%@page import="model1.bbs.BbsDTO"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main input.btn_login {margin : 10px 0; background: #fff;}
#header {text-align : right;}
</style>
</head>
<body>
<main id="header">
<%
// 세션에서 로그인 정보 유무 체크
String sessionId = "";
if (session.getAttribute("user_id") == null) {
	// 로그인 정보 없을 경우 [로그인] 버튼 표시
%>
	<input type="button" id="btn_login" name="btn_login" class="btn_login" value="로그인" />
	<script>
	const btn_login = document.querySelector("#btn_login");
	btn_login.addEventListener("click", (e)=> {
		location.href = "/bbsModel1/login/login.jsp";
	})
	</script>
<%	
} else {
	// 로그인 정보 없을 경우 [로그아웃] 버튼 표시 + sessionId 값 저장
	sessionId = (String) session.getAttribute("user_id");
%>
	<input type="button" id="btn_logOut" name="btn_logOut" class="btn_login" value="로그아웃" />
	<script>
	const btn_logOut = document.querySelector("#btn_logOut");
	btn_logOut.addEventListener("click", (e)=> {
		location.href = "/bbsModel1/login/logout.jsp";
	})
	</script>
<%
}
%>
</main>

</body>
</html>