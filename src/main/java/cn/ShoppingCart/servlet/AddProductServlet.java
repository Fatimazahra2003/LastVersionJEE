package cn.ShoppingCart.servlet;

 

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cn.ShoppingCart.connection.DbCon;

 

/**
 * Servlet implementation class AddProductServlet
 */

@WebServlet("/AddProduct")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     Connection con;
	     PreparedStatement pst;
	     ResultSet rs;
	   
		String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("image");
      
        InputStream fileContent = filePart.getInputStream();
        String fileName = filePart.getSubmittedFileName();
	 try {
            con=DbCon.getConnection();
            String sql = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, category);
            pst.setDouble(3, price);
            pst.setString(4, fileName);
            pst.executeUpdate();
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        } catch (SQLException e) {
           PrintWriter out=response.getWriter();
           out.print( e.getMessage());
             
            
        } catch (ClassNotFoundException e) {
        	 PrintWriter out=response.getWriter();
             out.print( e.getMessage());
			e.printStackTrace();
			request.setAttribute("err", "ClassNotFoundException ");
			//this.getServletContext().getRequestDispatcher("/error.jsp").forward(request,response);
		}
	}

}
