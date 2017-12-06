<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#details${event.id }">${event.title }</button>
<!-- Modal -->
<div class="modal fade" id="details${event.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"><div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">${event.title }</h5>
			</div>
			<div class="modal-body">
				<strong>Event: </strong> ${event.activity } <br> <strong>Location:
				</strong> ${event.address}<br> <strong>When: </strong>${event.dateTime}
				<br> <strong>Description: </strong>${event.description} <br>
				<strong>Attendees:</strong><br>
				<c:forEach var="ewu" items="${eventsWithUsers}">
					<c:choose>
						<c:when test="${ewu.id eq event.id}">
							<div class="littleBox">
								<c:forEach var="user" items="${ewu.users}">
									<a href="viewUserProfile.do?uid=${user.id }"> <img
										src="${user.profile.imageURL }" alt="${user.userName}"
										width="200" height="200" /></a>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>