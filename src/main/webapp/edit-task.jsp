<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Task</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(90deg, #4B0082, #1E3A5F);
	height: 100vh;
	margin: 0;
}

.container {
	background: rgba(255, 255, 255, 0.9);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 350px;
	text-align: center;
	margin: 0 auto;
	margin-top: 5%;
}

h2 {
	color: #333;
}

label {
	font-weight: bold;
	display: block;
	margin-top: 10px;
	text-align: left;
}
input, textarea {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

textarea {
	height: 80px;
}

.update-btn {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px;
	width: 100%;
	margin-top: 15px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
}

.update-btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<%
	int taskId = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_management", "root", "root");
	PreparedStatement ps = con.prepareStatement("SELECT * FROM tasks WHERE id = ?");
	ps.setInt(1, taskId);
	ResultSet rs = ps.executeQuery();
	if (rs.next()) {
	%>

	<div class="container">
		<h2>Edit Task</h2>
		<form action="UpdateTaskServlet" method="post">
			<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

			<label>Title:</label> <input type="text" name="title"
				value="<%=rs.getString("title")%>" required> <label>Description:</label>
			<textarea name="description" required><%=rs.getString("description")%></textarea>

			<label>Deadline:</label> <input type="date" name="deadline"
				value="<%=rs.getString("deadline")%>" required>

			<button class="update-btn" type="submit">Update Task</button>
		</form>
	</div>

	<%
	}
	con.close();
	%>

</body>
</html>