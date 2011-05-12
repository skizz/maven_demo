package com.tw;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class CTest 
    extends TestCase
{
    public void testApp()
    {
        assertEquals( "A' and B", new C().message() );
    }
}
