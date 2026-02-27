<%@ page import="java.sql.*" %>
<%@ page import="com.timetable.util.DBConnection" %>

<%
if(session.getAttribute("role") == null ||
   !session.getAttribute("role").equals("FACULTY")) {
    response.sendRedirect("login.jsp");
    return;
}

int facultyId = (int) session.getAttribute("userId");
String selectedDay = request.getParameter("day");

Connection con = DBConnection.getConnection();
%>

<!DOCTYPE html>
<html>
<head>
<title>My Timetable</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<div style="background:#1a73e8;color:white;
            padding:15px 30px;
            display:flex;justify-content:space-between;">
<h2 style="margin:0;">My Timetable</h2>
<a href="facultyDashboard.jsp"
   style="color:white;text-decoration:none;">Back</a>
</div>

<div style="padding:30px;">

<!-- Day Filter -->
<form method="get" style="margin-bottom:20px;">
<select name="day"
        style="padding:8px;">
<option value="">All Days</option>
<option>MONDAY</option>
<option>TUESDAY</option>
<option>WEDNESDAY</option>
<option>THURSDAY</option>
<option>FRIDAY</option>
<option>SATURDAY</option>
</select>

<button type="submit"
        style="padding:8px 12px;
               background:#1a73e8;
               color:white;
               border:none;
               border-radius:4px;">
Filter
</button>
</form>

<table border="1" cellpadding="10"
       style="border-collapse:collapse;width:100%;
              text-align:center;background:white;">

<tr style="background:#1a73e8;color:white;">
<th>Subject</th>
<th>Room</th>
<th>Day</th>
<th>Start</th>
<th>End</th>
</tr>

<%
String query =
"SELECT s.subject_name, c.room_name, " +
"t.day_of_week, t.start_time, t.end_time " +
"FROM timetable t " +
"JOIN subject s ON t.subject_id=s.subject_id " +
"JOIN classroom c ON t.room_id=c.room_id " +
"WHERE s.faculty_id=?";

if(selectedDay != null && !selectedDay.equals("")) {
    query += " AND t.day_of_week=?";
}

PreparedStatement pst = con.prepareStatement(query);
pst.setInt(1, facultyId);

if(selectedDay != null && !selectedDay.equals("")) {
    pst.setString(2, selectedDay);
}

ResultSet rs = pst.executeQuery();

while(rs.next()){
%>

<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
</tr>

<% } %>

</table>

</div>

</body>
</html>
