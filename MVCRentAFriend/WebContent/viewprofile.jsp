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
		
	<c:if test="${events != null }">
	<c:forEach var="event" items="${events }">  
		${event.activity }
		${event.owner }
		${event.dateTime }
		${event.address }
		
	</c:forEach>	
	</c:if>
</body>
</html>