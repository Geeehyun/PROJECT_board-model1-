<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");

MemberDAO dao = new MemberDAO(application);
MemberDTO dto = dao.getMemberInfo(user_id, pwd);
dao.close();

if(dto != null && dto.getMemberId() != null && dto.getPwd() != null) {
	session.setAttribute("user_id", dto.getMemberId());
	response.sendRedirect("/bbsModel1/bbs/list.jsp");
} else {
	System.out.println("로그인 자체 실패");
	request.setAttribute("errMsg", "로그인 오류");
	request.getRequestDispatcher("login.jsp").forward(request, response);  
}
%>
</body>
</html>