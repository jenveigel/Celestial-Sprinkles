<!--  old See all user reviews button code -->
	<%-- <form action="viewUserReviews.do" method="get">
		    			<input type="hidden" value="${user.id }" name="uid"></input>
		    			<input class="btn btn-black btn-lg" type="submit" value="See all user reviews" />
				</form> --%>

<form method="get" action="viewUserReviews.do?uid=${user.id }">
					<button type="button" class="btn btn-black btn-lg">See all user reviews</button>
					</form>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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

<%-- ALTERNATE EDIT PROFILE PAGE CODE IF NOT USING MODAL IN MODAL --%>

<%-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <a
		class="navbar-brand" href="index.jsp"> <img src="mountains.png"
		style="width: 60px;">
	</a>
	<ul class="navbar-nav">
		<li class="nav-item active"><a class="nav-link" href="index.jsp">Welcome
				- ${user.userName }</a></li>
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

	<div class="modal fade" id="updateEvent${event.id }" tabindex="-1"
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
				<div class="modal-body">
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
						<input type="hidden" value="${event.owner.id }" name="ownerId"></input>
						<input type="submit" class="btn btn-primary" value="Update"></input>
					</form> --%>
				<!-- </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
 -->
 
 <%--OLD VIEW PROFILE PAGE CODE  --%>
 
 	<%-- <div class="card">
		<img src="${profile.imageURL }" class="img-thumbnail"
			alt="${profile.firstName }" style="width: 100%">
		<p class="name">${profile.firstName} ${profile.lastName}</p>
		<p class="bio">Bio: ${profile.bio }</p>
		<br>
		<c:if test="${events != null }">
			<c:forEach var="event" items="${events }">

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-secondary btn-lg" data-toggle="modal"
					data-target="#details${event.id }">${event.title }</button>
				<br>

				<form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-primary" value="Attend Event"></input><br> 
		<input type="hidden" value="${event.id }" name="eventId"></input>
</form>
				<!-- Modal -->
				<div class="modal fade" id="details${event.id }" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">${event.title }</h5>
							</div>
							<div class="modal-body">
								${event.activity } at ${event.address}<br> on
								${event.dateTime} <br> Attendees:
								<c:forEach var="ewu" items="${eventsWithUsers}">
									<c:choose>
										<c:when test="${ewu.id eq event.id}">
											<c:forEach var="user" items="${ewu.users}">
	        					<a href="viewUserProfile.do?uid=${user.id }"	>${user.userName}</a>
	      		 </c:forEach>
										</c:when>
									</c:choose>
								</c:forEach>
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<div class="modal-footer">
								<c:if test="${sessionUser.id == event.owner.id }">
									<form action="deleteEvent.do" method="get">
										<input type="submit" class="btn btn-warning"
											value="Delete Event"></input><br> <input type="hidden"
											value="${event.id }" name="eventId"></input>
									</form>

									<button type="button" class="btn btn-warning"
										data-toggle="modal" data-target="#updateEvent${event.id }">
										Update Event</button>

									<div class="modal fade" id="updateEvent${event.id }"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content2">
												<div class="modal-header2">
													<h5 id="" class="modal-title">Update Event</h5>
				
												</div>
												<div class="modal-body2">
													<form action="updateevent.do" method="get">
														Event Title: <input type="text" name="event" value="${event.title }" /><br>
														Street Address: <input type="text" name="street"
															value="${event.address.address }" /><br> City: <input
															name="city" value="${event.address.city }" /><br>
														State: <input name="state" value="${event.address.state }" /><br>
														Description: <input name="desc" value="${event.description}" /><br>
														Activity: <input name="activity"
															value="${event.activity }" /><br> When (date and
														time): <input type="datetime-local" name="when"
															value="${event.dateTime }" /> <br>

														<!-- <input class="submit" type="submit" value="Update"> -->
														<input type="hidden" value="${event.id }" name="eid"></input>
														<input type="hidden" value="${event.owner.id }" name="ownerId"></input>
														<input type="submit" class="btn btn-primary"
															value="Update"></input>
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>

								</c:if>
								<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
								<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
								<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
								<form action="cancelrsvp.do" method="get">
									<input type="hidden" value="${event.id }" name="eid"></input> <input
										type="submit" class="btn btn-primary" value="Cancel RSVP"></input><br>
								</form>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="cancelrsvp.do?eid=${event.id }">Cancel RSVP</a>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</c:if>
		<div class="col-12">
			<a href="#"><i class="fa fa-twitter"></i></a> <a
				href="https://www.linkedin.com/in/david-chirdon-140560b6"><i
				class="fa fa-linkedin"></i></a> <a
				href="https://www.facebook.com/dave.chirdon.9"><i
				class="fa fa-facebook"></i></a>
		</div>
		<br>
		<p>
		<c:if test="${sessionUser.id == user.id }">
			<a class="btn btn-outline-warning" href="editProfileWithValues.do"
				role="button">Edit Profile</a>
		</c:if>
		</p>

	</div> --%>

	<%-- <div class="profileDetails">
		<div class="row justify-content-center">
			<div class="col-3">
				<img src="${profile.imageURL }" class="img-thumbnail">
				<div class="font-weight-bold"><br>
					<h1>${profile.firstName } ${profile.lastName }</h1>
				</div><br>
			</div>
			<div class="col-9">
				<br>
				<h3>${user.userName }</h3>
				<br>
				<h4>${profile.bio }</h4>
				<br> <br>
				<form action="editProfileWithValues.do" method="get">
					<input class="submit" type="submit" value="Edit Profile">
				</form>
			</div>

		</div>
	</div> --%>


	<%-- <c:if test="${events != null }">
		<c:forEach var="event" items="${events }">

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#details${event.id }">${event.activity }</button>
			<br>
			<br>
			<form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-primary" value="Attend Event"></input><br> 
		<input type="hidden" value="${event.id }" name="eventId"></input>
