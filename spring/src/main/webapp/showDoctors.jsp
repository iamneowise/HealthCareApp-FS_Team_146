<%@page import="com.example.model.Hospital"%>
<%@page import="com.example.model.Register"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Health Care Application</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
	<script src= "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
	
	<style>
			
	.split {
	    height: 100%;
	    width: 50%;
	    position: auto;
	    z-index: 1;
	    top: 70px;
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

</head>
<body>

   <header>
     
      <div class="left_area">
        <h3>Health Care <span>Management System</span></h3>
      </div>
    	<div class="right_area">
        <a href="/logout" class="logout_btn">Logout</a>
      </div>
      
        <div class="right_area">
        <a href="/showPrescriptions" class="logout_btn">Prescription</a>
      </div>
      <div class="right_area">
        <a href="/showReports" class="logout_btn">Report</a>
      </div>
      <div class="right_area">
        <a href="/showBooking" class="logout_btn">Booking</a>
      </div>
      <div class="right_area">
        <a href="/showProfileP" class="logout_btn">Home</a>
      </div>
    </header>
   <%

      List<Register> list=(List<Register>)request.getAttribute("list");
      List<Hospital> hospital=(List<Hospital>)request.getAttribute("hos_list");
     // out.println(list);
     
       // Register userDetails=(Register)request.getAttribute("register");
   
     //This is from above link
     String pat_name=(String)session.getAttribute("name");
     String pat_email=(String)session.getAttribute("email");
       
        
        
   
   %>
  
  
   <div class="split left" style="width:70%">
   <div class="row" style="margin-top:50px">     
      <%
     // out.println(userDetails.getUsername());
      //out.println(userDetails.getEmail());
      
        for(int i=0;i<list.size();i++)
        {
        	
      %>
	   <div class="card column" style="width:400px;margin-left:50px;margin-top:50px; z-index: 1;border-radius:10%;" onclick="changeDoctor(this)" >
	   <center>
	   <img class="card-img-bottom" src="Gimg.jpg" alt="Card image"  style="width:150px;height:150px;border-radius:50%;display: inline;">
	    </center>
	    <div class="card-body" >
	      <h4 class="card-title"><b><%=list.get(i).getUsername()  %></b></h4>
	      
	      <p class="card-text"><b>Specialist :  </b> <%=hospital.get(i).getSpecial() %></p>
	      <p class="card-text"><b>Hospital :    </b><span><%=hospital.get(i).getHos_name()%></span></p>
	      <p class="card-text" style="display:none"><b></b><span><%=list.get(i).getEmail()  %></span></p>
	    </div>
	   
	  </div>
	  <br>  
	  <%
        }
	  %>
	 </div>
	 </div>
	 
	 <div class="split right" style="width:30%;position:fixed">
	     
	     <center>
	      <h2><b>ADD BOOKING</b></h2>
	      
        <img src="Gimg.jpg" style="width:150px;height:150px;border-radius:50%;display: inline;">
       <br><br><br><br>
       <%
	          String status=(String)request.getAttribute("status");
	         // out.println(status);
	          if(status==null)
	          {
	        	  
	          }
	          else if(status.equals("true"))
	          {
	        	  %>
	        	 <h3 style="color:green">Last Booking Successfull!</h3>
	        	  <%
	        	  status=null;
	          }
	          else
	          {
	        	  %>
		        	 <h3 style="color:red">Last Booking Failed!</h3>
		          <%
	        	  status=null;
	          }
	      %>
        <form  method="post"  action="addBooking">
        <table cellpadding="10px" >
        <tr>
        
        
        <td><label><b>Doctor name</b></label></td>
        <td><p id="doc_name1">Name</p></td>
        <input type="hidden" name="doc_name" id="doc_name" value="Mugundhan S"/>
        <input type="hidden" name="doc_email" id="doc_email" value="email"/>
        <input type="hidden" name="pat_name" value="<%=pat_name%>"/>
        <input type="hidden" name="pat_email" value="<%=pat_email%>"/>
        
        </tr>
        <tr>
        
        
        <td><label><b>Hospital name</b></label></td>
        <td><p id="hos_name1">Hos_Name</p></td>
         <input type="hidden" name="hos_name" id="hos_name" value="ABC Hospital"/>
        
        </tr>
        <tr>
        
        
        <td><label><b>Select Date</b></label></td>
        <td><input class="input" type="date" name="date" required></td>
        
        </tr>
		<tr>
        
        
          <td><label><b>Select Time</b></label></td>
           <td><input class="input" type="time" name="time" required></td>
        
        </tr>
		<tr>
		<td></td>
		<td>
        <input type="submit" value="Book Slot">
        </td>
        </tr>
        </table>

      </form>
      
      </center>
      </div>
   
	<br><br><br>
    
	 <script type="text/javascript">
	   function changeDoctor(element)
	   {
		   var x=element.children;
		   var y=x[1].children;
		   
		   var name=y[0].children;
		   var hos_name=y[2].children;//p
		   var d_email=y[3].children;
		   
		   document.getElementById("doc_name1").innerHTML=name[0].innerHTML;
		   document.getElementById("hos_name1").innerHTML=hos_name[1].innerHTML;
		   document.getElementById("doc_name").value=name[0].innerHTML;
		   document.getElementById("hos_name").value=hos_name[1].innerHTML;
		   document.getElementById("doc_email").value=d_email[1].innerHTML;
		  // alert("hello"+"-->"+y[0].innerHTML+" "+name[0].innerHTML+" "+hos_name[1].innerHTML+" "+d_email[1].innerHTML);
		   
	   }
	 </script>
</body>
</html>