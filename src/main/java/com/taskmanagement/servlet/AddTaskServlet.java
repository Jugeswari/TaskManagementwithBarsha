package com.taskmanagement.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

@WebServlet("/AddTaskForm")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String addedOn = request.getParameter("date");
		String deadline = request.getParameter("deadline");
		String description = request.getParameter("description");
		
		HttpSession session = request.getSession();
        String email = (String) session.getAttribute("session_email");

		try {
			// Database Connection
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_management", "root", "root");

			// Query to insert task
			String query = "INSERT INTO tasks (title, added_on, deadline, description, email) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, addedOn);
			pstmt.setString(3, deadline);
			pstmt.setString(4, description);
			pstmt.setString(5, email);

			pstmt.executeUpdate();
			con.close();

			// Redirect with Success Message
			response.sendRedirect("home.jsp?success=true");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}

}
