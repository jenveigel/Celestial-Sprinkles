<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attend</title>
	
	<jsp:include page="bootstrapHeader.jsp"></jsp:include>
	
<%-- <%@ include file=“bootstrapHeader.jsp” %> --%>
<link rel="stylesheet" href="css/styles.css">
</head>
<body class="attendbackground">

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
	<br>

<div class="container" style="background-color:lightgrey;">
<div class="row justify-content-center">
<h1>ATTEND</h1>
</div>
<div class="row justify-content-center">
<h3>${errorMessage}</h3>
</div>

<div class="container">
<c:forEach var="event" items="${events}">
<div class="row justify-content-center">
<div class="col-sm-6">
 ${event.activity } ${event.address} 
</div>
<!-- Button trigger modal -->
<div class="col-sm-3">
<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#details${event.id }">
  See Event Details
</button>
</div>
<div class="col-sm-3">
<form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-secondary" value="Attend Event"></input><br> 
		<input type="hidden" value="${event.id }" name="eventId"></input>
</form>
</div>

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
        Attendees: 
        <c:forEach var="ewu" items="${eventsWithUsers}">
		        <c:choose>
		         <c:when test ="${ewu.id eq event.id}">
		           <c:forEach var="user" items="${ewu.users}">
	        			<a href="viewUserProfile.do?uid=${user.id }"	>${user.userName}</a>
	      		 </c:forEach>
		         </c:when>
		        </c:choose>    
        </c:forEach>
        </tbody>
	</table>
      </div>
      <div class="modal-footer">
      
        <form action="addEventToUser.do" method="get">
		<input type="submit" class="btn btn-primary" value="Attend Event"></input><br> 
		<input type="hidden" value="${event.id }" name="eventId"></input>
		</form>
		
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
       

      </div>
    </div>
  </div>
</div>
</div>
<br>
</c:forEach>
</div>
</div>

	<jsp:include page="bootstrapFooter.jsp"></jsp:include>

</body>
</html>