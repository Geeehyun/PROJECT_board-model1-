<%@page import="model1.bbs.BbsDAO"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/common/header.jsp" %>
<%
String user_id = request.getParameter("user_id");
int idx = 0;
if (sessionId.equals("")) {
	response.sendRedirect("/bbsModel1/login/login_fail.jsp");
} else {
	idx = Integer.parseInt(request.getParameter("idx"));
	
	// 본인 게시글 체크
	if (!sessionId.equals(user_id)){
		response.sendRedirect("/bbsModel1/login/idNotMatch.jsp");
	}
	
	BbsDAO dao = new BbsDAO(application);
	int result = dao.bbsDelete(idx);

	if (result > 0) {
		response.sendRedirect("list.jsp");
	} else {
		request.getRequestDispatcher("view.jsp?idx=519&&result=" + result).forward(request, response);
	}
}
%>
