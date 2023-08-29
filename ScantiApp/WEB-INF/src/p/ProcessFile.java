package p;

import java.io.*;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;
import java.util.stream.*;


import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;


public class ProcessFile extends ActionSupport {

	private File fileUpload;
	private String fileUploadFileName;
	private String fileUploadContentType;
	private String localDirectory = "C:\\temp";
	private String result;
	
	

	public String execute() throws Exception {
		
		if (fileUpload == null || fileUpload.length() == 0) {
			System.out.println("File is still null");
			result = "input";
		}
		
		else {

			File localFile = new File(localDirectory, fileUploadFileName);
			FileUtils.copyFile(fileUpload, localFile);


			try (BufferedReader br = new BufferedReader(new FileReader(localFile)))
			{

				String line;
				while ((line = br.readLine()) != null && !line.equals("") && line.matches(".*[,].*[,].*[,].*")) {
					//process the line.
					String tmp[]=line.split(",");
					String CardNo = tmp[0];
					String Date = tmp[1];
					String Description = tmp[2];
					String DateOfCompletion = tmp[3];
					String Withdrawal = tmp[4];
					String Deposit = tmp[5];
					String Balance = tmp[6];

					String sql = "INSERT into transactions (CardNumber, Date, Description, DateOfCompletion, Withdrawal, Deposit, Balance) VALUES (?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement addTransaction = conn().prepareStatement(sql);
					addTransaction.setString(1, CardNo);
					addTransaction.setString(2, Date);
					addTransaction.setString(3, Description);
					addTransaction.setString(4, DateOfCompletion);
					addTransaction.setString(5, Withdrawal);
					addTransaction.setString(6, Deposit);
					addTransaction.setString(7, Balance);
					int rowsUpdated = addTransaction.executeUpdate();
				}

				//Table 1. For suspicious cards with multiple transactions to the same address
				String check_sql = "INSERT into frequent_desc (CardNumber, Description, Count) SELECT DISTINCT CardNumber, Description, COUNT(*) as Count FROM transactions GROUP BY CardNumber, Description HAVING COUNT(*)>1";
				PreparedStatement ps1 = conn().prepareStatement(check_sql);
				ps1.executeUpdate();

				//Table 2. For suspicious cards with similar deposited amounts
				String check_sql2 = "INSERT into frequent_deposit (CardNumber, Deposit, Count) SELECT DISTINCT CardNumber, Deposit, COUNT(*) as Count FROM transactions GROUP BY CardNumber, Deposit HAVING COUNT(*)>1";
				PreparedStatement ps2 = conn().prepareStatement(check_sql2);
				ps2.executeUpdate();

				//Table 3. For suspicious cards with similar withdrawn amounts
				String check_sql3 = "INSERT into frequent_withdraw (CardNumber, Withdrawal, Count) SELECT DISTINCT CardNumber, Withdrawal, COUNT(*) as Count FROM transactions GROUP BY CardNumber, Withdrawal HAVING COUNT(*)>1";
				PreparedStatement ps3 = conn().prepareStatement(check_sql3);
				ps3.executeUpdate();

				//Table 4. For suspicious cards with same start date transactions
				String check_sql4 = "INSERT into same_date (CardNumber, Date, Count) SELECT DISTINCT CardNumber, Date, COUNT(*) as Count FROM transactions GROUP BY CardNumber, Date HAVING COUNT(*)>1";
				PreparedStatement ps4 = conn().prepareStatement(check_sql4);
				ps4.executeUpdate();

				//Table 5. For suspicious cards with some of the factors above
				String check_sql5 = "INSERT into flagged_cards (CardNumber) SELECT DISTINCT frequent_desc.CardNumber as CardNumber FROM frequent_desc INNER JOIN frequent_deposit ON frequent_desc.CardNumber = frequent_deposit.CardNumber INNER JOIN frequent_withdraw ON frequent_desc.CardNumber = frequent_withdraw.CardNumber INNER JOIN same_date ON frequent_desc.CardNumber = same_date.CardNumber";
				PreparedStatement ps5 = conn().prepareStatement(check_sql5);
				ps5.executeUpdate();
				
			}

			catch (Exception e) 
			{
				e.printStackTrace();
			} 

			result = "success";
			FileUtils.getFile(localFile).delete();
		}
		return result;

	}
	
	public String getLocalDirectory() {
		return localDirectory;
	}

	public void setLocalDirectory(String localDirectory) {
		this.localDirectory = localDirectory;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}
	
	public static Connection conn() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", "root");
	}

	/* Used to obtain a file listing for JSP display. */
	public Set<String> getFileList() {
		return Stream.of(new File(localDirectory).listFiles())
				.filter(file -> !file.isDirectory())
				.map(File::getName)
				.collect(Collectors.toSet());
	}
}