</form>
			<!-- Modal -->
			<div class="modal fade" id="details${event.id }" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">${event.activity }</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							${event.activity } at ${event.address}<br> on
							${event.dateTime} <br> Attendees:
							<c:forEach var="ewu" items="${eventsWithUsers}">
								<c:choose>
									<c:when test="${ewu.id eq event.id}">
										<c:forEach var="user" items="${ewu.users}">
	        					${user.userName}
	      		 </c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
						<div class="modal-footer">
							<c:if test="${user.id == event.owner.id }">
								<form action="deleteEvent.do" method="get">
									<input type="submit" class="btn btn-primary"
										value="Delete Event"></input><br> <input type="hidden"
										value="${event.id }" name="eventId"></input>
								</form>

								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#updateEvent${event.id }">
									Update Event</button>

								<div class="modal fade" id="updateEvent${event.id }"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 id="" class="modal-title">Update Event</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="updateevent.do" method="get">
													Event Title: <input type="text" name="event" value="" /><br>
													Street Address: <input type="text" name="street"
														value="${event.address.address }" /><br> City: <input
														name="city" value="${event.address.city }" /><br>
													State: <input name="state" value="${event.address.state }" /><br>
													Description: <input name="desc" value="" /><br>
													Activity: <input name="activity" value="${event.activity }" /><br>
													When (date and time): <input type="datetime-local"
														name="when" value="${event.dateTime }" /> <br>

													<!-- <input class="submit" type="submit" value="Update"> -->
													<input type="hidden" value="${event.id }" name="eid"></input>
													<input type="hidden" value="${event.owner.id }" name="ownerId"></input>
													<input type="submit" class="btn btn-primary" value="Update"></input>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>

							</c:if>
							<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
							<form action="cancelrsvp.do" method="get">
								<input type="submit" class="btn btn-primary" value="Cancel RSVP"></input><br>
							</form>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<a href="cancelrsvp.do?eid=${event.id }">Cancel RSVP</a>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>
	</c:if> --%>
<%-- <jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html> --%>