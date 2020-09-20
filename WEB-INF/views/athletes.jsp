<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.thmthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<title>Athlete</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/simple-line-icons.css" media="all">


<!-- CSS Style -->
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/simple-line-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/revslider.css" >
<link rel="stylesheet" type="text/css" href="static/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="static/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="static/css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="static/css/jquery.mobile-menu.css">
<link rel="stylesheet" type="text/css" href="static/css/style.css" media="all">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,600,600italic,400italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>

<body class="inner-page">
<div id="page"> 
  
 
 <!-- Header -->
  <jsp:include page="components/header.jsp"/>
  <!-- end header --> 
 
  <!-- Main Container -->
  <section class="main-container col2-left-layout bounceInUp animated">
    <div class="container">
      <div class="row">
        <div class="col-main col-sm-9 col-sm-push-3">
          
          <article class="col-main">
            <div class="page-title">
              <h1>Athletes</h1>
            </div>
            <div class="toolbar">
              
              <div class="pager">
              
                <c:if test="${list.hasContent()}">	
					                 <div class="pages">
                  						<ul class="pagination">
							                        <c:set var="prev" value="0"/>
							                        <c:if test="${list.hasContent()}">
							                            <c:set var="prev" value="${list.getNumber()-1}"/>
							                        </c:if>
							                        <c:if test="${list.hasPrevious()}">
							                             <li class='page-item'>
							                                <a class="page-link" href="athletes?page=0&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-left margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>							                                
							                                <a class="page-link"href="athletes?page=${prev}&size=${list.getSize()}">
							                                <i class="fa fa-long-arrow-alt-left margin-5px-right xs-display-none"></i> Prev</a>
							                            </li>
							                        </c:if>
							                        
							                        <c:forEach var="i" begin="0" end="${list.totalPages -1}">
							                            <li class='page-item <c:if test="${list.getNumber() eq i || (empty list.getNumber() && i eq 0)}">active</c:if>'>
							                                <a class="page-link" href="athletes?page=${i}&size=${list.getSize()}">${i+1} </a>
							                            </li>
							                     
							                        </c:forEach>
							                        <c:if test="${list.hasNext()}">
							                            <li class='page-item'>
							                                <a class="page-link" href="athletes?page=${list.getNumber() + 1}&size=${list.getSize()}">Next
							                                <i class="fa fa-long-arrow-alt-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>
							                                <a class="page-link" href="athletes?page=${list.totalPages -1}&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                        </c:if>
							                     </ul>
               								 </div>
							            </c:if>	
              </div>
              
              <form class="form-inline" action="athletesearch" method="post" class="col-md-5">
			    <input id="searchnow" class="form-control" type="text" name="keyword" placeholder="Search by race" required>
			    <button class="btn btn-default" type="submit">Search </button>
			    <c:if test="${!list.hasContent()}">
			    <a href="athletes" class="btn btn-info">Refresh <i class="fa fa-refresh"></i></a>
			    </c:if>
			  </form>
            </div>
            <div class="category-products">
              <ul class="products-grid">
                <c:forEach var="item" items="${list.content}">
                <c:if test="${not empty item.getUser().image}">
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-6">
                
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="item-img-info"><a href="#" title="" class="product-image">
                      <img src="static/img/users/${item.getUser().id}/profile/${item.getUser().image}" style="width: 225px; height: 235px; border-radius: 5%;" class="img-responsive"></a>
                        
                        <div class="actions">
                        <div class="quick-view-btn"><a href="#" data-toggle="modal" data-target="#product-modal${item.id}"> <span>Quick View</span></a></div>
                         
                        </div>
                       
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title">
                        <a href="#" data-toggle="modal" data-target="#product-modal${item.id}"> ${item.getUser().fname} ${item.getUser().lname} </a>
                                               
                        <c:if test="${not empty item.getUser().video}">
	          				 <a href="#" data-toggle="modal" data-target="#playvideo${item.id}" class="btn btn-default">
	                    <i class="fa fa-video-camera"></i> Video</a> 
	                    </c:if>
                        
                      </div>
                    </div>
                  </div>
                  </div>
                </li>
                </c:if>
                </c:forEach>
                
                
              </ul>
            </div>
          </article>
          <!--	///*///======    End article  ========= //*/// --> 
        </div>
        <div class="col-left sidebar col-sm-3 col-xs-12 col-sm-pull-9">
          <aside class="col-left sidebar">
            <div class="side-nav-categories">
              <div class="block-title"> Categories </div>
              <!--block-title--> 
              <!-- BEGIN BOX-CATEGORY -->
              <div class="box-content box-category">
                <ul>
                  <li> <a class="active" href="#">Women</a> <span class="subDropdown minus"></span>
                    <ul class="level0_415" style="display:block">
                     	  <li> <a href="findbyrace?race=100"> 100 Meters </a> </li>
                          <li> <a href="findbyrace?race=200"> 200 Meters </a> </li>
                          <li> <a href="findbyrace?race=400"> 400 Meters </a> </li>
                          <li> <a href="findbyrace?race=800"> 800 Meters </a> </li>
                          <li> <a href="findbyrace?race=1500"> 1500 Meters </a> </li>
                          <li> <a href="findbyrace?race=1mile"> 1 Mile </a> </li>
                          <li> <a href="findbyrace?race=3000"> 3000 Meters </a> </li>
                          <li> <a href="findbyrace?race=3000SC"> 3000 Meters SC</a> </li>
                          <li> <a href="findbyrace?race=5000"> 5000 Meters </a> </li>
                          <li> <a href="findbyrace?race=10000"> 10000 Meters </a> </li>
                          <li> <a href="findbyrace?race=halfmarathon"> Half Marathon </a> </li>
                          <li> <a href="findbyrace?race=Fullmarathon"> Full Marathon </a> </li>
                          <li> <a href="findbyrace?race=6k"> 6K Cross Country </a> </li>
                          <li> <a href="findbyrace?race=8k"> 8K Cross Country </a> </li>
                          <li> <a href="findbyrace?race=10k"> 10K Cross Country </a> </li>
                          <li> <a href="findbyrace?race= "> Others </a> </li>
                    </ul>
                    <!--level0--> 
                  </li>
                  <!--level 0-->
                  <li> <a href="#">Men</a> <span class="subDropdown plus"></span>
                    <ul class="level0_455" style="display:none">
                      <li> <a href="findbyrace?race=100"> 100 Meters </a> </li>
                          <li> <a href="findbyrace?race=200"> 200 Meters </a> </li>
                          <li> <a href="findbyrace?race=400"> 400 Meters </a> </li>
                          <li> <a href="findbyrace?race=800"> 800 Meters </a> </li>
                          <li> <a href="findbyrace?race=1500"> 1500 Meters </a> </li>
                           <li> <a href="findbyrace?race=1mile"> 1 Mile</a> </li>
                          <li> <a href="findbyrace?race=3000"> 3000 Meters </a> </li>
                          <li> <a href="findbyrace?race=3000SC"> 3000 Meters SC</a> </li>
                          <li> <a href="findbyrace?race=5000"> 5000 Meters </a> </li>
                          <li> <a href="findbyrace?race=10000"> 10000 Meters </a> </li>
                          <li> <a href="findbyrace?race=halfmarathon"> Half Marathon </a> </li>
                          <li> <a href="findbyrace?race=6k"> 6K Cross Country</a> </li>
                          <li> <a href="findbyrace?race=8k"> 8K Cross Country </a> </li>
                          <li> <a href="findbyrace?race=10k"> 10K Cross Country </a> </li>
                          <li> <a href="findbyrace?race= "> Others </a> </li>
                    </ul>
                    <!--level0--> 
                  </li>
                
                </ul>
              </div>
              <!--box-content box-category--> 
            </div>
           
            
          </aside>
        </div>
      </div>
    </div>
  </section>
  <!-- Main Container End -->
  
  
  <c:forEach var="item" items="${list.content}">
  				   
  				   <div class="modal fade" id="product-modal${item.id}">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	
						<div class="modal-header">
			                <h4>${item.getUser().fname} ${item.getUser().lname} - ${item.getUser().getAddress().age}
			                <a href="#" class=""><i class="fa fa-envelope"> Contact Athlete</i></a>
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h4>
			                
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
	                      <div class="product-view">
				            <div class="product-essential">
				               
				                <div class="product-img-box col-sm-3 col-xs-12">
				                  
				                    <div class="large-image"> <a href="#" class="cloud-zoom" id="zoom1"> 
				                    <img src="static/img/users/${item.getUser().id}/profile/${item.getUser().image}" alt="image" 
				                    style="width:125px; height:145px; border-radius: 5%;" class="img-responsive"> </a> 
				                    </div>
                  				
				                  <!-- end: more-images --> 
				                </div>
				                <div class="product-shop col-sm-9 col-xs-12">
				                  <div class="short-description">
				                    <p> ${item.getUser().getAddress().bio} <p>
				                    
				                    <p>
				                     <i class="fa fa-home"></i> 
				                     <c:if test="${role eq 'ADMIN' || role eq 'DBA'}">
				                     ${item.getUser().getAddress().street} 
				                     ${item.getUser().getAddress().city}
				                     </c:if>
				                     ${item.getUser().getAddress().country}
				 
				                     <i class="fa fa-envelope"></i> ${item.getUser().email} 
				                    
				                    </p>
				                    
				                    <table class="table data-table cart-table" id="shopping-cart-table">
					                  <thead>
					                    <tr class="first last">
										 <th>Race </th>
										  
										 <th>Location</th>
										 
										 <th>Time</th>
										 
										 <th>Position</th>
					                    </tr>
					                    
					                  </thead>
					                  <hr>
					                  <tbody>
					                  <c:forEach var="r" items="${item.getUser().getAthleteStats()}">
					                  <tr>
						                  <td>${r.races}</td>
						                  <td>${r.loc}</td>
						                  <td>${r.timetaken} </td>
						                  <td>${r.position}
						                  </td>
					                  </tr>
					                  </c:forEach>
					                  </tbody>
					                  </table>
				                    
				                  </div>
				                  
				                  
				                </div>
				              
				            </div>
				          </div>
       						<!--product-view--> 
		             
			    		  
	                     </div>
					    </div>	
				      </div>
					  </div>			
                     </c:forEach>
                     
                     <c:forEach var="item" items="${list.content}">
          			 <div class="modal fade" id="playvideo${item.id}">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	
						<div class="modal-header">
			                <h5 class="modal-">
			               <b>${item.getUser().fname} ${item.getUser().lname} Video</b>
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h5>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  <video width="850" height="400" controls>
						  <source src="static/img/users/${item.getUser().id}/videos/${item.getUser().video}" type="video/mp4">
						  </video>
	                     </div>
					    </div>	
				      </div>
					  </div>
			</c:forEach>	
  
  <!-- Footer --> 
