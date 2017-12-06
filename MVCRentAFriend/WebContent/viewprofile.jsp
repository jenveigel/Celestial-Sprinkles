<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Profile</title>
</head>
<body>

<!-- -------------------Navbar----------------- -->
<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container-fluid" style="max-width: 95%;">
		<div class="row justify-content-center">
			<div class="col-sm-12 bg-dark" style="border-radius: 25px 25px 0px 0px;">
				<h1>${profile.firstName } ${profile.lastName}</h1>
			</div>
		</div>

		<div class="row">

				<div class="col-sm-3 bg-secondary">
				<br>
				<img src="${profile.imageURL }" class="img-thumbnail" alt="${profile.firstName }" width="300" height="300">
				<%-- <p class="name">${profile.firstName} ${profile.lastName}</p> --%>
				<div class="row justify-content-center">
				<p>
				<c:if test="${sessionUser.id == user.id }">
					<form action="deleteUser.do" method="POST">
						<input  type="submit" class="btn btn-secondary btn-sm" value="Delete Account"></input>
					</form>
					</c:if>

				<br>
				<c:if test="${sessionUser.id == user.id }">
							<form action="editProfileWithValues.do" method="GET">
									<input  type="submit" class="btn btn-secondary btn-sm" value=" Modify Profile "></input>
							</form>
						</c:if>
						</p>
						</div>
						<%-- <div class="col-12">
							<a href="${profile.linkedinUrl}"><i
							class="fa fa-linkedin"></i></a>
							<a href="${profile.facebookUrl}"><i
							class="fa fa-facebook"></i></a>
							<a href="https://www.google.com/"><i
							class="fa fa-google"></i></a>
							<a href="https://twitter.com/?lang=en"><i
							class="fa fa-twitter"></i></a>
						</div> --%>
						<br>
							<div class="row justify-content-center">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#review${user.id }">
									Review User
								</button>
							</div>




					<!-- Modal -->
					<div class="modal fade" id="review${user.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Review User</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
									<div class="container-fluid">
										<div class="row">

					        		<form action="addReview.do" method="post">
					            <input type="radio" name="rating" value="1"> 1
					            <input type="radio" name="rating" value="2"> 2
					            <input type="radio" name="rating" value="3"> 3
					            <input type="radio" name="rating" value="4"> 4
					            <input type="radio" name="rating" value="5"> 5

													</div>
													<br>

										<div class="row">
											<div class="col">

					        			<textarea rows="" cols="" name="comment" placeholder="Enter Review"></textarea>
												</div>
										</div>

								</div>
								</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									<input type="submit" class="btn btn-primary" value="Submit">
									<input type="hidden" value="${user.id }" name="uid"></input>
									<!--need to pass user id to path of this thingy  -->
							</form>
					      </div>
					    </div>
					  </div>
					</div>
