
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
	<style type="text/css">
			.split {
	    height: 100%;
	    width: 50%;
	    position: auto;
	    z-index: 1;
	    top: 50px;
	    overflow-x: hidden;
	    padding-top: 20px;
	  }
	  
	  .left {
	    left: 10;
	    background-color: white;
	  }
	  
	  .right {
	    right: 0;
	    background-color: rgb(241, 236, 236);
	  }
	  
	
	  .centered {
	    position: absolute;
	    top: 30%;
	    left: 60%;
	    transform: translate(-50%, -50%);
	    text-align: center;
	  }
	   
	  .centered img {
	    width: 250px;
	    border-radius: 50%;
	  }
	
	  /* center align form*/
		
		 header{
		  position: fixed;
		  background: #22242A;
		  padding: 20px;
		  width: 100%;
		  height: 70px;
		  opacity:1;
		  z-index:100;
		}
		.left_area h3{
		  color: #fff;
		  margin: 0;
		  text-transform: uppercase;
		  font-size: 22px;
		  font-weight: 900;
		  margin-top:4px;
		}
		
		.left_area span{
		  color: #19B3D3;
		}
		
		.logout_btn{
		  padding: 5px;
		  background: #19B3D3;
		  text-decoration: none;
		  float: right;
		  margin-top: -30px;
		  margin-right: 40px;
		  border-radius: 2px;
		  font-size: 15px;
		  font-weight: 600;
		  color: #fff;
		  transition: 0.5s;
		  transition-property: background;
		}
		
		.logout_btn:hover{
		  background: #0B87A6;
		}
	</style>
	<script type="text/javascript">
	 function  initialSetup()
	 {
		// alert('hello');
		 document.getElementById("addPrecription").style.display='none';//addReport
		 document.getElementById("addReport").style.display='none';
	 }
	 
	</script>
</head >
<body onload="initialSetup()">

		<%
		 List<Booking> list=(List<Booking>)request.getAttribute("list");
		 
		 
		 String name=(String)session.getAttribute("name");
		 String email=(String)session.getAttribute("email"); 
		
		%>
		<header>
     
      <div class="left_area">
        <h3>Health Care <span>Management System</span></h3>
      </div>
    	<div class="right_area">
        <a href="/logout" class="logout_btn">Logout</a>
      </div>
      
      
      <div class="right_area">
        <a href="/showProfile" class="logout_btn">Home</a>
      </div>
    </header>
