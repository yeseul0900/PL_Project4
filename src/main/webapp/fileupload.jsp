<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.example.*, java.io.File" %>
<%--
  Created by IntelliJ IDEA.
  User: yeseul
  Date: 2022/11/19
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%
  String filename = "";
  int sizeLimit = 15 *1024*1024;

  String realPath = request.getServletContext().getRealPath("upload");
  File dir = new File(realPath);
  if(!dir.exists()) dir.mkdirs();

  MultipartRequest multipartRequest = null;
  multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());

  filename = multipartRequest.getFilesystemName("photo");
%>
