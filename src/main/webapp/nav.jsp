<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="nav-style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="profile.jsp"></jsp:include>
	<nav class="navbar">
		<div class="logo">Task Management with Barsha</div>
		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li><a href="yourtasks.jsp">My Tasks</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		</ul>
		<button onclick="openprofilemodal()" class="profile-button">Profile</button>
	</nav>
</body>
</html>