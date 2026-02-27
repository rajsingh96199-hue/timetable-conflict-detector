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
<title>Manage Subjects</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- Header -->
<div style="background:#222;color:white;padding:15px 30px;
            display:flex;justify-content:space-between;align-items:center;">
    <h2 style="margin:0;">Manage Subjects</h2>
    <a href="adminDashboard.jsp"
       style="color:white;text-decoration:none;">Back</a>
</div>

<div style="padding:30px;display:flex;gap:40px;flex-wrap:wrap;">

<!-- Add Subject Form -->
<div style="background:white;padding:20px;border-radius:8px;
            box-shadow:0 3px 8px rgba(0,0,0,0.1);width:350px;">

<h3>Add Subject</h3>

<form action="SubjectServlet" method="post">

<input type="text" name="subjectName"
       placeholder="Subject Name" required
       style="width:100%;padding:8px;margin-bottom:15px;">

<select name="facultyId" required
        style="width:100%;padding:8px;margin-bottom:15px;">
<option value="">Select Faculty</option>

<%
PreparedStatement pst1 = con.prepareStatement(
"SELECT user_id,name FROM users WHERE role='FACULTY'");
ResultSet rs1 = pst1.executeQuery();

while(rs1.next()){
%>
<option value="<%= rs1.getInt("user_id") %>">
<%= rs1.getString("name") %>
</option>
<% } %>

</select>

<button type="submit" name="action" value="add"
        style="padding:8px 15px;background:#222;
               color:white;border:none;border-radius:5px;">
Add Subject
</button>

</form>

</div>

<!-- Subject List -->
<div style="flex:1;background:white;padding:20px;
            border-radius:8px;
            box-shadow:0 3px 8px rgba(0,0,0,0.1);">

<h3>Subject List</h3>

<table border="1" cellpadding="8"
       style="border-collapse:collapse;width:100%;text-align:center;">

<tr style="background:#222;color:white;">
<th>ID</th>
<th>Subject</th>
<th>Faculty</th>
<th>Action</th>
</tr>

<%
PreparedStatement pst2 = con.prepareStatement(
"SELECT s.subject_id, s.subject_name, u.name " +
"FROM subject s JOIN users u ON s.faculty_id=u.user_id");

ResultSet rs2 = pst2.executeQuery();

while(rs2.next()){
%>

<tr>
<td><%= rs2.getInt(1) %></td>
<td><%= rs2.getString(2) %></td>
<td><%= rs2.getString(3) %></td>
<td>
<form action="SubjectServlet" method="post" style="display:inline;">
<input type="hidden" name="subjectId"
       value="<%= rs2.getInt(1) %>">
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
