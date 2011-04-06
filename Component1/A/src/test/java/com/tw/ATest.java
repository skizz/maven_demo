package com.tw;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class ATest 
    extends TestCase
{
    public void testMessage()
    {    	
		assertEquals( "A'", new A().message() );
    }
}
