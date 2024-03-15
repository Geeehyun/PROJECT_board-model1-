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
	input[type = "button"], input[type = "submit"], input[type = "reset"] {
		background : #e3f0ff;
		border : 1px solid #aaa;
		padding : 0 10px;
	}
	table th:nth-child(1), table td:nth-child(1) {
		border: 1px solid #aaa;		
		background : #eee;
	}
	#btn_submit, #btn_cancel {
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
String user_id = "";
String title = "";
String content = "";
String fail = "";

// 로그인 여부 체크
if (sessionId.equals("")) {
	response.sendRedirect("/bbsModel1/login/login_fail.jsp");
} else {
	user_id = sessionId;
	if (request.getParameter("result") != null) {
		fail = "등록이 실패하였습니다 ㅜ ㅜ";
	}
	if (request.getParameter("title") != null) {
		title = request.getParameter("title");
	}
	if (request.getParameter("content") != null) {
		content = request.getParameter("content");
	}
}

%>
<main>
<h2><a href="list.jsp">게시판 등록 페이지</a></h2>
<p class="warnning"><%= fail %></p>
<form name="frmRegist" id="frmRegist" action="register_ok.jsp" method="post">
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
	<input type="submit" name="btn_submit" id="btn_submit" value="글등록" />
	<input type="reset" name="btn_cancel" id="btn_cancel" value="초기화" />
	<input type="button" name="btn_list" id="btn_list" value="목록으로" />
</form>

</main>
<script>
const btn_list = document.querySelector("#btn_list");
btn_list.addEventListener("click", (e) => {
	window.location.replace("list.jsp?<%=queryStringPCW%>");
})

const btn_submit = document.querySelector("#btn_submit");
const frmRegist = document.querySelector("#frmRegist");
frmRegist.addEventListener("submit", (e)=> {
	e.preventDefault();
	let user_id = document.querySelector("#user_id").value;
	let title = document.querySelector("#title").value;
	let content = document.querySelector("#content").value;
	
	
	if(user_id == null) return alert("작성자는 필수 입력사항 입니다.");
	if(user_id != null) {
		user_id = user_id.trim();
		if(user_id == "") return alert("작성자는 필수 입력사항 입니다.");
	}
	if(title == null) return alert("제목은 필수 입력사항 입니다.");
	if(title != null) {
		title = title.trim();
		if(title == "") return alert("제목은 필수 입력사항 입니다.");
	}
	if(content == null) return alert("내용은 필수 입력사항 입니다.");
	if(content != null) {
		content = content.trim();
		if(content == "") return alert("내용은 필수 입력사항 입니다.");
	}
	frmRegist.submit();
})
</script>
</body>
</html>