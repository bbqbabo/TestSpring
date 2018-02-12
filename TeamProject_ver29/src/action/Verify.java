package action;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import controller.CommandAction;

public class Verify implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
	 
        try {
            URL verifyUrl = new URL(SITE_VERIFY_URL);
 
            // Open a Connection to URL above.
            HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();
 
            // Add the Header informations to the Request to prepare send to the server.
            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
 
            // Data will be sent to the server.
            String postParams = "secret=6LdQ7kMUAAAAALQcHCmK6R5QtxJNQoReqxrCIL4r"
                    + "&response=" + request.getParameter("response");
 
            // Send Request
            conn.setDoOutput(true);
 
            // Get the output stream of Connection.
            // Write data in this stream, which means to send data to Server.
            OutputStream outStream = conn.getOutputStream();
            outStream.write(postParams.getBytes());
 
            outStream.flush();
            outStream.close();
 
            // Response code return from Server.
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode=" + responseCode);
 
            // Get the Input Stream of Connection to read data sent from the Server.
            InputStream is = conn.getInputStream();
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(new InputStreamReader(is));
 
            // ==> {"success": true}
            System.out.println("Response: " + json.toJSONString());

            return json.get("success").toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }
}
