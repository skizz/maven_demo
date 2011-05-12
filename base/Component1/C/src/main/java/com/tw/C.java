package com.tw;

public class C {

	public String message() {
		A a = new A();    	
    	B b = new B();
        String message = a.message() + " and " + b.message();
		return message;
	}

}
