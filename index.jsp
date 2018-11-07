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
<p><u><b><font size = "32">List of Galleries</font></b></u></p>
<%//1.List Galleries
try{
	Statement s = con.createStatement();
	s.executeQuery("SELECT * FROM gallery");
	ResultSet rs = s.getResultSet();

	while(rs.next()){
		String gName = rs.getString("name");
		String gDescription =  rs.getString("description");
		out.println("Name: " + gName);
		out.println("Description: " + gDescription);%>
		<form action = "gallery.jsp" method = "post">
			<button name= "gallery_id" type="submit" value="<%out.println(rs.getInt("gallery_id"));%>" class="btn btn-link">View</button>
		</form>
		<p></p>
	<%}
}
catch(Exception e){
			
}%>
</center>

<p></p> <!-- add a gallery -->

<form action= "add_gallery.jsp" method="post">
<p> <b>Add Gallery:</b><p>

Name: <input name="name" type="text">
Description: <input name="description" type="text">

<input type="submit" value="Submit"/>

</form>

<p></p> <!-- add an artist -->

<form action= "add_artist.jsp" method="post">
<p> <b>Add Artist:</b><p>

Name: <input name="name" type="text">
Birth Year: <input name="birth" type="text">
Country: <input name="country" type="text">
Description: <input name="description" type="text">

<input type="submit" value="Submit"/>

</form>

<form action= "search_image_type.jsp" method="post">
<p> <b>Seach Image by Type:</b><p>

Type: <input name="type" type="text">

<input type="submit" value="Submit"/>

</form>

<form action= "search_image_year.jsp" method="post">
<p> <b>Seach Image by range of years:</b><p>

From: <input name="from" type="text">
To: <input name="to" type="text">

<input type="submit" value="Submit"/>

</form>

<form action= "search_image_artist.jsp" method="post">
<p> <b>Seach Image by Artist:</b><p>

Artist Name: <input name="name" type="text">

<input type="submit" value="Submit"/>

</form>

<form action= "search_image_location.jsp" method="post">
<p> <b>Seach Image by Location:</b><p>

Location: <input name="location" type="text">

<input type="submit" value="Submit"/>

</form>




