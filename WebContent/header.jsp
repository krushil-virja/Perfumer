
<%@page import="com.entities.User"%>
<% User user = (User) session.getAttribute("u"); %>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> krushilvirja@gmail.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img/language.png" alt="">
                                <div>India</div>
                               <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Hindi</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                          <% if(user==null){ %>
                            <div class="header__top__right__auth">
                                <a href="Login.jsp"><i class="fa fa-user"></i> Login</a>
                            </div>
                          <%} else{ %>   
                           <div class="header__top__right__auth">
                                <a href="logout.jsp"><i class="fa fa-user"></i> logout</a>
                            </div>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.jsp"><img class=" " src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.jsp">Home</a></li>
                            <li><a href="./shop-grid.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                   
                                    <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                                     <li><a href="./wishList.jsp">Wishlist</a></li>
                                    <li><a href="./checkout.jsp">Check Out</a></li>
                                     <li><a href="./yourOrder.jsp">Your Order</a></li>
                                     
                                  
                                </ul>
                            </li>
                            <li><a href="./blog.jsp">Blog</a></li>
                            <li><a href="./contact.jsp">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                       
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
