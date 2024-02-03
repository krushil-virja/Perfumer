<!DOCTYPE html>
<%@page import="com.entities.Wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.Userdao.Userdao"%>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<%@ include file="Humberger.jsp"%>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<%@ include file="header.jsp"%>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<%@ include file="sidebar.jsp"%>
	<!-- Hero Section End -->
	<%
		if (user != null) {
	%>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/contact.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>wishList</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>wishList</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->


	<!-- Contact Form Begin -->

   <% Userdao udao = new Userdao();
    List<Wishlist> list =udao.showWishlist(user.getId());
   %>

	<table class="table" style="margin-top: 50px; margin-bottom: 50px;">
		<thead>
			<tr>
				<th>#ID</th>
				<th>Product Image</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Delete</th>
				<th>Add To Cart</th>
			</tr>
		</thead>
		<tbody>
			<% for(Wishlist w : list){ %>
			<tr>
				<th scope="row"><%= w.getId() %></th>
				<td><img  style="border-radius: 0; width: 100px; height: 100px"
										src="img/product/<%=w.getProduct().getPimage1() %>" alt="image"
										style="border-radius: 0; width: 100px; height: 50px" /></td>
				<td><%= w.getProduct().getPname()%></td>
				<td><%= w.getPrice() %></td>
				<td></td>
				<td></td>
			</tr>
			<%} %>
		</tbody>
	</table>

	<!-- Contact Form End -->

	<%
		} else {
	%>
	<%@ include file="error.jsp"%>
	<%
		}
	%>

	<!-- Footer Section Begin -->

	<%@ include file="footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>




</body>

</html>