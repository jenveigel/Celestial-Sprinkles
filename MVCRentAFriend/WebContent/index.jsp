<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Celestial Sprinkles</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/styles.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="index.jsp">
    <img src="mountains.png" style="width:60px;">
  </a>
  <ul class="navbar-nav">
  
  	<li class="nav-item active">
      <a class="nav-link" href="index.jsp">Welcome - ${user.userName }</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="attendEvent.do">Attend</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="createEventPage.do">Create</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="viewprofile.do">Your Profile</a>
    </li>
  </ul>
</nav>
<!-- ================WLECOME BUTTONS======================= -->
	
	<div class="container">
	
		<div class="card text-white bg-dark mb-3 container center_div" style="max-width: 30rem;">
			<div class="row justify-content-center">
		  		<div class="card-header">Hi ${user.userName },  Select an option below</div>
			</div>
	  		<div class="card-body">
	    <p class="card-text">
	    
	    <div class="row justify-content-center"> 
 			<form action="createEventPage.do" method="get">
				<input class="btn btn-lg btn-secondary" type="submit" value="Create Event"></input>
			</form>
		</div>
		
		<br>
		
		<div class="row justify-content-center"> 
 			<form action="attendEvent.do" method="get">
				<input class="btn btn-lg btn-secondary" type="submit" value="Attend Event"></input>
			</form>
		</div>
		
		<br>
		
		<div class="row justify-content-center"> 
 			<form action="viewprofile.do" method="get">
				<input class="btn btn-lg btn-secondary" type="submit" value="View Profile"></input>
			</form>
		</div>
		
		<br>
	
	</div>
	</div>
	</div>
	
	
	<!-- ======================Bootstrap======================== -->

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