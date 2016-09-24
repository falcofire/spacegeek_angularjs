package com.spacegeek.feeds;

import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class JsonWriter extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public JsonWriter() {
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@RequestMapping(value="/writeJson", method=RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		JSONObject obj = new JSONObject();
		obj.put("data", request.getParameter("data"));
		
		try (FileWriter file = new FileWriter("C:\\Users\\Scholar\\git\\spacegeek_angularjs\\WebContent\\feeds\\file1.JSON")) {
			file.write(obj.toJSONString());
			System.out.println("Successfully Copied JSON Object to File...");
			System.out.println("\nJSON Object: " + obj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
