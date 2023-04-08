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
	
<body>
	<!-- navBar -->
	<nav class="navbar navbar-expand-lg navbar-dark" id="navBar">
		<div class="container">
			<a class="navbar-brand" href="Home">Book Your Medicine</a>
			
			<div class="navbar-nav ml-auto mb-2 mb-lg-0">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#login"> Login <i
							class="fa fa-sign-in" aria-hidden="true"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#register"> Register <i
							class="fa fa-user-plus" aria-hidden="true"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- navBar end -->
	
	<%@include file="Modal-Login-Register.jsp"%>
</body>