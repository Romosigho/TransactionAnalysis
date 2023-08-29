package p;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.opensymphony.xwork2.ActionSupport;

import de.taimos.totp.TOTP;

public class TwoFA extends ActionSupport {
	
	private String authenticator1;
	private static String hash = "COVE2OEFS2EKSX42SEWU7AVK6MNB6VFD";
	
	public static String useQR() {
		String encoded = hash;
		String username = "A.User";
		String companyName = "Scanti";
		String barCodeUrl = getGoogleAuthenticatorBarCode(encoded, username, companyName);
		return barCodeUrl;
	}
	
	public static String getTOTPCode(String key) {
		Base32 base32 = new Base32();
	    byte[] bytes = base32.decode(key);
	    String hexKey = Hex.encodeHexString(bytes);
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println(formatter.format(date));
	    System.out.println(TOTP.getOTP(hexKey));
	    return TOTP.getOTP(hexKey);
	}
	
	public static String getGoogleAuthenticatorBarCode(String secretKey, String account, String issuer) {
		secretKey = hash; 
		try {
	        return "otpauth://totp/"
	                + URLEncoder.encode(issuer + ":" + account, "UTF-8").replace("+", "%20")
	                + "?secret=" + URLEncoder.encode(secretKey, "UTF-8").replace("+", "%20")
	                + "&issuer=" + URLEncoder.encode(issuer, "UTF-8").replace("+", "%20");
	    } catch (UnsupportedEncodingException e) {
	        throw new IllegalStateException(e);
	    }
	}
	
	/*
	 * public static void createQRCode(String barCodeData) throws WriterException,
	 * IOException { String filePath =
	 * "C:\\Program Files\\apache-tomcat-9.0.68\\webapps\\Scanti\\test.png"; int
	 * height = 200; int width = 200; BitMatrix matrix = new
	 * MultiFormatWriter().encode(barCodeData, BarcodeFormat.QR_CODE, width,
	 * height); try (FileOutputStream out = new FileOutputStream(filePath)) {
	 * MatrixToImageWriter.writeToStream(matrix, "png", out); } }
	 */
	
	public static void infinityGeneratingCodes() {
		String code = getTOTPCode(hash);
		String lastCode = null;
		while (true) {
			if (!code.equals(lastCode)) {
				System.out.println(code);
			}
			lastCode = code;
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {};
		}
	}
	
	public String processAuth() throws Exception {
		String result = "error";
	    
		if (getAuthenticator1().length() == 0) {
			addFieldError("authenticator", "Code cannot be empty");
		}

		else {
				if (authenticator1.equals(getTOTPCode(hash))) {
					result = "tasks";
				}
				
				else {
					result = "error";
				}
		}
		
		return result;
		}
	
	public String getAuthenticator1() {
		return authenticator1;
	}

	public void setAuthenticator1(String authenticator1) {
		this.authenticator1 = authenticator1;
	}

}
