<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="index.jsp">
    <img src="mountains.png" style="width:60px;">
  </a>
  <ul class="navbar-nav">
    <!-- <li class="nav-item active">
      <a class="nav-link" href="attendEvent.do">Attend</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="createEventPage.do">Create</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="viewprofile.do">Your Profile</a>
    </li> -->
  </ul>
</nav>

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-sm-6">
					<h1>Login or Create New User</h1>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-sm-6">
					<form action="login.do" method="post">
						<input type="text" name="userName" placeholder="Enter User Name">
						<input type="text" name="password" placeholder="Enter Password">
						<input class="submit" type="submit" value="Sign-In">
					</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-sm-6">
					<!-- error message for wrong username/password -->
					<h3>${errorMessage}</h3>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-sm-6">
					<form action="createUser.do" method="get">
						<button type="submit" class="btn btn-secondary" value="Create Account">Create Account</button>
					</form>
				</div>
			</div>
		
		</div>
		
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>
</body>
</html>