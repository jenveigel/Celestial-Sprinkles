<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Event</title>
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/createEvent.css">
</head>
<body>

<!-- -------------------Navbar----------------- -->
<jsp:include page="navbar.jsp"></jsp:include>

	<div class="card text-white bg-dark mb-3 container center_div roundCorners"
		style="max-width: 40rem;">
		<div class="card-header">Create Event</div>
		<div class="card-body">
			<p class="card-text">
			<div class="row justify-content-center">
					<h3>${errorMessage}</h3>
				<form action="createEvent.do" method="post" modelAttribute="item">
					<label>Event Title:</label> <input type="text" name="title" /><br> 
					<label>Street Address: </label><input type="text" name="street" /><br> 
					<label>City:</label><input name="city" /><br>
					<label>State Abbreviation: </label> <input name="state" /><br>
					<label>Description:</label> <input name="desc" /><br>
					<label> Activity:</label><input name="activity" /><br> 
					<label>When (date and time): </label><input type="datetime-local" name="when" /> 
					
					<input class="btn btn-success" type="submit" value="Create" />
				</form>

			</div>
			<p class="row justify-content-center">
				<a href="index.jsp"> Return To Home </a>&nbsp; <br> 
				<a href="attendEvent.do"> View Events</a>
			</p>
		</div>
	</div>

<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>