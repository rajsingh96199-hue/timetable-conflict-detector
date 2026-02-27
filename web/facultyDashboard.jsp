<%
if(session.getAttribute("role") == null ||
   !session.getAttribute("role").equals("FACULTY")) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Faculty Dashboard</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- Top Bar -->
<div style="background:#1a73e8;color:white;
            padding:15px 30px;
            display:flex;
            justify-content:space-between;
            align-items:center;">

    <h2 style="margin:0;">Faculty Dashboard</h2>

    <div>
        Welcome, <b><%= session.getAttribute("name") %></b>
        <a href="LogoutServlet"
           style="margin-left:20px;
                  padding:6px 12px;
                  background:white;
                  color:#1a73e8;
                  text-decoration:none;
                  border-radius:4px;">
            Logout
        </a>
    </div>
</div>

<div style="padding:40px;">

    <div style="background:white;
                padding:25px;
                border-radius:8px;
                box-shadow:0 3px 8px rgba(0,0,0,0.1);
                width:320px;">

        <h3>View My Timetable</h3>
        <p>Check your assigned classes.</p>

        <a href="facultyTimetable.jsp"
           style="padding:8px 15px;
                  background:#1a73e8;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;">
            Open
        </a>

    </div>

</div>

</body>
</html>
