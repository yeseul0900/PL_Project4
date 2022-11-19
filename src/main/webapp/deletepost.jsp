<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.SuggestionDAO.SuggestionDAO, com.example.SuggestionVO.SuggestionVO"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		SuggestionVO u = new SuggestionVO();
		u.setPersonID(id);
		SuggestionDAO boardDAO = new SuggestionDAO();
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>