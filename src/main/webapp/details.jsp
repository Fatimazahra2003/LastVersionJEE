<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "cn.ShoppingCart.connection.DbCon" %>
<%@page import ="java.util.*"%>
<%@ page import = "cn.ShoppingCart.dao.ProductDao" %>
<%@page import="cn.ShoppingCart.model.*"%>
    <%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
Product p=(Product)request.getAttribute("p");

%>

<!DOCTYPE html>
<html>
<head>
	<title>Product Details</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="includes/head.jsp" %>
	<!-- Bootstrap 5 CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
<style>
section{
    margin-top: 50px;
    padding-top:30px;
    padding-bottom:30px;
    box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
    margin-left: 50px;
    margin-right: 50px;
}
    }
    

</style>
</head>
<body>
	<!-- Add header and navigation bar -->
		<%@include file="includes/navbar.jsp" %>
	<main >
	
		<section class="product-section">
			<div class="container">
				<div class="row" >
					<div class="col-lg-4">
						<!-- Add product image here -->
						<img src="product-image/<%=p.getImage()%>" class="img-fluid">
					</div>
					<div class="col-lg-8">
						<h1><%=p.getName()%></h1>
						<p><%=p.getCategory()%></p>
						<p>Product Price: $xx.xx</p>
						<h5>Résumé</h5>
						<p>
						Quae dum ita struuntur, indicatum est apud 
						Tyrum indumentum regale textum occulte,
						 incertum quo locante vel cuius usibus
						  apparatum. ideoque rector provinciae tunc
						   pater Apollinaris eiusdem nominis ut 
						   conscius ductus est aliique congregati 
						   sunt ex diversis civitatibus multi, qui 
						   atrocium criminum ponderibus urgebantur.
						</p>
						<!-- Add product features and specifications here -->
						<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-primary">Add to Cart</a>
						<a href="order-now?quantity=1&id=<%=p.getId() %>" class="btn btn-dark">Buy Now</a>
					</div>
				</div>
			</div>
		</section>
		<%@include file="includes/footer.jsp" %>
		
	</main>
	
	<!-- Add footer and other necessary scripts -->
	<!-- Bootstrap 5 JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>