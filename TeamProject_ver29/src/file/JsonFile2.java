package file;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonFile2 {

	public JSONObject readJsonFile(String url) {
		
		JSONParser parser = new JSONParser();
		
		try {
			return (JSONObject) parser.parse(new FileReader(url)); 
			
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void writeJsonFile(String url, String datas) {
		
		try {
			FileWriter out = new FileWriter(url);
			out.write(datas);
			out.flush();
			out.close();
			System.out.println("저장");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
