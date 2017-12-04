<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
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

	<h1>Edit Profile</h1>
	<form action="editprofile.do" method="get">
		<input type="text" name="firstName" placeholder="Enter First Name"
			value="${profile.firstName }"> <input type="text"
			name="lastName" placeholder="Enter Last Name"
			value="${profile.lastName }"> <input type="text" name="bio"
			placeholder="Enter Bio" value="${profile.bio }"> <input
			type="text" name="imageURL" placeholder="Enter url"
			value="${profile.imageURL }"> <input class="submit"
			type="submit" value="Done">
	</form>

	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>