<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/queryString.jsp" %>
<%
// 값 초기화
String user_id = request.getParameter("user_id");
String title = request.getParameter("title");
String content = request.getParameter("content");

//로그인 여부 체크
if (sessionId.equals("")) {
	response.sendRedirect("/bbsModel1/login/login_fail.jsp");
} else {
	// 인써트할 정보 생성
	BbsDTO dto = new BbsDTO();
	dto.setUser_id(user_id);
	dto.setTitle(title);
	dto.setContent(content);
	
	// 인써트문 실행
	BbsDAO dao = new BbsDAO(application);
	int result = dao.bbsRegister(dto);
	
	// 결과 반환
	if (result > 0) {
		response.sendRedirect("list.jsp?"+queryStringPCW);
	} else {
		request.getRequestDispatcher("register.jsp?result=" + result).forward(request, response);
	}
}

%>