package com.timetable.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.timetable.util.DBConnection;

public class AddTimetableServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int subjectId = Integer.parseInt(request.getParameter("subjectId"));
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            String day = request.getParameter("day");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");

            Connection con = DBConnection.getConnection();

            // 🔥 Conflict Detection Query
           PreparedStatement check = con.prepareStatement(
    "SELECT * FROM timetable " +
    "WHERE room_id=? AND day_of_week=? " +
    "AND start_time < ? AND end_time > ?"
);

check.setInt(1, roomId);
check.setString(2, day);
check.setString(3, endTime);    // new end time
check.setString(4, startTime);  // new start time

ResultSet rs = check.executeQuery();

if (rs.next()) {

    request.setAttribute("msg",
        "Classroom already taken for this time slot!");

    request.getRequestDispatcher("addTimetable.jsp")
           .forward(request, response);
    return;
}

            // Insert if no conflict
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO timetable(subject_id, room_id, day_of_week, start_time, end_time) " +
                "VALUES(?,?,?,?,?)");

            pst.setInt(1, subjectId);
            pst.setInt(2, roomId);
            pst.setString(3, day);
            pst.setString(4, startTime);
            pst.setString(5, endTime);

            pst.executeUpdate();

            response.sendRedirect("addTimetable.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
