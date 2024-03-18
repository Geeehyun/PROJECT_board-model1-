<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/queryString.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<style>
	* {margin : 0; padding : 0;}
	body {
		width : 100%;
		margin : 0 auto;
	}
	main {
		width : 1000px;
		margin : 0 auto;
	}
	h2 {
		padding : 20px;
		text-align : center;
	}
	table, tr, td, th {
		border-collapse:collapse;
		padding : 10px;
	}
	table {
		width : 100%;
		margin : 10px 0;
	}
	.border, .border tr, border th {
		border: 1px solid #aaa;		
	}
	.border td:nth-child(1), td:nth-child(3), td:nth-child(4){
		text-align : center;
	}
	.search_area {
		border: 1px solid #bbdbff;
		background : #bbdbff;
		text-align : center;
		height : 80px;
	}
	th {
		background : #e3f0ff;
	}
	input, select {
		box-sizing : border-box;
		height : 30px;
	}
	#search_word {
		width : 200px;
	}
	input[type = "button"], input[type = "submit"] {
		background : #e3f0ff;
		border : 1px solid #aaa;
		padding : 0 10px;
	}
	table th:nth-child(1), table td:nth-child(1) {
		border: 1px solid #aaa;		
		background : #eee;
	}
		table th:nth-child(1), table td:nth-child(1) {
		border: 1px solid #aaa;		
		background : #eee;
	}
	#btn_submit {
		float : right;
		margin-left : 5px;
	}
	a, a:link, a:hover, a:active, a:visited {
		color : #000;
		text-decoration : none;
	}
	a:hover {
		text-decoration : underline !important;
	}
	.warnning {
		color : red;
		text-align : center;
		font-weight : 800;
	}
</style>
</head>
<body>
<%
// 값 초기화
int read_cnt = 0;
String user_id = "";
String reg_date = "";
String title = "";
String content = "";
String fail = "";
int idx = 0;

//로그인 여부 체크
if (sessionId.equals("")) {
	response.sendRedirect("/bbsModel1/login/login_fail.jsp");
} else {
	// 게시글 정보 불러오기
	BbsDAO dao = new BbsDAO(application);
	idx = Integer.parseInt(request.getParameter("idx"));
	BbsDTO bbsView = dao.bbsView(idx);
	dao.close();
	if (bbsView != null) {
		read_cnt = bbsView.getRead_cnt();
		user_id = bbsView.getUser_id();
		reg_date = bbsView.getReg_date().toString();
		title = bbsView.getTitle();
		content = bbsView.getContent();
		content = (content != null) ? content.replace("<br>", "\r\n") : "";
		content = (content != null) ? content.replace(" ", "&nbsp") : "";
	}
	
	// 본인 게시글 체크
	if (!sessionId.equals(user_id)){
		response.sendRedirect("/bbsModel1/login/idNotMatch.jsp");
	}
	
	// 수정 실패여부
	if(request.getParameter("result") != null) {
		fail = "수정이 실패하였습니다 ㅜ ㅜ";
	}
}



%>
<main>
<h2><a href="list.jsp">게시판 수정 페이지</a></h2>
<p class="warnning"><%= fail %></p>
<form name="frmModify" id="frmModify" action="modify_ok.jsp" method="post">
<!-- 히든 필드는 가능한 form 바로 밑에 두면 쉽게 찾을 수 있음. -->
<input type="hidden"name="idx" id="idx"  value="<%= idx%>" />
<table  class="border">
	<tr>
		<td width="200">작성자 :</td>
		<td width="600"><input type="text" name="user_id" id="user_id" value="<%= user_id %>" readonly/></td>
	</tr>
	<tr>
		<td width="200">제목</td>
		<td colspan="3"><input type="text" name="title" id="title" value="<%= title %>"  maxlength="100"/></td>
	</tr>
	<tr>
		<td width="200">내용</td>
		<td colspan="3">
			<textarea name="content" id="content" rows="10" cols="80"><%= content %></textarea>
		</td>
	</tr>
</table>
	<input type="submit" name="btn_submit" id="btn_submit" value="수정" />
	<input type="button" name="btn_view" id="btn_view" value="돌아가기" />
	<input type="button" name="btn_list" id="btn_list" value="목록으로" />
</form>

</main>
<script>
// 목록으로 이동
const btn_list = document.querySelector("#btn_list");
btn_list.addEventListener("click", (e) => {
	window.location.replace("list.jsp?<%=queryStringPCW%>");
})

// 조회하던 글로 다시 이동
const btn_view = document.querySelector("#btn_view");
btn_view.addEventListener("click", (e) => {
	window.location.replace("view.jsp?idx=<%=idx%>&<%=queryStringPCW%>");
})

// 제출
const btn_submit = document.querySelector("#btn_submit");
const frmModify = document.querySelector("#frmModify");
frmModify.addEventListener("submit", (e)=> {
	e.preventDefault();
	let user_id = document.querySelector("#user_id");
	let user_idVal = user_id.value;
	let title = document.querySelector("#title");
	let titleVal = title.value;
	let content = document.querySelector("#content");
	let contentVal = content.value;
	
	
	if(!user_idVal) {
		alert("작성자는 필수 입력사항 입니다.");
		return;
	} else {
		user_idVal = user_idVal.trim();
		if(user_idVal == "") {
			alert("작성자는 필수 입력사항 입니다.");
			return;
		}
	}
	
	if(!titleVal) {
		title.focus();
		alert("작성자는 필수 입력사항 입니다.");
		return;
	} else {
		titleVal = titleVal.trim();
		if(titleVal == "") {
			title.focus();
			alert("작성자는 필수 입력사항 입니다.");
			return;
		}
	}
	
	if(!contentVal) {
		content.focus();
		alert("작성자는 필수 입력사항 입니다.");
		return;
	} else {
		contentVal = contentVal.trim();
		if(contentVal == "") {
			content.focus();
			alert("작성자는 필수 입력사항 입니다.");
			return;
		}
	}

	frmModify.submit();
})
</script>
</body>
</html>