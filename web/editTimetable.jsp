<%@ page import="java.sql.*" %>
<%@ page import="com.timetable.util.DBConnection" %>

<%
if(session.getAttribute("role") == null ||
   !session.getAttribute("role").equals("ADMIN")) {
    response.sendRedirect("login.jsp");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
Connection con = DBConnection.getConnection();

PreparedStatement pst = con.prepareStatement(
"SELECT * FROM timetable WHERE timetable_id=?");
pst.setInt(1, id);
ResultSet rs = pst.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Timetable</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<div style="background:#222;color:white;padding:15px 30px;">
<h2>Edit Timetable</h2>
</div>

<div style="padding:30px;">

<form action="UpdateTimetableServlet" method="post"
      style="background:white;padding:25px;
             border-radius:8px;
             box-shadow:0 3px 8px rgba(0,0,0,0.1);
             width:400px;">

<input type="hidden" name="id" value="<%= id %>">

<label>Day</label>
<input type="text" name="day"
       value="<%= rs.getString("day_of_week") %>"
       required style="width:100%;padding:8px;margin-bottom:15px;">

<label>Start Time</label>
<input type="time" name="startTime"
       value="<%= rs.getString("start_time") %>"
       required style="width:100%;padding:8px;margin-bottom:15px;">

<label>End Time</label>
<input type="time" name="endTime"
       value="<%= rs.getString("end_time") %>"
       required style="width:100%;padding:8px;margin-bottom:20px;">

<button type="submit"
        style="padding:8px 15px;background:#222;
               color:white;border:none;border-radius:5px;">
Update
</button>

</form>

</div>

</body>
</html>
