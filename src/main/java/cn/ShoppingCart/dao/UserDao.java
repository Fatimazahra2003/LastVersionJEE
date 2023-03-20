package cn.ShoppingCart.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import cn.ShoppingCart.connection.DbCon;
import cn.ShoppingCart.model.*;
import cn.ShoppingCart.model.User;

import java.sql.*;

import cn.ShoppingCart.connection.DbCon;
import cn.ShoppingCart.model.PasswordEncrypter;
import cn.ShoppingCart.model.User;


public class UserDao {
	private Connection con =null;

	private String query;
    private PreparedStatement pst;
    

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=? ";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
//            pst.setString(2, password);
             ResultSet rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            	user.setAdresse(rs.getString("adresse"));
            	user.setRole(rs.getString("role"));
            	user.setPhone(rs.getString("telephone"));
            	
            	boolean check=PasswordEncrypter.checkPassword(password, rs.getString("password"));
            	if(check) {
            	user.setPassword(rs.getString("password"));
            	}
            	else {
            		System.out.print("Errooor on password");
            		user=null;
            	}
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
	
	public boolean addUser(User user) {
        boolean success = false;
        
        String hashedPassword=PasswordEncrypter.encrypt(user.getPassword());
        
        try {
            String sql = "INSERT INTO users (name, email,password, adresse, telephone, role) VALUES ( ? , ? , ? , ? , ? , ? )";
            pst = con.prepareStatement(sql);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, hashedPassword);
            pst.setString(4, user.getAdresse());
            pst.setString(5, user.getPhone());
            pst.setString(6, user.getRole());
            
//            System.out.print("add User : "+user.toString());
            
            int rows = pst.executeUpdate();
            
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                	pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }


public int getTotalUsers() throws SQLException, ClassNotFoundException {
	
    int total = 0;
    PreparedStatement stmt = null;
    ResultSet rs = null;

        stmt = con.prepareStatement("SELECT COUNT(*) as total_users FROM users");
        rs = stmt.executeQuery();

        if (rs.next()) {
            total = rs.getInt("total_users");
        }
    

    return total;

}

public User getUser(String n) {
	User user=null;
	
	
	
	try {
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery("select * from users");
		
		while(rs.next()) {
			user=new User(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return user;
}

	





	
	
	
	
}
