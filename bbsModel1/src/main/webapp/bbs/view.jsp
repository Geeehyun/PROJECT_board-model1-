<%@page import="common.MyErr"%>
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
	input[type = "button"] {
		background : #e3f0ff;
		border : 1px solid #aaa;
		padding : 0 10px;
	}
	table th:nth-child(1), table td:nth-child(1) {
		border: 1px solid #aaa;		
		background : #eee;
	}
	#btn_modify, #btn_delete {
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
int idx = 0;


try {
	//게시글 숫자아닌 값 들어올 때 걸러내기
	if (request.getParameter("idx") != null) {
		idx = Integer.parseInt(request.getParameter("idx"));
	}
	
	BbsDAO dao = new BbsDAO(application);
	BbsDTO bbsView = dao.bbsView(idx);
	dao.close();
	

	//게시글 정보 불러오기
	if (bbsView != null) {
		read_cnt = bbsView.getRead_cnt();
		user_id = bbsView.getUser_id();
		reg_date = (bbsView.getReg_date() != null)? bbsView.getReg_date().toString() : "";
		title = bbsView.getTitle();
		content = bbsView.getContent();
		content = (content != null) ? content.replace("\r\n", "<br>") : "";
		content = (content != null) ? content.replace(" ", "&nbsp") : "";
	}
	
	// todo 로직수정필요
	if (bbsView.getUser_id() == null) {
		throw new MyErr("없는 게시글 입니다.");
	}
} catch(NumberFormatException e1) {
	out.print("<script>alert('없는 게시글 입니다.');history.back()</script>");
} catch(MyErr e) {
	out.print("<script>alert('"+ e.getMessage() +"');history.back()</script>");
}

%>
<main>
	<h2><a href="list.jsp">상세 게시글 조회</a></h2>
	<table class="border">
		<caption style="display:none">표제목</caption>
		<thead>
			<tr>
				<td>NO <%= idx %> </td>
				<td>작성자 : <%= user_id %></td>
				<td>조회수 : <%= read_cnt %></td>
				<td>작성일 : <%= reg_date %></td>
			</tr>
		</thead>
 		<tbody>
			<tr>
				<td>제목</td>
				<td colspan="3"><%= title %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><%= content %></td>
			</tr>
		</tbody>
	</table>
	<input type="button" id="btn_list" value="목록으로">
	<input type="button" id="btn_modify" value="수정">
	<input type="button" id="btn_delete" value="삭제">
	<input type="hidden" id="myContentYN" name="myContentYN" value=<%= (sessionId.equals(user_id))? "Y" : "N" %> />
</main>
<script>
const btn_list = document.querySelector("#btn_list");
btn_list.addEventListener("click", (e) => {
	window.location.replace("list.jsp?<%=queryStringPCW%>");
})

const btn_delete = document.querySelector("#btn_delete");
const myContentYN = document.querySelector("#myContentYN").value;
btn_delete.addEventListener("click", (e) => {
	if (<%= !sessionId.equals("") ? 0 : 1%>) {
		location.href = "/bbsModel1/login/login_fail.jsp";
	} else if (myContentYN != "Y") {
		location.href = "/bbsModel1/login/idNotMatch.jsp";
	} else {
		let confirmYN = confirm("정말 삭제하시겠습니까?");
		if (confirmYN) {
			window.location.replace("delete_ok.jsp?idx=<%= idx%>");	
			//post로 바꾸는건 어떠한가
		}
	}
})

const btn_modify = document.querySelector("#btn_modify");
btn_modify.addEventListener("click", (e) => {
	if (<%= !sessionId.equals("") ? 0 : 1%>) {
		location.href = "/bbsModel1/login/login_fail.jsp";
	} else if (myContentYN != "Y") {
		location.href = "/bbsModel1/login/idNotMatch.jsp";
	} else {
		window.location.replace("modify.jsp?idx=<%= idx%>&&search_category=<%=search_category%>&&search_word=<%=search_word%>");
	}
})
</script>
</body>
</html>