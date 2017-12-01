<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
<h1>HERES A PROFILE OR SOMETHING</h1>
		
		<!-- edit profile button -->
		<form action="editProfileWithValues.do" method="get">
			<input class="submit" type="submit" value="Edit Profile">
		</form>
		
		Your Session ID is: ${sessionId }
		${user.userName }
		${profile.firstName }
		${profile.lastName }
		${profile.bio }
		${profile.imageURL}
		<br>
		
	<c:if test="${events != null }">
	<c:forEach var="event" items="${events }">  
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#details${event.id }">
  ${event.activity }
</button><br>
<form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-primary" value="Attend Event"></input><br> 
		<input type="hidden" value="${event.id }" name="eventId"></input>
</form>
<!-- Modal -->
<div class="modal fade" id="details${event.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">${event.activity }</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ${event.activity } at ${event.address}<br> 
        on ${event.dateTime} <br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
        <form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-primary" value="Attend Event"></input><br> 
</form>
      </div>
    </div>
  </div>
</div>
		${event.activity }<br>
		${event.owner }<br>
		${event.dateTime }<br>
		${event.address }<br>
		
	</c:forEach>	
	</c:if>
</body>
</html>