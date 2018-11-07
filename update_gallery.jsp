<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<head> 
	<title>Image Gallery</title> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<%try {
Class.forName("com.mysql.jdbc.Driver").newInstance(); //connect to Driver
}
catch(Exception e) {
out.println("can't load mysql driver");
out.println(e.toString());
} %>

<%
Connection con  = null;                             //Establish connection with database
try{
	String url="jdbc:mysql://127.0.0.1:3306/gallery";
	String id="gallery";
	String pwd="eecs118";
	con= DriverManager.getConnection(url,id,pwd);
}
catch(Exception e){
			System.err.println("Cannot connect to database server");
		}%>





<center>
	<p><u><b><font size = "32">You have modified the gallery information</font></b></u></p>

<%
try{
	
	String gallery_id = request.getParameter("gallery_id");
	String title= request.getParameter("title");
	String description = request.getParameter("description");
	

	Statement s = con.createStatement();
	s.executeUpdate("UPDATE gallery SET name = '" + title+ "'" + "WHERE gallery_id =" + gallery_id);
	s.executeUpdate("UPDATE gallery SET description = '" + description + "'" + "WHERE gallery_id =" + gallery_id);
	
	
}
catch(Exception e){
	out.println("error");
} 
%>

<form action = "index.jsp" method = "post">
	<button name= "gallery_id" type="submit" class="btn btn-link">back to list of galleries</button>
</form>
</center>




</center>