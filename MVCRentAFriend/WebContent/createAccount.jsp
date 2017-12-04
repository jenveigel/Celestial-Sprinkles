<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<jsp:include page="bootstrapHeader.jsp"></jsp:include>

<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/createAccount.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <a
		class="navbar-brand" href="loginPage.do"> <img src="mountains.png"
		style="width: 60px;">
	</a>

	</nav>

	<form action="addUser.do" method="post">
		<div class="container">
			<p class="well"></p>
			<h1 class="header">Registration</h1>
			<hr>
			<div class="row justify-content-center">
				<div class="col-sm-5">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span></span> <input type="text"
							class="form-control" name="userName" id="userName"
							placeholder="Enter a Username">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span> <input type="text"
							class="form-control" name="password" id="password"
							placeholder="Enter a Password" required data-toggle="popover"
							title="Password Strength" data-content="Enter Password...">
					</div>

				</div>
				<div class="form-group"></div>

				<div class="col-sm-5">
					<div class="form-group">
						<!-- <label>name</label> -->
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="firstName" id="firstName"
								placeholder="Enter your first name">
						</div>
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="lastName" id="lastName"
								placeholder="Enter your last name">
						</div>
			<div class="form-group">
						<!-- <label>bio and image</label> -->
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span>
								<textarea rows="" cols="" name="bio" id="bio"
								placeholder="Enter something about you"></textarea>
<!-- 								<input type="text"
								class="form-control" name="bio" id="bio"
								placeholder="Enter something about you"> -->
						</div>
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="imgUrl" id="imgUrl"
								placeholder="Enter your imgUrl">
						</div>
					</div>
					</div>
				<div class="form-group">
					<input type="submit" name="submit" id="submit" value="Submit"
						class="btn btn-secondary pull-right">
				</div>
				</div>
				<div class="col-sm-5">

				<br>

            </div>  


			</div>
	</form>
	</div>
	<p class="row justify-content-center">
		<a href="loginPage.do"> Return to Login</a>
	</p>
	</p>
	</div>
	</div>

	<%-- <div>

		<form action="addUser.do" method="post">
			<input type="text" name="userName" placeholder="Enter User Name">
			<input type="text" name="password" placeholder="Enter Password">
			<input class="submit" type="submit" value="Create Account">
		</form>

	</div>  --%>

	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>