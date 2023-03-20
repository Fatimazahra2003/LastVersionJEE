<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import ="java.util.*"%>
    
 <%@page import="cn.ShoppingCart.model.*"%>
    
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list= (ArrayList<Cart> )session.getAttribute("cart-list");
    if(cart_list !=null){
    	request.setAttribute("cart_list",cart_list);
    } %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/fonts/icomoon/style.css">

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/style.css">

    <title>Sign Up</title>
  </head>
  <body>
  

  <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('<%= request.getContextPath()%>/assets/img/bg1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>Sign Up</h3>
			</div>
            <form action="register-user" method="post">
              <div class="form-group first">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name">

              </div>
              <div class="form-group first">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email">

              </div>
              <div class="form-group first">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address">

              </div>
              <div class="form-group first">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone">

              </div>
              <div class="form-group last mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
                
              </div>
              <input type="submit" value="Sign up" class="btn btn-block btn-outline-primary">

              
            </form>
          </div>
        </div>
      </div>
    </div>

    
  </div>
    
    

    <script src="<%= request.getContextPath()%>/assets/js/jquery-3.3.1.min.js"></script>
    <script src="<%= request.getContextPath()%>/assets/js/popper.min.js"></script>
    <script src="<%= request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath()%>/assets/js/main.js"></script>
  </body>
</html>


































