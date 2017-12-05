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

	<form action="editprofile.do" method="get">
		<div class="container">
			<p class="well"></p>
			<h1 class="header">Edit Profile</h1>
			<h1> ${error }</h1>
			<br>
			<div class="row justify-content-center text-white bg-dark" style="border-radius: 25px; background-color:darkgrey;">
				<h4>Requried Fields</h4>
				<div class="col-sm-12 col-md-12 col-lg-12"></div>
				<div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span></span> <input type="text"
							class="form-control" name="userName" id="userName"
							placeholder="Enter a Username" value="${user.userName }">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-lock"></span></span> <input type="text"
							class="form-control" name="password" id="password"
							placeholder="Enter a Password" value="${user.password }"
							required data-toggle="popover" title="Password Strength"
							data-content="Enter Password...">
					</div>
					<br>
				</div>
				
				<div class="col-sm-6">
						<!-- <label>name</label> -->
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="firstName" id="firstName"
								placeholder="Enter your first name" value="${profile.firstName }">
						</div>
						</div>
				<div class="col-sm-6">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="lastName" id="lastName"
								placeholder="Enter your last name" value="${profile.lastName }">
						</div>
					</div>
					<div class="col-sm-12">&nbsp</div>
					</div>
					<br>
					
					<div class="row justify-content-center text-white bg-dark" style="border-radius: 25px; background-color:darkgrey;">
						<h4>Optional</h4>
						<div class="input-group col-sm-12">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span>
								
								<textarea rows="" cols="" name="bio" id="bio" 
								placeholder="Enter something about you" value="${profile.bio }">${profile.bio }</textarea>
						</div>
						<div class="col-sm-12">&nbsp</div>
						 <div class="input-group col-sm-4">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="facebookUrl" id="facebookUrl"
								placeholder="Paste your Facebook URL here" value="${profile.facebookUrl }">
						</div><br>
						<div class="input-group col-sm-4">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="linkedinUrl" id="linkedinUrl"
								placeholder="Paste your LinkedIn URL here" value="${profile.linkedinUrl }">
						</div><br>
						<!-- <label>bio and image</label> -->
						
						<div class="input-group col-sm-4">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span></span> <input type="text"
								class="form-control" name="imgUrl" id="imgUrl"
								placeholder="Enter a profile image url" value="${profile.imageURL }">
						</div>
						<div class="col-sm-12">&nbsp</div>
						<input type="submit" name="submit" id="submit" value="Submit"
						class="btn pull-right btn-default logbutton">
						<div class="col-sm-12">&nbsp</div>
					</div>
				<br>

            </div>  

	</form>
	
	<div class="container">
		<div class="row justify-content-center">
			<div class="col"></div>
				<form action="loginPage.do">
		    			<input class="btn btn-default btn-sm" type="submit" value="Back to login" />
				</form>
			<div class="col"></div>
		</div>
	</div>>

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
			<input type="text" name="bio" placeholder="Enter Bio" value="${profile.bio }"> 
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