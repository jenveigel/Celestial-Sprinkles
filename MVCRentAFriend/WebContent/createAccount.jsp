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

	<nav class="navbar sticky-top navbar-expand-sm bg-dark navbar-dark"> <a
		class="navbar-brand" href="loginPage.do"> <img src="logo.png"
		style="width: 65px;">
	</a>

	</nav>

	<form action="addUser.do" method="post">
		<div class="container">
			<p class="well"></p>
			<h1 class="header">Registration</h1>
			<h1> ${error }</h1>
			<br>
			<div class="row justify-content-center text-white bg-dark" style="border-radius: 25px; background-color:darkgrey;">
				<h4>Required Fields</h4>
				<div class="col-sm-12 col-md-12 col-lg-12"></div>
				<div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span></span> <input type="text"
							class="form-control" name="userName" id="userName"
							placeholder="Enter a Username">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span> <input type="text"
							class="form-control" name="password" id="password"
							placeholder="Enter a Password" required data-toggle="popover"
							title="Password Strength" data-content="Enter Password...">
					</div>
					<br>
				</div>
				
				<div class="col-sm-6">
						<!-- <label>name</label> -->
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="firstName" id="firstName"
								placeholder="Enter your first name">
						</div>
						</div>
				<div class="col-sm-6">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="lastName" id="lastName"
								placeholder="Enter your last name">
						</div>
					</div>
					<div class="col-sm-12">&nbsp</div>
					</div>
					<br>
					
					<div class="row justify-content-center text-white bg-dark" style="border-radius: 25px; background-color:darkgrey;">
						<h4>Optional</h4>
						<div class="input-group col-sm-12">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span>
								<textarea rows="" cols="" name="bio" id="bio"
								placeholder="Enter something about you"></textarea>
						</div>
						<div class="col-sm-12">&nbsp</div>
						 <div class="input-group col-sm-4">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="facebookUrl" id="facebookUrl"
								placeholder="Paste your Facebook URL here">
						</div><br>
						<div class="input-group col-sm-4">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="linkedinUrl" id="linkedinUrl"
								placeholder="Paste your LinkedIn URL here">
						</div><br>
						<!-- <label>bio and image</label> -->
						
						<div class="input-group col-sm-4">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="imgUrl" id="imgUrl"
								placeholder="Enter a profile image url">
						</div>
						<div class="col-sm-12">&nbsp</div>
						<input type="submit" name="submit" id="submit" value="Submit"
						class="btn pull-right btn-default logbutton">
						<div class="col-sm-12">&nbsp</div>
					</div>
				<br>

            </div>  

	</form>
	
	<div class="container">
		<div class="row justify-content-center">
			<div class="col"></div>
				<form action="loginPage.do">
		    			<input class="btn btn-default btn-sm" type="submit" value="Back to login" />
				</form>
			<div class="col"></div>
		</div>
	</div>>


	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>