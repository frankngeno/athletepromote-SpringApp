<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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

<title>Shop</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->

<link rel="stylesheet" href="static/css/fancybox.css" type="text/css">
<link rel="stylesheet" href="static/css/animate.css" type="text/css">
<link rel="stylesheet" href="static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="static/css/style.css" type="text/css">
<link rel="stylesheet" href="static/css/revslider.css" type="text/css">
<link rel="stylesheet" href="static/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" type="text/css" href="static/css/flexslider.css">
<link rel="stylesheet" href="static/css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="static/css/font-awesome.css" type="text/css">

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
  
  <section class="main-container col2-left-layout bounceInUp animated">
  <div class="container">
    
    <div class="row">
      <div class="col-main col-sm-9 col-sm-push-3">
	  
        <article class="col-main">
          <div class="page-title">
           <h3> Page ${list.getNumber()+1} of ${list.totalPages} showing ${list.content.size()} of all ${list.getTotalElements()}  
           </h3>
           <hr>
          </div>
        
          <div class="toolbar">
            <div class="sorter">
                <div class="view-mode"> <a href="#" title="Grid" class="button button-grid">&nbsp;</a>&nbsp; <span title="List" class="button button-active button-list">&nbsp;</span>&nbsp; </div>
              </div>
            <div id="sort-by">
              <label class="left">Sort By: </label>
              <ul>
                <li><a href="#">Position<span class="right-arrow"></span></a>
                  <ul>
                    <li><a href="#">Name</a></li>
                    <li><a href="#">Price</a></li>
                    <li><a href="#">Position</a></li>
                  </ul>
                </li>
              </ul>
               
            </div>
            <div class="pager">
              <div id="limiter">
                <label>View: </label>
                <ul>
                  <li><a href="#">15<span class="right-arrow"></span></a>
                    <ul>
                      <li><a href="#">20</a></li>
                      <li><a href="#">30</a></li>
                      <li><a href="#">35</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="pages">
                
                <c:if test="${list.hasContent()}">	
					                 <div class="pages">
                  						<ul class="pagination">
							                        <c:set var="prev" value="0"/>
							                        <c:if test="${list.hasContent()}">
							                            <c:set var="prev" value="${list.getNumber()-1}"/>
							                        </c:if>
							                        <c:if test="${list.hasPrevious()}">
							                             <li class='page-item'>
							                                <a class="page-link" href="shop?page=0&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-left margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>							                                
							                                <a class="page-link"href="shop?page=${prev}&size=${list.getSize()}">
							                                <i class="fa fa-long-arrow-alt-left margin-5px-right xs-display-none"></i> Prev</a>
							                            </li>
							                        </c:if>
							                        
							                        <c:forEach var="i" begin="0" end="${list.totalPages -1}">
							                            <li class='page-item <c:if test="${list.getNumber() eq i || (empty list.getNumber() && i eq 0)}">active</c:if>'>
							                                <a class="page-link" href="shop?page=${i}&size=${list.getSize()}">${i+1} </a>
							                            </li>
							                     
							                        </c:forEach>
							                        <c:if test="${list.hasNext()}">
							                            <li class='page-item'>
							                                <a class="page-link" href="shop?page=${list.getNumber() + 1}&size=${list.getSize()}">Next
							                                <i class="fa fa-long-arrow-alt-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>
							                                <a class="page-link" href="shop?page=${list.totalPages -1}&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                        </c:if>
							                     </ul>
               								 </div>
							            </c:if>	
							            			
              </div>
            </div>
          </div>
        
         <div class="category-products">
         <ol class="products-list" id="products-list">
         <c:forEach var="item" items="${list.content}">
          <li class="item even">
            <div class="product-image"> 
            <c:if test="${not empty item.img}">
            <a href="productdetails?id=${item.id}"> 
            <img class="small-image" src="static/img/products/${item.id}/${item.img}" > 
            </a> 
            </c:if>
            
            </div>
            <div class="product-shop">
              <h2 class="product-name"><a href="#" >${item.type}: ${item.name}</a></h2>
              <div class="desc std">
                <p>${item.des}</p>
              </div>
              <div class="price-box">
                      <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-48" class="price"> 
                      $<fmt:formatNumber value="${item.price*.8}" 
				       maxFractionDigits="2" minFractionDigits="2"/>
				      </span> </p>
                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price">
                      $<fmt:formatNumber value="${item.price}" maxFractionDigits="2" minFractionDigits="2"/>
                       </span> </p>
                       </div>
              <div class="actions">
                <a href="productdetails?id=${item.id}" class="button btn-cart ajx-cart" title="Add to Cart" type="button"><span> Add to Cart</span></a>
                <a class="btn btn-default" href="#" data-toggle="modal" data-target="#product-modal${item.id}"><span class="fa fa-eye"> view</span></a> 
               </div>
            </div>
          </li>
          </c:forEach>
         
         
        </ol>
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
                  <li> <a class="active" href="#/women.html">Women</a> <span class="subDropdown minus"></span>
                    <ul class="level0_415" style="display:block">
                      <li> <a href="#/women/tops.html"> Handbags </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/tops/evening-tops.html"> Clutch Handbags </a> </li>
                          <li> <a href="#/women/tops/shirts-blouses.html"> Diaper Bags </a> </li>
                          <li> <a href="#/women/tops/tunics.html"> Back Bags </a> </li>
                          <li> <a href="#/women/tops/vests.html"> Hobo handbags </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/women/bags.html"> Jackets </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/bags/bags.html"> Bags </a> </li>
                          <li> <a href="#/women/bags/designer-handbags.html"> Designer Handbags </a> </li>
                          <li> <a href="#/women/bags/purses.html"> Purses </a> </li>
                          <li> <a href="#/women/bags/shoulder-bags.html"> Shoulder Bags </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/women/shoes.html"> Shoes </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/shoes/flat-shoes.html"> Flat Shoes </a> </li>
                          <li> <a href="#/women/shoes/flat-sandals.html"> Flat Sandals </a> </li>
                          <li> <a href="#/women/shoes/boots.html"> Boots </a> </li>
                          <li> <a href="#/women/shoes/heels.html"> Heels </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/women/Jewellery.html"> Jewellery </a>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/Jewellery/bracelets.html"> Bracelets </a> </li>
                          <li> <a href="#/women/Jewellery/necklaces-pendants.html"> Necklaces &amp; Pendants </a> </li>
                          <li> <a href="#/women/Jewellery/pins-brooches.html"> Pins &amp; Brooches </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/women/dresses.html"> Dresses </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/dresses/casual-dresses.html"> Casual Dresses </a> </li>
                          <li> <a href="#/women/dresses/evening.html"> Evening </a> </li>
                          <li> <a href="#/women/dresses/designer.html"> Designer </a> </li>
                          <li> <a href="#/women/dresses/party.html"> Party </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      
                      
                      <!--level1-->
                      <li> <a href="#/women/swimwear.html"> Swimwear </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/swimwear/swimsuits.html"> Swimsuits </a> </li>
                          <li> <a href="#/women/swimwear/beach-clothing.html"> Beach Clothing </a> </li>
                          <li> <a href="#/women/swimwear/bikinis.html"> Bikinis </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                    </ul>
                    <!--level0--> 
                  </li>
                  <!--level 0-->
                  <li> <a href="#/men.html">Men</a> <span class="subDropdown plus"></span>
                    <ul class="level0_455" style="display:none">
                      <li> <a href="#/men/shoes.html"> Shoes </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/men/shoes/flat-shoes.html"> Flat Shoes </a> </li>
                          <li> <a href="#/men/shoes/boots.html"> Boots </a> </li>
                          <li> <a href="#/men/shoes/heels.html"> Heels </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/men/Jewellery.html"> Jewellery </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/men/Jewellery/bracelets.html"> Bracelets </a> </li>
                          <li> <a href="#/men/Jewellery/necklaces-pendants.html"> Necklaces &amp; Pendants </a> </li>
                          <li> <a href="#/men/Jewellery/pins-brooches.html"> Pins &amp; Brooches </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/men/dresses.html"> Dresses </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/men/dresses/casual-dresses.html"> Casual Dresses </a> </li>
                          <li> <a href="#/men/dresses/evening.html"> Evening </a> </li>
                          <li> <a href="#/men/dresses/designer.html"> Designer </a> </li>
                          <li> <a href="#/men/dresses/party.html"> Party </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/men/jackets.html"> Jackets </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/men/jackets/coats.html"> Coats </a> </li>
                          <li> <a href="#/men/jackets/jackets.html"> Jackets </a> </li>
                          <li> <a href="#/men/jackets/leather-jackets.html"> Leather Jackets </a> </li>
                          <li> <a href="#/men/jackets/blazers.html"> Blazers </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/men/swimwear.html"> Swimwear </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/men/swimwear/swimsuits.html"> Swimsuits </a> </li>
                          <li> <a href="#/men/swimwear/beach-clothing.html"> Beach Clothing </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                    </ul>
                    <!--level0--> 
                  </li>
                  <!--level 0-->
                  <li> <a href="#.html">Electronics</a> <span class="subDropdown plus"></span>
                    <ul class="level0_482" style="display:none">
                      <li> <a href="#/smartphones.html"> Smartphones </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/smartphones/samsung.html"> Samsung </a> </li>
                          <li> <a href="#/smartphones/apple.html"> Apple </a> </li>
                          <li> <a href="#/smartphones/blackberry.html"> Blackberry </a> </li>
                          <li> <a href="#/smartphones/nokia.html"> Nokia </a> </li>
                          <li> <a href="#/smartphones/htc.html"> HTC </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/cameras.html"> Cameras </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/cameras/digital-cameras.html"> Digital Cameras </a> </li>
                          <li> <a href="#/cameras/camcorders.html"> Camcorders </a> </li>
                          <li> <a href="#/cameras/lenses.html"> Lenses </a> </li>
                          <li> <a href="#/cameras/filters.html"> Filters </a> </li>
                          <li> <a href="#/cameras/tripod.html"> Tripod </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                      <li> <a href="#/accesories.html"> Accesories </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/accesories/headsets.html"> HeadSets </a> </li>
                          <li> <a href="#/accesories/batteries.html"> Batteries </a> </li>
                          <li> <a href="#/accesories/screen-protectors.html"> Screen Protectors </a> </li>
                          <li> <a href="#/accesories/memory-cards.html"> Memory Cards </a> </li>
                          <li> <a href="#/accesories/cases.html"> Cases </a> </li>
                          <!--end for-each -->
                        </ul>
                        <!--level1--> 
                      </li>
                      <!--level1-->
                    </ul>
                    <!--level0--> 
                  </li>
                  <!--level 0-->
                  <li> <a href="#/digital.html">Furniture</a> </li>
                  <!--level 0-->
                  <li class="last"> <a href="#/fashion.html">Kids</a> </li>
                  <!--level 0-->
                </ul>
              </div>
              <!--box-content box-category--> 
            </div>
            
            
          </aside>
        </div>
    </div>
  </div>
