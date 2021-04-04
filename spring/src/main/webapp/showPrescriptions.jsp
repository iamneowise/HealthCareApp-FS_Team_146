<%@page import="com.example.model.Prescription"%>
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
		 List<Prescription> list=(List<Prescription>)request.getAttribute("list");
		
		%>
	<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      		<th>S.NO</th>
		            <th>Doctor Name</th>
		            <th>Doctor Email</th>
		            <th>Medicine name</th>
		            <th>Dose</th>
		            <th>Morning</th>
		            <th>AfterNoon</th>
		            <th>Night</th>
		            
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
				<td><%=list.get(i).getMedicine_name() %></td>				
				<td><%=list.get(i).getDose()%></td>	
				 <%
				     if(list.get(i).getMorning()==null) 
				     {
				    %>
				    	  <td>Not take</td>
				    	<%  
				     }
				     else
				     {
				    %>	
				        <td>Take</td>
				    <% 
				     }
				 if(list.get(i).getAfternoon()==null) 
			     {
			    %>
			    	  <td>Not take</td>
			    	<%  
			     }
			     else
			     {
			    %>	
			        <td>Take</td>
			    <% 
			     }
				 if(list.get(i).getNight()==null) 
			     {
			    %>
			    	  <td>Not take</td>
			    	<%  
			     }
			     else
			     {
			    %>	
			        <td>Take</td>
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