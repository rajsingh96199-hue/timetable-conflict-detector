package com.timetable.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.timetable.util.DBConnection;

public class DeleteTimetableServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(
                    request.getParameter("timetableId"));

            Connection con = DBConnection.getConnection();

            PreparedStatement pst = con.prepareStatement(
            "DELETE FROM timetable WHERE timetable_id=?");

            pst.setInt(1, id);
            pst.executeUpdate();

            response.sendRedirect("viewTimetable.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
