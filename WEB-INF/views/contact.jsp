<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>


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

<title>Contact</title>

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

<body class="contacts-index-index rtl inner-page">
<div id="page"> 
  
  <!-- Header -->
  <jsp:include page="components/header.jsp"/>
  <!-- end header --> 

  
  <!-- Main Container -->
  <section class="main-container col2-right-layout">
    <div class="main container">
        <h3 class="text-center text-success"> ${success}</h3>
	    <h3 class="text-center text-danger">${error}</h3>
      <div class="row">
        <section class="col-main col-sm-9">
          <div class="page-title">
            <h1>${msg}</h1>
          </div>
          <div class="static-contain">
          <form action="sendemail" method="post" role="form">
            <fieldset class="group-select">
              <ul>
                <li >
                  <fieldset>
                    <legend>New Address</legend>
                     <ul>
                      <li>
                          <div class="">                          
                            <label for="name"> Full Name<span class="required">*</span></label>
                            <br>
                            <input type="text" id="name" name="name" placeholder="Full Name" title="Full Name" class="input-text" required>
                         
                          <div class="input-box">
                            <label for="email"> Email Address <span class="required">*</span> </label>
                            <br>
                            <input type="text" id="email" name="email" placeholder="E-mail"  title="E-mail" class="input-text" required>
                          </div>
                          <div class="input-box ">
                            <label for="subject"> Subject <span class="required">*</span> </label>
                            <br>
                            <input type="text" name="subject" placeholder="subject" title="Subject" class="input-text">
                          </div>
                        </div>
                      </li>
                      
                      <li class="">
                        <label for="comment">Comment<em class="required">*</em></label>
                        <br>
                        <div style="float:none" class="">
                          <textarea name="message" id="message" title="message" class="input-text" cols="5" rows="3"></textarea>
                        </div>
                      </li>
                    </ul>
                  </fieldset>
                </li>
                <span class="require"><em class="required">* </em>Required Fields</span>
                <div class="buttons-set">
                  <button type="submit" title="Submit" class="button submit"> <span> Submit </span> </button>
                </div>
              </ul>
            </fieldset>
            </form>
            
          </div>
        </section>
        <aside class="col-right sidebar col-sm-3">
          <div class="block block-company">
            <div class="block-title">Athletepromote inc. </div>
            <div class="block-content">
              <ol id="recently-viewed-items">
                <li class="item odd"><a href="home">Home</a></li>
                <li class="item even"><a href="about">About Us</a></li>
                <li class="item  odd"><a href="#">Terms of Service</a></li>
                <li class="item even"><a href="#">Search Terms</a></li>
                <li class="item last"><a href="contact">Contact Us</a></li>
              </ol>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </section>
  <!-- Main Container End --> 
  
   <jsp:include page="components/footer.jsp"/>
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
