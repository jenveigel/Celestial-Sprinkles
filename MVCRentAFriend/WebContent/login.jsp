<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css"
	href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <a
		class="navbar-brand" href="login.jsp"> <img src="mountains.png"
		style="width: 60px;"></a>
	</nav>
	<br>
	<br>

	<div class="container">
		<form action="login.do" method="post" class="register-form">
			<div class="card text-white bg-dark mb-3 container center_div"
            style="max-width: 100%;" >
            <div class="row justify-content-center">
                <div class="card-header">Login or Create New User</div>
            </div>
					<p class="card-text">
					<div class="row justify-content-center">
			
						<div class="col"></div>
						<div class="col">
							<input name="userName" class="form-control" type="text" placeholder="username">
						</div>
						<div class="col"></div>
				    </div>
						<br>
						<div class="row justify-content-center">
							<div class="col"></div>
							<div class="col">
								<input name="password" class="form-control" type="password" placeholder="password">
							</div>
							<div class="col"></div>
					</div>
						<hr>
						<div class="row justify-content-center">
							<div class="error">
								<div class="col-sm-12">
									<!-- error message for wrong username/password -->
									<h3>${errorMessage}</h3>
								</div>
							</div>
						</div>
						<div class="row justify-content-center">
						<div class="col"></div>
							<div class="col">
								<form action="login.do" method="post">
									<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
										<input type="submit" class="btn btn-default logbutton"
											value="Sign in" />
									</div>
								</form>
							</div>
							<div class="col"></div>
							</div>
							<br>
							<div class="row justify-content-center">
							<!-- <div class="row"> -->
							<div class="col"></div>
							<div class="col">
								<form action="createUser.do" method="get">
									<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
										<input type="submit" class="btn btn-default logbutton"
											value="Create account" />
									</div>
								</form>
							</div>
							<div class="col"></div>
							<!-- </div> -->
						</div>

					</div>
			</form>
				</div>
	
	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>
