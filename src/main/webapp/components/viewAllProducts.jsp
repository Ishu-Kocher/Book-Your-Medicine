<%@page import="com.book.medicine.helper.HelperDesc"%>
<%@page import="com.book.medicine.helper.ConnectionProvider"%>
<%@page import="com.book.medicine.entities.Product"%>
<%@page import="com.book.medicine.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%
ProductDao pDao = new ProductDao(ConnectionProvider.getConnection());

String searchInput = request.getParameter("searchInput");
List<Product> allProductList = null;

if(searchInput=="" || searchInput==null){
	allProductList = pDao.getAllProductsExist();
}else{
	allProductList = pDao.searchProducts(searchInput);
}

%>
<style>
.search-conatiner {
	max-width: 600px;
	margin: auto;
}
</style>
<head>
<%@include file="comman_css_js.jsp"%>
</head>
<body>
	<div class="container mt-3">

		<div>
			<form action="UserDashboard" method="post" autocomplete="off">
				<div class="search-conatiner my-3 shadow bg-body rounded">
					<input name="searchInput" type="text" class="form-control"
						placeholder="Search medicines/Healthcare products">
				</div>
				<div class="container text-center">
					<button class="btn btn-light border border-1" type="submit">Search</button>
				</div>
			</form>
		</div>

		<div class="conatiner">
			<div class="container text-center mt-4">
				<button class="btn btn-dark">Medicine</button>
				<button class="btn btn-dark">HealthcareProduct</button>
			</div>
		</div>

		<%@include file="Message.jsp"%>

		<div class="mt-2 row justify-content-center">
			<%
				if(allProductList==null || allProductList.isEmpty()){
			%>
			<img alt="buy" src="IMG/NoResultsFound.png"
				class="mt-4 rounded mx-auto d-block" style="max-width: 300px;">
			<%	
				}		
			for (Product allProList : allProductList) {
			%>
			<div class="col-lg-3 mx-4 my-4">

				<div class="card shadow bg-body rounded" style="width: 18rem;">

					<img src="ProductsImg/<%=allProList.getImageUrl()%>"
						class="rounded mx-auto d-block m-2" style="max-width: 120px;">

					<div class="card-body">
						<h5 class="card-title"><%=allProList.getProductName()%></h5>
						<p class="card-text"><%=HelperDesc.get10Words(allProList.getProductDesc())%></p>
						<div>
							<h4>
								&#8377;<%=allProList.getPriceAfterDiscount(allProList.getProductPrice(),allProList.getProductDiscount())%>/-
							</h4>
							<span class="text-secondary"> <del>
									&#8377;<%=allProList.getProductPrice()%></del> <%=allProList.getProductDiscount()%>%
								off
							</span>
						</div>
						<div class="mt-1">
							<a
								href="ViewProduct?productName=<%=allProList.getProductName()%>">
								<button class="btn btn-outline-success">View</button>
							</a>
						</div>
					</div>

				</div>

			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
