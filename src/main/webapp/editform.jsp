<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.SuggestionDAO.SuggestionDAO" %>
<%@ page import="com.example.SuggestionVO.SuggestionVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
	<style>
		body{
			box-sizing: border-box;
			align-items: center;
			display: flex;
			align-content: center;

		}
		input, select, textarea{
			border-radius: 0.5rem;
			border: 1px solid lightpink;
			margin-bottom: 2px;
		}
		.sign{
			margin: 20px;
			padding: 10px;
			max-width: 500px;
			text-align: center;
		}
		legend{
			text-align: center;
			color: #002F63;
		}
		fieldset{
			border-radius: 0.5rem;
			border:  2px solid lightpink;
		}
		h1 {
			text-align: center;
			color: white;
			background-color: lightpink;
			border-radius: 0.5rem;
			margin-bottom: 0;
		}
		p{
			margin: 0;
			text-align: right;
			color: lightpink;

		}
		.cen{
			text-align: center;
		}
		.submit, .modal_btn{
			margin-top: 10px;
			background-color: lightpink;
			color: white;
			height: 30px;
			width: 50%;
			border-radius: 0.5rem;
			cursor: pointer;
			border: 1px solid lightpink;
			font-size: 1rem;
		}
		.modal_btn{

			width : 10% !important;
		}
		.submit:hover{
			background-color: white;
			color: lightpink;
		}
	</style>
</head>
<body>

<%
	SuggestionDAO boardDAO = new SuggestionDAO();
	String id=request.getParameter("id");
	SuggestionVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<form action="editpost.jsp" class = "sign" method="post" enctype="multipart/form-data">
<input type="hidden" name="personID" value="<%=u.getPersonID() %>"/>
	<div>
		<h1>건의사항 수정</h1>
		<button type="button" class="modal_btn" onclick="location.href = './posts.jsp'">닫기</button>
	</div>
	<fieldset style="width: 400px;margin:5px">
		<legend>이름</legend>
		<label for ="name">이름: </label>
		<input type="text" id="name" name="name" placeholder="이름을 입력하세요." value = "<%=u.getName()%>" required><br>
		<label for ="nickname">닉네임: </label>
		<input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요." value = "<%=u.getNickname()%>" required><br>
	</fieldset>
	<fieldset style="width: 400px;margin:5px">
		<legend>학번</legend>
		<label for ="s_number">학번: </label>
		<input type="text" id="s_number" name="s_number" placeholder="학번을 입력하세요." value = "<%=u.getS_number()%>" required><br>
	</fieldset>
	<fieldset style="width:400px;margin:5px">
		<legend>학부/전공</legend>
		<label for="major">학부: </label>
		<input type="text" id="major" name="major" placeholder="학부를 입력하세요." value = "<%=u.getMajor()%>" required><br>
		<label for="department">전공: </label>
		<input type="text" id="department" name="department" placeholder="전공을 입력하세요." value = "<%=u.getDepartment()%>" required><br>
	</fieldset>
	<fieldset style='width: 400px; margin:5px'>
		<legend>건의 카테고리</legend>
		<label for="category">카테고리: </label>
		<input type="text" id="category" name = "category" placeholder="카테고리를 입력하세요." value = "<%=u.getCategory()%>" required><br>
	</fieldset>
	<fieldset>
		<legend>건의사항</legend>
		<label for="suggestions">카테고리: </label>
		<input type="text" style ="width: 80%; height: 40px;" id="suggestions" name = "suggestions" placeholder="건의사항을 입력하세요." value = "<%=u.getSuggestions()%>" required><br>
	</fieldset>
	<fieldset>
		<legend>파일첨부</legend>
		<label for ="photo">파일선택: </label>
		<input type="file" id ="photo" name = "photo" value = "<%=u.getphoto()%>"><br>
	</fieldset>
	<div >
		<input type="submit" class="submit" value="Submit">
	</div>
</form>

</body>
</html>