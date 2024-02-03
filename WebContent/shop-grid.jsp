<!DOCTYPE html>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.admindao.Admindao"%>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>shope.jsp</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
    <%@ include file="Humberger.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
   <%@ include file="header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
     <%@ include file="sidebar.jsp" %>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/contact.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shope Now</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
               
                <div class="col-lg-12 col-md-7 mx-auto">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Sale Off</h2>
                        </div>
                        <div class="row">
                        
                      
                        
                        
                            <div class="product__discount__slider owl-carousel">
                                
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="img/product/discount/pd-5.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                              
                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">All</option>
                                        <option value="0">Perfume</option>
                                        <option value="0">Deodorant</option>
                                        <option value="0">ittar</option>
                                        <option value="0">Roll-on-Deodeorant</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                      <% Admindao adao = new Admindao();      		
               List<Product> list = adao.showProduct();
            %>
            
              <%for(Product p : list){%>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="product__item">
                           
                                <div class="product__item__pic set-bg" data-setbg="img/product/<%= p.getPimage1()%>">
                                    <ul class="product__item__pic__hover  d-flex justify-content-center">
                                    
                                    <form action="" method="post" class="mx-2">
                                    
                                    <input type="hidden" name="pid" value="<%= p.getId()%>">
                                    <input type="hidden" name="pimge1" value="<%= p.getPimage1()%>">
                                     <input type="hidden" name="pname" value="<%= p.getPname()%>">
                                     <input type="hidden" name="price" value="<%= p.getPrice()%>">
                                     
                                     
                                    <%if(user!=null){ %>
                                    <input type="hidden" name="uid" value="<%=user.getId()%>">
                                      <button class=" bg-transparent border-0"><li><a href="wishList.jsp"><i class="fa fa-heart"></i></a></li></button>
                                      <%} else{ %>
                                      <li><a href="Login.jsp"><i class="fa fa-heart"></i></a></li>
                                        <%} %>
                                      </form>  
                                        
                                        
                                        
                                        
                                        <li class="mx-1"><a href="ProductDetails.jsp"><i class="fa fa-retweet"></i></a></li>
                                        
                                        
                                       <form action="addToCart" method="post" class="mx-1">
                                <input type="hidden" name="pid" value="<%= p.getId()%>" >
                                <input type="hidden" name="pname" value="<%= p.getPname() %>">
                                <input type="hidden" name="qty" value="1">
                                <input type="hidden" name="price" value="<%= p.getPrice()%>">
                                
                                <% if(user!= null){ %>
                                <input type="hidden" value="<%= user.getId()%>" name="id">
                              <button class=" bg-transparent border-0"><li><a href=""><i class="fa fa-shopping-cart"></i></a></li>  </button>
                                <% } else{ %>
                                <li><a href="Login.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                                 <%} %>
                                 
                                 
                                </form>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#"><%= p.getPname() %></a></h6>
                                     <h5><%= p.getPbrand()%></h5>
                                    <h5><%= p.getPrice()%></h5>
                                </div>
                                
                            </div>
                           
                        </div>
                         <%} %>
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
   <%@ include file="footer.jsp" %>
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