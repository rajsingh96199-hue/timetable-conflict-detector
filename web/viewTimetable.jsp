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
<title>View Timetable</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- Header -->
<div style="background:#222;color:white;padding:15px 30px;
            display:flex;justify-content:space-between;align-items:center;">
    <h2 style="margin:0;">Timetable List</h2>
    <a href="adminDashboard.jsp"
       style="color:white;text-decoration:none;">Back</a>
</div>

<div style="padding:30px;">

<% if(request.getAttribute("msg") != null){ %>
<p style="color:red;font-weight:bold;">
<%= request.getAttribute("msg") %>
</p>
<% } %>

<table border="1" cellpadding="10"
       style="border-collapse:collapse;width:100%;
              text-align:center;background:white;">

<tr style="background:#222;color:white;">
<th>ID</th>
<th>Subject</th>
<th>Room</th>
<th>Day</th>
<th>Start</th>
<th>End</th>
<th>Action</th>
</tr>

<%
PreparedStatement pst = con.prepareStatement(
"SELECT t.timetable_id, s.subject_name, c.room_name, " +
"t.day_of_week, t.start_time, t.end_time " +
"FROM timetable t " +
"JOIN subject s ON t.subject_id=s.subject_id " +
"JOIN classroom c ON t.room_id=c.room_id");

ResultSet rs = pst.executeQuery();

while(rs.next()){
%>

<tr>
<td><%= rs.getInt(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td>

<!-- Edit Button -->
<form action="editTimetable.jsp" method="get" style="display:inline;">
<input type="hidden" name="id"
       value="<%= rs.getInt(1) %>">
<button type="submit"
        style="background:orange;color:white;
               border:none;padding:5px 10px;
               border-radius:4px;">
Edit
</button>
</form>

<!-- Delete Button -->
<form action="DeleteTimetableServlet" method="post" style="display:inline;">
<input type="hidden" name="timetableId"
       value="<%= rs.getInt(1) %>">
<button type="submit"
        style="background:red;color:white;
               border:none;padding:5px 10px;
               border-radius:4px;">
Delete
</button>
</form>

</td>
</tr>

<% } %>

</table>

</div>

</body>
</html>
