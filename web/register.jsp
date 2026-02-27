<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
</head>
<body style="font-family:Arial; background:#f0f2f5;">

<div style="width:350px;margin:80px auto;background:white;
padding:30px;border-radius:8px;box-shadow:0 4px 10px rgba(0,0,0,0.1);">

<h2 style="text-align:center;">Faculty Registration</h2>

<form action="RegisterServlet" method="post">

    <input type="text" name="name" placeholder="Full Name" required
    style="width:100%;padding:8px;margin-bottom:15px;">

    <input type="email" name="email" placeholder="Email" required
    style="width:100%;padding:8px;margin-bottom:15px;">

    <input type="password" name="password" placeholder="Password" required
    style="width:100%;padding:8px;margin-bottom:20px;">

    <button type="submit"
    style="width:100%;padding:10px;background:#1a73e8;color:white;
    border:none;border-radius:5px;">
        Register
    </button>

</form>

<% if(request.getAttribute("msg")!=null){ %>
<p style="color:red;text-align:center;">
<%= request.getAttribute("msg") %>
</p>
<% } %>

<p style="text-align:center;margin-top:15px;">
<a href="login.jsp">Already have account?</a>
</p>

</div>
</body>
</html>
