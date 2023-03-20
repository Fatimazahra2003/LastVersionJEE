package cn.ShoppingCart.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ShoppingCart.connection.DbCon;
import cn.ShoppingCart.dao.ProductDao;
import cn.ShoppingCart.model.Product;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/detail-product")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id=(String) request.getParameter("id");
//		System.out.print(id);
		try {
			ProductDao pd=new ProductDao(DbCon.getConnection());
			Product p=pd.getSingleProduct(Integer.parseInt(id));
			
			request.setAttribute("p", p);
			System.out.print(p.toString());
			
			request.getRequestDispatcher("/details.jsp").forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
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
