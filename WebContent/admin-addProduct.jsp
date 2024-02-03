<!DOCTYPE html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.admindao.Admindao"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Forms / Layouts - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
 <%
		LocalDateTime now = LocalDateTime.now();
	System.out.println("Before Formatting: " + now);
	DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss");
	String formatDateTime = now.format(format);
	%> 

	<!-- ======= Header ======= -->
	<%@ include file="admin-header.jsp"%>
	<!-- ======= END Header ======= -->


	<!-- ======= Sidebar ======= -->
	<%@ include file="admin-sidebar.jsp"%>
	<!-- ======= END Header ======= -->

	<main id="main" class="main">

	<div class="pagetitle">
		<h1>Category</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item">Forms</li>
				<li class="breadcrumb-item active">Layouts</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->
	<section class="section" style="height: 400px;">
		<div class="row">

			<div class="col-lg-6 offset-3 my-auto">
				<div class="card">
					<div class="card-body">



						<form action="addProduct" method="post"
							enctype="multipart/form-data" class="row g-3 mt-3">
							<div class="col-12">
								<label for="inputNanme4" class="form-label">Product Name</label>
								<input name="pname" type="text" class="form-control"
									id="inputNanme4">
							</div>
							<div class="col-12">
								<label for="inputEmail4" class="form-label">Product
									Image1</label> <input name="pimage1" type="file" class="form-control"
									id="inputEmail4">
							</div>
							<div class="col-12">
								<label for="inputEmail4" class="form-label">Product
									Image2</label> <input name="pimage2" type="file" class="form-control"
									id="inputEmail4">
							</div>
							<div class="col-12">
								<label for="inputEmail4" class="form-label">Product
									Image3</label> <input name="pimage3" type="file" class="form-control"
									id="inputEmail4">
							</div>
							<div class="col-12">
								<label for="inputEmail4" class="form-label">Product
									Image4</label> <input name="pimage4" type="file" class="form-control"
									id="inputEmail4">
							</div>

							<select name="cname" id="procat" class="form-control">

								<option selected disabled value="">Select Category</option>

								<% Admindao adao = new Admindao();
								List<Category> list =  adao.showCategory();	
							%>
								<% for(Category c : list){ %>
								<option value="<%= c.getCname() %>"><%= c.getCname() %></option>
								<%} %>
							</select>

							<div class="col-12">
								<label for="inputEmail4" class="form-label">Product
									Brand</label> <input name="pbrand" type="text" class="form-control">
							</div>

							<div class="col-12">
								<label for="inputEmail4" class="form-label">Product
									Price</label> <input name="price" type="text" class="form-control"
									id="inputEmail4">
							</div>
							
							<input type="hidden" name="timedurestion" value="<%=formatDateTime%>">
							


							<div class="row mt-3">
								<label for="discription" class="col-sm-2 col-form-label">Discription</label>
								<div class="col-sm-10">
									<textarea  name="discription" class="form-control" style="height: 100px"></textarea>
								</div>
							</div>
							
							
							<div class="row mt-3">
								<label for="information" class="col-sm-2 col-form-label">Information</label>
								<div class="col-sm-10">
									<textarea  name="information" class="form-control" style="height: 100px"></textarea>
								</div>
							</div>




							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-secondary">Reset</button>
							</div>
						</form>
						<!-- Vertical Form -->

					</div>
				</div>





			</div>
		</div>
	</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->

	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>