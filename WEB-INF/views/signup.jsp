
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

<title>Register</title>

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
          <h1>Register </h1>
        </div>
        <fieldset class="col2-set">
          
          <div class="col-1 registered-users"><strong>Customers</strong>
            <div class="content">
              <p>If you have an account with us, please log in.</p><div class="buttons-set">
                <a href="login" class="button create-account">
                <button class="button create-account"><span>Login here</span></button>
                </a>
              </div>
            </div>
          </div>
          
          <div class="col-2 new-users"><strong>New Customers</strong>
            <form:form action="register" modelAttribute="users" method="post" >
            <div class="content">             
                <h4 class="text-muted">
                <span class="required">${error} ${param.expired}</span>
                </h4>
              
              <ul class="form-list">
                <li>
                  <label for="email">First Name<span class="required">*</span></label>
                  <br>
                  <form:input type="text" path="fname"  class="input-text"  placeholder="First Name"/>
		          <form:errors path="fname" class="required"/>
                </li>
                <li>
                  <label for="password">Last Name <span class="required">*</span></label>
                  <br>
		          <form:input type="text" path="lname" class="input-text"  placeholder="Last Name"/>
		          <form:errors path="lname" class="required"/>
                </li>
                <li>
                  <label for="password">Email <span class="required">*</span></label>
                  <br>
                  <form:input type="hidden" path="id"/>
		          <form:input type="email" path="email" class="input-text"  placeholder="E-mail"/>
		          <form:errors path="email" class="required"/>
                </li>
                <li>
                  <label for="password">Password <span class="required">*</span></label>
                  <br>
                  <form:input type="password" path="password" class="input-text"  placeholder="Password"/>
		          <form:errors path="password" class="required"/>
                </li>
                <li>
                  <label for="password">Retype Password <span class="required">*</span></label>
                  <br>
                  <form:input type="password" path="password2" class="input-text"  placeholder="Retype Password"/>
		          <form:errors path="password2" class="required"/>
                </li>
              </ul>
              </div>
              <p class="required">* Required Fields</p>
              <div class="buttons-set">
                <button id="send2" name="" type="submit" class="button login"><span>Create Account</span></button>                
            </div>
            </form:form>
            
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
  <!-- Main Container End --> 
  
   
</div>
 <jsp:include page="components/footer.jsp"/>
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