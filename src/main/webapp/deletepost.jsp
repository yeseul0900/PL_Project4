<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.SuggestionDAO.SuggestionDAO, com.example.SuggestionVO.SuggestionVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		SuggestionVO u = new SuggestionVO();
		String filename = SuggestionDAO.getPhotoFilename(id);
		u.setPersonID(id);
		if(filename != null)
			FileUpload.deleteFile(request,filename);
		SuggestionDAO boardDAO = new SuggestionDAO();
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>