<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="bootstrapHeader.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${user.userName }'s Reviews</title>
</head>
<body>

<!-- -------------------Navbar----------------- -->
<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container-fluid" style="max-width: 95%;">
		<div class="row justify-content-center">
			<div class="col-sm-12 bg-dark" style="border-radius: 25px 25px 0px 0px;">
				<h1>${profile.firstName } ${profile.lastName}</h1>
			</div>
		</div>

		<div class="row">

				<div class="col-sm-3 bg-secondary text-center">
				<br>
				<img src="${profile.imageURL }"  
					alt="${profile.firstName }" 
					style="width: 300px; height: 300px">

					<div class="container" style="max-width: 70%;">
				<div class="row justify-content-center">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-black btn-lg mt-3" data-toggle="modal"
						data-target="#review${user.id }">Review User</button>
				</div>
				<br>
				<div class="row justify-content-center">
					<!-- Button trigger modal -->
					
					<a href="viewUserProfile.do?uid=${user.id }">
						<button type="button" class="btn btn-black btn-lg">Back to ${user.userName}'s profile</button>
					</a>
					
				</div>
				</div>

					<!-- Modal -->
					<div class="modal fade" id="review${user.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Review User</h5>
					      </div>
					      <div class="modal-body">
									<div class="container-fluid">
										<div class="row">

					        		<form action="addReview.do" method="post">
					            <input type="radio" name="rating" value="1" required> 1
					            <input type="radio" name="rating" value="2"> 2
					            <input type="radio" name="rating" value="3"> 3
					            <input type="radio" name="rating" value="4"> 4
					            <input type="radio" name="rating" value="5"> 5

													</div>
													<br>

										<div class="row">
											<div class="col">

					        			<textarea rows="" cols="" name="comment" placeholder="Enter Review"></textarea>
												</div>
										</div>

								</div>
								</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									<input type="submit" class="btn btn-primary" value="Submit">
									<input type="hidden" value="${user.id }" name="uid"></input>
									<!--need to pass user id to path of this thingy  -->
							</form>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
				<div class="col-sm-9 bg-secondary myBox">
				<br>
				<!-- <div class="col">
				<div class="row"> -->
				<c:forEach var="review" items="${reviews }">
				<div class="border mr-3 ml-3 mb-3 p-2">
					<h4>${review.review} &nbsp</h4>
					<h4><strong>Rating: ${review.rating}</strong></h4>
				</div>
				</c:forEach>
				<%-- ${user.rating } --%>
				</div>
				<!-- </div>
				</div> -->

		</div>
		<div class="row">
<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-sm-12 bg-dark row justify-content-center" style="border-radius: 0px 0px 25px 25px;">
				<a href="${profile.linkedinUrl}"><i
							class="fa fa-linkedin"></i></a>
							<a href="${profile.facebookUrl}"><i
							class="fa fa-facebook"></i></a>
							<a href="https://www.google.com/"><i
							class="fa fa-google"></i></a>
							<a href="https://twitter.com/?lang=en"><i
							class="fa fa-twitter"></i></a>
			</div>
		</div>
		</div><br>

		</div>
	</div>
	<br><br>
	<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>
