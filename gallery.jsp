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



<%String g_id = request.getParameter("gallery_id");%>

<center>										
<p><u><b><font size = "32"> Gallery </font></b></u></p>

<% //2. List images
try{
	Statement s = con.createStatement();
	s.executeQuery("SELECT * FROM image WHERE gallery_id =" + g_id);
	ResultSet rs = s.getResultSet();
	int number = 0;
	while(rs.next()){
		number++;
		String iTitle = rs.getString("title");
		String iLink =  rs.getString("link");
		out.println("Title: " + iTitle + ";");
		out.println("Link: " + iLink);%>
		<form action = "image.jsp" method = "post">
			<button name= "image_id" type="submit" value="<%out.println(rs.getInt("image_id"));%>" class="btn btn-link">View</button>
		</form>
		<p></p>
	<%}
	out.println("Total number of images in this gallery: " + number);
}
catch(Exception e){
			
		}%>
</center>
<p></p>
<p></p>
<p></p>
<form action= "add_image.jsp" method="post">
	<p> <b>Add Image to this Gallery:</b><p>
	Title: <input name="name" type="text">
	Link: <input name="birth" type="text">
	Year: <input name="year" type="text">
	Type: <input name="type" type="text">
	Width: <input name="width" type="text">
	Height: <input name="height" type="text">
	Location: <input name="location" type="text">
	Description: <input name="description" type="text">
	Artist_ID: <input name="artist_id" type="text">
	<input type="submit" value="Submit"/>
</form>

<form action= "update_gallery.jsp" method="post">
	<p> <b>Update Gallery Information:</b><p>

	Title: <input name="title" type="text">
	Description: <input name="description" type="text">
	
	<button name= "gallery_id" type="submit" value="<%out.println(g_id);%>" class="btn btn-link"><font color = green>Submit</font></button>
</form>