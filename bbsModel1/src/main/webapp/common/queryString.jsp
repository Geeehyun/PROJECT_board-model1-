<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
// 값 초기화
String search_category = "";
String search_word = "";
int page_selected = 1;

// 값 할당
if (request.getParameter("search_category") != null) {
	search_category = request.getParameter("search_category");
}
if(request.getParameter("search_word") != null) {
	search_word = request.getParameter("search_word");
}
if (request.getParameter("page_selected") != null) {
	page_selected = Integer.parseInt(request.getParameter("page_selected"));
}

//QreryString 만들
String queryStringPCW = "page_selected=" + page_selected + "&search_category=" + search_category + "&search_word=" + search_word;
String queryStringCW = "search_category=" + search_category + "&search_word=" + search_word;
%>