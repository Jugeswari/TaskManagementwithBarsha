package com.taskmanagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mysql.cj.jdbc.PreparedStatementWrapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterForm")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("fullname");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		System.out.println("hello.....Post");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_management","root","root");
			System.out.println("success");
			PreparedStatement ps = con.prepareStatement("insert into user (name,email,password) values(?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pass);
			
			int result = ps.executeUpdate();
			if(result>0) {
				 resp.sendRedirect("signin.jsp?message=Account Created Successfully");
            } else {
                resp.sendRedirect("signup.jsp?error=Something went wrong");
            }
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("signup.jsp?error=User Already Exists");
		}

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hello.....");
		resp.sendRedirect("signup.jsp");
	}

}