<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<%@include file="comman_css_js.jsp"%>
</head>
<body>
	<div>
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://cms-contents.pharmeasy.in/banner/e2a1dce3351-dweb_pl.jpg?dim=1440x0&dpr=1&q=100"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://cms-contents.pharmeasy.in/banner/2f72e192b9e-PSP_Dweb.jpg?dim=1440x0&dpr=1&q=100"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://cms-contents.pharmeasy.in/banner/85955054ec0-Surgicare_Dweb_1.jpg?dim=1440x0&dpr=1&q=100"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="container d-flex justify-content-center">
		<div class="row my-3">
			<div class="col">
				<div class="card" style="width: 18rem;">
					<img
						src="https://assets.pharmeasy.in/web-assets/dist/7c645a8d.png?dim=186x0&dpr=0.8999999761581421&q=100"
						class="card-img-top" alt="...">
					<div class="card-body d-flex">
						<h5 class="text-muted">Order Medicines</h5>
						<button class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#login">Order Now</button>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="card" style="width: 18rem;">
					<img
						src="https://assets.pharmeasy.in/web-assets/dist/c7c7095b.png?dim=186x0&dpr=0.8999999761581421&q=100"
						class="card-img-top" alt="...">
					<div class="card-body d-flex">
						<h5 class="text-muted"
						data-bs-toggle="modal" data-bs-target="#login">Healthcare Products</h5>
						<button class="btn btn-warning"
						data-bs-toggle="modal" data-bs-target="#login">Order Now</button>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="Modal-Login-Register.jsp"%>
</body>
</html>