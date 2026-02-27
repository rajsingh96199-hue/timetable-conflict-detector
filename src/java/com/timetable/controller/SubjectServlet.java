package com.timetable.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import com.timetable.util.DBConnection;

public class SubjectServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            Connection con = DBConnection.getConnection();

            if(action.equals("add")) {

                String subjectName = request.getParameter("subjectName");
                int facultyId = Integer.parseInt(
                        request.getParameter("facultyId"));

                PreparedStatement pst = con.prepareStatement(
                "INSERT INTO subject(subject_name, faculty_id) VALUES (?, ?)");

                pst.setString(1, subjectName);
                pst.setInt(2, facultyId);
                pst.executeUpdate();
            }

            if(action.equals("delete")) {

                int subjectId = Integer.parseInt(
                        request.getParameter("subjectId"));

                PreparedStatement pst = con.prepareStatement(
                "DELETE FROM subject WHERE subject_id=?");

                pst.setInt(1, subjectId);
                pst.executeUpdate();
            }

            response.sendRedirect("manageSubjects.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
