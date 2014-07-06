/**
 * 
 */
package com.example.ecom;

import java.sql.*;

/**
 * @author: SV 
 * Purpose: Utilities for Database Access will be present here
 *
 */
public class DatabaseAccessor {
	
	private Connection _mConnection;
	private ResultSet _mResultSet;
		
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
			Class.forName(pConnectionURL).newInstance();
			this._mConnection = DriverManager.getConnection(pConnectionURL, pUsername, pPassword);
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

    public boolean tryDataBaseConnect(String pConnectionURL)
    {
    	boolean DatabaseConnected = false;
		
		try
		{		
			Class.forName(pConnectionURL).newInstance();
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

    public ResultSet fireSelectQuery(String pSelectquery)
    {
    	return this._mResultSet;
    	
    }
    
    
}
