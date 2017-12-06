<button type="button" class="btn btn-warning" data-toggle="modal"
	data-target="#updateEvent${event.id }">Update Event</button>

<div class="modal fade" id="updateEvent${event.id }" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content2">
			<div class="modal-header2">
				<h5 id="" class="modal-title">Update Event</h5>

			</div>
			<div class="modal-body2">
				<form action="updateevent.do" method="get">
					Event Title: <input type="text" name="event"
						value="${event.title }" /><br> Street Address: <input
						type="text" name="street" value="${event.address.address }" /><br>
					City: <input name="city" value="${event.address.city }" /><br>
					State: <input name="state" value="${event.address.state }" /><br>
					Description: <input name="desc" value="${event.description}" /><br>
					Activity: <input name="activity" value="${event.activity }" /><br>
					When (date and time): <input type="datetime-local" name="when"
						value="${event.dateTime }" /> <br>

					<!-- <input class="submit" type="submit" value="Update"> -->
					<input type="hidden" value="${event.id }" name="eid"></input>
					<%-- <input type="hidden" value="${event.owner.id }" name="ownerId"></input> --%>
					<input type="submit" class="btn btn-primary" value="Update"></input>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>