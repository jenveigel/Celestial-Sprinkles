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

		<form action="addUser.do" method="post">
			<div class="container">
				<p class="well"></p>
				<h1> ${errorMessage }</h1>
				<br>
				<div class="row justify-content-center text-white bg-dark" style="border-radius: 25px; background-color:darkgrey;">
					<h1>Create Event</h1>
					<div class="col-sm-12 col-md-12 col-lg-12"></div>
					<div class="col-sm-6">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="title" id="title"
								placeholder="Event Title">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-lock"></span></span> <input type="text"
								class="form-control" name="street" id="street"
								placeholder="Street Address">
						</div>
						<br>
					</div>

					<div class="col-sm-6">
							<!-- <label>name</label> -->
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> <input type="text"
									class="form-control" name="city" id="city"
									placeholder="City">
							</div>
							</div>
					<div class="col-sm-6">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> <input type="text"
									class="form-control" name="state" id="state"
									placeholder="State Abbreviation">
							</div>
							<br>
						</div>
						<div class="col-sm-6">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										class="form-control" name="desc" id="desc"
										placeholder="Short Description">
								</div>
							</div>
							<div class="col-sm-6">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-user"></span></span> <input type="text"
											class="form-control" name="activity" id="activity"
											placeholder="Activity">

									</div>
									<br>
								</div>

								<div class="col-sm-6">
										<div class="input-group">
											<br>
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-user"></span></span>
												<br>
												<input type="datetime-local"
												class="form-control" name="activity" id="activity"
												placeholder="Date/Time">
												<br>

										</div>

									</div>
									<br>

							<div class="col-sm-12"></div>
							<br>
							<input type="submit" name="submit" id="submit" value="Create"
							class="btn pull-right btn-default logbutton">
							<br>
							<div class="col-sm-12"></div>
							<br>

						</div>
						<br>

		</form>

			<br>
			<div class="row justify-content-center">

				<form action="attendEvent.do" method="get">
					<input type="submit" class="btn btn-outline-warning" value="View Events">
				</form>
			</div>
		</div>
	</div>

<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>
