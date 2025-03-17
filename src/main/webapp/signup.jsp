<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f7f7f7;
}

.container {
	display: flex;
	width: 60%;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.left {
	width: 50%;
	padding: 20px;
}

.right {
	width: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.right img {
	width: 100%;
	max-width: 300px;
}

h2 {
	margin-bottom: 20px;
}

input {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.btn {
	width: 100%;
	padding: 10px;
	background: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin: 10px 0;
	box-sizing: border-box;
}

.btn:hover {
	background: #218838;
}

.login-link {
	text-align: center;
	margin-top: 10px;
}

.login-link a {
	color: #007BFF;
	text-decoration: none;
}

.login-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<div class="left">
			<h2>Create Account</h2>
			<form action="RegisterForm" method="post">
				<input type="text" name="fullname" placeholder="Full Name" required>
				<input type="email" name="email" placeholder="Email" required>
				<input type="password" name="password" placeholder="Password"
					required>
				<button type="submit" class="btn">Sign Up</button>
			</form>
			<div class="login-link">
				<a href="signin.jsp">Already have an account? Sign In</a>
			</div>
		</div>
		<div class="right">
			<img src="images/signup-image.png" alt="Sign Up Image">
		</div>
	</div>
</body>
</html>