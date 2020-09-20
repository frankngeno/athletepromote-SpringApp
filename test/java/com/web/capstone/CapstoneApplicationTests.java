package com.web.capstone;

import static java.time.Duration.ofMinutes;
import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.athletepromote.model.Addressess;


public class CapstoneApplicationTests {

	public final Logger log = LoggerFactory.getLogger(CapstoneApplicationTests.class);
	
	private final Addressess addressess = new Addressess("311 West Doersey", "Memphis","TN", "38119", "USA");
	
	@BeforeEach
	void init() {
	    log.info("@BeforeEach --- executes before each test method in this class---");
	}
	
	@Test
	public void testMath(){
    log.info("{}", quotient(10, 100));
    //Verify succeed
     assertEquals(quotient(10, 100), 10);
    }

	@Test
	public void calculator() {
		  assertEquals(16, mutliply(4,4));
		  assertEquals(20, sum(10,10));		 
	}
	
	@Test
    void abortedTest() {
        assumeTrue("abc".contains("c"));
        //fail("test should have been aborted");
    }
	
	@Test
	void timeoutNotExceededWithMethod() {
	        // The following assertion invokes a method reference and returns an object.
	        String actualGreeting = assertTimeout(ofMinutes(2), CapstoneApplicationTests::greeting);
	        assertEquals("Hello, World!", actualGreeting);
	}
	
	 private static String greeting() {
	        return "Hello, World!";
	 }
	 
	 @Test
	 void groupedAssertions() {
	        // In a grouped assertion all assertions are executed, and all
	        // failures will be reported together.
	        assertAll("addresses",
	            () -> assertEquals("311 West Doersey", addressess.getStreet()),
	            () -> assertEquals("Memphis", addressess.getCity()),
	            () -> assertEquals("TN", addressess.getState()),
	            () -> assertEquals("38119", addressess.getZip()),
	            () -> assertEquals("USA", addressess.getCountry()),
	            () -> assertTrue(addressess.getState().startsWith("T")),
	            () -> assertTrue(addressess.getCity().endsWith("s")),
	            () -> assertTrue(addressess.getCountry().endsWith("C")));
	 }
	 
	@Test
    void failingTest() {
        fail("a failing test");
    }
	
	int quotient(int a, int b){
		return b/a;	
	}
	
	int mutliply(int a, int b){
		return b*a;		
	}
	
	int sum(int a, int b){
		return b+ a;		
	}
	
}