<%@page import="java.sql.*"%>
<%@page import ="java.sql.Blob" %>
<%@page import ="java.io.InputStream" %>
<%@page import ="javax.servlet.http.Part" %>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
                    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Health Care Application</title>
	</head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<style>
			body{
			 font-family: "Poppins", sans-serif
			}
			.register{
			    background: lightblue;
			    margin-top: 3%;
			    padding: 3%;
			}
			.register-left{
			    text-align: center;
			    color: #fff;
			    margin-top: 4%;
			}
			.register-left input{
			    border: none;
			    border-radius: 1.5rem;
			    padding: 2%;
			    width: 60%;
			    background: #669900;
			    font-weight: bold;
			    color:white;
			    margin-top: 30%;
			    margin-bottom: 3%;
			    cursor: pointer;
			}
			.register-right{
			    background: #f8f9fa;
			    border-top-left-radius: 10% 50%;
			    border-bottom-left-radius: 10% 50%;
			}
			.register-left .image{
			    margin-top: 15%;
			    margin-bottom: 5%;
			    width: 25%;
			    -webkit-animation: mover 2s infinite  alternate;
			    animation: mover 1s infinite  alternate;
			}
			@-webkit-keyframes mover {
			    0% { transform: translateY(0); }
			    100% { transform: translateY(-20px); }
			}
			@keyframes mover {
			    0% { transform: translateY(0); }
			    100% { transform: translateY(-20px); }
			}
			.register-left p{
			    font-weight: lighter;
			    padding: 12%;
			    margin-top: -9%;
			}
			.register .register-form{
			    padding: 10%;
			    margin-top: 10%;
			}
			.btnRegister{
			    float: right;
			    margin-top: 10%;
			    border: none;
			    border-radius: 1.5rem;
			    padding: 2%;
			    background: blue;
			    color: #fff;
			    font-weight: 600;
			    width: 50%;
			    cursor: pointer;
			}
			
			.register .nav-tabs .nav-link:hover{
			    border: none;
			}
			.register .nav-tabs .nav-link.active{
			    width: 100px;
			    color: #0062cc;
			    border: 2px solid  #669900;
			    border-top-left-radius: 1.5rem;
			    border-bottom-left-radius: 1.5rem;
			}
			.register-heading{
			    text-align: center;
			    margin-top: 8%;
			    margin-bottom: -15%;
			    color:  #669900;
			}
	</style>
	<body onLoad="initGeolocation();">
	
	
	<form  method="post" action="addUser">
	<div class="container register">
	                <div class="row">
	                    <div class="col-md-3 register-left">
	                        <h3 >Health Care Application</h3>
	                       
	                        
	                    </div>
	                    <div class="col-md-9 register-right">
	                       
	                        <div class="tab-content" id="myTabContent">
	                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	                                <h3 class="register-heading" style="color:Blue">Registration</h3>
	                                <div class="row register-form">
	                                    <div class="col-md-6">
	                                        
	                                        <div class="form-group">
	                                            <input type="text" class="form-control" name="username" placeholder="Username*" value="" Required />
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <input type="text" class="form-control" name="email" placeholder="Email*" value="" Required />
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <input type="text" minlength="10" maxlength="10"class="form-control" name="mobileno" placeholder="Phone Number*" value="" Required/>
	                                        </div>
	                                        
	                                         <div class="maxl">
	                                                <label class="radio inline">
	                                                    <input type="radio" name="role" value="D" checked>
	                                                    <span>Doctor </span>
	                                                </label>
	                                                <label class="radio inline">
	                                                    <input type="radio" name="role" value="P">
	                                                    <span>Patient</span>
	                                                </label>
	                                           
	                                            </div>  
	                                            <input type="hidden" name="status" value="Active"/>
	                                            
	                                    </div>
	                                    <div class="col-md-6">
	                                        
	                                  
	                                          <div class="form-group">
	                                            <input type="password" class="form-control" name="password" placeholder="Password*" value="" Required/>
	                                          </div>
	                                          <div class="form-group">
	                                            <input type="password" class="form-control" name="confirmpassword"  placeholder="Confirm Password*" value="" Required/>
	                                          </div>
	                                        <br><br><br>
	                                        <input type="submit" class="btnRegister"  value="Register" name="submit" />
	                                    </div>
	                                </div>
	                            </div>
	                 
	                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	                                <h3  class="register-heading">Registration</h3>
	                                <div class="row register-form">  
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            </form>
	            
	            
      </body>
</html>
           
