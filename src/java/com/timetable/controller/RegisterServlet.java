package com.timetable.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.timetable.util.DBConnection;

public class RegisterServlet extends HttpServlet {

    // If someone opens servlet directly
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("register.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                response.getWriter().println("Database Connection Failed");
                return;
            }

            // Check if email already exists
            PreparedStatement checkStmt = con.prepareStatement(
                    "SELECT * FROM users WHERE email=?");
            checkStmt.setString(1, email);

            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("msg", "Email already registered!");
                request.getRequestDispatcher("register.jsp")
                        .forward(request, response);
                return;
            }

            // Insert new faculty
            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, 'FACULTY')");

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);

            int result = pst.executeUpdate();

            if (result > 0) {

                // Successful registration → redirect to login
                response.sendRedirect("login.jsp");

            } else {

                request.setAttribute("msg", "Registration Failed!");
                request.getRequestDispatcher("register.jsp")
                        .forward(request, response);
            }

        } catch (Exception e) {

            // Print error on browser (temporary for debugging)
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>Error Occurred:</h3>");
            e.printStackTrace(out);

        }
    }
}
