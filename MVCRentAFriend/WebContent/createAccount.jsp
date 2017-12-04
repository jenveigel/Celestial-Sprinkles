<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
</head>
<body>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="loginPage.do">
    <img src="mountains.png" style="width:60px;">
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
	
	<form action="addUser.do" method="post">
	 	<div class="container">
		<p class="well"></p>
     	<h3>Registration</h3>
    		<hr>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <!-- <label>Username</label> -->
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter a Username">
                </div>
            </div>
            </div>
            <div class="form-group">
        </div>
       
        <div class="col-sm-5">
            <div class="form-group">
                <!-- <label>name</label> -->
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Enter your first name">
                </div>
                 <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter your last name">
                </div>
            </div>
            </div>
            <div class="col-sm-5">
            <div class="form-group">
                <!-- <label>bio and image</label> -->
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="bio" id="bio" placeholder="Enter something about you">
                </div>
                 <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="imgUrl" id="imgUrl" placeholder="Enter your imgUrl">
                </div>
            </div>
            </div>
            <div class="col-sm-5">
            <div class="form-group">
        </div>
        
                <!-- <label>Password</label> -->
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="text" class="form-control" name="password" id="password" placeholder="Enter a Password" required data-toggle="popover" title="Password Strength" data-content="Enter Password...">
                </div>
                
            </div>
            <div class="form-group">
            		<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-secondary pull-right">
            </div><br>
            <!-- <div class="form-group">
                <label>Confirm Password</label>
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-resize-vertical"></span></span>
                    <input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm Password" required>
                </div>
            </div>  -->
        
    
</div> 
    </form>
    
    </div>
<p class="row justify-content-center">
<a href="loginPage.do"> Return to Login</a>
</p></p>
  </div>
</div>

	 <%-- <div>

		<form action="addUser.do" method="post">
			<input type="text" name="userName" placeholder="Enter User Name">
			<input type="text" name="password" placeholder="Enter Password">
			<input class="submit" type="submit" value="Create Account">
		</form>

	</div>  --%>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

</body>
</html>