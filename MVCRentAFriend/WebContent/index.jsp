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

	<div class="container">

		<div class="card text-white bg-dark mb-3 container center_div"
			style="max-width: 30rem;">
			<div class="row justify-content-center">
				<div class="card-header">Hi ${user.userName }, Select an
					option below</div>
			</div>
			<div class="card-body">
				<p class="card-text">
				<div class="row justify-content-center">
					<form action="createEventPage.do" method="get">
						<input  type="submit" class="btn btn-lg btn-secondary" style="background: url(http://www.zingerbug.com/Backgrounds/background_images/green_plaid.jpg)"
							value="Create Event"></input>
				</form>
				</div>

				<br>

				<div class="row justify-content-center">
					<form action="attendEvent.do" method="get">
						<input  type="submit" class="btn btn-lg btn-secondary" style="background: #ccc url(http://www.zingerbug.com/Backgrounds/background_images/green_plaid.jpg)"
							value="Attend Event"></input>
					</form>
				</div>

				<br>

				<div class="row justify-content-center">
					<form action="viewprofile.do" method="get">
						<input type="submit" class="btn btn-lg btn-secondary"  style="background: #ccc url(http://www.zingerbug.com/Backgrounds/background_images/green_plaid.jpg)" 
							value="View Profile"></input>
					</form>
				</div>

				<br>

			</div>
		</div>
	</div>

	<!-- ======================Bootstrap======================== -->

	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>