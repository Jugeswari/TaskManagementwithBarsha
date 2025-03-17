package com.taskmanagement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginForm")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Step 1: Get form data
        String name = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Step 2: Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 3: Create Connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_management", "root", "root");

            // Step 4: Create SQL query to check user
            String sql = "SELECT * FROM user WHERE name = ? AND password = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, password);
            
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("session_name", rs.getString("name"));
                session.setAttribute("session_email", rs.getString("email"));
                response.sendRedirect("home.jsp"); // Redirect to welcome page
            } else {
                // Step 6: If login fails, show error
                out.println("<script>alert('Invalid Email or Password!');window.location='signin.jsp';</script>");
            }

            // Close resources
            rs.close();
            pst.close();
            con.close();

        } catch (Exception e) {
            out.println("<script>alert('Something went wrong! Try again.');window.location='signin.jsp';</script>");
            e.printStackTrace();
        }
    }
}
