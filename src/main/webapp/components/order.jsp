<%@page import="java.text.DecimalFormat"%>
<%@page import="com.book.medicine.helper.ConnectionProvider"%>
<%@page import="com.book.medicine.dao.ProductDao"%>
<%@page import="com.book.medicine.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.book.medicine.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
User user = (User) session.getAttribute("user");
ArrayList<Cart> cartList = (ArrayList) session.getAttribute("addToCart");

DecimalFormat df = new DecimalFormat("0.00");

if (user == null) {
	response.sendRedirect("Home");
	return;
} else {
	if (user.getUserType().equals("admin")) {
		response.sendRedirect("Home");
		return;
	}
}

List<Cart> cartProducts = null;

double totalPrice = 0;
if (cartList != null) {
	ProductDao pDao = new ProductDao(ConnectionProvider.getConnection());
	cartProducts = pDao.getCartProducts(cartList);
	totalPrice = pDao.getTotalCartPrice(cartList);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
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

	<!-- Main Content -->
	<div class="content-container">

		<div class="container">
			<div class="row">

				<div class="col-md-10 offset-md-1">

					<h1 class="display-5 text-center background-color text-white">Cart</h1>

					<%
					if (cartList == null || cartList.isEmpty()) {
					%>
					<h1 class="display-6 text-center mt-5">Your Cart is Empty :(</h1>
					<div class="container text-center mt-3">
						<a href="UserDashboard">
							<button class="btn btn-outline-success">Go Back</button>
						</a>
					</div>
					<%
					return;
					}
					%>
					<p class="display-5 text-center">Cart Item's</p>
					<%@include file="Message.jsp"%>					
					<!-- table -->
					<table class="table table-loght mt-4">
						<thead>
							<tr>
								<th>Item Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Action</th>
							</tr>
						</thead>

						<%
						if (cartList != null) {
							for (Cart c : cartProducts) {
						%>
						<tr>
							<td><%=c.getProductName()%></td>
							<td><%=c.getProductPrice()%> &#8377;</td>
							<td>
								<form action="" method="post" class="form-inline">
									<div class="form-group d-flex justify-content-between">
										<a href="ProductQty?action=dec&pName=<%=c.getProductName()%>"
											class="btn btn-primary btn-sm btn-decre"><i
											class="fa fa-minus"></i></a> <input type="number"
											name="pQuantity" class="form-control"
											value="<%=c.getProductQty()%>" readonly> <a
											href="ProductQty?action=inc&pName=<%=c.getProductName()%>"
											class="btn btn-primary btn-sm"> <i class="fa fa-plus"></i></a>
									</div>
								</form>
							</td>
							<td><a href="ProductRemove?pName=<%=c.getProductName()%>"><button
										class="btn btn-danger">Remove</button></a></td>
							</td>
						</tr>
						<%
						}
						}
						%>
						<tr>
							<td colspan="5" class="text-end fw-bolder">Total Price: 
							<%=df.format(totalPrice)%> &#8377;<br> <br> 
								<a href="UserDashboard"><button class="btn btn-secondary">Continue Shopping</button></a>
								<a href="OrderCancel"><button class="btn btn-danger">Cancel</button></a> 
							</td>
						</tr>
						<tr>
							<td colspan="5" class="text-center fw-bolder">
								<a href="BuyController">
									<button class="btn btn-success">Proceed To Buy</button>
								</a>
							</td>
						</tr>

						<tbody>
					</table>
					<!-- table close -->

				</div>
			</div>
		</div>
		<!-- Main Content close -->

		<!-- footer -->
		<div style="margin-top: 5%;">
			<%@include file="footer.jsp"%>
		</div>
		<!-- end foter -->
</body>
</html>