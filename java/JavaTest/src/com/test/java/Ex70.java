package com.test.java;

import com.github.lalyos.jfiglet.FigletFont;

public class Ex70 {

	public static void main(String[] args) {
		
		try {
			
			String asciiArt1 = FigletFont.convertOneLine("Abc");
			System.out.println(asciiArt1);
		
		    String asciiArt2 = FigletFont.convertOneLine(FigletFont.class.getResourceAsStream(".\\flf\\big.flf"), "hello");
		    System.out.println(asciiArt2);
			 
		} catch (Exception e) {
			System.out.println("Ex70.main");
			e.printStackTrace();
		}
		
		
		
	}
	
}