</section>
  
 				<c:forEach var="item" items="${list.content}">
  				   
  				   <div class="modal fade" id="product-modal${item.id}">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	
						<div class="modal-header">
			                <h4 class="modal-">
			                ${item.type}
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h4>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
	                      <div class="product-view">
				            <div class="product-essential">
				              <form action="#" method="post" id="product_addtocart_form">
				               
				                <div class="product-img-box col-sm-5 col-xs-12">
				                  <div class="new-label new-top-left"> New </div>
				                  <div class="product-image">
				                    <div class="large-image"> <a href="#" class="cloud-zoom" id="zoom1"> 
				                    <img src="static/img/products/${item.id}/${item.img}" alt="product image" > </a> </div>
				                    <div class="flexslider flexslider-thumb">
				                      <ul class="previews-list slides">
				                      <c:forEach var="img" items="${item.getIfiles()}">
				                        <li>
				                        <a class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: 'static/img/products/${item.id}/${img.image}' ">
				                        <img src="static/img/products/${item.id}/${img.image}" style="width:80px; height:70px;"/></a>
				                        </li>
				                      </c:forEach>
				                      </ul>
				                    </div>
                  				</div>
				                  <!-- end: more-images --> 
				                </div>
				                <div class="product-shop col-sm-7 col-xs-12">
				                  <div class="product-name">
				                    <h3>${item.name}</h3>
				                  </div>
				                  <div class="ratings">
				                    <div class="rating-box">
				                      <div style="width:60%" class="rating"></div>
				                    </div>
				                    <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Your Review</a> </p>
				                  </div>
				                  <div class="price-block">
				                     <div class="price-box">
				                      <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-48" class="price"> 
				                      $<fmt:formatNumber value="${item.price*.8}" 
								       maxFractionDigits="2" minFractionDigits="2"/>
								      </span> </p>
				                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price">
				                      $<fmt:formatNumber value="${item.price}" maxFractionDigits="2" minFractionDigits="2"/>
				                       </span> </p>
				                       </div>
				                    <p class="availability in-stock pull-right"><span>In Stock</span></p>
				                  </div>
				                  <div class="short-description">
				                    <h2>Quick Overview</h2>
				                    <p>${item.des}</p>
				                  </div>
				                  <div class="add-to-box">
				                    <div class="add-to-cart">
				                      <div class="pull-left">
				                        <div class="custom pull-left">
				                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="fa fa-minus">&nbsp;</i></button>
				                          <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" id="qty" name="qty">
				                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="fa fa-plus">&nbsp;</i></button>
				                        </div>
				                      </div>
				                      <button onClick="productAddToCartForm.submit(this)" class="button btn-cart" title="Add to Cart" type="button"><span>Add to Cart</span></button>
				                    </div>
				                    <div class="email-addto-box">
				                      <p class="email-friend"><a href="#" class=""><span>Email to a Friend</span></a></p>
				                      <ul class="add-to-links">
				                        <li> <a class="link-wishlist" href="#"><span>Add to Wishlist</span></a></li>
				                        <li><span class="separator">|</span> <a class="link-compare" href="#"><span>Add to Compare</span></a></li>
				                      </ul>
				                    </div>
				                  </div>
				                  
				                </div>
				              </form>
				            </div>
				          </div>
       						<!--product-view--> 
		             
			    		  
	                     </div>
					    </div>	
				      </div>
					  </div>			
                     </c:forEach>
  <!-- Main Container End --> 
  
 <jsp:include page="components/footer.jsp"/>
</div>  
<!-- JavaScript --> 
<script type="text/javascript" src="static/js/jquery.fancybox.js"></script> 
<script type="text/javascript" src="static/js/toggle.js"></script>
<script type="text/javascript" src="static/js/jquery.min.js"></script> 
<script type="text/javascript" src="static/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="static/js/jquery.flexslider.js"></script> 
<script type="text/javascript" src="static/js/parallax.js"></script> 
<script type="text/javascript" src="static/js/common.js"></script> 
<script type="text/javascript" src="static/js/revslider.js"></script> 
<script type="text/javascript" src="static/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
</body>
</html>