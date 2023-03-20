package cn.ShoppingCart.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
//        	System.out.print("inside connection");
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3304/ecommerce_cart","root","Fatimazahra123");
            System.out.print("connected");
        }
        return connection;
    }
}