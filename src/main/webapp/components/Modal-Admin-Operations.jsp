<%@page import="com.book.medicine.entities.Order"%>
<%@page import="com.book.medicine.dao.OrderDao"%>
<%@page import="com.book.medicine.entities.Product"%>
<%@page import="com.book.medicine.dao.ProductDao"%>
<%@page import="com.book.medicine.entities.Store"%>
<%@page import="com.book.medicine.dao.StoreDao"%>
<%@include file="comman_css_js.jsp"%>
<%@page import="com.book.medicine.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.book.medicine.helper.ConnectionProvider"%>
<%@page import="com.book.medicine.dao.UserDao"%>
<%@include file="comman_css_js.jsp"%>
<%
UserDao userdao = new UserDao(ConnectionProvider.getConnection());
List<User> userList = userdao.getAllUsersExist();

StoreDao storedao = new StoreDao(ConnectionProvider.getConnection());
List<Store> storeList = storedao.getAllStoresExist();

ProductDao productdao = new ProductDao(ConnectionProvider.getConnection());
List<Product> productList = productdao.getAllProductsExist();

OrderDao oDao = new OrderDao(ConnectionProvider.getConnection());
List<Order> listOrder = oDao.getAllOrders();
%>

<!-- Modal Show Users -->
<div class="modal fade" id="showUsers" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<div class="container text-center">
					<h5 class="modal-title display-6 text-white" id="exampleModalLabel">User's</h5>
				</div>
			</div>
			<div class="modal-body">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#Id</th>
							<th scope="col">Full Name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Type</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (User usr : userList) {
						%>
						<tr>
							<td><%=usr.getUserId()%></td>
							<td><%=usr.getUserFullName()%></td>
							<td><%=usr.getUserEmail()%></td>
							<td><%=usr.getUserPhone()%></td>
							<td><%=usr.getUserAddress()%></td>
							<td><%=usr.getUserType()%></td>
							<td>
								<button class="btn btn-dark m-1">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</button>
								<button class="btn btn-danger m-1">
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Show Users -->

<!-- Modal Show Medical Store -->
<div class="modal fade" id="showMedicalStore" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<div class="container text-center">
					<h5 class="modal-title display-6 text-white" id="exampleModalLabel">Medical
						Store's</h5>
				</div>
			</div>
			<div class="modal-body">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#Id</th>
							<th scope="col">Store Name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Store str : storeList) {
						%>
						<tr>
							<td><%=str.getStoreId()%></td>
							<td><%=str.getStoreName()%></td>
							<td><%=str.getStoreEmail()%></td>
							<td><%=str.getStorePh()%></td>
							<td><%=str.getStoreAddr()%></td>
							<td>
								<button class="btn btn-dark m-1">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</button>
								<button class="btn btn-danger m-1">
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Show Medical Store -->

<!-- Modal Show Medicines -->
<div class="modal fade" id="showMedicines" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<div class="container text-center">
					<h5 class="modal-title display-6 text-white" id="exampleModalLabel">Medicine's</h5>
				</div>
			</div>
			<div class="modal-body">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#Id</th>
							<th scope="col">Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Discount</th>
							<th scope="col">Category</th>
							<th scope="col">Type</th>
							<th scope="col">Image</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Product pro : productList) {
						%>
						<tr>
							<td><%=pro.getProductId()%></td>
							<td><%=pro.getProductName()%></td>
							<td><%=pro.getProductDesc()%></td>
							<td><%=pro.getProductPrice()%>rs</td>
							<td><%=pro.getProductDiscount()%>%</td>
							<td><%=pro.getProductCategory()%></td>
							<td><%=pro.getProductType()%></td>
							<td><img src="ProductsImg/<%=pro.getImageUrl()%>"
								style='max-width: 100px;'></td>
							<td>
								<button class="btn btn-dark m-1">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</button>
								<button class="btn btn-danger m-1">
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>
							</td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Show Medicines  -->

<!-- Modal Add Medical Store -->
<div class="modal fade" id="addMedicalStore" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<div class="container text-center">
					<h5 class="modal-title display-6 text-white" id="exampleModalLabel">Add
						Medical Store</h5>
				</div>
			</div>
			<div class="modal-body">
				<form id="AddMedicalStore">
					<div class="form-group">

						<div class="form-group my-2">
							<label for="exampleInputEmail1" class="form-label">Store
								name</label> <input type="text" class="form-control" id="storeName"
								required>
						</div>
						<div class="form-group my-2">
							<label for="exampleInputEmail1" class="form-label">Store
								Email</label> <input type="email" class="form-control" id="storeEmail"
								required>
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Store
								10 digit Mobile Number </label> <input type="text" class="form-control"
								id="storePh" maxlength="10" pattern="\d{10}" required>
						</div>

						<div class="form-group my-2">
							<label for="exampleInputEmail1" class="form-label">Store
								Address</label>
							<textarea style="height: 200px;" id="storeAddr"
								class="form-control" placeholder="type here.." required></textarea>
						</div>

						<div class="container text-center my-2">
							<input type="submit" value="Add Store"
								class="btn btn-outline-success">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Add Medical Store -->

<!-- Modal Add Medicine -->
<div class="modal fade" id="addMedicine" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<div class="container text-center">
					<h5 class="modal-title display-6 text-white" id="exampleModalLabel">Add
						Medicine</h5>
				</div>
			</div>
			<div class="modal-body">
				<form action="addProduct" method="post"
					enctype="multipart/form-data">
					<div class="form-group">

						<div class="form-group my-2">
							<label class="form-label">Medicine name</label> <input
								type="text" class="form-control" name="pName" required>
						</div>

						<div class="form-group my-2">
							<label class="form-label">Medicine description</label>
							<textarea style="height: 80px;" name="pDesc" class="form-control"
								placeholder="type here.." required></textarea>
						</div>

						<div class="form-group my-2">
							<label class="form-label">Medicine price</label> <input
								type="text" class="form-control" name="pPrice" required>
						</div>

						<div class="form-group my-2">
							<label class="form-label">Medicine discount in percent(%)</label>
							<input type="text" class="form-control" name="pdiscount" required>
						</div>

						<div class="form-group my-2" onchange="ChooseCat();">
							<label class="form-label">Select medicine category</label> <select
								class="form-control" id="pCategory" name="pCategory" required>
								<option value="">Select Any Category</option>
								<option value="Medicine">Medicine</option>
								<option value="HealthcareProduct">Healthcare Product</option>
							</select>
						</div>

						<div class="form-group my-2" style="display: none;"
							id="pTypeStyle">
							<label class="form-label">Select medicine type</label> <select
								class="form-control" id="pType" name="pType">
								<option value="">Select Any Type</option>
								<option value="Tablet">Tablet</option>
								<option value="Capsules">Capsules</option>
								<option value="Liquid">Liquid</option>
								<option value="Injections">Injections</option>
							</select>
						</div>

						<div class="form-group my-2">
							<label class="form-label">Upload medicine image</label> <input
								class="form-control" type="file" name="pPic" required>
						</div>

						<div class="container text-center my-2">
							<input type="submit" value="Add Medicine"
								class="btn btn-outline-success">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Add Medicine  -->

<!-- Modal Show Orders -->
<div class="modal fade" id="showOrders" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<div class="container text-center">
					<h5 class="modal-title display-6 text-white" id="exampleModalLabel">Order's</h5>
				</div>
			</div>
			<div class="modal-body">
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
							<td>
								<a href="UpdateOrderStatus?ordId=<%=ord.getOrdId()%>&action=confirm">
								<button class="btn btn-dark m-1">
									<i class="fa fa-thumbs-up" aria-hidden="true"></i>
								</button>
								</a>
								<a href="UpdateOrderStatus?ordId=<%=ord.getOrdId()%>&action=reject">
								<button class="btn btn-danger m-1">
									<i class="fa fa-thumbs-down" aria-hidden="true"></i>
								</button>
								</a>
							</td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Show Orders -->


<!-- Add Medical Store script -->
<script>
	$("#AddMedicalStore").on(
			'submit',
			function(event) {

				var data = {
					storeName : $('#storeName').val(),
					storeEmail : $('#storeEmail').val(),
					storePh : $('#storePh').val(),
					storeAddr : $('#storeAddr').val(),
				}

				event.preventDefault();

				$.ajax({
					url : "addMedicalStore",
					data : data,
					type : 'POST',

					success : function(data, textStatus, jqXHR) {
						if (data.trim() == "success") {
							swal("Added Successful", "", "success");
						} else if (data.trim() == "Store Already Exist") {
							swal("Store Already Exist", "Try with another one",
									"warning");
						} else {
							swal(data, "", "error");
						}
					},

					error : function(jqXHR, textStatus, errorThrown) {
						swal("Oops", "Something went wrong", "error");
					}

				})

			})
</script>
<!-- End Add Medical Store script -->

<!-- Choose Category script -->
<script>
	function ChooseCat(){
		var pCat = document.getElementById("pCategory").value;
		if(pCat == "Medicine"){
			document.getElementById("pTypeStyle").style.display = "inline";
			document.getElementById("pType").required = true;   
		}
		else if(pCat == ""){
			document.getElementById("pTypeStyle").style.display = "none";
			document.getElementById("pType").value = "";
			document.getElementById("pType").value = false; 
		}
		else if(pCat == "HealthcareProduct"){
			document.getElementById("pTypeStyle").style.display = "none";
			document.getElementById("pType").value = "";
			document.getElementById("pType").required = false; 
		}
	}
</script>
<!-- End Choose Category script -->
