package com.tw;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class BTest 
    extends TestCase
{
    public void testMessage()
    {    	
		assertEquals( "B", new B().message() );
    }
}
