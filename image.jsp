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



<%String image_id = request.getParameter("image_id");%>
<%//out.println(image_id);%>

<center>										
<p><u><b><font size = "32"> Image and Details </font></b></u></p>

<% //3. List image details
try{
	Statement s = con.createStatement();
	s.executeQuery("SELECT link, artist_id FROM image WHERE image_id = " + image_id);
	ResultSet rs = s.getResultSet();
	rs.next();
	String link = rs.getString("link");
	int artist_id = rs.getInt("artist_id");%>

	<img src = "<%out.println(link);%>" alt = "none">
	<p></p>

	<%
	s.executeQuery("SELECT * FROM detail WHERE image_id = " + image_id);
	rs = s.getResultSet();
	rs.next();
	int year = rs.getInt("year");
	String type = rs.getString("type");
	int width = rs.getInt("width");
	int height = rs.getInt("height");
	String location = rs.getString("location");
	String description = rs.getString("description");
	out.println("Year: " + year +";" + " Type: " + type +";" + " Width/Height: " + width + "x" + height +";" + " Location: " + location + ";" + " Description: " + description);
	%>

	<p>

		<%
		s.executeQuery("SELECT name, artist_id FROM artist WHERE artist_id = " + artist_id);
		rs = s.getResultSet();
		rs.next();
		String artist_name = rs.getString("name");
		out.println("Artist: " + artist_name);
		%>

		<form action = "artist.jsp" method = "post">
				<button name= "artist_id" type="submit" value="<%out.println(rs.getInt("artist_id"));%>" class="btn btn-link">Artist Information</button>
		</form>
	</p>

	

<%}
catch(Exception e){
			
		}%>

</center>

<form action= "update_image.jsp" method="post">
	<p> <b>Update Image:</b><p>


	Title: <input name="title" type="text">
	Link: <input name="link" type="text">
	Year: <input name="year" type="text">
	Type: <input name="type" type="text">
	Width: <input name="width" type="text">
	Height: <input name="height" type="text">
	Location: <input name="location" type="text">
	Description: <input name="description" type="text">

	<button name= "image_id" type="submit" value="<%out.println(image_id);%>" class="btn btn-link"><font color = green>Submit</font></button>
</form>

<center>
	

	<form action = "delete_image.jsp" method = "post">
		<button name= "image_id" type="submit" value="<%out.println(image_id);%>" class="btn btn-link"><font color = red>Delete This Image</font></button>
	</form>
</center>
