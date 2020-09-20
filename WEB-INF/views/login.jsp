
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->

<title>Login</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<link rel="stylesheet" type="text/css" href="static/css/internal.css">
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/simple-line-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/style.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/revslider.css" >
<link rel="stylesheet" type="text/css" href="static/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="static/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="static/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="static/css/jquery.mobile-menu.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,600,600italic,400italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>

<body class="customer-account-login inner-page">
<div id="page"> 
  
  <!-- Header -->
  <jsp:include page="components/header.jsp"/>
  <!-- end header --> 
   
  <!-- Main Container -->
  <section class="main-container col1-layout bounceInUp animated">
    <div class="main container">
      <div class="account-login">
        <div class="page-title">
          <h1>Login or Create an Account</h1>
        </div>
        <fieldset class="col2-set">
          <legend>Login or Create an Account</legend>
          <div class="col-1 new-users"><strong>New Customers</strong>
            <div class="content">
              <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
              <div class="buttons-set">
                <a href="register" class="button create-account">
                <button class="button create-account"><span>Create an Account</span></button>
                </a>
                
                
              </div>
            </div>
          </div>
          <div class="col-2 registered-users"><strong>Registered Customers</strong>
            <form action="login" method="post">
            <div class="content">
              <h3 class="text-Success"> 
                <spring:message code="pages.login"/>${msg}
                </h3>
                <h4 class="text-muted">
                <span class="required">${error} ${param.expired}</span>
                </h4>
              <p>If you have an account with us, please log in.</p>
              <ul class="form-list">
                <li>
                  <label for="email">Email Address <span class="required">*</span></label>
                  <br>
                  <input type="text" title="" class="input-text" id="user" name="email">
                </li>
                <li>
                  <label for="password">Password <span class="required">*</span></label>
                  <br>
                  <input type="password" title="" id="pass" class="input-text" name="password">
                </li>
              </ul>
              <p class="required">* Required Fields</p>
              <div class="buttons-set">
                <button id="send2" name="" type="submit" class="button login"><span>Login</span></button>
               <a href="#" data-toggle="modal" data-target="#pswrd" class="forgot-word">Forgot password?</a>
                </div>
            </div>
            </form>
            
          </div>
        </fieldset>
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
    </div>
  </section>
  
 				<div class="modal fade" id="pswrd">
					    <div class="modal-dialog modal-md">
						<div class="modal-content">	
						<div class="modal-header">
			                <h5 class="modal-">Forgot Password
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h5>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
	                      <form method="POST" action="#"  method="post" id="form-validate" >			                 
			                  <ul class="form-list">
			                    <li class="fields">
			                      <div class="customer-name">
			                        <div class="input-box name-firstname">
			                          <label for="userEmail">E-Mail<span class="required">*</span></label>
			                          <div class="input-box1">
			                             <input id="email" name="userEmail" maxlength="255" placeholder="E-mail" class="input-text required-entry">
			                          </div>
			                        </div>			                       
			                      </div>
			                    </li>
			                  </ul>
			                <p class="legend">Please enter the email address for your account. A verification code will be sent to you.
							             Once you have received the verification code, you will be able to choose a new password for 
							             your account.</p>	                
			                <div class="buttons-set">
			                  <button type="submit" title="Save" class="btn btn-info"><span>Send token</span></button>
			                  <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger">Close</button>
			                </div>
			              </form>
		             
			    		  
	                     </div>
					    </div>	
				      </div>
					  </div>
					  
					   
                     
  <!-- Main Container End --> 
  
  
 
</div>
<!-- JavaScript --> 

<script type="text/javascript" src="static/js/jquery.min.js"></script> 
<script type="text/javascript" src="static/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="static/js/parallax.js"></script> 
<script type="text/javascript" src="static/js/common.js"></script> 
<script type="text/javascript" src="static/js/jquery.flexslider.js"></script> 
<script type="text/javascript" src="static/js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="static/js/jquery.mobile-menu.min.js"></script> 
<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
</body>
</html>