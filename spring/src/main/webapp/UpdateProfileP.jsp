<%@page import="com.example.model.Hospital"%>
<%@page import="com.example.model.Register"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/cosmo/bootstrap.min.css" />
	<script src= "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
<style>
	body {
		    background-color: #f9f9fa
		}
		
		.padding {
		    padding: 3rem !important
		}
		
		.user-card-full {
		    overflow: hidden
		}
		
		.card {
		    border-radius: 5px;
		    -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
		    box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
		    border: none;
		    margin-bottom: 30px
		}
		
		.m-r-0 {
		    margin-right: 0px
		}
		
		.m-l-0 {
		    margin-left: 0px
		}
		
		.user-card-full .user-profile {
		    border-radius: 5px 0 0 5px
		}
		
		.bg-c-lite-green {
		    background: -webkit-gradient(linear, left top, right top, from(#f29263), to(#ee5a6f));
		    background: linear-gradient(to right, #ee5a6f, #f29263)
		}
		
		.user-profile {
		    padding: 20px 0
		}
		
		.card-block {
		    padding: 1.25rem
		}
		
		.m-b-25 {
		    margin-bottom: 25px
		}
		
		.img-radius {
		    border-radius: 5px
		}
		
		h6 {
		    font-size: 14px
		}
		
		.card .card-block p {
		    line-height: 25px
		}
		
		@media only screen and (min-width: 1400px) {
		    p {
		        font-size: 14px
		    }
		}
		
		.card-block {
		    padding: 1.25rem
		}
		
		.b-b-default {
		    border-bottom: 1px solid #e0e0e0
		}
		
		.m-b-20 {
		    margin-bottom: 20px
		}
		
		.p-b-5 {
		    padding-bottom: 5px !important
		}
		
		.card .card-block p {
		    line-height: 25px
		}
		
		.m-b-10 {
		    margin-bottom: 10px
		}
		
		.text-muted {
		    color: #919aa3 !important
		}
		
		.b-b-default {
		    border-bottom: 1px solid #e0e0e0
		}
		
		.f-w-600 {
		    font-weight: 600
		}
		
		.m-b-20 {
		    margin-bottom: 20px
		}
		
		.m-t-40 {
		    margin-top: 20px
		}
		
		.p-b-5 {
		    padding-bottom: 5px !important
		}
		
		.m-b-10 {
		    margin-bottom: 10px
		}
		
		.m-t-40 {
		    margin-top: 20px
		}
		
		.user-card-full .social-link li {
		    display: inline-block
		}
		
		.user-card-full .social-link li a {
		    font-size: 20px;
		    margin: 0 10px 0 0;
		    -webkit-transition: all 0.3s ease-in-out;
		    transition: all 0.3s ease-in-out
		}
		.split {
	    height: 100%;
	    width: 50%;
	    position: auto;
	    z-index: 1;
	    top: 0px;
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
     <%
        Register register=(Register)request.getAttribute("register");
     //   Hospital  hospital=(Hospital)request.getAttribute("hospital");
      //  out.println(register.toString());
       // out.println(hospital.toString());
        
     
     %>
     <div class="split left" style="width:70%">
     <br><br>
         <center><h1><b>Profile</b></h1></center>
	     <div class="page-content page-container" id="page-content">
		    <div class="padding">
		        <div class="row container d-flex justify-content-center">
		            <div class="col-xl-6 col-md-12">
		                <div class="card user-card-full">
		                    <div class="row m-l-0 m-r-0">
		                        <div class="col-sm-5 bg-c-lite-green user-profile">
		                            <div class="card-block text-center text-white">
		                                <div class="m-b-25"> <img src="Gimg.jpg" class="img-radius" alt="User-Profile-Image" style="width:150px;height:150px;border-radius:50%;display: inline;"> </div>
		                                <h4 class="f-w-600"><%=register.getUsername() %></h4>
		                                <h2>Patient</h2> <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
		                            </div>
		                        </div>
		                        <div class="col-sm-7">
		                            <div class="card-block">
		                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <p class="m-b-10 f-w-600">Email</p>
		                                        <h6 class="text-muted f-w-700"><%=register.getEmail() %></h6>
		                                    </div>
		                                   
		                                </div>
		                                <div class="row">
		                                	 <div class="col-sm-12">
		                                        <p class="m-b-10 f-w-600">Phone</p>
		                                        <h6 class="text-muted f-w-700"><%=register.getMobileno() %></h6>
		                                    </div>
		                                
		                                </div>
		                                
		                                
		                                
		                                <ul class="social-link list-unstyled m-t-40 m-b-10">
		                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
		                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
		                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
		                                </ul>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
	     </div>
     </div>
     <div  class="split right" style="width:30%;position:fixed">
     <br><br>
     <div class="right_area">
        <a href="/backP" class="logout_btn">Back</a>
      </div>
      <center><h1><b>Update Profile</b></h1><br><br>
      <table cellpadding="10">
             <form method="post" action="/updateProfileP">
		       <tr>
		         <td><b>Username</b></td>
		         <td><input type="text" name="username" value="<%=register.getUsername()%>"></td>
		       </tr>
		       
		       <tr>
		         <td><b>Mobile</b></td>
		         <td><input type="text" name="mobileno" value="<%=register.getMobileno()%>"></td>
		       </tr>
		       
		       <tr>
		         <td><b>Email</b></td>
		         <td><input type="text" name="email" value="<%=register.getEmail()%>"></td>
		       </tr>
		       
		      
		       <tr>
		         <td></td>
		         <td><input type="submit" value="Update"></td>
		       </tr>
		       </form>
		      
      </table>
      </center>
     
     </div>
</body>
</html>