<%-- 
    Document   : post_komentar.jsp
    Created on : Nov 25, 2014, 2:31:32 PM
    Author     : adwisatya
--%>
<%@page import="classes.Client"%>

<%
	String Parent	=	request.getParameter("ID");
	String Name = request.getParameter("Name");
	String Email =  request.getParameter("Email");
	String Content = request.getParameter("Content");
	
        Client cli = new Client();
        int i = Integer.parseInt(Parent);
        cli.addComment(i,Name,Email,Content);
	//Komentar.NewKomentar(Parent, Name, Email, Content);
%>
