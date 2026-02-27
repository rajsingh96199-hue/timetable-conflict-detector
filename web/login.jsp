<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<body style="margin:0; font-family:Arial; background:#eef2f3;">

<div style="width:350px; margin:100px auto; background:white;
            padding:30px; border-radius:8px;
            box-shadow:0 4px 12px rgba(0,0,0,0.1);">

    <h2 style="text-align:center; margin-bottom:20px;">Login</h2>

    <form action="LoginServlet" method="post">

        <input type="email" name="email" placeholder="Email" required
               style="width:100%; padding:8px; margin-bottom:15px;">

        <input type="password" name="password" placeholder="Password" required
               style="width:100%; padding:8px; margin-bottom:20px;">

        <button type="submit"
                style="width:100%; padding:10px;
                       background:#1a73e8; color:white;
                       border:none; border-radius:5px;">
            Login
        </button>
    </form>

    <p style="text-align:center; margin-top:15px;">
        <a href="register.jsp">Create Account</a>
    </p>

    <% if(request.getAttribute("message") != null) { %>
        <p style="color:red; text-align:center;">
            <%= request.getAttribute("message") %>
        </p>
    <% } %>

</div>

</body>
</html>
