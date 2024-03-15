<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 오류</title>
</head>
<body>
<%
session.invalidate();
%>
<script>
alert("로그아웃 되었습니다.");
location.href = "/bbsModel1/bbs/list.jsp";
</script>
</body>
</html>