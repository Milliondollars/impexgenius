<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="com.example.ecom.*" %>
<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dealers page</title>
</head>
<body>

<%
	DatabaseAccessor dO = new DatabaseAccessor();
	String ConnectionURL = "jdbc:mysql://localhost:3306/impgen"; 
	boolean dbConnection = dO.tryDataBaseConnectWithCredentials(ConnectionURL, "root", "admin");
	
	if(dbConnection == true)
	{
		String SelectStmtForDealers = "select dealer_name, dealer_addr, dealer_email, dealer_ctry_code, dealer_phone, dealer_type from impgen.tbl_dealer d inner join impgen.tbl_dealer_type dt where d.dealer_type_id = dt.dealer_type_id;";
		ArrayList<ArrayList<String>> SelectStmtForDealersResult = (ArrayList<ArrayList<String>>) dO.getSelectResult(SelectStmtForDealers);
			
%>
	

<table border = 2 >

<%
		ArrayList<String> HeaderRecord = SelectStmtForDealersResult.get(0);
		for(int countI = 0; countI<HeaderRecord.size(); countI++)
		{
			%>			
			<th> <%= HeaderRecord.get(countI) %> </th>			
			<%
		}


		for(int countI=1; countI<SelectStmtForDealersResult.size(); countI++)
		{
			%>
			<tr>
			<%
			for(int countJ=0; countJ < SelectStmtForDealersResult.get(0).size(); countJ++)
			{
				%>
				<td> <%= SelectStmtForDealersResult.get(countI).get(countJ) %> </td>				
				<%
			}
			
			%>
			</tr>
			<%
		}

	}
%>

<!--  
<th>Name</th>
<th> Address</th>
<th> Phone No</th>
<th> email</th>
<th>Contact Person</th>
<tr>
	<td> Dealer 1</td>
	<td> Address1</td>
	<td> Phone1</td>
	<td> email 1</td>
	<td> Contact Person1</td>
</tr>

<tr>
	<td> Dealer 2</td>
	<td> Address 2</td>
	<td> Phone 2</td>
	<td> email 2</td>
	<td> Contact Person2</td>
</tr> -->

</table>






</body>
</html>