package com.example.ecom;

import java.util.logging.*;

public class LoggerClass {
	
	//NOTE: This class is the main logger class for the application
	
	private Logger _mLogger;
	
	public LoggerClass()
	{
		_mLogger = Logger.getLogger(LoggerClass.class.getName());
	}
	
	public final Logger GetLoggerObject()
	{
		return this._mLogger;
	}
	
	

}
