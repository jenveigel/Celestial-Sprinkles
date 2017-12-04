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
		style="width: 60px;">
	</a>
	<ul class="navbar-nav">
		<!-- <li class="nav-item active">
      <a class="nav-link" href="attendEvent.do">Attend</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="createEventPage.do">Create</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="viewprofile.do">Your Profile</a>
    </li> -->
	</ul>
	</nav>
	<br>
	<br>






	<div class="container-fluid">
		<form action="login.do" method="post" class="register-form">
			<div class="card text-white bg-dark mb-3 container center_div"
            style="max-width: 60rem;">
            <div class="row justify-content-center">
                <div class="card-header">Login or Create New User</div>
            </div>
				<div class="card-body">
					<p class="card-text">
					<div class="row justify-content-center">
						<div class="col-sm-6">
							<!-- <h1>Login or Create New User</h1> -->
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-md-4 col-sm-4 col-lg-4">
							<label for="userName">USERNAME</label> <input name="userName"
								class="form-control" type="text">
						</div>

						<div class="col-md-4 col-sm-4 col-lg-4">
							<label for="password">PASSWORD</label> <input name="password"
								class="form-control" type="password">

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
						<div class="row">
							<div class="col">
								<form action="login.do" method="post">
									<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
										<input type="submit" class="btn btn-default logbutton"
											value="Sign in" />
									</div>
								</form>
							</div>
							<!-- <div class="row"> -->
							<div class="col">
								<form action="createUser.do" method="get">
									<div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
										<input type="submit" class="btn btn-default logbutton"
											value="Create account" />
									</div>
								</form>
							</div>
							<!-- </div> -->
						</div>

					</div>
				</div>
			</div>
			</form>
	</div>

















	<%-- <div class="container">
        <div class="card text-white bg-dark mb-3 container center_div"
            style="max-width: 60rem;">
            <div class="row justify-content-center">
                <div class="card-header">Login or Create New User</div>
            </div>
            <div class="card-body">
                <p class="card-text">
                <div class="row justify-content-center">
                    <div class="col-sm-6">
                        <!-- <h1>Login or Create New User</h1> -->
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-6">
                        <form action="login.do" method="post">
                            <input type="text" name="userName" placeholder="Enter User Name">
                            <input type="text" name="password" placeholder="Enter Password">
                            <input class="submit" type="submit" value="Sign-In">
                        </form>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-6">
                        <!-- error message for wrong username/password -->
                        <h3>${errorMessage}</h3>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-6">
                        <form action="createUser.do" method="get">
                            <button type="submit" class="btn btn-secondary"
                                value="Create Account">Create Account</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
 --%>
	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>
