<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.SuggestionDAO.SuggestionDAO"%>
<%@ page import="com.example.SuggestionVO.SuggestionVO" %>
<%@ page import="com.example.common.FileUpload" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	SuggestionDAO boardDAO = new SuggestionDAO();
	FileUpload upload = new FileUpload();
	SuggestionVO u = upload.uploadPhoto(request);
	int i = boardDAO.insertBoard(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>