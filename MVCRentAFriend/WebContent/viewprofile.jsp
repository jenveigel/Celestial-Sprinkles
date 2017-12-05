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
			<div class="col-sm-12 bg-dark">
				<h1>Profile</h1>
			</div>
		</div>
		
		<div class="row">
		
				<div class="col-sm-3 bg-secondary">
				<br>
				<img src="${profile.imageURL }" class="img-thumbnail" alt="${profile.firstName }" style="width: 100%">
				<p class="name">${profile.firstName} ${profile.lastName}</p>
					
						<div class="col-9">
							<a href="${profile.linkedinUrl}"><i 
							class="fa fa-linkedin"></i></a> <a
							href="${profile.facebookUrl}"><i
							class="fa fa-facebook"></i></a>
						</div>
						<br>
						<p>
						<c:if test="${sessionUser.id == user.id }">
							<a class="btn btn-outline-warning" href="editProfileWithValues.do"
								role="button">Edit Profile</a>
						</c:if>
						</p>
					
				</div>
				
				<div class="col-sm-4 bg-secondary">		
					<c:if test="${events != null }">
						<h4>Events Attending</h4>
						<br>
						<c:forEach var="event" items="${events }">
						<div class="col">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
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
										<strong>Event: </strong> ${event.activity } <br>
										<strong>Location: </strong> ${event.address}<br>
										<strong>When: </strong>${event.dateTime} <br> 
										<strong>Description: </strong>${event.description} <br> 
										<strong>Attendees:</strong><br>
										<c:forEach var="ewu" items="${eventsWithUsers}">
											<c:choose>
												<c:when test="${ewu.id eq event.id}">
													<c:forEach var="user" items="${ewu.users}">
			        										<a href="viewUserProfile.do?uid=${user.id }"> ${user.userName} <img src="${user.profile.imageURL }" width="200" height="200"/></a>
			      		 													
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
				<div class="col-sm-5 bg-secondary">
				<br>
					<div class="jumbotron jumbotron-fluid">
  						<div class="container">
  						<h1 class="display-3">${user.userName } Bio</h1>
					    		<p class="lead">${profile.bio }</p>
					  	</div>
					</div>
				</div>
			
		</div>
		<br>
		<br>
		</div>
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-1">
					<form action="deleteUser.do" method="POST">
						<input  type="submit" class="btn btn-lg btn-secondary" value="Delete Account"></input>
					</form>
				</div>
			</div>
		</div>
	
	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>