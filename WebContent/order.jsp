<!DOCTYPE html>
<%@page import="com.entities.Checkout"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


</head>

<body>

	<%
		LocalDateTime now = LocalDateTime.now();
	System.out.println("Before Formatting: " + now);
	DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	String formatDateTime = now.format(format);
	%>
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
	<section class="breadcrumb-section set-bg" data-setbg="img/contact.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Order</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>order</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">

			<div class="checkout__form">

				<form action="Order" method="post" id="someFormId">
					<div class="row">


						<%
							Userdao udao = new Userdao();
						 List<Cart>  list =  udao.viewCart(user.getId());
						%>

						<div class="col-lg-4 col-md-6">

							<div class="checkout__order">


								<h4>Your Order</h4>

									<div class="checkout__order__products">
										Products <span>Total</span>
									</div>
	
									<%
										for(Cart c:list){
									%>
									<input type="hidden" name="uid" 	value="<%=c.getUser().getId()%>"> 
										<input type="hidden" name="pid" value="<%=c.getProduct().getId()%>">
										 <input type="hidden" name="qty" value="<%=c.getQty()%>"> 
										<input type="hidden" name="amount" value="<%=c.getTotal()%>">
									<input type="hidden" name="status" value="1"> 
									<input type="hidden" name="date" value="<%=formatDateTime%>">
									<ul>
										<li><%=c.getPname()%><span>$<%=c.getPrice()%></span></li>
									</ul>
									<%
										}
									%>
	
									<%
										Userdao dao = new Userdao();
											            List<Cart> cartlist =  dao.viewCart(user.getId());
											            double subtotal =  dao.gettotalprice(cartlist);
											            request.setAttribute("subtotal", subtotal);
											            session.getAttribute("checkout");
									%>
	
									<input type="hidden" name="cid" value="${checkout.id}">
	
								<div class="checkout__order__subtotal">
									Subtotal <span>${subtotal}</span>
								</div>
								<div class="checkout__order__total">
									Total <span>${subtotal}</span>
								</div>




								<button id="rzp-button1" class="btn btn-outline-dark btn-lg">
									<i class="fas fa-money-bill"></i>Place order
								</button>


							</div>

						</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->





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

	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript">
		var options = {
			"key" : "rzp_test_BFuqGW7IZkVybQ", // Enter the Key ID generated from the Dashboard
			"amount" :
	<%=subtotal%>
		* 100,
			// Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
			"currency" : "INR",
			"name" : "Famms",
			"description" : "Test Transaction",
			"image" : "assets/images/demos/demo-10/shoe-logo.png",
			//"order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
			"handler" : function(response) {
				document.getElementById('someFormId').submit();
			},
			//"callback_url": "order.jsp",
			"prefill" : {
				"name" : "",
				"email" : "",
				"contact" : "+91 "
			},
			"notes" : {
				"address" : "Razorpay Corporate Office"
			},
			"theme" : {
				"color" : "#445f84;"
			}
		};
		var rzp1 = new Razorpay(options);
		rzp1.on('payment.failed', function(response) {
			alert(response.error.code);
			alert(response.error.description);
			alert(response.error.source);
			alert(response.error.step);
			alert(response.error.reason);
			alert(response.error.metadata.order_id);
			alert(response.error.metadata.payment_id);
		});
		document.getElementById('rzp-button1').onclick = function(e) {
			rzp1.open();
			e.preventDefault();
		}
	</script>

</body>

</html>