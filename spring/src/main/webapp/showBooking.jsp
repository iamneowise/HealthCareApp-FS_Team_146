<%@page import="com.example.model.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Health Care Management</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
	<script src= "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
</head>
<body>

		<%
		 List<Booking> list=(List<Booking>)request.getAttribute("list");
		
		%>
	<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      		<th>S.NO</th>
		            <th>Doctor Name</th>
		            <th>Doctor Email</th>
		            <th>Hospital Name</th>
		            <th>Booked Date</th>
		            <th>Booked Time</th>
		            <th>Status</th>
		            
		   	</tr>
		  </thead>
		  <tbody>
		  <%
		     for(int i=0;i<list.size();i++)
		     {
		    	 
		  
		  %>
		        <tr>
				<td><%=i+1 %></td>
				<td><%=list.get(i).getDoc_name() %></td>
				<td><%=list.get(i).getDoc_email() %></td>
				<td><%=list.get(i).getHos_name() %></td>				
				<td><%=list.get(i).getDate() %></td>							    
				<td><%=list.get(i).getTime() %></td>
				<%
				   if(list.get(i).getStatus().equals("false"))
				   {
				%>	
				     <td><p style="color:red;"><b>Not Yet Accepted</b><p></td>
				<%
				   }
				   else if(list.get(i).getStatus().equals("true"))
				   {
				%>	   
					<td><p style="color:green;"><b>Accepted</b><p></td>
				<%
				   }
				%> 
				</tr> 
		   <%
		     }
		   %>
		  </tbody>
	</table>

</body>
</html>