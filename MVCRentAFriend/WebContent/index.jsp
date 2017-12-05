<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Celestial Sprinkles</title>
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>
<body>

<!-- -------------------Navbar----------------- -->
<jsp:include page="navbar.jsp"></jsp:include>

	<!-- ================WLECOME BUTTONS======================= -->

		<br><br><br><br>
		<div class="card text-white bg-dark mb-3 container-fluid center_div roundCorners">
			<div class="row justify-content-center">
				<div class="card-header">Hi ${user.userName }, Select an
					option below</div>
			</div>
			<div class="card-body">
				<p class="card-text">
				<div class="row justify-content-center">
					<div class="col-12">
					<form action="createEventPage.do" method="get">
						<input  type="submit" class="btn btn-lg logbutton" value="Create Event">
						</input>
					</form>
					</div><div class="col-12">&nbsp</div>
					<div class="col-12">
					<form action="attendEvent.do" method="get">
						<input  type="submit" class="btn btn-lg logbutton"
							value="Attend Event"></input>
					</form>
					</div><div class="col-12">&nbsp</div>
					<div class="col-12">
					<form action="viewprofile.do" method="get">
						<input type="submit" class="btn btn-lg btn-secondary logbutton" value="View Profile"></input>
					</form>
					</div>

			</div>
		</div>
	</div>
	<!-- ======================Bootstrap======================== -->

	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>