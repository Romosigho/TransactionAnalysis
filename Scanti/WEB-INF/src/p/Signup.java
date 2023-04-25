package p;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

public class Signup extends ActionSupport {
	
	private String username, password;
	User user;
	
	public Signup() {
		
	}
	
	public static Connection conn() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", "root");
	}
	
	public String processSignup() throws Exception {
		String result = "signup";
		
		if (getUsername().length() == 0) {
			addFieldError("username", "Username is required");
        }
		
		if (getPassword().length() == 0) {
            addFieldError("password", getText("Password is required"));
        }
		
		else {

			try {

				//check database
				String sql = "INSERT into user (username, password) VALUES (?, ?)";
				PreparedStatement createUser = conn().prepareStatement(sql);
				createUser.setString(1, username);
				createUser.setString(2, password);
				int rowsUpdated = createUser.executeUpdate();
				result = "login";

				createUser.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}			
		return result;	
		
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}
}
