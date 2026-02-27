<%
if(session.getAttribute("role") == null ||
   !session.getAttribute("role").equals("ADMIN")) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- Top Bar -->
<div style="background:#222;color:white;
            padding:15px 30px;
            display:flex;
            justify-content:space-between;
            align-items:center;">

    <h2 style="margin:0;">Admin Dashboard</h2>

    <div>
        Welcome, <b><%= session.getAttribute("name") %></b>
        <a href="LogoutServlet"
           style="margin-left:20px;
                  padding:6px 12px;
                  background:white;
                  color:black;
                  text-decoration:none;
                  border-radius:4px;">
            Logout
        </a>
    </div>
</div>

<!-- Content Area -->
<div style="padding:40px;
            display:flex;
            gap:20px;
            flex-wrap:wrap;">

    <!-- Manage Subjects -->
    <div style="flex:1;min-width:250px;
                background:white;
                padding:20px;
                border-radius:8px;
                box-shadow:0 3px 8px rgba(0,0,0,0.1);">

        <h3>Manage Subjects</h3>
        <p>Add or remove subjects.</p>

        <a href="manageSubjects.jsp"
           style="padding:8px 15px;
                  background:#222;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;">
            Manage
        </a>
    </div>

    <!-- Manage Classrooms -->
    <div style="flex:1;min-width:250px;
                background:white;
                padding:20px;
                border-radius:8px;
                box-shadow:0 3px 8px rgba(0,0,0,0.1);">

        <h3>Manage Classrooms</h3>
        <p>Add or update rooms.</p>

        <a href="manageClassrooms.jsp"
           style="padding:8px 15px;
                  background:#222;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;">
            Manage
        </a>
    </div>

    <!-- Create Timetable -->
    <div style="flex:1;min-width:250px;
                background:white;
                padding:20px;
                border-radius:8px;
                box-shadow:0 3px 8px rgba(0,0,0,0.1);">

        <h3>Create Timetable</h3>
        <p>Assign subjects and detect conflicts.</p>

        <a href="addTimetable.jsp"
           style="padding:8px 15px;
                  background:#222;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;">
            Create
        </a>
    </div>

    <!-- View Timetable -->
    <div style="flex:1;min-width:250px;
                background:white;
                padding:20px;
                border-radius:8px;
                box-shadow:0 3px 8px rgba(0,0,0,0.1);">

        <h3>View Timetable</h3>
        <p>See, edit and delete schedules.</p>

        <a href="viewTimetable.jsp"
           style="padding:8px 15px;
                  background:#222;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;">
            View
        </a>
    </div>

</div>

</body>
</html>
