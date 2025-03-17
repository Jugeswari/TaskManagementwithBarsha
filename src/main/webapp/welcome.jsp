<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background: url('images/background.jpg') no-repeat center center/cover;
	text-align: center;
}

.profile-pic {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	border: 3px solid #fff;
	margin-bottom: 20px;
}

h1 {
	font-size: 28px;
	color: white;
	font-family: "Ubuntu", sans-serif;
    font-weight: 500;
    font-style: normal;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
	margin-bottom: 10px;
}

p {
	font-size: 18px;
	color: white;
	max-width: 600px;
	font-family: Arial;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
	margin-bottom: 20px;
}

.btn-container {
	display: flex;
	gap: 20px;
}

.btn {
	padding: 12px 24px;
	font-size: 18px;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	text-decoration: none;
	transition: transform 0.3s ease-in-out;
}

.btn-signin {
	background: #007BFF;
}

.btn-signup {
	background: #28A745;
}

.btn:hover {
	transform: scale(1.1);
}
</style>
</head>
<body>
	<img src="images/profile.jpeg" alt="Girl Image" class="profile-pic">
	<h1>Welcome to Task Management With Barsha</h1>
	<p>Do you have a problem managing your tasks? No need to worry, I
		am here to manage your tasks effectively.</p>
	<div class="btn-container">
		<a href="signin.jsp" class="btn btn-signin">Sign In</a> <a
			href="signup.jsp" class="btn btn-signup">Sign Up</a>
	</div>
</body>
</html>