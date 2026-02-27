<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Timetable Conflict Detector</title>
</head>

<body style="margin:0; font-family:Segoe UI, Arial, sans-serif; 
             background:linear-gradient(to right,#eef2f3,#d9e4f5);
             overflow-x:hidden;">

<!-- NAVBAR -->
<div style="width:100%;
            background:#ffffff;
            padding:12px 20px;
            box-sizing:border-box;
            display:flex;
            justify-content:space-between;
            align-items:center;
            flex-wrap:wrap;
            box-shadow:0 2px 6px rgba(0,0,0,0.08);">

    <!-- Logo -->
    <div style="font-size:20px;
                font-weight:bold;
                color:#1a73e8;
                white-space:nowrap;">
        TimetableHub
    </div>

    <!-- Menu -->
    <div style="display:flex;
                flex-wrap:wrap;
                align-items:center;
                justify-content:flex-end;
                gap:10px;
                max-width:100%;">

        <a href="index.jsp"
           style="text-decoration:none;
                  color:#333;
                  font-size:14px;">
            Home
        </a>

        <a href="viewTimetable.jsp"
           style="text-decoration:none;
                  color:#333;
                  font-size:14px;">
            Timetable
        </a>

        <a href="login.jsp"
           style="padding:5px 12px;
                  border:1px solid #1a73e8;
                  color:#1a73e8;
                  text-decoration:none;
                  border-radius:5px;
                  font-size:13px;">
            Login
        </a>

        <a href="register.jsp"
           style="padding:5px 12px;
                  background:#1a73e8;
                  color:white;
                  text-decoration:none;
                  border-radius:5px;
                  font-size:13px;">
            Signup
        </a>

    </div>
</div>


<!-- HERO SECTION -->
<div style="min-height:85vh;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            text-align:center;
            padding:20px;
            box-sizing:border-box;">

    <div style="background:#ffe5e5;
                color:#c62828;
                padding:8px 18px;
                border-radius:20px;
                font-size:13px;
                margin-bottom:20px;">
        Smart Conflict Detection System
    </div>

    <h1 style="font-size:40px;
               margin:0;
               color:#1f2d3d;
               line-height:1.3;">
        Manage College Timetable <br> Without Conflicts
    </h1>

    <p style="color:#444;
              font-size:16px;
              margin-top:20px;
              max-width:650px;">
        Automatically detect classroom and time-slot clashes and manage your academic schedule efficiently.
    </p>

    <a href="login.jsp"
       style="margin-top:30px;
              padding:12px 28px;
              background:#1a73e8;
              color:white;
              text-decoration:none;
              font-size:16px;
              border-radius:6px;">
        Get Started
    </a>

</div>


<!-- FOOTER -->
<div style="width:100%;
            background:#ffffff;
            text-align:center;
            padding:15px;
            box-sizing:border-box;">
    <span style="color:#666; font-size:13px;">
        © 2026 Timetable Conflict Detector | BSc CS Project
    </span>
</div>

</body>
</html>
