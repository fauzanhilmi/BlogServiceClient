<!-- 
    Document   : index
    Created on : Nov 24, 2014, 4:14:48 PM
    Author     : adwisatya
-->

<%@page import = "classes.Client" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "classes.Post" %>
<%@page import= "classes.User" %>
<%@page import= "classes.Comment" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Simple Blog">
<meta name="author" content="Bangsatya">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="omfgitsasalmon">
<meta name="twitter:title" content="Simple Blog">
<meta name="twitter:description" content="Simple Blog">
<meta name="twitter:creator" content="Bangsatya Blog">
<meta name="twitter:image:src" content="{{! TODO: ADD GRAVATAR URL HERE }}">

<meta property="og:type" content="article">
<meta property="og:title" content="Simple Blog">
<meta property="og:description" content="Deskripsi Blog">
<meta property="og:image" content="{{! TODO: ADD GRAVATAR URL HERE }}">
<meta property="og:site_name" content="Simple Blog">

<link rel="stylesheet" type="text/css" href="assets/css/screen.css" />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<title>Simple Blog of Bangsatya</title>
</head>

<body class="default">
<div class="wrapper">

<jsp:include page="header.jsp"/>
<%
	String usrC=" ";
	int typeC=4;
	Cookie[] cookies = null;
	cookies = request.getCookies();
	if (cookies!=null){
		for (Cookie c:cookies){
			if (c.getName().equals("LogName")){
				usrC=c.getValue();
				for (Cookie c2:cookies){
				    if (c2.getName().equals("LogType")){
							typeC=Integer.parseInt(c2.getValue());
						}
				}
			}
		}
	}
%>

<div id="home">
    <div class="posts">
        <nav class="art-list">
          <ul class="art-list-body">
			<%
				Client Cli = new Client();
				for(int i=0;i<Cli.getPublishedPost().size();i++){
                                    out.println(Cli.getPublishedPost().get(i));
                                    Post p = new Post();
                                    p.JSONtoPost(Cli.getPublishedPost().get(i));
					//if(p.Status == 1){
			%>	
			<li class="art-list-item">
				<div class="art-list-item-title-and-time">
					<h2 class="art-list-title"><a href="show_post.jsp?id=<% out.println(/*Cli.GetPublishedPost().get(i).id*/p.id); %>"><% out.println(/*Cli.GetPublishedPost().get(i).*/p.Judul); %></a></h2>
					<div class="art-list-time"><% out.println(/*Cli.GetPublishedPost().get(i)*/p.Tanggal); %></div>
					<div class="art-list-owner">Owner:&nbsp;<% out.println(/*Cli.GetPublishedPost().get(i)*/p.Owner); %></div>
				</div>
				<p><% out.println(/*Cli.getPublishedPost().get(i)*/p.Konten); %></p>
				
				<% if (typeC!=4){
				%>
					<a href="edit.jsp?id=<% out.println(/*Cli.getPublishedPost().get(i)*/p.id); %>">Edit</a> | <a href="#" onclick="return ConfirmDelete(<% out.println(p.id); %>);">Hapus</a>
				<% } %>
				
				
			</li>	
			<%
					//}
				}
			%>
          </ul>
        </nav>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</div>
<script>
    function ConfirmDelete(nomor)
    {
      var x = confirm("Apakah Anda yakin menghapus post ini?");
      if (x)
          return window.location.assign('trashPost.jsp?id='+nomor);
      else
        return false;
    }
</script>

</body>
</html>