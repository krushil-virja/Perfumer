<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style >
@import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);
body {

    background-color: #eee;
    font-family: 'Calibri', sans-serif !important;
}

.mt-100{
   margin-top:100px;

}


.card {
    margin-bottom: 30px;
    border: 0;
    -webkit-transition: all .3s ease;
    transition: all .3s ease;
    letter-spacing: .5px;
    border-radius: 8px;
    -webkit-box-shadow: 1px 5px 24px 0 rgba(68,102,242,.05);
    box-shadow: 1px 5px 24px 0 rgba(68,102,242,.05);
}

.card .card-header {
    background-color: #fff;
    border-bottom: none;
    padding: 24px;
    border-bottom: 1px solid #f6f7fb;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
}

.card-header:first-child {
    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
}



.card .card-body {
    padding: 30px;
    background-color: transparent;
}

.btn-primary, .btn-primary.disabled, .btn-primary:disabled {
    background-color: #4466f2!important;
    border-color: #4466f2!important;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="container-fluid  mt-100">
				 <div class="row">
				 
				 
					<div class="col-md-12">
					
							<div class="card">
						<div class="card-header">
						
						</div>
						<div class="card-body cart">
								<div class="col-sm-12 empty-cart-cls text-center">
									<img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
									<h3><strong>Sorry</strong></h3>
									<h4>You have to login first :)</h4>
									<a href="Login.jsp" class="btn btn-primary cart-btn-transform m-3" data-abc="true">continue shopping</a>
									
								
								</div>
						</div>
				</div>
						
					
					</div>
				 
				 </div>
				
				</div>

</body>
</html>