</div>



				<div class="col-sm-4 bg-secondary myBox" >
					<br>
					<c:if test="${events != null }">
					<h4>Events Attending</h4>
						<c:forEach var="event" items="${events }">
						<div class="col">
						<!-- Button trigger modal -->
						<button type="button" class="btn  btn-lg yellowgreen" data-toggle="modal"
							data-target="#details${event.id }">${event.title }</button>
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
										<strong>Event Title: </strong> ${event.title } <br>
										<strong>Activity: </strong> ${event.activity } <br>
										<strong>Location: </strong> ${event.address}<br>
										<strong>When: </strong>${event.dateTime} <br>
										<strong>Description: </strong>${event.description} <br>
										<strong>Attendees:</strong><br>
										<c:forEach var="ewu" items="${eventsWithUsers}">
											<c:choose>
												<c:when test="${ewu.id eq event.id}">
													<div class="littleBox">
													<c:forEach var="user" items="${ewu.users}">
			        										<a href="viewUserProfile.do?uid=${user.id }"> <img src="${user.profile.imageURL }" alt="${user.userName}" width="200" height="200"/></a>
			      		 							</c:forEach>
			      		 							</div>
												</c:when>
											</c:choose>
										</c:forEach>
									</div>

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
													<div class="modal-content">
														<div class="modal-header">
															<h5 id="" class="modal-title">Update Event</h5>

														</div>
														<div class="modal-body">
															<form action="updateevent.do" method="get">

															<table class="table">
															<tbody>
														    <tr>
														      <th scope="row">Event Title:</th>
														      <td><input type="text" name="event"
																	value="${event.title }" /></td>
														    </tr>
														    <tr>
														      <th scope="row">Activity:</th>
														      <td><input name="activity"
																	value="${event.activity }" /></td>
														    </tr>
														    <tr>
														      <th scope="row">Street Address:</th>
														      <td><input type="text" name="street"
																	value="${event.address.address }" /></td>
														    </tr>
														    <tr>
														      <th scope="row">City:</th>
														      <td><input type="text" name="city"
														      		value="${event.address.city }" /></td>
														    </tr>
														    <tr>
														      <th scope="row">State:</th>
														      <td><input type="text" name="state"
														      		value="${event.address.state }" /></td>
														    </tr>
														    <tr>
														      <th scope="row">Description:</th>
														      <td><input type="text" name="desc"
														      		value="${event.description}" /></td>
														    </tr>
														    <tr>
														      <th scope="row">Date and Time:</th>
														      <td><input type="datetime-local"
																	name="when" value="${event.dateTime }" /></td>
														    </tr>
														    </tbody>
														    </table>


															<%-- 	Event Title: <input type="text" name="event"
																	value="${event.title }" /><br>
																Activity: <input name="activity"
																	value="${event.activity }" /><br>
																Street Address: <input type="text" name="street"
																	value="${event.address.address }" /><br>
																City: <input
																	name="city" value="${event.address.city }" /><br>
																State: <input name="state" value="${event.address.state }" /><br>
																Description: <input name="desc" value="${event.description}" /><br>
																When (date and time): <input type="datetime-local"
																	name="when" value="${event.dateTime }" /> <br> --%>

																<!-- <input class="submit" type="submit" value="Update"> -->
																<input type="hidden" value="${event.id }" name="eid"></input>
																<%-- <input type="hidden" value="${event.owner.id }" name="ownerId"></input> --%>
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
										<%-- <a href="cancelrsvp.do?eid=${event.id }">Cancel RSVP</a> --%>
									</div>
								</div>
							</div>
						</div>

						</div>
						<br>
					</c:forEach>
					</c:if>

				</div>
				<div class="col-sm-5 bg-secondary myBox">
				<br>
					<div class="col">
  						<div class="container ">

  						<h4>${profile.firstName }'s Bio</h4>
					    		<p class="lead">${profile.bio }</p>
					  	</div>
					</div>
				</div>

		</div>
				<%-- <c:forEach var="review" items="${reviews }">
				<div class="col">
					${review.reviewee }
					${review.review }
					${review.rating }
				</div>
			</c:forEach> --%>
		<!-- <div class="container-fluid"> -->
		<div class="row">
			<c:forEach var="review" items="${reviews }">
				<div class="col">
					${review.reviewee }
					${review.review }
					${review.rating }
				</div>
			</c:forEach>
			<%-- ${user.rating } --%>
		</div>
		<div class="row">
<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-sm-12 bg-dark row justify-content-center" style="border-radius: 0px 0px 25px 25px;">
				<a href="${profile.linkedinUrl}"><i
							class="fa fa-linkedin"></i></a>
							<a href="${profile.facebookUrl}"><i
							class="fa fa-facebook"></i></a>
							<a href="https://www.google.com/"><i
							class="fa fa-google"></i></a>
							<a href="https://twitter.com/?lang=en"><i
							class="fa fa-twitter"></i></a>
			</div>
		</div>
		</div><br>

		</div>
	</div>
	<br><br>
	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>
