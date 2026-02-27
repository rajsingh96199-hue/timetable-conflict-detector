<%@ page import="java.sql.*" %>
<%@ page import="com.timetable.util.DBConnection" %>

<%
if(session.getAttribute("role") == null ||
   !session.getAttribute("role").equals("ADMIN")) {
    response.sendRedirect("login.jsp");
    return;
}

Connection con = DBConnection.getConnection();
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Classrooms</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- Header -->
<div style="background:#222;color:white;padding:15px 30px;
            display:flex;justify-content:space-between;align-items:center;">
    <h2 style="margin:0;">Manage Classrooms</h2>
    <a href="adminDashboard.jsp"
       style="color:white;text-decoration:none;">Back</a>
</div>

<div style="padding:30px;display:flex;gap:40px;flex-wrap:wrap;">

<!-- Add Room Form -->
<div style="background:white;padding:20px;border-radius:8px;
            box-shadow:0 3px 8px rgba(0,0,0,0.1);width:350px;">

<h3>Add Classroom</h3>

<form action="ClassroomServlet" method="post">

<input type="text" name="roomName"
       placeholder="Room Name (e.g. A101)" required
       style="width:100%;padding:8px;margin-bottom:15px;">

<input type="number" name="capacity"
       placeholder="Capacity" required
       style="width:100%;padding:8px;margin-bottom:15px;">

<button type="submit" name="action" value="add"
        style="padding:8px 15px;background:#222;
               color:white;border:none;border-radius:5px;">
Add Room
</button>

</form>

</div>

<!-- Room List -->
<div style="flex:1;background:white;padding:20px;
            border-radius:8px;
            box-shadow:0 3px 8px rgba(0,0,0,0.1);">

<h3>Classroom List</h3>

<table border="1" cellpadding="8"
       style="border-collapse:collapse;width:100%;text-align:center;">

<tr style="background:#222;color:white;">
<th>ID</th>
<th>Room Name</th>
<th>Capacity</th>
<th>Action</th>
</tr>

<%
PreparedStatement pst = con.prepareStatement(
"SELECT * FROM classroom");

ResultSet rs = pst.executeQuery();

while(rs.next()){
%>

<tr>
<td><%= rs.getInt("room_id") %></td>
<td><%= rs.getString("room_name") %></td>
<td><%= rs.getInt("capacity") %></td>
<td>
<form action="ClassroomServlet" method="post" style="display:inline;">
<input type="hidden" name="roomId"
       value="<%= rs.getInt("room_id") %>">
<button type="submit" name="action" value="delete"
        style="background:red;color:white;
               border:none;padding:5px 10px;border-radius:4px;">
Delete
</button>
</form>
</td>
</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>
