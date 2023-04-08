<%@page import="com.book.medicine.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
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
<%@include file="components/comman_css_js.jsp"%>
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


	<!-- main content -->
	<%@include file="components/viewAllProducts.jsp"%>
	<!-- end main content -->
	
	<!-- footer -->
	<%@include file="components/footer.jsp"%>
	<!-- end foter -->

</body>
</html>