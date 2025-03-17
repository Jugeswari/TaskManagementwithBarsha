<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
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
	display: flex;
	justify-content: center;
	align-items: center;
}

.left img {
	width: 100%;
	max-width: 300px;
}

.right {
	width: 50%;
	padding: 20px;
}

h2 {
	margin-bottom: 20px;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 21px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.btn {
	width: 100%;
	box-sizing: border-box;
	padding: 10px;
	background: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 10px;
}

.btn:hover {
	background: #0056b3;
}

.create-account {
	text-align: center;
	margin-top: 10px;
}

.create-account a {
	color: #007BFF;
	text-decoration: none;
}

.create-account a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<div class="left">
			<img src="images/signin-image.png" alt="Login Image">
		</div>
		<div class="right">
			<h2>Sign In</h2>
			<form action="LoginForm" method="post">
				<input type="text" name="username" placeholder="Your Name" required>
				<input type="password" name="password" placeholder="Password"
					required>
				<button type="submit" class="btn">Log In</button>
			</form>
			<div class="create-account">
				<a href="signup.jsp">Create an account</a>
			</div>
		</div>
	</div>
</body>
</html>