<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
</head>
<body>
	<h1>Hello new user</h1>

	<div>

		<form action="addUser.do">
			<input type="text" name="userName" placeholder="Enter User Name">
			<input type="text" name="password" placeholder="Enter Password">
			<input class="submit" type="submit" value="Create Account">
		</form>

	</div>

</body>
</html>