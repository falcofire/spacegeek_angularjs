package com.spacegeek.feeds;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class JsonWriter extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public JsonWriter() {
		
	}
	@Override
	@RequestMapping(value="/writeJson", method=RequestMethod.GET)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		Scanner scanner = new Scanner(new File("C:\\Users\\Scholar\\git\\spacegeek_angularjs\\WebContent\\feeds\\" + name + ".JSON"));
		StringBuilder sB = new StringBuilder();
		while (scanner.hasNextLine()) {
			sB.append(scanner.nextLine());
		}
		System.out.println("Retrieved " + name + " file.");
		scanner.close();
		response.getWriter().write(sB.toString());
	}
	
	@Override
	@RequestMapping(value="/writeJson", method=RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String body = null;
	    StringBuilder stringBuilder = new StringBuilder();
	    BufferedReader bufferedReader = null;
	    try {
	    	bufferedReader = request.getReader();
	        if (bufferedReader != null) {
	            char[] charBuffer = new char[128];
	            int bytesRead = -1;
	            while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                stringBuilder.append(charBuffer, 0, bytesRead);
	            }
	        } else {
	            stringBuilder.append("");
	        }
	    } catch (IOException ex) {
	        throw ex;
	    } finally {
	        if (bufferedReader != null) {
	            try {
	                bufferedReader.close();
	            } catch (IOException ex) {
	                throw ex;
	            }
	        }
	    }

	    body = stringBuilder.toString();
	    int end = body.indexOf("data") - 3;
		String name = body.substring(9,end);  
		body = body.replace("’", "'");
		try (FileWriter file = new FileWriter("C:\\Users\\Scholar\\git\\spacegeek_angularjs\\WebContent\\feeds\\" + name + ".JSON")) {
			file.write(body);
			file.close();
			System.out.println("Successfully retreived " + name + " feed from Facebook...");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
