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
<p><u><b><font size = "32">Thank you for adding an artist!</font></b></u></p>

<%
try{
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String country = request.getParameter("country");
	String description = request.getParameter("description");
	Statement s = con.createStatement();
	s.executeUpdate("insert into artist(artist_id, name, birth_year, country, description) values (default,'" + name + "'," + birth + ",'" + country + "','" + description + "')");
	out.println("Successfully added Artist: "+ name);
}
catch(Exception e){
	out.println("ASdfdsdf");
} 
%>

<form action = "index.jsp" method = "post">
	<button name= "gallery_id" type="submit" class="btn btn-link">back to list of galleries</button>
</form>
</center>

