<!DOCTYPE html>

<%@page import="com.entities.Admin"%>
<%@page import="java.util.List"%>

<%@page import="com.admindao.Admindao"%>
<%@page import="com.entities.Product"%>
<html lang="zxx">


<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
`
<title>ProductDetails</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/star.css" type="text/css">

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
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">



				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Product Details</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <a href="./index.jsp">Vegetables</a>
							<span>Vegetable’s Package</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">

				<%
					int id = Integer.parseInt(request.getParameter("id"));
					Admindao adao = new Admindao();
					Product p = adao.getbetailsbyid(id);
					session.setAttribute("p", p);
				%>


				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">

						<div class="product__details__pic__item">
							<img src="img/product/<%=p.getPimage1()%>" alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<img src="img/product/<%=p.getPimage1()%>" alt=""> <img
								src="img/product/<%=p.getPimage2()%>" alt=""> <img
								src="img/product/<%=p.getPimage3()%>" alt=""> <img
								src="img/product/<%=p.getPimage4()%>" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3><%=p.getPname()%></h3>
						<h5>
							Brand :
							<%=p.getPbrand()%></h5>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
						</div>
						<div class="product__details__price">
							<i class="fa fa-inr" aria-hidden="true"></i><%=p.getPrice()%><span>
								Only/-</span>
						</div>
						<p><%=p.getDiscription()%></p>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
						</div>
						<!-- <a href="#" class="primary-btn">ADD TO CARD</a> <a href="#"
							class="heart-icon"><span class="icon_heart_alt"></span></a> -->

						<form action="addToCart" method="post">

							<input type="hidden" name="pid" value="<%=p.getId()%>"> <input
								type="hidden" name="pname" value="<%=p.getPname()%>"> <input
								type="hidden" name="qty" value="1"> <input type="hidden"
								name="price" value="<%=p.getPrice()%>">

							<%
								if (user != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>" name="id">
							<button class="btn btn-success " style="border: hidden;">ADD
								TO CARD</button>

						</form>

						<form action="addToWishlist" class=" mx-2" method="post">

							<input type="hidden" name="pid" value="<%=p.getId()%>"> <input
								type="hidden" name="price" value="<%=p.getPrice()%>">
							<%
								if (user != null) {
							%>
							<input type="hidden" name="uid" value="<%=user.getId()%>">
							<button style="border: hidden;">
								<span class="icon_heart_alt">
							</button>

							<%
								}
							%>

							<%
								} else {
							%>
							<button style="border: hidden;">
								<a href="Login.jsp" class="primary-btn">ADD TO CARD</a>
							</button>
							<%
								}
							%>
							
							<button style="border: hidden;">
								<a href="rating.jsp?id=<%= p.getId() %>" class="primary-btn">Rate</a>
							</button>
						</form>


						<!-- ========================================= Product Rating Model Start ============================================================== -->

					<%-- 	<button data-toggle="modal" data-target="#rating"
							class="btn btn-sm btn-danger">
							Rating <i class="typcn typcn-delete btn-icon-append"></i>
						</button>


						<div class="modal fade" id="rating" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-xl modal-dialog-centered"
								style="width: 1000px;" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Product
											Rating</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<body>
											<link rel="stylesheet"
												href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

										

										</body>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<a href="deleteproduct.jsp?id=<?php echo $row['id']; ?>"
											type="button" class="btn btn-primary">Yes</a>
									</div>
								</div>
							</div>
						</div> --%>

						<!-- =============================================Product Rating Model End ============================================================= -->


						<ul>
							<li><b>Availability</b> <span>In Stock</span></li>
							<li><b>Shipping</b> <span>01 day shipping. <samp>Free
										pickup today</samp></span></li>
							<li><b>Weight</b> <span>0.5 KG</span></li>
							<li><b>Share on</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>

							<li><b>Highlight</b> <span>Quantity:</span>
							                     <span>Ideal For:</span>
							
								<h6>Quantity :</h6>
								<h6>Ideal For :</h6>
								<h6>Fragrance Classification :</h6>
								<h6>Fragrance Family :</h6>
								<h6>Fragrance Segment :</h6>
								<h6>Base Note :</h6>
								<h6>Heart Note :</h6>
								<h6>Top Note :</h6></li>
							
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">Information</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
							</li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Description</h6>


									<p><%=p.getDiscription()%></p>
								</div>
							</div>
							<div class="tab-pane" style="text-align: center;" id="tabs-2"
								role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Information</h6>
									<P><%=p.getInformation()%></P>
									<!-- <ul>
                                    <li>Quantity:</li>
                                    <li>Ideal for:</li>
                                    <li>Fragrance Classification:</li>
                                    <li>Fragrance Family:</li>
                                    <li>Base Note:</li>
                                    <li>Heart Note:</li>
                                    <li>Top Note</li>
                                    </ul> -->


								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Review</h6>
									<p></p>



								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>Related Product</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-1.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-2.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-3.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="img/product/product-7.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<!-- Related Product Section End -->

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