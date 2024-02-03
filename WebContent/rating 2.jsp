<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.star-rating {
  display: inline-block;
}

input[type="radio"] {
  display: none;
}

label {
  font-size: 30px;
  color: gray;
  cursor: pointer;
}

label:before {
  content: "★";
}

input[type="radio"]:checked ~ label {
  color: gold;
}

</style>
</head>
<body>


<div class="star-rating">

 <input type="radio" id="star5" name="rating" value="5" />
  <label for="star5"></label>
  <input type="radio" id="star4" name="rating" value="4" />
  <label for="star4"></label>
   <input type="radio" id="star3" name="rating" value="3" />
  <label for="star3"></label>
  <input type="radio" id="star2" name="rating" value="2" />
  <label for="star2"></label>
  <input type="radio" id="star1" name="rating" value="1" />
  <label for="star1"></label>
  
 
  
 
</div>
</body>
</html>