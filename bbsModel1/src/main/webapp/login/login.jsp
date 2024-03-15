<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	.border td:nth-child(1), td:nth-child(3), td:nth-child(4), td:nth-child(5){
		text-align : center;
	}
	.search_area {
		border : 1px solid #aaa;
		background : #eee;
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
		padding : 5px 10px;
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
// 기존 로그인 정보 여부 체크
if (session.getAttribute("user_id") != null) {
	out.print("<script>alert(" +"'이미 로그인되어있습니다. 게시판 리스트로 이동합니다.'" + ");location.href='/bbsModel1/bbs/list.jsp';</script>");
	//response.sendRedirect("/bbsModel1/bbs/list.jsp");
}
// 로그인 실패 정보 확인
String fail = "";
if(request.getAttribute("errMsg") != null) {
	fail = "로그인 실패";
	
}
%>
<main>

<h2>로그인</h2>
<p class="warnning"><%= fail %></p>
<form action="login_ok.jsp" method="post" id="frmLogin">
	<table class="border">
			<tr>
				<td>아이디 : <input type="text" name="user_id" id="user_id" value="" placeholder="아이디" /></td>
				<td>비밀번호 : <input type="password" name="pwd" id="pwd" value="" placeholder="비밀번호" /></td>
				<td><input type="submit" name="btn_login" id="btn_login" value="로그인"/></td>
			</tr>
	</table>
</form>
<input type="button" id="btn_list" name="btn_list" class="btn_list" value="리스트" />

</main>
<script>
	const frmLogin = document.querySelector("#frmLogin");
	frmLogin.addEventListener("submit", (e)=>{
		e.preventDefault();
		let user_id = document.querySelector("#user_id");
		let user_idVal = user_id.value;
		let pwd = document.querySelector("#pwd");
		let pwdVal = pwd.value;
		
		if (!user_idVal) {
			user_id.focus();
			alert("아이디를 입력해주세요");
			return ;
		} else {
			user_idVal = user_idVal.trim();
			if (user_idVal == "") {
				user_id.focus();
				alert("아이디를 입력해주세요");
				return;
			}
		}
		
		if (!pwdVal) {
			pwd.focus();
			alert("비밀번호를 입력해주세요");
			return;
		} else {
			pwdVal = pwdVal.trim();
			if (pwdVal == "") {
				pwd.focus();
				alert("비밀번호를 입력해주세요");
				return;
			}
		}
		frmLogin.submit();
	})
	
	const btn_list = document.querySelector("#btn_list");
	btn_list.addEventListener("click", (e)=> {
		location.href = "/bbsModel1/bbs/list.jsp";
	})
</script>
</body>
</html>