package cn.ShoppingCart.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ShoppingCart.connection.DbCon;
import cn.ShoppingCart.dao.OrderDao;
import cn.ShoppingCart.model.*;
import cn.ShoppingCart.model.User;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckOutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try(PrintWriter out=response.getWriter()){
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
//			
			Date date=new Date();
//			out.print("check out servlet");
			
		//retrive all cart products                                            
			ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			//l'authentification
			User auth=(User)request.getSession().getAttribute("auth");

			if(cart_list !=null && auth !=null) {
				
				for(Cart c: cart_list) {
					Order o=new Order(); 
					o.setId(c.getId());
					o.setUid(auth.getId());
					o.setQuantity(c.getQuantity());
					o.setDate(formatter.format(date));
					
					
					OrderDao oD=new OrderDao(DbCon.getConnection());
					boolean result=oD.insertOrder(o);
					
					if(!result)break;
				  	
				}
				//vider la liste du cartes
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
			}else {
				
				if(auth==null) response.sendRedirect("login.jsp");
				response.sendRedirect("cart.jsp");
					
			}
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
