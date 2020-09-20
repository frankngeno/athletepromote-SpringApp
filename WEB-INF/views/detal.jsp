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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

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
  
  <!-- Main Container -->
  <section class="main-container col1-layout wow bounceInUp animated">
    <div class="main container">
      <div class="col-main">
      <h2 class="text-center">Product Detail ${msg} </h2><hr>
        <div class="row">
          <div class="product-view">
            <div class="product-next-prev"> <a class="product-next" href="#"><span></span></a> <a class="product-prev" href="#"><span></span></a> </div>
            <div class="product-essential">
              <form action="#" method="post" id="product_addtocart_form">
                
                <div class="product-img-box col-sm-4 col-xs-12">
                  <div class="new-label new-top-left"> New </div>
                  <div class="product-image">
                    <div class="large-image"> <a href="static/img/products/${item.id}/${item.img}" class="cloud-zoom" id="zoom1"> 
                    <img src="static/img/products/${item.id}/${item.img}" alt="product image"> </a> </div>
                    <div class="flexslider flexslider-thumb">
                      <ul class="previews-list slides">
                      <c:forEach var="img" items="${item.getIfiles()}">
                        <li>
                        <a href='static/img/products/${item.id}/${img.image}' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: 'static/img/products/${item.id}/${img.image}'">
                        <img src="static/img/products/${item.id}/${img.image}" alt = "Thumbnail 1" style="width:60px; height:60px;"/></a>
                        
                        <c:if test="${role eq 'ADMIN'}">
                        <a href="removeimg?id=${item.id}&imgid=${img.id}&img=${img.image}"  onclick="confirmed(); return false;"><i class="fa fa-trash"></i></a>
						<a href="setimg?id=${item.id}&img=${img.image}"> set <i class="fa fa-plus"></i></a>
						</c:if>
                        </li>
                      </c:forEach>
                      </ul>
                    </div>
                  </div>
                  <!-- end: more-images --> 
                </div>
                <div class="product-shop col-sm-8 col-xs-12">
                  <div class="product-name">
                    <h1>${item.name}
                    <c:if test="${role eq 'ADMIN'}">
                        <a href="#" data-toggle="modal" data-target="#edit">
						<span class="small fa fa-pencil"></span></a> 
						<a href="deleteproduct?id=${item.id}" onclick="confirmed(); return false;">
						<span class="small fa fa-trash"></span></a> 
						
				    </c:if>
				   </h1>
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
                    <p>${item.des}
                    </p></div>
                  <div class="add-to-box">
                    <div class="add-to-cart">
                      <div class="pull-left">
                        <div class="custom pull-left">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) result.value--;return false;" class="reduced items-count" type="button"><i class="fa fa-minus">&nbsp;</i></button>
                          <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" min="1" id="qty" name="qty">
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
            <div class="product-collateral col-lg-12 col-sm-12 col-xs-12 bounceInUp animated">
              <div class="add_info">
                <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                  <li class="active"> <a href="#product_tabs_description" data-toggle="tab"> Product Description </a> </li>
                  <li><a href="#product_tabs_tags" data-toggle="tab">Tags</a></li>
                  <li> <a href="#reviews_tabs" data-toggle="tab">Reviews</a> </li>
                </ul>
                <div id="productTabContent" class="tab-content">
                  <div class="tab-pane fade in active" id="product_tabs_description">
                    <div class="std">
                      <p>${item.des}</p>                      
                    </div>
                  </div>
                  <div class="tab-pane fade" id="product_tabs_tags">
                    <div class="box-collateral box-tags">
                      <div class="tags">
                        <form id="addTagForm" action="#" method="get">
                          <div class="form-add-tags">
                            <label for="productTagName">Add Tags:</label>
                            <div class="input-box">
                              <input class="input-text" name="productTagName" id="productTagName" type="text">
                              <button type="button" title="Add Tags" class=" button btn-add" onClick="submitTagForm()"> <span>Add Tags</span> </button>
                            </div>
                            <!--input-box--> 
                          </div>
                        </form>
                      </div>
                      <!--tags-->
                      <p class="note">Use spaces to separate tags. Use single quotes (') for phrases.</p>
                    </div>
                  </div>
                  <div class="tab-pane fade" id="reviews_tabs">
                    <div class="box-collateral box-reviews" id="customer-reviews">
                      <div class="box-reviews1">
                        <div class="form-add">
                          <form id="review-form" method="post" action="#">
                            <h3>Write Your Own Review</h3>
                            <fieldset>
                              <h4>How do you rate this product? <em class="required">*</em></h4>
                              <span id="input-message-box"></span>
                              <table id="product-review-table" class="data-table">
                                
                                <thead>
                                  <tr class="first last">
                                    <th>&nbsp;</th>
                                    <th><span class="nobr">1 *</span></th>
                                    <th><span class="nobr">2 *</span></th>
                                    <th><span class="nobr">3 *</span></th>
                                    <th><span class="nobr">4 *</span></th>
                                    <th><span class="nobr">5 *</span></th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr class="first odd">
                                    <th>Price</th>
                                    <td class="value"><input type="radio" class="radio" value="11" id="Price_1" name="ratings[3]"></td>
                                    <td class="value"><input type="radio" class="radio" value="12" id="Price_2" name="ratings[3]"></td>
                                    <td class="value"><input type="radio" class="radio" value="13" id="Price_3" name="ratings[3]"></td>
                                    <td class="value"><input type="radio" class="radio" value="14" id="Price_4" name="ratings[3]"></td>
                                    <td class="value last"><input type="radio" class="radio" value="15" id="Price_5" name="ratings[3]"></td>
                                  </tr>
                                  <tr class="even">
                                    <th>Value</th>
                                    <td class="value"><input type="radio" class="radio" value="6" id="Value_1" name="ratings[2]"></td>
                                    <td class="value"><input type="radio" class="radio" value="7" id="Value_2" name="ratings[2]"></td>
                                    <td class="value"><input type="radio" class="radio" value="8" id="Value_3" name="ratings[2]"></td>
                                    <td class="value"><input type="radio" class="radio" value="9" id="Value_4" name="ratings[2]"></td>
                                    <td class="value last"><input type="radio" class="radio" value="10" id="Value_5" name="ratings[2]"></td>
                                  </tr>
                                  <tr class="last odd">
                                    <th>Quality</th>
                                    <td class="value"><input type="radio" class="radio" value="1" id="Quality_1" name="ratings[1]"></td>
                                    <td class="value"><input type="radio" class="radio" value="2" id="Quality_2" name="ratings[1]"></td>
                                    <td class="value"><input type="radio" class="radio" value="3" id="Quality_3" name="ratings[1]"></td>
                                    <td class="value"><input type="radio" class="radio" value="4" id="Quality_4" name="ratings[1]"></td>
                                    <td class="value last"><input type="radio" class="radio" value="5" id="Quality_5" name="ratings[1]"></td>
                                  </tr>
                                </tbody>
                              </table>
                              <input type="hidden" value="" class="validate-rating" name="validate_rating">
                              <div class="review1">
                                <ul class="form-list">
                                  <li>
                                    <label class="required" for="nickname_field">Nickname<em>*</em></label>
                                    <div class="input-box">
                                      <input type="text" class="input-text" id="nickname_field" name="nickname">
                                    </div>
                                  </li>
                                  <li>
                                    <label class="required" for="summary_field">Summary<em>*</em></label>
                                    <div class="input-box">
                                      <input type="text" class="input-text" id="summary_field" name="title">
                                    </div>
                                  </li>
                                </ul>
                              </div>
                              <div class="review2">
                                <ul>
                                  <li>
                                    <label class="required " for="review_field">Review<em>*</em></label>
                                    <div class="input-box">
                                      <textarea rows="3" cols="5" id="review_field" name="detail"></textarea>
                                    </div>
                                  </li>
                                </ul>
                                <div class="buttons-set">
                                  <button class="button submit" title="Submit Review" type="submit"><span>Submit Review</span></button>
                                </div>
                              </div>
                            </fieldset>
                          </form>
                        </div>
                      </div>
                      <div class="box-reviews2">
                        <h3>Customer Reviews</h3>
                        <div class="box visible">
                          <ul>
                            <li>
                              <table class="ratings-table">
                                <colgroup>
                                <col width="1">
                                <col>
                                </colgroup>
                                <tbody>
                                  <tr>
                                    <th>Value</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                  <tr>
                                    <th>Quality</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                  <tr>
                                    <th>Price</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                </tbody>
                              </table>
                              <div class="review">
                                <h6><a href="#">Excellent</a></h6>
                                <small>Review by <span>Leslie Prichard </span>on 1/3/2014 </small>
                                <div class="review-txt"> I have purchased shirts from Minimalism a few times and am never disappointed. The quality is excellent and the shipping is amazing. It seems like it's at your front door the minute you get off your pc. I have received my purchases within two days - amazing.</div>
                              </div>
                            </li>
                            <li class="even">
                              <table class="ratings-table">
                                <colgroup>
                                <col width="1">
                                <col>
                                </colgroup>
                                <tbody>
                                  <tr>
                                    <th>Value</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                  <tr>
                                    <th>Quality</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                  <tr>
                                    <th>Price</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:80%;"></div>
                                      </div></td>
                                  </tr>
                                </tbody>
                              </table>
                              <div class="review">
                                <h6><a href="#/catalog/product/view/id/60/">Amazing</a></h6>
                                <small>Review by <span>Sandra Parker</span>on 1/3/2014 </small>
                                <div class="review-txt"> Minimalism is the online ! </div>
                              </div>
                            </li>
                            <li>
                              <table class="ratings-table">
                                <colgroup>
                                <col width="1">
                                <col>
                                </colgroup>
                                <tbody>
                                  <tr>
                                    <th>Value</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                  <tr>
                                    <th>Quality</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:100%;"></div>
                                      </div></td>
                                  </tr>
                                  <tr>
                                    <th>Price</th>
                                    <td><div class="rating-box">
                                        <div class="rating" style="width:80%;"></div>
                                      </div></td>
                                  </tr>
                                </tbody>
                              </table>
                              <div class="review">
                                <h6><a href="#/catalog/product/view/id/59/">Nicely</a></h6>
                                <small>Review by <span>Anthony  Lewis</span>on 1/3/2014 </small>
                                <div class="review-txt"> Unbeatable service and selection. This store has the best business model I have seen on the net. They are true to their word, and go the extra mile for their customers. I felt like a purchasing partner more than a customer. You have a lifetime client in me. </div>
                              </div>
                            </li>
                          </ul>
                        </div>
                        <div class="actions"> <a class="button view-all" id="revies-button" href="#"><span><span>View all</span></span></a> </div>
                      </div>
                      <div class="clear"></div>
                    </div>
                  </div>
                  
                  
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    
  </section>
  
  
  <section class="related-pro wow bounceInUp animated">
    <div class="container">
      <div class="slider-items-products">
        <div class="new_title center">
          <h2>Related Products</h2>
        </div>
        <div id="related-products-slider" class="product-flexslider hidden-buttons">
          <div class="slider-items slider-width-col4 products-grid">
            <c:set var="count" value="0"/>
            <c:forEach var="item" items="${list}">
		    <c:set var="count" value="${count+1}"/>
            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"><a href="productdetails?id=${item.id}" title="Retis lapen casen" class="product-image">
                  <img src="static/img/products/${item.id}/${item.img}"" alt="Retis lapen casen"></a>
                    
                    <div class="actions">
                      <div class="quick-view-btn"><a href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Quick View"> <span>Quick View</span></a></div>
                      <div class="link-wishlist"><a href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Wishlist"><span>Add to Wishlist</span></a></div>
                      <div class="link-compare"><a href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Compare"><span>Add to Compare</span></a></div>
                      <div class="add_cart">
                        <button class="button btn-cart" type="button" data-toggle="tooltip" data-placement="right" title="" data-original-title="Add to Cart"><span>Add to Cart</span></button>
                      </div>
                    </div>
                    <div class="rating">
                      <div class="ratings">
                        <div class="rating-box">
                          <div class="rating" style="width:80%"></div>
                        </div>
                        <p class="rating-links"><a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"><a href="#" title="Retis lapen casen">Retis lapen casen</a> </div>
                    <div class="item-content">
                      <div class="item-price">
                        <div class="price-box">
	                      <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-48" class="price"> 
	                      $<fmt:formatNumber value="${item.price*.8}" 
					       maxFractionDigits="2" minFractionDigits="2"/>
					      </span> </p>
	                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price">
	                      $<fmt:formatNumber value="${item.price}" maxFractionDigits="2" minFractionDigits="2"/>
	                       </span> </p>
	                      </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
            
            <!-- End Item --> 
            
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Related Products Slider End --> 
  
  
  
 				<div class="modal fade" id="edit">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	
						<div class="modal-header">
			                <h5 class="modal-">
			                Update  ${product.name}
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h5>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  <form:form action="editproduct" modelAttribute="product" method="post" role="form" enctype="multipart/form-data" > 
			    		  <fieldset class="group-select">
			              <ul>
			                <li id="billing-new-address-form">
			                  <fieldset>
			                    <ul>
			                    
			                      <li class="">
				                    <div class="">
			                          <label for="name">Name</label>
			                          <br>
			                          <form:input path="name" placeholder="Product Name" class="input-text" />
			                        </div>
				                  </li>
				                  
			                      <li>
			                        <div class="">
			                          <div class="input-box ">
			                            <label for="type"> Section <span class="required">*</span></label>
			                            <br>
			                            <form:input path="type" placeholder="Section like electronics etc" class="input-text" />
			                          </div>
			                          <div class="input-box">
			                            <label for="price"> Price<span class="required">*</span> </label>
			                            <br>
			                            <form:input path="price" placeholder="product Price" class="input-text" />
			                          </div>
			                          
			                        </div>
			                      </li>
			                      
				                  <li>
			                        <div class="">
			                          <div class="input-box">
			                            <label for="type"> Size <span class="required">*</span></label>
			                            <br>
			                            <form:select path="size" id="size" multiple="true" class="validate-select required-entry" required="required" > 
						                    <option value="" >${product.size}</option>
						                    <c:forEach items="${sizes}" var="item">
				                            <option value="${item}" > ${item}</option>
				                            </c:forEach>
				                      </form:select>
			                          </div>
			                          <div class="input-box">
			                            <label for="name"> Color<span class="required">*</span> </label>
			                            <br>
			                            <form:select path="color" id="color" multiple="true" class="input-text"  required="required" > 
					                    <option value="" >${product.color}</option>
					                    <c:forEach items="${cols}" var="item">			                        
				                        <option value="${item}" > ${item}</option>
					                    </c:forEach>
					                    </form:select>
			                          </div>
			                          
			                        </div>
			                      </li>
			                      <li class="">
			                        <label for="des">Description<em class="required">*</em></label>
			                        <br>
			                        <div style="float:none" class="">
			                          <form:textarea path="des"  placeholder="Description" class="input-text" cols="5" rows="5"  required="required"/>
			                         </div>
			                      </li>
			                      <li class="">
				                   <div class="input-box">
			                           <form:input path="file" type="file" class="input-text"  />
			                       </div>
			                       <div class="input-box">
			                           <form:input path="file" type="file" class="input-text"  />
			                       </div>
			                       <div class="input-box">
			                           <form:input path="file" type="file" class="input-text"  />
			                       </div>
			                       <div class="input-box">
			                           <form:input path="file" type="file" class="input-text"  />
			                       </div>   
				                  </li>
			                   
			                    </ul>
			                  </fieldset>
			                </li>
			                    <form:input type="hidden" path="id" /> 
			                    <form:input type="hidden" path="users_id" />
			                    <form:input type="hidden" path="img" />
			                    <form:input type="hidden" path="email"  />
			                <li class="buttons-set">
			                  <button type="submit" title="Submit" class="button submit"> <span> Submit </span> </button>
			                  <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger"><span aria-hidden="true">Close</span></button>
			                   
			                </li>
			              </ul>
			            </fieldset>
			            </form:form>
            
            
	                      
	                     </div>
					    </div>	
				      </div>
					  </div>			
                     
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

<script>
	    function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
	            } else {
	               return false;
	            }
	         }
   
</script>  
</body>
</html>