<%@page import="com.book.medicine.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.book.medicine.dao.OrderDao"%>
<%@page import="com.book.medicine.helper.ConnectionProvider"%>
<%@page import="com.book.medicine.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.book.medicine.entities.User"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
User user = (User) session.getAttribute("user");
ArrayList<Cart> cartList = (ArrayList) session.getAttribute("addToCart");

if (user == null) {
	response.sendRedirect("Home");
	return;
} else {
	if (user.getUserType().equals("admin")) {
		response.sendRedirect("Home");
		return;
	}
}

OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
List<Order> listOrder = orderDao.getAllOrdersByUser(user.getUserEmail());
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
		<div class="row mt-5 justify-content-center">
			<div class="col-12">
				<h1 class="text-center display-6">My Order's</h1>
				<%
				if(listOrder==null || listOrder.isEmpty()){
				%>
				<p class="text-center h5 mt-5">There are no orders
					associated with this account that were placed in the past :( </p>
				<%	
					return;
					}
				%>
				<table class="table mt-4">
					<thead>
						<tr>
							<th>Order Name</th>
							<th>Order Ph</th>
							<th>Order Address</th>
							<th>Product Name</th>
							<th>Product Qty</th>
							<th>Product Price</th>
							<th>Payment Type</th>
							<th>Order Date</th>
							<th>Delivery Date</th>
							<th>Order Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<% 
						for(Order ord : listOrder){
					%>
					<tbody>
						<tr>
							<td><%=ord.getOrdName() %></td>
							<td><%=ord.getOrdPh() %></td>
							<td><%=ord.getOrdAddress() %></td>
							<td><%=ord.getProductName() %></td>
							<td><%=ord.getProductQuantity() %></td>
							<td><%=ord.getProductPrice() %></td>
							<td><%=ord.getPaymentType() %></td>
							<td><%=ord.getOrdDate() %></td>
							<td><%=ord.getDeliveryDate() %></td>
							<td><%=ord.getOrdStatus() %></td>
							<td><button class="btn btn-danger">Cancel</button></td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
		</div>
	</div>
	<!-- end main content -->

	<!-- footer -->
	<div style="margin-top: 16%;">
		<%@include file="footer.jsp"%>
	</div>
	<!-- end foter -->