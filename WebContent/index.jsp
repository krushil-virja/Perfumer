<%@page import="com.Userdao.Userdao"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>

<%@page import="com.admindao.Admindao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
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
    <%@ include file="Humberger.jsp"%>
        <!-- Humberger End --> 

    <!-- Header Section Begin -->
    <%@ include file="header.jsp"%>	
        <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <%@ include file="sidebar.jsp"%>
        <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="opacity:0.8;" data-setbg="img/categories/ittar.jpeg">
                            <h5><a href="#">Perfume</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/">
                            <h5><a href="#">Deo</a></h5>
                        </div>
                    </div> 
                    <div class="col-lg-3">
                        <div class="categories__item set-bg " style="opacity:0.8;" data-setbg="img/categories/perfume.jpg">
                            <h5><a href="#">Ittar</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
                            <h5><a href="#">Roll ON Deo</a></h5>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    
    <% Admindao adao = new Admindao();
    List<Product> list  =adao.showProduct();
    List<Category> clist=adao.showCategory();
    %>
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <%for(Category c:clist){ %>
                            <li data-filter=".<%=c.getCname()%>"><%=c.getCname()%></li>
                            <%} %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <%for(Product p : list){ %>
                <div class="col-lg-3 col-md-4 col-sm-6 mix <%=p.getCategory().getCname()%>">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg text-center" data-setbg="img/product/<%=p.getPimage1()%>">
                            <ul class="featured__item__pic__hover d-flex justify-content-center">
                            
                            
                            
                            
                            <form action="addToWishlist" class=" mx-2" method="post">
                                    
                                    <input type="hidden" name="pid" value="<%= p.getId()%>">
                                    
                                     <input type="hidden" name="price" value="<%= p.getPrice()%>">
                                     
                                     
                                    <%if(user!=null){ %>
                                    <input type="hidden" name="uid" value="<%=user.getId()%>">
                                      <button class=" bg-transparent border-0"><li><a href="wishList.jsp"><i class="fa fa-heart"></i></a></li></button>
                                      <%} else{ %>
                                      <li><a href="Login.jsp"><i class="fa fa-heart"></i></a></li>
                                        <%} %>
                                      </form>  
                               
                                
                                
                                
                                
                                
                                <li class="mx-1"><a href="ProductDetails.jsp?id=<%= p.getId()%>"><i class="fa fa-retweet"></i></a></li>
                                
                                
                                
                                  <form action="addToCart" class="mx-1" method="post">
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
                        <div class="featured__item__text">
                            <h6><a href="#"><%=p.getPname() %></a></h6>
                            <h5><%= p.getPrice() %></h5>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
        
        <nav aria-label="Page navigation example">
  <ul class="pagination text-center">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
        <%
        Userdao udao  = new Userdao();
        
       List<Product> plist = udao.showLatestProduct();
        %>
       
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                     <%for(Product p :plist){ %>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/product/<%=p.getPimage1() %>" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6><%= p.getPname() %></h6>
                                        <span><%= p.getPrice() %></span>
                                    </div>
                                </a>
                                
                            </div>
                        </div>
              <%} %>
                    </div>
                </div>
                
                  
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        
                      
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/product/ alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6></h6>
                                        <span></span>
                                    </div>
                                </a>
                                
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Review Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Crab Pool Security</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-3.jpg" alt="">
                        < /div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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