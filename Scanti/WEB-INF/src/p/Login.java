package p;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport {
	
	private String username, password;
	User user;
	
	public Login() {
		
	}
	
	public static Connection conn() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", "root");
	}
	
	public String processLogin() throws Exception {
		String result = "login";

		if (getUsername().length() == 0) {
			addFieldError("username", "Username is required");
		}

		if (getPassword().length() == 0) {
			addFieldError("password", getText("Password is required"));
		}

		else {
			try {
				//check database
				String sql = "SELECT * FROM user WHERE username = '"+username+"' AND password = '"+password+"'";
				PreparedStatement ps = conn().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					result = "tasks";
				}
				
				else {
					addFieldError("username", getText("User does not exist in database"));
				}

				ps.close();

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
