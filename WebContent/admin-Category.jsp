<!DOCTYPE html>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.admindao.Admindao"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>admin-Category</title>
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

	<!-- ======= Header ======= -->
	<%@ include file="admin-header.jsp"%>
	<!-- ======= END Header ======= -->

	<!-- ======= Sidebar ======= -->
	<%@ include file="admin-sidebar.jsp"%>
	<!-- ======= END Header ======= -->

	<main id="main" class="main">

	<div class="pagetitle">
		<h1>All Categories</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item">Tables</li>
				<li class="breadcrumb-item active">Data</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">

		<%
			Admindao adao = new Admindao();
			List<Category> list = adao.showCategory();
		%>
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">

						<div class="mt-3 mb-3 ">
							<button class="btn btn-primary" type="submit">
								<a style="text-decoration: none; color: white;"
									href="admin-addCategory.jsp">Add Category</a>
							</button>
						</div>



						<!-- Table with stripped rows -->
						<table class="table datatable">
							<thead>
								<tr>
									<th scope="col">#Id</th>
									<th scope="col">Name</th>
									<th scope="col">Category Image</th>
									
									<th scope="col">Remove</th>
									<th scope="col">Update</th>
									

								</tr>
							</thead>
							<tbody>

								<%
									for (Category c : list) {
								%>
								<tr>
									<th scope="row"><%=c.getId()%></th>
									<td><%=c.getCname()%></td>

									<td><img
										style="border-radius: 0; width: 100px; height: 100px"
										src="img/categories/<%=c.getCimage()%>" alt="image"
										style="border-radius: 0; width: 100px; height: 50px" /></td>
									
									
									<td><button class="btn btn-danger"><a style="text-decoration: none; color: white;" href="deleteCategory?id=<%=c.getId()%>">Delete</a></button></td>
									<td><button class="btn btn-primary"><a style="text-decoration: none; color: white;" href="updateCategory?id=<%=c.getId()%>">Update</a></button></td>
									

								</tr>
								<%
									}
								%>
							</tbody>
						</table>
						<!-- End Table with stripped rows -->

					</div>
				</div>

			</div>
		</div>
	</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="admin-footer.jsp" %>
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