/**
 * 
 */
package com.example.ecom;

import java.sql.*;
import java.util.*;

import org.apache.log4j.Logger;


/**
 * @author: SV 
 * Purpose: Utilities for Database Access will be present here
 *
 */
public class DatabaseAccessor {
	
	private Connection _mConnection;
	private ResultSet _mResultSet;
	private Statement _mStatement;
	
	private Logger logger = Logger.getLogger("DatabaseAccessor");
			
	public DatabaseAccessor()
	{
		this._mConnection = null;
		this._mResultSet = null;
	}
	
	public ResultSet getResultSet()
	{
		return this._mResultSet;
	}
	
	public boolean tryDataBaseConnectWithCredentials(String pConnectionURL, String pUsername, String pPassword)
	{
		boolean DatabaseConnected = false;
		
		try
		{		
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			this._mConnection = DriverManager.getConnection(pConnectionURL, pUsername, pPassword);
			if(_mConnection.isClosed() == false)
			{
				logger.debug("Om Sai Ram");
				DatabaseConnected = true;
			}
			else
			{
				//TBD: logging: "Database Connectivity is Closed"				
			}
			
		}
		catch(Exception ex)
		{
			//TBD: logging the error message using the error class
			DatabaseConnected = false;
		}
			
		return DatabaseConnected;
	}

    public boolean tryDataBaseConnect(String pConnectionURL)
    {
    	boolean DatabaseConnected = false;
		
		try
		{		
			Class.forName("com.mysql.jdbc.Driver").newInstance();			
			this._mConnection = DriverManager.getConnection(pConnectionURL);
			if(_mConnection.isClosed() == false)
			{
				//TBD: logging: "Connected to Database"
				DatabaseConnected = true;
			}
			else
			{
				//TBD: logging: "Database Connectivity is Closed"				
			}
			
		}
		catch(Exception ex)
		{
			//TBD: logging the error message using the error class
			DatabaseConnected = false;
		}
			
		return DatabaseConnected;
    }

    public void fireInsertQuery(String pInsertQuery)
    {
    	return;
    }

    public boolean closeConnection() 
    {
    	boolean closeStatus = false;
    	
    	try
    	{
    	
	    	if(this._mConnection.isClosed() == false)
	    	{
	    		this._mStatement.close();
	    		this._mResultSet.close();
	    		this._mConnection.close();
	    		
	    		closeStatus = true;
	    	}
    	
    	}
    	catch(SQLException sqle)
    	{
    		// TBD
    	}
    	
    	return closeStatus;
    	
    	
    }

    public Object getSelectResult(String pSelectquery)
    {
    	ArrayList<ArrayList<String>> SelectResult = new ArrayList<ArrayList<String>>();
    	
    	try
    	{
    		_mStatement = _mConnection.createStatement();
            _mResultSet = _mStatement.executeQuery(pSelectquery);               
            
    		if(this._mResultSet != null)
	    	{
	    	  	ResultSetMetaData rsMetaData = this._mResultSet.getMetaData(); 
		        int numberOfColumns = rsMetaData.getColumnCount();
		        
		        ArrayList<String> headerRecord = new ArrayList<String>();
		        for(int countI = 1; countI <= numberOfColumns; countI++)
		        {
		        	headerRecord.add(rsMetaData.getColumnName(countI));
		        }
		        
		        SelectResult.add(headerRecord);
		        
		        while(this._mResultSet.next())
		        {
		        	ArrayList<String> record = new ArrayList<String>(); 		        	
		        	for(int countI = 1; countI <= numberOfColumns; countI++)
		        	{
		        		record.add(this._mResultSet.getString(countI));
		        	}
		        	SelectResult.add(record);
		        }
		        			        
		        
	    	}
    	}
    	catch(SQLException sqle)
    	{
    		
    	}
    	return SelectResult;
    }
    
}
