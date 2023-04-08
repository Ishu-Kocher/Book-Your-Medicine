<%@page import="com.book.medicine.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.book.medicine.entities.Product"%>
<%@page import="com.book.medicine.dao.ProductDao"%>
<%@page import="com.book.medicine.helper.ConnectionProvider"%>
<%@page import="com.book.medicine.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

String productName = request.getParameter("productName");
if (productName == "" || productName == null) {
	response.sendRedirect("UserDashboard");
	return;
}
ProductDao pDao = new ProductDao(ConnectionProvider.getConnection());
Product product = pDao.getProductDetails(productName);
if (product == null) {
	response.sendRedirect("UserDashboard");
	return;
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
						if(cartList==null){
					%>
						<li class="nav-item active"><a class="nav-link" href="Order">
							Cart<span>( 0 )</span><i class="fa fa-cart-plus" aria-hidden="true"></i>
						</a>
						</li> 
					<%
					}else{
					%>
						<li class="nav-item active"><a class="nav-link" href="Order">
							Cart<span>( <%=cartList.size() %> )</span><i class="fa fa-cart-plus" aria-hidden="true"></i>
						</a>
						</li>
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

	<!-- main-container -->
	<div class="container">

		<div class="row mt-5">
			<div class="col-lg-6">
				<img src="ProductsImg/<%=product.getImageUrl()%>"
					class="rounded mx-auto d-block mt-4" style="max-width: 100%;">
			</div>
			<div class="col-lg-6">
				<p class="display-4"><%=product.getProductName()%></p>
				<p class="lead"><%=product.getProductDesc()%></p>
				<p class="h5 lh-1">
					&#8377;<%=product.getPriceAfterDiscount(product.getProductPrice(),product.getProductDiscount())%></p>
				<p class="lh-1">
					<del>
						&#8377;<%=product.getProductPrice()%></del>
					<%=product.getProductDiscount()%>%off
				</p>

				<div class="mt-1">
					<form action="AddToCart" method="post">
						<input type="hidden" name="pName"  value="<%=product.getProductName()%>"/>
						<input type="hidden" name="pPriceAfterDiscount"  value="<%=product.getPriceAfterDiscount(product.getProductPrice(),product.getProductDiscount())%>"/>
												
						<select class="form-select d-inline" name="pQty" style="max-width: 25%;" required>
							<option value="">Select Qty</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5 <p class="lead">Max Qty</p></option>
						</select>
						
						<button class="btn btn-outline-success d-inline" type="submit">Add To Cart</button>
					</form>
				</div>

				<p class="mt-5">
					Medicine Type ::
					<%=product.getProductType()%></p>
				<p>
					Category ::
					<%=product.getProductCategory()%></p>
			</div>
		</div>

	</div>
	<!-- end main-container -->

	<!-- footer -->
	<%@include file="footer.jsp"%>
	<!-- end foter -->

</body>
</html>