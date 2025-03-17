package com.taskmanagement.servlet;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebListener
public class TaskReminderScheduler extends HttpServlet implements ServletContextListener {
	private static final long serialVersionUID = 1L;

	private ScheduledExecutorService scheduler;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		scheduler = Executors.newSingleThreadScheduledExecutor();
		scheduler.scheduleAtFixedRate(() -> checkTaskDeadline(), 0, 12, TimeUnit.HOURS); // Runs every hour
		System.out.println("Scheduler started to check task deadlines.");

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		scheduler.shutdownNow();
		System.out.println("Scheduler stopped.");

	}

	private void checkTaskDeadline() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_management", "root", "root");
			PreparedStatement ps = con
					.prepareStatement("SELECT * FROM tasks WHERE deadline < CURDATE() AND status!='Completed'");
			ResultSet rs = ps.executeQuery();

			Map<String, ArrayList<String>> dueTaskMap = new HashMap<>();
			String taskTitle;
			while (rs.next()) {
				String email = rs.getString("email");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String deadline = rs.getString("deadline");
				taskTitle = title;

				String emailContentString = title + " - " + description + " - " + deadline;
				if (!dueTaskMap.containsKey(email)) {
					dueTaskMap.put(email, new ArrayList<>());
				}
				dueTaskMap.get(email).add(emailContentString);
			}

			for (Map.Entry<String, ArrayList<String>> entry : dueTaskMap.entrySet()) {
				String email = entry.getKey();
				ArrayList<String> task = entry.getValue();
				EmailReminder.sendEmail(email, task);
				PreparedStatement psmt = con
						.prepareStatement("UPDATE tasks\r\n"
								+ "SET status = 'Due'\r\n"
								+ "WHERE deadline < CURDATE() AND status != 'Completed'");
				
				psmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
