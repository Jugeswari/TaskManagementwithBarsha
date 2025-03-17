<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - Task Management</title>
<link rel="stylesheet" href="home-style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="nav.jsp"><jsp:param name="nav"
			value="navbar"></jsp:param></jsp:include>
			
	<!-- Main Container -->
	<div class="container">
		<!-- Task Creation Form -->
		<div class="task-form">
			<h2>Create New Task</h2>
			<form action="AddTaskForm" method="POST">
				<label for="title">Title:</label> <input type="text" id="title"
					name="title" required> <label for="date">Task Added
					On:</label> <input type="date" id="date" name="date" required> <label
					for="deadline">Deadline:</label> <input type="date" id="deadline"
					name="deadline" required> <label for="description">Description:</label>
				<textarea id="description" name="description" rows="3" required></textarea>

				<button type="submit">Create Task</button>
			</form>
		</div>

		<!-- Right-Side Image -->
		<div class="task-image">
			<img src="images/homeimage.png" alt="Task Management Image">
		</div>
	</div>
	<!-- Footer Section -->
	<footer class="footer">
		<p>&copy; 2025 Task Management with Barsha. All Rights Reserved.</p>
	</footer>

	<script>
		window.onload = function() {
			const urlParams = new URLSearchParams(window.location.search);
			if (urlParams.has('success')) {
				alert("Your task has been added successfully!");
			}
		};
	</script>

</body>
</html>