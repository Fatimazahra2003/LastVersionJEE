<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ page import = "cn.ShoppingCart.connection.DbCon" %>
<%@page import ="java.util.*"%>
<%@ page import = "cn.ShoppingCart.dao.ProductDao" %>
<%@page import="cn.ShoppingCart.model.*"%>
 
   
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
		request.setAttribute("person", auth);
		if(!auth.isAdmin()){
			response.sendRedirect("index.jsp");
		}
}else{
	response.sendRedirect("login.jsp");
}
ProductDao pd= new ProductDao(DbCon.getConnection());
List<Product> products=pd.getAllProducts();

%>
 
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">

</head>
<body >


<%-- <%@include file="includes/navbar.jsp" %> --%>
<div class="container-fluid py-1 px-3">
			
				 
					<button type="button" class="btn btn-warning btn-rounded">
					<a class="nav-link text-white "
					href="disp">DashBoard</a></button>
					
							 
</div>
    <div  bgcolor="#7b809a" class="container">
<div style="text-align:center;">
  <h1  style=" color: black;">Product List</h1>
</div>
<div></div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                     
            </thead>
            <tbody>
            <%
if(!products.isEmpty()){
	for(Product p:products){%>
		 
		   <tr>
                        <td><%=p.getId() %></td>
                        <td><%=p.getName() %></td>
                        <td><%=p.getCategory() %></td>
                        <td><%=p.getPrice() %></td>
                        <td><img src="product-image/<%=p.getImage()%>" width="50px" height="50px"></td>
                        <td>
                            <form action="UpdateProduct" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%=p.getId() %>">
                                <button type="submit" class="btn btn-primary">Edit</button>
                            </form>
                            <form action="del" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%=p.getId() %>">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
		
	<% }
	
}

%>
             
                
            </tbody>
        </table>
        <a href="AddProductForm.jsp" class="btn btn-success">Add Product</a>
    </div>
</body>
</html>
