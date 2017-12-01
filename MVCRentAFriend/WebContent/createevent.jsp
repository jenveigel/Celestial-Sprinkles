<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Event</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/styles.css">
</head>
<body>


	<div class="card text-white bg-dark mb-3 container center_div"
		style="max-width: 40rem;">
		<div class="card-header">Create Event</div>
		<div class="card-body">
			<p class="card-text">
			<div class="row justify-content-center">

				<form action="createEvent.do" method="post" modelAttribute="item">

					 Event Title: <input type="text" name="event" /><br>
					 Street Address: <input type="text" name="street" /><br>
					 City: <input name="city" /><br>
					 State: <input name="state" /><br>
					 Description:	<input name="desc" /><br>
					 Activity: <input name="activity" /><br>
					 Time: <input name="dateTime" /><br>
					<input class="btn btn-success" type="submit" value="Add" />
				</form>

			</div>
			<p class="row justify-content-center">
				<a href="index.do"> Return</a>
			</p>
			</p>
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