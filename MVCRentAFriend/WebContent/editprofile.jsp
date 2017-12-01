<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Edit Profile</h1>
		<form action="editprofile.do" method="post">
			<input type="text" name="firstName" placeholder="Enter your First Name">
			<input type="text" name="lastName" placeholder="Enter your Last Name">
			<input type="text" name="bio" placeholder="Enter a short Bio">
			<input type="text" name="imageURL" placeholder="Enter a url for a profile Picture">
			<input class="submit" type="submit" value="Sign-In">
		</form>
		
</body>
</html>