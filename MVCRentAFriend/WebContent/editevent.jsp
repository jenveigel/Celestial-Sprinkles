<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<title>Edit Event</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <a
		class="navbar-brand" href="index.jsp"> <img src="mountains.png"
		style="width: 60px;">
	</a>
	<ul class="navbar-nav">
		<%-- <li class="nav-item active"><a class="nav-link" href="index.jsp">Welcome
				- ${user.userName }</a></li> --%>
		<li class="nav-item active"><a class="nav-link"
			href="attendEvent.do">Attend</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="createEventPage.do">Create</a></li>
		<li class="nav-item active"><a class="nav-link"
			href="viewprofile.do">Your Profile</a></li>
		<li class="nav-item">
			<div class="logout">
				<a class="nav-link" href="loginPage.do">Logout</a>
			</div>
		</li>
	</ul>
	</nav>

<%-- 	<div class="modal fade" id="updateEvent${event.id }" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="" class="modal-title">Update Event</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"> --%>
					<form action="updateevent.do" method="get">
						Event Title: <input type="text" name="event" value="" /><br>
						Street Address: <input type="text" name="street"
							value="${event.address.address }" /><br> City: <input
							name="city" value="${event.address.city }" /><br> State: <input
							name="state" value="${event.address.state }" /><br>
						Description: <input name="desc" value="" /><br> Activity: <input
							name="activity" value="${event.activity }" /><br> When
						(date and time): <input type="datetime-local" name="when"
							value="${event.dateTime }" /> <br>

						<!-- <input class="submit" type="submit" value="Update"> -->
						<input type="hidden" value="${event.id }" name="eid"></input>
						<%-- <input type="hidden" value="${event.owner.id }" name="ownerId"></input> --%>
						<input type="submit" class="btn btn-primary" value="Update"></input>
					</form>
				<!-- </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
 -->
<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>