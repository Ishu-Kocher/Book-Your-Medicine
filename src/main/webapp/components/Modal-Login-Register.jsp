<%@include file="comman_css_js.jsp"%>

<!-- Login Modal -->
	<div class="modal fade" id="login" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="container text-center">
						<p class="display-6 text-muted">Login</p>
					</div>
				</div>
				<div class="modal-body">
					<form id="loginForm">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control" id="email" required>
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Password</label>
							<input type="password" class="form-control" id="password" required>
							<div id="emailHelp" class="form-text">We'll never share
								your password with anyone else.</div>
						</div>

						<div class="text-center mt-3">
							<input type="submit" class="btn btn-primary me-2" value="Login" />
							<input type="reset" class="btn btn-danger me-2" value="Reset" />
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- end Login Modal -->


	<!-- Register Modal -->
	<div class="modal fade" id="register" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="container text-center">
						<p class="display-6 text-muted">Registration</p>
					</div>
				</div>
				<div class="modal-body">
					<form id="registerForm">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Full
								Name</label> <input type="text" class="form-control" id="fullName"
								required>
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control" 
								id="regEmail" required>
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Password</label>
							<input type="password" class="form-control" id="regPassword"
								required>
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								10 digit Mobile Number </label> <input type="text" class="form-control"
								id="phone" maxlength="10" pattern="\d{10}" required>
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Address</label>
							<textarea class="form-control" id="address" required></textarea>
						</div>

						<div class="text-center mt-3">
							<input type="submit" class="btn btn-primary me-2"
								value="Register" /> <input type="reset"
								class="btn btn-danger me-2" value="Reset" />
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- end Register Modal -->

	<script>
		$("#registerForm").on('submit', function(event) {

			var data = {
				fullName : $('#fullName').val(),
				regEmail : $('#regEmail').val(),
				regPassword : $('#regPassword').val(),
				phone : $('#phone').val(),
				address : $('#address').val(),
			}

			event.preventDefault();

			$.ajax({
				url : "registerServlet",
				data : data,
				type : 'POST',

				success : function(data, textStatus, jqXHR) {
					if (data.trim() == "success") {
						swal("Registration Successful", "", "success");
					}else if(data.trim() == "Email Already Exist") {
						swal("Email Already Exist", "Try with another one", "warning");
					}else{
						swal(data, "", "error");
					}
				},

				error : function(jqXHR, textStatus, errorThrown) {
					swal("Oops", "Something went wrong", "error");
				}

			})

		})
	</script>

	<script>
		$("#loginForm").on(
				'submit',
				function(event) {

					var loginData = {
						email : $('#email').val(),
						password : $('#password').val(),
					}

					event.preventDefault();

					$.ajax({
						url : "loginServlet",
						data : loginData,
						type : 'POST',

						success : function(data, textStatus, jqXHR) {
							if (data.trim() == "Invalid") {
								swal("Invalid Login Details",
										"Try with another one", "error");
							} else if (data.trim() == "user") {
								window.location.href = 'UserDashboard';
							} else if(data.trim() == "admin"){
								window.location.href = 'AdminDashboard';
							}else {
								swal(data, "", "warning");
							}

						},

						error : function(jqXHR, textStatus, errorThrown) {
							swal("Oops", "Something went wrong", "error");
						}

					})

				})
	</script>