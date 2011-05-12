package com.tw;

/**
 * Hello world!
 */
public class App 
{
    public static void main( String[] args )
    {
    	
    	
    	String message = message();
		System.out.println( "Hello World from " + message );
    }

	private static String message() {
		return new C().message();
	}
}
