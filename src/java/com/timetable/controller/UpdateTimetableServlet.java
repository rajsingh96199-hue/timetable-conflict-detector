package com.timetable.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.timetable.util.DBConnection;

public class UpdateTimetableServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String day = request.getParameter("day");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");

            if(startTime.compareTo(endTime) >= 0) {
                request.setAttribute("msg", "End time must be after start time!");
                request.getRequestDispatcher("viewTimetable.jsp")
                       .forward(request, response);
                return;
            }

            Connection con = DBConnection.getConnection();

            // Get room_id of existing entry
            PreparedStatement getRoom = con.prepareStatement(
            "SELECT room_id FROM timetable WHERE timetable_id=?");
            getRoom.setInt(1, id);
            ResultSet r = getRoom.executeQuery();
            r.next();
            int roomId = r.getInt(1);

            // Conflict check excluding current record
            PreparedStatement check = con.prepareStatement(
            "SELECT * FROM timetable " +
            "WHERE room_id=? AND day_of_week=? " +
            "AND timetable_id!=? " +
            "AND (start_time < ? AND end_time > ?)");

            check.setInt(1, roomId);
            check.setString(2, day);
            check.setInt(3, id);
            check.setString(4, endTime);
            check.setString(5, startTime);

            ResultSet rs = check.executeQuery();

            if(rs.next()) {
                request.setAttribute("msg", "Conflict Detected!");
                request.getRequestDispatcher("viewTimetable.jsp")
                       .forward(request, response);
                return;
            }

            PreparedStatement pst = con.prepareStatement(
            "UPDATE timetable SET day_of_week=?, start_time=?, end_time=? " +
            "WHERE timetable_id=?");

            pst.setString(1, day);
            pst.setString(2, startTime);
            pst.setString(3, endTime);
            pst.setInt(4, id);

            pst.executeUpdate();

            response.sendRedirect("viewTimetable.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
