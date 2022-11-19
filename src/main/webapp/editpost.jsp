<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.SuggestionDAO.SuggestionDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.SuggestionVO.SuggestionVO" />
<jsp:setProperty property="*" name="u"/>

<%
	SuggestionDAO boardDAO = new SuggestionDAO();
	int i=boardDAO.updateBoard(u);
	response.sendRedirect("posts.jsp");
%>