<div class="split left" style="width:70%">
   <div class="row" style="margin-top:50px">     
      <%
     // out.println(userDetails.getUsername());
      //out.println(userDetails.getEmail());
      
        for(int i=0;i<list.size();i++)
        {
        			if(list.get(i).getStatus().equals("true"))
        			{
        	
					      %>
						   <div class="card column" style="width:400px;margin-left:50px;margin-top:50px; z-index: 1;border-radius:10%;" onclick="changePatient(this)" >
						   <center>
						       <img class="card-img-bottom" src="Gimg.jpg" alt="Card image"  style="width:150px;height:150px;border-radius:50%;display: inline;">
						    </center>
						    <div class="card-body" >
						      <h4 class="card-title"><b><%=list.get(i).getPat_name()  %></b></h4>
						      
						      <p class="card-text"><b>Booked Date :  </b><span> <%=list.get(i).getDate() %></span></p>
						      <p class="card-text"><b>Booked Time :    </b><span><%=list.get(i).getTime()%></span></p>
						     	 <p class="card-text" style="display:none"><b></b><span><%=list.get(i).getPat_email() %></span></p>
						    	<p class="card-text" style="display:none"><b></b><span><%=list.get(i).getDate() %></span></p>
						    	<p class="card-text" style="display:none"><b></b><span><%=list.get(i).getTime() %></span></p>
						    </div>
						   
						  </div>
						  <br>  
						  <%
        			}
        }
	  %>
	 </div>
	 </div>
	 
	 <div class="split right" style="width:30%;position:fixed">
	    
	        <div class="accept_reject_table" id="accept_reject_table">
			    <table class="table">
				  <thead class="thead-dark">
				    <tr>
				      		
				            <th>Patient Name</th>
				            <th>Date</th>
				            <th>Time</th>
				            <th>Accept</th>
				            <th>Reject</th>
				   	</tr>
				  </thead>
				  <tbody>
				   <%
					     // out.println(userDetails.getUsername());
					      //out.println(userDetails.getEmail());
					      
					        for(int i=0;i<list.size();i++)
					        {
					        	if(list.get(i).getStatus().equals("false"))
					        	{
		        	
						            %>
								  
								        <tr>
										<td><%=list.get(i).getPat_name() %></td>
										<td><%=list.get(i).getDate() %></td>
										<td><%=list.get(i).getTime() %></td>
										<form method="post" action="/acceptBooking">
										<input type="hidden" name="id" value="<%=list.get(i).getId()%>">
										<td><input type="Submit" value="Accept" style="background: green;"></td>				
										</form>
										<form method="post" action="/deleteBooking">
										<input type="hidden" name="id" value="<%=list.get(i).getId()%>">
										<td><input type="Submit" value="Reject" style="background: red;"></td>							    
						    			</form>
										</tr> 
										
									<%
				      			  }
					        }
					
					%>
				   
				  </tbody>
		       </table>
                    
              </div>
              
              <div class="addPrecription" id="addPrecription">
              
                
                       
				        <table cellpadding="10px" >
					        <tr>
						        <td><b>Patient Name</b></td>
						        <td><b>Time</b></td>
						        <td><b>Date</b></td>
					        </tr>
					        <tr>
						        <td><p id="pat_name1">Name</p></td>
						        <td><p id="date"></p></td>
						        <td><p id="time"></p></td>
						        
					        </tr>
						
				        </table>
				        <form  method="post" action="addPrescription">
				          <table cellpadding="0px" border="1" >
					        <tr>
						        
						        <td><b>Medicine</b></td>
						        <td><b>Dose</b></td>
						        <td><b>Time</b></td>
						        <td><b>Add</b></td>
					        </tr>
					        <tr>
						        
						        <td><input type="text" name="medicine_name"></td>
						        <td><input type="text" name="dose"></td>
						        <input type="hidden" name="pat_name" id="pat_name" value="">
						        <input type="hidden" name="pat_email" id="pat_email" value="">
						        <input type="hidden" name="doc_name"  value="<%=name %>">
						        <input type="hidden" name="doc_email" value="<%=email %>">
						        <td>
						        
						         M <input type="checkbox" name="morning"><br>
						         A  <input type="checkbox" name="afternoon"><br>
						         N  <input type="checkbox" name="night"><br>
						        </td>
						        <td><input type="Submit" value="Add"></td>
						      
					        </tr>
					       
						
				        </table>
				        </form>
				        <br><br><br><br><br>
				        <h4><b>Add a report</b></h4>
				        <form  method="post" action="addReport">
				          <table cellpadding="0px"  >
					        <tr>
						        
						        <td><b>Disease name</b></td>
						        
						        
					        </tr>
					        <tr>
						        
						        <td><input type="text" name="disease_name"></td><tr>
						        <tr>
						        <br><br>
						        <tr>
						        <td><b>Report</b></td>
						        </tr>
						        <td><input type="text" name="report_name" style="width:350px;height:100px;"></td>
						        </tr>
						        <input type="hidden" name="pat_name" id="pat_name2" value="">
						        <input type="hidden" name="pat_email" id="pat_email2" value="">
						        <input type="hidden" name="doc_name"  value="<%=name %>">
						        <input type="hidden" name="doc_email" value="<%=email %>">
						        <input type="hidden" name="date" id="date1" value="">
						        <input type="hidden" name="time" id="time1" value="">
						        
						        
						        <td><input type="Submit" value="Report"></td>
						        </form>
					        </tr>
					       
						
				        </table>
				        </form>
				        

                   
              </div>
              
            
              
 
          </div> 
 
	</tr>
 
	</tbody>
	</table>
	   
      </div>
	
<script type="text/javascript">
  function changePatient(element)
  {
	  
	   var x=element.children; //0 1
	   var y=x[1].children;
	   
	   var name=y[0].children;
	   var date=y[1].children;
	   var time=y[2].children;
	   var p_email=y[3].children;
	   var date=y[4].children;
	   var time=y[5].children;
	 
	  document.getElementById("addPrecription").style.display='block';//accept_reject_table
	  document.getElementById("accept_reject_table").style.display='none';
	  
	  document.getElementById("pat_name1").innerHTML=name[0].innerHTML;
	  document.getElementById("pat_name").value=name[0].innerHTML;
	  document.getElementById("pat_email").value=p_email[1].innerHTML;
	  document.getElementById("pat_name2").value=name[0].innerHTML;
	  document.getElementById("pat_email2").value=p_email[1].innerHTML;
	  document.getElementById("date").innerHTML=time[1].innerHTML;
	  document.getElementById("time").innerHTML=date[1].innerHTML;
	  document.getElementById("date1").value=time[1].innerHTML;
	  document.getElementById("time1").value=date[1].innerHTML;
	//  alert(name[0].innerHTML+" "+time[1].innerHTML+" "+date[1].innerHTML+" "+p_email[1].innerHTML);
	  
  }

</script>
</body>
</html>
</body>
</html>