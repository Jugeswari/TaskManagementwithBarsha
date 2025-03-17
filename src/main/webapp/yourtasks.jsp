<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Tasks - Task Management</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="yourtasks-style.css">
</head>
<body>

	<jsp:include page="nav.jsp">
		<jsp:param name="nav" value="navbar" />
	</jsp:include>

	<!-- Main Container -->
	<div class="task-container">
		<h1>Your Tasks</h1>

		<div class="taskcolumn-container">
			<div id="pending" class="task-column">
				<h2>Pending</h2>
				<%
				StringBuilder pendingTasks = new StringBuilder();
				StringBuilder completedTasks = new StringBuilder();
				StringBuilder dueTasks = new StringBuilder();
				
		        String email = (String) session.getAttribute("session_email");
		        System.out.println(email);
				try {
					
					// Database connection
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_management", "root", "root");
					String query = "SELECT * FROM tasks where email = ?";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, email);
					ResultSet rs = pstmt.executeQuery();
					

					while (rs.next()) {
						String title = rs.getString("title");
						String description = rs.getString("description");
						String addedOn = rs.getString("added_on");
						String deadline = rs.getString("deadline");
						String status = rs.getString("status");
						int id = rs.getInt("id");

						// Card HTML
						
						String card = "<div class='task-card'>" + "<h3>" + title + "</h3>" + "<p><strong>Added On:</strong> " + addedOn
						+ "</p>" + "<p><strong>Deadline:</strong> " + deadline + "</p>" + "<p><strong>Status:</strong> "
						+ status + "</p>" + "<p>" + description + "</p>" + "<div class='task-actions'>"
						+ "<button class='edit-btn' onclick='editTask(" + id + ")'>Edit</button>"
						+ "<button class='delete-btn' onclick='deleteTask(" + id + ")'>Delete</button>"
						+ (status.equalsIgnoreCase("pending")? "<button class='complete-btn' onclick='markCompleted(" + id + ")'>Mark as Completed</button>" :"")
						+ "</div></div>";

						// Add to respective column
						if ("Pending".equalsIgnoreCase(status)) {
					pendingTasks.append(card);
						} else if ("Completed".equalsIgnoreCase(status)) {
					completedTasks.append(card);
						} else if ("Due".equalsIgnoreCase(status)) {
					dueTasks.append(card);
					
						}
					}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<%=pendingTasks.toString()%>
			</div>

			<div id="completed" class="task-column">
				<h2>Completed</h2>
				<%=completedTasks.toString()%>
			</div>

			<div id="due" class="task-column">
				<h2>Due</h2>
				<%=dueTasks.toString()%>
			</div>
		</div>
	</div>
	<footer class="footer">
		<p>&copy; 2025 Task Management with Barsha. All Rights Reserved.</p>
	</footer>

	<script>
		function deleteTask(taskId) {
			if (confirm("Are you sure you want to delete this task?")) {
				window.location.href = "DeleteTaskServlet?id=" + taskId;
			}
		}

		function editTask(taskId) {
			window.location.href = "edit-task.jsp?id=" + taskId;
		}

		function markCompleted(taskId) {
			window.location.href = "MarkCompletedServlet?id=" + taskId;
		}
		
	</script>

</body>
</html>