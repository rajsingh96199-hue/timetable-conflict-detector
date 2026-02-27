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
<title>Create Timetable</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- Header -->
<div style="background:#222;color:white;
            padding:15px 30px;
            display:flex;
            justify-content:space-between;
            align-items:center;">

    <h2 style="margin:0;">Create Timetable</h2>

    <a href="adminDashboard.jsp"
       style="color:white;
              text-decoration:none;
              background:#444;
              padding:6px 12px;
              border-radius:4px;">
        Back
    </a>
</div>

<div style="padding:30px;">

<form action="AddTimetableServlet" method="post"
      style="background:white;padding:25px;
             border-radius:8px;
             box-shadow:0 3px 8px rgba(0,0,0,0.1);
             width:400px;">

<h3>Assign Schedule</h3>

<!-- Subject Dropdown -->
<select name="subjectId" required
        style="width:100%;padding:8px;margin-bottom:15px;">
<option value="">Select Subject</option>

<%
PreparedStatement pst1 = con.prepareStatement(
"SELECT subject_id, subject_name FROM subject");
ResultSet rs1 = pst1.executeQuery();
while(rs1.next()){
%>
<option value="<%= rs1.getInt(1) %>">
<%= rs1.getString(2) %>
</option>
<% } %>
</select>


<select name="roomId" required
        style="width:100%;padding:8px;margin-bottom:15px;">
<option value="">Select Room</option>

<%
PreparedStatement pst2 = con.prepareStatement(
"SELECT room_id, room_name FROM classroom");
ResultSet rs2 = pst2.executeQuery();
while(rs2.next()){
%>
<option value="<%= rs2.getInt(1) %>">
<%= rs2.getString(2) %>
</option>
<% } %>
</select>

<!-- Day -->
<select name="day" required
        style="width:100%;padding:8px;margin-bottom:15px;">
<option value="">Select Day</option>
<option>MONDAY</option>
<option>TUESDAY</option>
<option>WEDNESDAY</option>
<option>THURSDAY</option>
<option>FRIDAY</option>
<option>SATURDAY</option>
</select>

<!-- Time -->
<input type="time" name="startTime" required
       style="width:100%;padding:8px;margin-bottom:15px;">

<input type="time" name="endTime" required
       style="width:100%;padding:8px;margin-bottom:20px;">

<button type="submit"
        style="padding:8px 15px;background:#222;
               color:white;border:none;border-radius:5px;">
Create Timetable
</button>

</form>

<% if(request.getAttribute("msg")!=null){ %>
<p style="color:red;margin-top:20px;">
<%= request.getAttribute("msg") %>
</p>
<% } %>

</div>

</body>
</html>
