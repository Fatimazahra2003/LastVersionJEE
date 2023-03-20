<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import = "cn.ShoppingCart.connection.DbCon" %>
<%@page import ="java.util.*"%>
<%@ page import = "cn.ShoppingCart.dao.*" %>
<%@page import="cn.ShoppingCart.model.*"%> 

<%@ page import = "cn.ShoppingCart.dao.ProductDao" %> 
<%@page import="java.sql.*"%>

 
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd= new ProductDao(DbCon.getConnection());
List<Product> products=pd.getAllProducts();

ArrayList<Cart> cart_list= (ArrayList<Cart> )session.getAttribute("cart-list");
if(cart_list !=null){
	request.setAttribute("cart_list",cart_list);
}
%>
 
<%
// int NProduit=0, NOrder=0, NUser=0;
// String chart="";

// Connection conn = null;
// try {
// 	conn = new DbCon().getConnection();
// } catch (ClassNotFoundException | SQLException e1) {
// 	// TODO Auto-generated catch block
// 	e1.printStackTrace();
// }
// ProductDao p = new ProductDao(conn);

// try {
// 	chart = p.getchart();
// } catch (SQLException e) {
// 	// TODO Auto-generated catch block
// 	e.printStackTrace();
// }
// NProduit = p.getTotalNumberOfProducts();
// try {
// 	NUser = new UserDao(conn).getTotalUsers();
// 	NOrder = new OrderDao(conn).getTotalOrders();
// } catch (ClassNotFoundException | SQLException e) {
// 	// TODO Auto-generated catch block
// 	e.printStackTrace();
// }

    
int NProduit = Integer.valueOf(request.getAttribute("NProduit").toString());
int NUser = Integer.valueOf(request.getAttribute("NUser").toString());
int NOrder = Integer.valueOf(request.getAttribute("NOrder").toString());
String chart = request.getAttribute("chart").toString();


 

%>
  <!DOCTYPE html>  
 <html lang="en">  
 <head> 
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
     <script type="text/javascript">  
    google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawVisualization);

 function drawVisualization() {
       // Some raw data (not necessarily accurate)
        var ddata = <%=chart%>  

     let optio = {
         title : 'Monthly Categories Cells',
         vAxis: {title: 'Categories'},
         hAxis: {title: 'Month'},
         seriesType: 'bars',
        series: {5: {type: 'line'}}
      };

       var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
      chart.draw(ddata, optio);
    }
  </script>  
</head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<title>DashBoard</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<!-- Material Icons -->
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
	rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="./assets/css/material-dashboard.css?v=3.0.0"
	rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-200">
	 <%@include file="includes/navbar.jsp" %>
	 
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<!-- Navbar -->
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" navbar-scroll="true">
			<div class="container-fluid py-1 px-3">
			
				 
					<button type="button" class="btn btn-warning btn-rounded">
					<a class="nav-link text-white "
					href="ListProduct.jsp">All Products</a></button>
					
							 
			</div>
		</nav> 
		
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">shopping_cart</i>
							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">Products</p>
								<h4 class="mb-0"><%=NProduit%></h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								 
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">person</i>
							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">Users</p>
								<h4 class="mb-0"><%=NUser%></h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								 
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">format_list_numbered</i>

							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">Orders</p>
								<h4 class="mb-0"><%=NOrder%></h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								 
						 	</p>
						</div>
					</div>
				</div>

				<div class="row mt-lg-4 d-flex justify-content-center">
					<div class="col-11  mt-4 mb-3">
						<div class="card z-index-2 ">
							<div
								class="card-header p-0 position-relative mt-n4 mx-3 z-index-1 bg-transparent">
								<div>
                               					    <div class="card p-3 text-right">
						    <blockquote class="blockquote mb-0">
						     <div id="chart_div" style=" height: 280px;"></div>
						    </blockquote>
						     </div>
     							</div>
							</div>
							<div class="card-body">
							
								<hr class="dark horizontal">
								 
							</div>
						</div>
					</div>
				</div>
			</div>
			                 
			 
			 
		</div>
	</main>
 
 
 
</body>

</html>