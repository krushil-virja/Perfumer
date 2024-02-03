<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Perfumer</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/register.jpeg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Checkout</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>Checkout</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->





	<!-- Contact Form Begin -->
	<div class="contact-form spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2>Checkout Section</h2>
					</div>
				</div>
			</div>
			<form action="userCheckout" method="post">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<input name="name" type="text" placeholder="Your name">
					</div>
					<div class="col-lg-6 col-md-6">
						<input name="email" type="text" placeholder="Your Email">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="password" type="password"
							placeholder="your secure password">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="contact" type="text"
							placeholder="your contact number">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="pincode" type="text" placeholder="Pincode Number">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="state" type="text" placeholder="State">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="country" type="text" placeholder="country">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="landmark" type="text" placeholder="nr, location">
					</div>

					<div class="col-lg-6 col-md-6">
						<input name="address" type="text" placeholder="delivery address">
					</div>



					<% if(user!=null) {%>
					<div class="col-lg-12 text-center">
						<input type="hidden" name="id" value="<%= user.getId()%>">
						<button type="submit" class="site-btn">SEND MESSAGE</button>
					</div>
					<%} else{ %>
					<div class="col-lg-12 text-center">
						<button type="submit" class="site-btn">SEND MESSAGE</button>
					</div>
					<%} %>




				</div>
		</div>
		</form>
	</div>
	</div>
	<!-- Contact Form End -->

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