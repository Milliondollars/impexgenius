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
			Class.forName("com.mysql.jdbc.Driver").newInstance();
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

    public ResultSet fireSelectQuery(String pSelectquery) 
    {
    	Statement stmt = null;
        
        try {
            stmt = _mConnection.createStatement();
            _mResultSet = stmt.executeQuery(pSelectquery);
            
            ResultSetMetaData rsMetaData = _mResultSet.getMetaData(); 
            int numberOfColumns = rsMetaData.getColumnCount();
            
            for (int i = 1; i <= numberOfColumns; i++) {
                if (i > 1) System.out.print(",  ");
                String columnName = rsMetaData.getColumnName(i);
                System.out.print(columnName);
              }
              System.out.println("");
            
            while (_mResultSet.next()) 
            {

                            	             
                  while (_mResultSet.next()) {
                    for (int i = 1; i <= numberOfColumns; i++) {
                      if (i > 1) System.out.print(",  ");
                      String columnValue = _mResultSet.getString(i);
                      System.out.print(columnValue);
                    }
                    System.out.println("");
                  }
            	
            	
            }
            

        	
        	stmt.close(); 
            
        } 
        catch (SQLException e )
        {
            
        } 
            	
    		
        return this._mResultSet;
    	
    }
    
    public boolean closeConnection() 
    {
    	boolean closeStatus = false;
    	
    	try
    	{
    	
	    	if(this._mConnection.isClosed() == false)
	    	{
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
    
    
}
