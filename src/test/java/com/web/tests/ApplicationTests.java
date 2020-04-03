package com.web.tests;

import static org.junit.Assert.assertEquals;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ApplicationTests {

	public final Logger log = LoggerFactory.getLogger(ApplicationTests.class);
	
	@Test
	public void testMath(){
    log.info("{}", quotient(10, 100));
    //Verify succeed
    Assert.assertEquals(quotient(10, 100), 10);
    }

	@Test
	public void calculator() {
		  assertEquals(16, mutliply(4,4));
		  assertEquals(20, sum(10,10));		 
	}
	
	int quotient(int a, int b){
		return b/a;	
	}
	
	int mutliply(int a, int b){
		return b*a;		
	}
	
	int sum(int a, int b){
		return b+a;		
	}
	
}