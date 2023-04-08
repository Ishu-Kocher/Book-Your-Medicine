<%@page import="com.book.medicine.dao.ProductDao"%>
<%@page import="com.book.medicine.dao.StoreDao"%>
<%@page import="com.book.medicine.helper.ConnectionProvider"%>
<%@page import="com.book.medicine.dao.UserDao"%>
<%@include file="comman_css_js.jsp"%>

<%
UserDao usrdao = new UserDao(ConnectionProvider.getConnection());
int userCount = usrdao.getNumberOfUsersExist();

StoreDao strdao = new StoreDao(ConnectionProvider.getConnection());
int storeCount = strdao.getNumberOfStoresExist();

ProductDao prodao = new ProductDao(ConnectionProvider.getConnection());
int productCount = prodao.getNumberOfProductsExist();

OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
int orderCount = orderDao.getNumberOfOrdersExist();

%>

<body>
	<div class="container" id="admin">
		
		<%@include file="Message.jsp"%>

		<div class="row mt-5">

			<div class="col-md-4 mb-4">
				<div class="card text-center shadow bg-body rounded"
					data-bs-toggle="modal" data-bs-target="#showUsers">
					<div class="card-body">
						<img alt="users" src="IMG/team.png"
							class="img-fluid" style="max-width: 125px;">
						<h1><%=userCount%></h1>
						<h1 class="text-uppercase text-muted">User's</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4">
				<div class="card text-center shadow bg-body rounded"
					data-bs-toggle="modal" data-bs-target="#showMedicalStore">
					<div class="card-body">
						<img alt="list" src="IMG/pharmacy.png"
							class="img-fluid" style="max-width: 125px;">
						<h1><%=storeCount%></h1>
						<h1 class="text-uppercase text-muted">Store's</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-4">
				<div class="card text-center shadow bg-body rounded"
					data-bs-toggle="modal" data-bs-target="#showMedicines">
					<div class="card-body">
						<img alt="buy" src="IMG/medicine.png"
							class="img-fluid" style="max-width: 125px;">
						<h1><%=productCount%></h1>
						<h1 class="text-uppercase text-muted">Medicine's</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">

			<div class="col-md-6 mb-4">
				<div class="card text-center shadow bg-body rounded"
					data-bs-toggle="modal" data-bs-target="#addMedicalStore">
					<div class="card-body">
						<img alt="buy" src="IMG/plus.png" class="img-fluid"
							style="max-width: 125px;">
						<h1 class="text-uppercase text-muted">Add Medical Store</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6 mb-4">
				<div class="card text-center shadow bg-body rounded"
					data-bs-toggle="modal" data-bs-target="#addMedicine">
					<div class="card-body">
						<img alt="buy" src="IMG/buy.png" class="img-fluid"
							style="max-width: 125px;">
						<h1 class="text-uppercase text-muted">Add Medicine</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col-md-12 mb-4">
				<div class="card text-center shadow bg-body rounded"
					data-bs-toggle="modal" data-bs-target="#showOrders">
					<div class="card-body">
						<img alt="list" src="IMG/orders.png"
							class="img-fluid" style="max-width: 125px;">
						<h1><%=orderCount%></h1>
						<h1 class="text-uppercase text-muted">Order's</h1>
					</div>
				</div>
			</div>
		</div>

	</div>

	<%@include file="Modal-Admin-Operations.jsp"%>
</body>