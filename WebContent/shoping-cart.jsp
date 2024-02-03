<!DOCTYPE html>
<%@page import="com.entities.Cart"%>
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

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/fo0nt-awesome.min.css" type="text/css">
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
	<%if(user!=null){ %>
	<section class="breadcrumb-section set-bg"
		data-setbg="img/addToCart3.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2  style="color: white;">Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>Shopping Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad margin-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">Products</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>Remove</th>
								</tr>
							</thead>
							<tbody>


								<% Userdao udao = new Userdao();
                        List<Cart> list  =udao.viewCart(user.getId());
                        
                        %>
								<% for(Cart c: list){ %>
								<tr>
									<td class="shoping__cart__item"><img
										style="border-radius: 0; width: 80px; height: 80px"
										src="img/product/<%= c.getProduct().getPimage1() %>" alt="">
										<h5><%= c.getPname() %></h5></td>
									<td class="shoping__cart__price"><%= c.getPrice() %></td>
									<form action="updateCart" method="post">
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="">
													<input type="hidden" name="id" value="<%=c.getId()%>">
													<input type="number" name="qty" value="<%=c.getQty()%>"
														min="1" max="10" step="1" data-decimals="0" required
														onchange="this.form.submit();">
												</div>
											</div>
										</td>
									</form>
									<td class="shoping__cart__total"><%= c.getTotal() %></td>
							 		<td class="shoping__cart__item__close">
									<button class="btn btn-danger"><a href="removeCart?id=<%=c.getId()%>">Delete</a></button>
										</td>
								</tr>

								<%} %>
							</tbody> 
						</table>
					</div>
				</div>
			</div>
			<% if(list.size()==0){ %>
			<%@ include  file="emptyCart.jsp" %>
			<%}  else{%>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="index.jsp" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
							 <a href="#" class="primary-btn cart-btn cart-btn-right"><span
							class="icon_loading"></span> Upadate Cart</a>
					</div>
				</div>
				
				
				<div class="col-lg-6">
					<div class="shoping__continue">
						<div class="shoping__discount">
							<h5>Discount Codes</h5>
							<form action="userCoupon" method="post">
							<input name="uid" type="hidden" value="<%= user.getId()%>">
								<input name="coupon" type="text" placeholder="Enter your coupon code">
								
								<button type="submit" class="site-btn">APPLY COUPON</button>
							</form>
						</div>
					</div>
				</div>


				<% Userdao dao = new Userdao();
						// implement viewcart method using user id so we can get perticuler cart data and here using gettotalprice method we do total of all cart product and fetch below
				            List<Cart> cartlist =  dao.viewCart(user.getId());
				            double subtotal =  dao.gettotalprice(cartlist);
				            request.setAttribute("subtotal", subtotal);
				            
                          %>

				<input type="hidden" name="cid" value="${cart.id}">
				<div class="col-lg-6">
					<div class="shoping__checkout">
						<h5>Cart Total</h5>
						<ul>
							<li>Subtotal <span>${subtotal}</span></li>
							<li>Dicount <span></span></li>
							<li>Total <span>${subtotal}</span></li>
						</ul>
						<a href="checkout.jsp" class="primary-btn">PROCEED TO CHECKOUT</a>
					</div>
				</div>
			</div>
			<%} %>
		</div>

		<% }else{ %>
		
		please Login first
		<%-- <%@ include file="error.jsp" %> --%>
		<%} %>

	</section>
	<!-- Shoping Cart Section End -->

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