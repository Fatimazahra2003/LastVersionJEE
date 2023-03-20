<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>Login</title>
  </head>
  <body>
  

  <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('<%= request.getContextPath()%>/assets/img/bg1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>Sign In</h3>
			</div>
            <form action="user-login" method="post">
              <div class="form-group first">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="login-email">

              </div>
              <div class="form-group last mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="login-password">
                
              </div>
              
              <div class="d-flex mb-3 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                
                
              </div>
              <div class="mb-3">Don't you have an account? <a href="register.jsp">Sign Up</a></div> 

              <input type="submit" value="Log In" class="btn btn-block btn-outline-primary">              
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