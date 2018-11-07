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



<%String artist_id = request.getParameter("artist_id");%>

<center>										
<p><u><b><font size = "32"> Artist Information </font></b></u></p>

<% //3. List Artist Details
try{
	Statement s = con.createStatement();
	s.executeQuery("SELECT * FROM artist WHERE artist_id = " + artist_id);
	ResultSet rs = s.getResultSet();
	rs.next();
	String name = rs.getString("name");
	int bday = rs.getInt("birth_year");
	String country = rs.getString("country");
	String description = rs.getString("description");
	out.println("Name: " + name + ";" + " Birth Year: " + bday + ";" + " Country: " + country + ";" + " Description: " + description);


	%>

	

<%}
catch(Exception e){
			
		}%>

</center>

<form action= "update_artist.jsp" method="post">
	<p> <b>Update Artist Information:</b><p>

	Name: <input name="name" type="text">
	Birth Year: <input name="birth" type="text">
	Country: <input name="country" type="text">
	Description: <input name="description" type="text">

	<button name= "artist_id" type="submit" value="<%out.println(artist_id);%>" class="btn btn-link"><font color = green>Submit</font></button>
</form>

