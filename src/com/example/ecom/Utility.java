/**
 * 
 */
package com.example.ecom;

import org.apache.commons.validator.routines.*;
/**
 * @author SV
 *
 */
public class Utility {

	public boolean isValidHostName(String pHostname)
	{
		UrlValidator urlValidator = new UrlValidator();
		return urlValidator.isValid(pHostname);
	}
	
	public boolean isValidEmail(String pEmail)
	{
		return false;
	}
	
}
