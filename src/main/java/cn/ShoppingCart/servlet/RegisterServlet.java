package cn.ShoppingCart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ShoppingCart.connection.DbCon;
import cn.ShoppingCart.dao.UserDao;
import cn.ShoppingCart.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register-user")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html");
		
		try(PrintWriter out =response.getWriter()){
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String adresse=request.getParameter("address");
			String phone=request.getParameter("phone");
			String password=request.getParameter("password");
			
			
			User u=new User(name,email,adresse,phone,password,"user");
//			
			UserDao ud=new UserDao(DbCon.getConnection());
			boolean r=ud.addUser(u);
			
			if(r) {response.sendRedirect("login.jsp");}
			else {
				out.println("User Registrartion Failed");
			}
//			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
