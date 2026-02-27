package com.timetable.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.timetable.util.DBConnection;

public class ClassroomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String roomName = request.getParameter("roomName");
            String capacityStr = request.getParameter("capacity");

            if(roomName == null || roomName.trim().isEmpty()
               || capacityStr == null || capacityStr.trim().isEmpty()) {

                request.setAttribute("errorMessage",
                        "All fields are required!");
                request.getRequestDispatcher("manageClassrooms.jsp")
                       .forward(request, response);
                return;
            }

            int capacity = Integer.parseInt(capacityStr);

            Connection con = DBConnection.getConnection();

            // 🔍 Check if classroom already exists
            PreparedStatement check = con.prepareStatement(
                    "SELECT * FROM classroom WHERE room_name=?"
            );

            check.setString(1, roomName.trim());
            ResultSet rs = check.executeQuery();

            if (rs.next()) {

                request.setAttribute("errorMessage",
                        "Classroom already taken!");

                request.getRequestDispatcher("manageClassrooms.jsp")
                       .forward(request, response);
                return;
            }

            // ✅ Insert new classroom
            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO classroom(room_name, capacity) VALUES (?, ?)"
            );

            pst.setString(1, roomName.trim());
            pst.setInt(2, capacity);

            pst.executeUpdate();

            request.setAttribute("successMessage",
                    "Classroom added successfully!");

            request.getRequestDispatcher("manageClassrooms.jsp")
                   .forward(request, response);

        } catch(Exception e){
            e.printStackTrace();

            request.setAttribute("errorMessage",
                    "Something went wrong!");

            request.getRequestDispatcher("manageClassrooms.jsp")
                   .forward(request, response);
        }
    }
}