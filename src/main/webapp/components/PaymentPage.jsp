<%@page import="com.book.medicine.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.book.medicine.entities.User"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
User user = (User) session.getAttribute("user");
ArrayList<Cart> cartList = (ArrayList) session.getAttribute("addToCart");
String filePrescription = (String) session.getAttribute("PrescriptionName");

if (user == null) {
	response.sendRedirect("Home");
	return;
} else {
	if (user.getUserType().equals("admin")) {
		response.sendRedirect("Home");
		return;
	}

	if (cartList == null) {
		response.sendRedirect("UserDashboard");
		return;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
#navBar {
	background-color: #11847F;
	font-size: 1.1rem;
}

#navBar form input {
	width: 350px;
}

.navbar-dark .navbar-nav .nav-link {
	color: white !important;
}

#cardDetails {
	display: none;
}
</style>
<%@include file="comman_css_js.jsp"%>
</head>
<body>

	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark" id="navBar">
		<div class="container">
			<a class="navbar-brand" href="UserDashboard">Book Your Medicine</a>
			<div class="navbar-nav ml-auto mb-2 mb-lg-0">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item active"><a class="nav-link"
						href="UserDashboard">Welcome, <%=user.getUserFullName()%> <i
							class="fa fa-user" aria-hidden="true"></i>
					</a></li>
					<%
					if (cartList == null) {
					%>
					<li class="nav-item active"><a class="nav-link" href="Order">
							Cart<span>( 0 )</span><i class="fa fa-cart-plus"
							aria-hidden="true"></i>
					</a></li>
					<%
					} else {
					%>
					<li class="nav-item active"><a class="nav-link" href="Order">
							Cart<span>( <%=cartList.size()%> )
						</span><i class="fa fa-cart-plus" aria-hidden="true"></i>
					</a></li>
					<%
					}
					%>

					<li class="nav-item active"><a class="nav-link" href="MyOrders">My
							Orders <i class="fa fa-shopping-bag" aria-hidden="true"></i>
					</a></li>
	
					<li class="nav-item active"><a class="nav-link" href="logout">Logout
							<i class="fa fa-sign-out" aria-hidden="true"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- end navbar -->

	<!-- main content -->
	<div class="container">
		<form id="orderPlaced" autocomplete="off">
			<div class="row">
				<div class="col-md-6 mt-5">
					<!-- Form -->

					<div class="card">
						<div class="card-body">
							<h3 class="text-center mb-5">Your details for order</h3>
							<div class="form-group">
								<label for="ordname">Name</label> <input type="text"
									value="<%=user.getUserFullName()%>" class="form-control"
									id="ordName" placeholder="Enter here" required>
							</div>

							<div class="form-group">
								<label for="ordph">Phone</label> <input type="text"
									value="<%=user.getUserPhone()%>" class="form-control"
									id="ordPh" placeholder="Enter here" required>
							</div>
							
							<div class="form-group">
								<label for="ordadd">Address</label>
								<textarea class="form-control" id="ordAdd"
									placeholder="Enter here" style="height: 200px;" required><%=user.getUserAddress()%></textarea>
							</div>
							
							<div class="form-group" id="prescription">
								<label for="ordph">Prescription</label> <input type="text"
									value="<%=filePrescription%>" class="form-control"
									id="filePrescription" placeholder="Enter here" readonly>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-6 mt-5">
					<div class="card">
						<div class="card-body">
							<h3 class="text-center mb-5">Payment Details</h3>

							<div onchange="ChoosePayment();">
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="flexRadioDefault" id="COD" value="COD"> <label
										class="form-check-label" for="flexRadioDefault1">Pay
										On Delivery(COD)</label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="flexRadioDefault" id="Card" value="Card"> <label
										class="form-check-label" for="flexRadioDefault1"> Card</label>
								</div>
							</div>

							<div id="cardDetails">
								<h3 class="text-center mt-4">Card Details</h3>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="ordph">Card Number</label> <input type="text"
												id="cardNo" class="form-control" placeholder="Enter here">
										</div>
									</div>
								</div>

								<div class="row mt-2">
									<div class="col-6">
										<div class="form-group">
											<label for="ordph">Expiration Date</label> <input type="text"
												id="cardMonth" class="form-control" placeholder="(MM/YY)">
										</div>
									</div>

									<div class="col-6">
										<div class="form-group">
											<label for="ordph">CVV</label> <input type="text"
												id="cardCVV" class="form-control" placeholder="3 digits">
										</div>
									</div>
								</div>
							</div>


							<div class="container text-center mt-4">
								<input type="submit" class="btn btn-outline-success me-1"
									value="Place Order" /> <a href="UserDashboard"
									class="btn btn-outline-secondary"> Continue Shopping</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- end main content -->

	<!-- footer -->
	<%@include file="footer.jsp"%>
	<!-- end foter -->

	<script>
	$( document ).ready(function() {
		if(document.getElementById('filePrescription').value == "null"){
			document.getElementById('prescription').style.display = "none";	
		}else{
			document.getElementById('prescription').style.display = "inline";
		}
	});
	
	
		function ChoosePayment() {
			if (document.getElementById('COD').checked) {
				document.getElementById('cardDetails').style.display = "none";
			} else if (document.getElementById('Card').checked) {
				document.getElementById('cardDetails').style.display = "inline";
			}
		}

		$("#orderPlaced")
				.on(
						'submit',

						function(event) {
							event.preventDefault();

							if (document.getElementById('COD').checked) {
								var data = {
										ordName : $('#ordName').val(),
										ordPh : $('#ordPh').val(),
										ordAdd : $('#ordAdd').val(),
										paymentType : $('#COD').val(),
										filePrescription : $('#filePrescription').val(),
									}
								$.ajax({
									url : "OrderMedicine",
									data : data,
									type : 'POST',

									success : function(data, textStatus, jqXHR) {
										if (data.trim() == "success") {
											swal("Order Successfully Placed", "", "success").then(function() {
    											window.location = "MyOrders";
											}); 
										} else {
											swal("Oops", "Something went wrong", "error").then(function() {
    											window.location = "UserDashboard";
											});
										}
									},

									error : function(jqXHR, textStatus, errorThrown) {
										swal("Oops", "Something went wrong", "error").then(function() {
											window.location = "UserDashboard";
										});
									}

								})

							} else if (document.getElementById('Card').checked) {

								var cardNo = document.getElementById('cardNo').value;
								var cardMonth = document
										.getElementById('cardMonth').value;
								var cardCVV = document
										.getElementById('cardCVV').value;

								if (cardNo == "" || cardMonth == ""
										|| cardCVV == "") {
									swal("Oops", "Enter Card Details", "error");
								} else {
									var data = {
											ordName : $('#ordName').val(),
											ordPh : $('#ordPh').val(),
											ordAdd : $('#ordAdd').val(),
											paymentType : $('#Card').val(),
											cardNo : $('#cardNo').val(),
											cardMonth : $('#cardMonth').val(),
											cardCVV : $('#cardCVV').val(),
											filePrescription : $('#filePrescription').val(),
										}
									$.ajax({
										url : "OrderMedicine",
										data : data,
										type : 'POST',

										success : function(data, textStatus, jqXHR) {
											if (data.trim() == "success") {
												swal("Order Successfully Placed", "", "success").then(function() {
	    											window.location = "MyOrders";
												}); 
											} else {
												swal("Oops", "Something went wrong", "error").then(function() {
	    											window.location = "UserDashboard";
												});
											}
										},

										error : function(jqXHR, textStatus, errorThrown) {
											swal("Oops", "Something went wrong", "error").then(function() {
    											window.location = "UserDashboard";
											});
										}

									})
								}
							} else {
								swal("Oops", "Select Payment Option", "error");
							}
						})
	</script>