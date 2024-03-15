<%@page import="model1.bbs.BbsDAO"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/queryString.jsp" %>
<%
// 값 초기화
String user_id = request.getParameter("user_id");
String title = request.getParameter("title");
String content = request.getParameter("content");
int idx = 0;

//로그인 여부 체크
if (sessionId.equals("")) {
	response.sendRedirect("/bbsModel1/login/login_fail.jsp");
} else {
	// 게시글 숫자아닌 값 들어올 때 걸러내기
	try {
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
	} catch(NumberFormatException e) {
		out.print("<script>alert('없는 게시글 입니다.');history.back()</script>");
	}
	// 본인 게시글 체크
	if (!sessionId.equals(user_id)){
		response.sendRedirect("/bbsModel1/login/idNotMatch.jsp");
	}
	
	// 업데이할 정보 생성
	BbsDTO dto = new BbsDTO();
	dto.setIdx(idx);
	dto.setUser_id(user_id);
	dto.setTitle(title);
	dto.setContent(content);
	
	// 업데이트문 실행
	BbsDAO dao = new BbsDAO(application);
	int result = dao.bbsModify(dto);
	dao.close();
	
	// 결과 반환
	if (result > 0) {
		response.sendRedirect("list.jsp");
	} else {
		request.getRequestDispatcher("modify.jsp?result=" + result).forward(request, response);
	}
}
%>