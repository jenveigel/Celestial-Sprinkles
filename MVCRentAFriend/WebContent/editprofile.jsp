<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/editProfile.css">
</head>
<body>

<!-- -------------------Navbar----------------- -->
<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container-fluid">
	
	<div class="row justify-content-center">
	<h1>Edit Profile</h1>
	</div>
	<div class="row justify-content-center" >
	<form action="editprofile.do" method="get">
	<div class="col">
		<input type="text" name="firstName" width="100" placeholder="Enter First Name" value="${profile.firstName }"> 
		</div>
		<div class="col">
			<input type="text" name="lastName" placeholder="Enter Last Name" value="${profile.lastName }">
		</div>
		<div class="col">
			<textarea rows="3" cols="3" name="bio" id="bio">${profile.bio }</textarea>
		</div>
			<%-- <input type="text" name="bio" placeholder="Enter Bio" value="${profile.bio }"> --%> 
		<div class="col">
			<input type="text" name="imageURL" placeholder="Enter url" value="${profile.imageURL }"> 
			<br>
			<input type="text" name="facebookUrl" placeholder="Enter Facebook URL" value="${profile.facebookUrl }"> 
			<br>
			<input type="text" name="linkedinUrl" placeholder="Enter LinkedIn URL" value="${profile.linkedinUrl }"> 
			<br>
			<input class="submit" type="submit" value="Done">
		</div>
	</form>
	</div>
</div>
	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>