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
	<p><u><b><font size = "32">You have modified this image</font></b></u></p>

<%
try{
	String image_id = request.getParameter("image_id");
	String link = request.getParameter("link");
	String year = request.getParameter("year");
	String type = request.getParameter("type");
	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String location = request.getParameter("location");
	String description = request.getParameter("description");
	String title = request.getParameter("title");

	Statement s = con.createStatement();
	s.executeUpdate("UPDATE image SET title = '" + title + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE image SET link = '" + link + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE detail SET year = '" + year + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE detail SET type = '" + type + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE detail SET width = '" + width + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE detail SET height = '" + height + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE detail SET location = '" + location + "'" + "WHERE image_id =" + image_id);
	s.executeUpdate("UPDATE detail SET description = '" + description + "'" + "WHERE image_id =" + image_id);
	
	

	//s.executeUpdate("UPDATE image SET title = '" + title + "'," + "link ='" + link + "'," + "year='" + year + "'," + "type='" + type + "',"
	//+ "width='" + width + "'," + "height='" + height + "'," + "location='" + location + "'," + "description='" + description + "'" + "WHERE image_id ='" + image_id + "'");
	
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