<jsp:include page="components/footer.jsp"/>
</div>

<!-- End Footer --> 

<!-- JavaScript --> 
<script type="text/javascript" src="static/js/jquery.min.js"></script> 
<script type="text/javascript" src="static/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="static/js/parallax.js"></script> 
<script type="text/javascript" src="static/js/revslider.js"></script> 
<script type="text/javascript" src="static/js/common.js"></script> 
<script type="text/javascript" src="static/js/jquery.bxslider.min.js"></script> 
<script type="text/javascript" src="static/js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="static/js/jquery.mobile-menu.min.js"></script> 

<script type='text/javascript'>
        jQuery(document).ready(function(){
            jQuery('#rev_slider_4').show().revolution({
                dottedOverlay: 'none',
                delay: 5000,
                startwidth: 0,
                startheight: 800,

                hideThumbs: 200,
                thumbWidth: 200,
                thumbHeight: 50,
                thumbAmount: 2,

                navigationType: 'thumb',
                navigationArrows: 'solo',
                navigationStyle: 'round',

                touchenabled: 'on',
                onHoverStop: 'on',
                
                swipe_velocity: 0.7,
                swipe_min_touches: 1,
                swipe_max_touches: 1,
                drag_block_vertical: false,
            
                spinner: 'spinner0',
                keyboardNavigation: 'off',

                navigationHAlign: 'center',
                navigationVAlign: 'bottom',
                navigationHOffset: 0,
                navigationVOffset: 20,

                soloArrowLeftHalign: 'left',
                soloArrowLeftValign: 'center',
                soloArrowLeftHOffset: 20,
                soloArrowLeftVOffset: 0,

                soloArrowRightHalign: 'right',
                soloArrowRightValign: 'center',
                soloArrowRightHOffset: 20,
                soloArrowRightVOffset: 0,

                shadow: 0,
                fullWidth: 'on',
                fullScreen: 'off',

                stopLoop: 'off',
                stopAfterLoops: -1,
                stopAtSlide: -1,

                shuffle: 'off',

                autoHeight: 'off',
                forceFullWidth: 'on',
                fullScreenAlignForce: 'off',
                minFullScreenHeight: 0,
                hideNavDelayOnMobile: 1500,
            
                hideThumbsOnMobile: 'off',
                hideBulletsOnMobile: 'off',
                hideArrowsOnMobile: 'off',
                hideThumbsUnderResolution: 0,

                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                startWithSlide: 0,
                fullScreenOffsetContainer: ''
            });
        });
        </script> 
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>
</body>
</html>
