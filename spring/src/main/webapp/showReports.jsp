<%@page import="com.example.model.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
	<script src= "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
</head>
<body>
<%
		 List<Report> list=(List<Report>)request.getAttribute("list");
		
		%>
	<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      		<th>S.NO</th>
		            <th>Doctor Name</th>
		            <th>Doctor Email</th>
		            <th>Disease Name</th>
		            <th>Reprot</th>
		            <th>Booked Date</th>
		            <th>Booked time</th>
		            
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
				<td><%=list.get(i).getDisease_name() %></td>				
				<td><%=list.get(i).getReport_name()%></td>							    
				<td><%=list.get(i).getDate() %></td>
				<td><%=list.get(i).getTime() %></td>
				
				</tr> 
		   <%
		     }
		   %>
		  </tbody>
	</table>

</body>
</html>