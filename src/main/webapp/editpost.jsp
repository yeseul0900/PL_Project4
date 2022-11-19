<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.SuggestionDAO.SuggestionDAO" %>
<%@ page import="com.example.common.FileUpload" %>
<%@ page import="com.example.SuggestionVO.SuggestionVO" %>

<% request.setCharacterEncoding("utf-8"); %>


<%
	SuggestionDAO boardDAO = new SuggestionDAO();
	FileUpload upload = new FileUpload();
	SuggestionVO u = upload.uploadPhoto(request);
	int i=boardDAO.updateBoard(u);
	response.sendRedirect("posts.jsp");

%>