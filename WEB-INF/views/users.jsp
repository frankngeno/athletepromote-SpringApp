
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "java.util.*" %>


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

<title>Members</title>

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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

</head>

<body class="customer-account-login inner-page">
<div id="page"> 
  
  <!-- Header -->
  <jsp:include page="components/header.jsp"/>
  <!-- end header --> 
  
  
  <section class="main-container col1-layout">
    <div class="main container">
      <div class="col-main">
        
          <div class="page-title">
             <h3> Page ${list.getNumber()+1} of ${list.totalPages} showing ${list.content.size()} of all ${list.getTotalElements()} Users 
             </h3> 
			 <hr>
          </div>
          
          <form class="form-inline" action="lookups" method="post" class="col-md-5">
			    <input id="searchnow" class="input-text required-entry" type="text" name="name" placeholder="Name">
			    <input class="input-text required-entry" type="email" name="email" placeholder="E-Mail">
			    <button class="btn btn-success btn-md" type="submit">Search </button>
			    <c:if test="${!list.hasContent()}">
			    <a href="users" class="btn btn-info">Refresh <i class="fa fa-refresh"></i></a>
			    </c:if>
			  </form>
			  
          <div class="table-responsive">
            
              <fieldset>
                <table class="data-table " id="shopping-cart-table">
                  <thead>
                    <tr class="first last">
                      <th>#</th>
					 <th>Image <i class="fa fa-image"></i></th>
					 <th>Athlete <i class="fa fa-users"></i></th>
					 <th>Video <i class="fa fa-play"></i></th>
					 <th>Email <i class="fa fa-envelope"></i></th>
					 <c:if test="${role eq 'ADMIN' || role eq 'DBA'}">
					 <th>Roles <i class="fa fa-unlock-alt"></i></th>					 
					 <th>Action <i class="fa fa-pencil"></i></th>
					 </c:if>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <c:forEach var="item" items="${list.content}">
				    <tr class="text-body">
					<td>${list.content.indexOf(item)+1}.
					</td>	
					<td class="image">
					
					<c:choose>
					<c:when test="${not empty item.image}">
					<img class="product-image" src="static/img/users/${item.id}/profile/${item.image}" 
						 alt="${item.fname} ${item.lname}" style="width: 125px; height: 145px; border-radius: 10%;">
					</c:when>
					<c:when test="${not empty item.fileType}">
					<img src="data:${item.fileType};base64,${Base64.getEncoder().encodeToString(item.getData())}" 
			  		style="width: 125px; height: 145px; border-radius: 10%;" class="img-responsive">
					</c:when>
					<c:otherwise>
					
					<c:if test="${empty user_account.fileType && empty item.image}">
					<i class="fa fa-image"></i>
					</c:if>
					</c:otherwise>
					</c:choose>
					
					</td>
					<td>
					<a href="#" data-toggle="modal" data-target="#about${item.id}" ><i class="fa fa-user"></i>
					${item.fname}  ${item.lname} 
					</a>
                     
                     <c:if test="${role eq 'ADMIN' or role eq 'DBA'}">
                     <a href="#" data-toggle="modal" data-target="#prof${item.id}" class="btn btn-secondary"><i class="fa fa-eye"></i></a>
                    </c:if>
                    
					</td>
					<td>
					<c:if test="${not empty item.video}">
                    Video <a href="#" data-toggle="modal" data-target="#playvideo${item.id}" class="btn btn-secondary"> <i class="fa fa-play"></i></a> 
                    </c:if>
                    <c:if test="${empty item.video}">
                    No Video
                    </c:if>
					</td>	
					<td><h2 class="product-name">${item.email}</h2></td>	
					<c:if test="${role eq 'ADMIN' || role eq 'DBA'}">
					<td>
					<form method="POST" action="editrole" >		    									
							<input type="hidden" name="id" value="${item.id}" />		    	 
							<select onchange="this.form.submit()" name="role"  class="input-text required-entry" required>
							<option value="">
							<c:forEach var="r" items="${item.getRoles()}">
				    		 ${r.role}
				    	     </c:forEach>
							</option>
							<option value="USER">USER </option>
							<option value="DBA">DBA</option>
							<option value="ADMIN">ADMIN</option>												  
						 </select>												
					 </form>
					</td>					
					<td>
					<a class="button remove-item" title="Remove item"  href="removeuser?id=${item.id}" onclick="confirmed(); return false;" title="Delete member ${item.fname} ${item.lname}" class="btn btn-danger"> 
					<span><span>Remove item</span></span>
					</a>
                    <a href="#" data-toggle="modal" data-target="#edits${item.id}" class="btn btn-secondary"><i class="fa fa-pencil"></i></a> 
                    </td>	
                    </c:if>		
				</tr>
				</c:forEach>
                    
                  </tbody>
                </table>
                
              </fieldset>
          
         </div>
         
         
         <br>
          <jsp:include page="components/pagination.jsp"/>
      </div>
    </div>
    
               <c:forEach var="item" items="${list.content}">
               <div class="modal fade" id="about${item.id}">
					    <div class="modal-dialog modal-sm">
						<div class="modal-content">	
						<div class="modal-header">
			              <h5 class="modal-">User Info
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h5> 
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
	                      <div class="text-secondary">	
			    		  <h4><b>${item.fname} ${item.lname}</b></h4>
			    		  <h5>	
			    		     <c:if test="${not empty item.getAddress()}">            
				             <i class="fa fa-home text-success"> </i>
				             ${item.getAddress().street},
							 ${item.getAddress().city},
							 ${item.getAddress().state}
							 ${item.getAddress().country}<br>
							 </c:if>
							 <i class="fa fa-envelope"></i> ${item.email}<br>
							 <c:forEach var="fone" items="${item.getPhoneBook()}">
				    		 <i class="fa fa-phone-square text-success"> </i>
				    		 <span> ${fone.tel} </span> 
				    	     </c:forEach><br><i class="fa fa-lock text-success"> </i> Roles
				    	     <c:forEach var="r" items="${item.getRoles()}">
				    		 <span> ${r.role} <i class="fa fa-check-square text-success"> </i></span> 
				    	     </c:forEach><br>
				    	   </h5>   
					      </div>		             
			    		  <div class="buttons-set">
			                  <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger">Close</button>
			                </div>
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
			               <b>${item.fname} ${item.lname} Video</b>
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			                </h5>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  <video width="850" height="400" controls>
						  <source src="static/img/users/${item.id}/videos/${item.video}" type="video/mp4">
						  </video>
	                     </div>
					    </div>	
				      </div>
					  </div>
			</c:forEach>		  
					  
  </section>
  <br>
<jsp:include page="components/footer.jsp"/>

		<c:forEach var="item" items="${list.content}">
            <div class="modal fade" id="edits${item.id}">
					    <div class="modal-dialog modal-md">
						<div class="modal-content">	
						     
						<!-- Modal body -->
						<div class="modal-body">	
						<div  class="fieldset">		    		
			    		  <form:form action="updatemyinfo" modelAttribute="user" method="post" id="form-validate" >
			               
			                  <input name="id" type="hidden" value="${item.id}" >
			                  <h2 class="legend">Edit Information</h2><hr>
			                  <ul class="form-list">
			                    <li class="fields">
			                      <div class="customer-name">
			                        <div class="input-box">
			                          <label for="firstname">First Name<span class="required">*</span></label>
			                          <div class="input-box1">
			                            <input type="text" id="firstname" name="fname" value="${item.fname}"  title="" maxlength="255" class="input-text required-entry">
			                          </div>
			                        </div>
			                        <div class="input-box">
			                          <label for="lastname">Last Name<span class="required">*</span></label>
			                          <div class="input-box1">
			                            <input type="text" id="lastname" name="lname" value="${item.lname}"  title="" maxlength="255" class="input-text required-entry">
			                          </div>
			                        </div>
			                        <div class="field">
				                      <div class="input-box">
				                        <label for="role">Roles<em class="required">*</em></label>
				                        <br>
				                        <form:select path="role" class="validate-select required-entry">
				                    	<option value="${item.role}">${item.role}</option>
				                    	<option value="USER">USER</option>
										<option value="DBA">DBA</option>
										<option value="ADMIN">ADMIN</option>
										</form:select>
							            </div>
				                    </div>			                    
			                     </div>
			                    </li>
			                    
			                  </ul>
			                	                
			                <div class="buttons-set">
			                  <p class="required">* Required Fields</p>
			                  <button type="submit" title="Save" class="btn btn-info"><span>Save</span></button>
			                  <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger">Close</button>
			                </div>
			              </form:form>
		                </div>
		             
	                     </div>
					    </div>	
				      </div>
					  </div>
           			 </c:forEach>
           			 
           <c:forEach var="item" items="${list.content}">
            <div class="modal fade" id="prof${item.id}">
					    <div class="modal-dialog modal-md">
						<div class="modal-content">	
						     
						<!-- Modal body -->
						<div class="modal-body">	
						<div  class="fieldset">	
						
						<div class="product-essential">
				                 <h3> ${item.fname} ${item.lname}</h3>
				                <div class="product-img-box col-sm-5 col-xs-12">
				                 
				                  <c:if test="${not empty item.image}">
				                  <div class="product-image">
				                    <div class="large-image"> <a href="#" class="cloud-zoom" id="zoom1"> 
				                    <img src="static/img/users/${item.id}/profile/${item.image}" alt="image" 
				                    style="width:125px; height:145px;" class="img-responsive"> </a> </div>
				                   
                  				  </div>
                  				  </c:if>
				                  <!-- end: more-images --> 
				                </div>
				                <div class="product-shop col-sm-7 col-xs-12">
				             
				                   <div class="short-description">
				                   
				                    <p> ${item.getAddress().bio} <br>
				                     <i class="fa fa-home"></i> ${item.getAddress().street} ${item.getAddress().city} ${item.getAddress().country}<br>
				                     <i class="fa fa-envelope"></i> ${item.email} 
				                     </p>
				                     <c:if test="${not empty item.getAthleteStats()}">
				                     <table class="data-table " id="shopping-cart-table">
					                  <thead>
					                    <tr class="first last">
					                     <th>#</th>
										 <th>Race </th>
										 <th>Location</th>
										 <th>Time</th>
										 <th>Position</th>
					                    </tr>
					                  </thead>
					                  
					                  <tbody>
					                  <c:forEach var="r" items="${item.getAthleteStats()}">
					                  <tr>
					                  <td>${r.id}</td>
					                  <td>${r.races}</td>
					                  <td>${r.loc}</td>
					                  <td>${r.timetaken}</td>
					                  <td>${r.position}</td>
					                  </tr>
					                  </c:forEach>
					                  </tbody>
					                  </table>
					                  </c:if>
				                     
				                  </div>
				                  <div class="add-to-box">
				                    <div class="email-addto-box">
				                      <p class="email-friend"><a href="#" class=""><span>Contact Friend</span></a></p>
				                      
				                    </div>
				                  </div>
				                  
				                </div>
				              
				            </div>
							    		
			    	   
		                </div>
		              <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger">Close</button>
	                     </div>
					    </div>	
				      </div>
					  </div>
           			 </c:forEach>
<!-- JavaScript --> 
</div>
<script type="text/javascript" src="static/js/jquery.min.js"></script> 
<script type="text/javascript" src="static/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="static/js/parallax.js"></script> 
<script type="text/javascript" src="static/js/common.js"></script> 
<script type="text/javascript" src="static/js/jquery.flexslider.js"></script> 
<script type="text/javascript" src="static/js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="static/js/jquery.mobile-menu.min.js"></script> 
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
        	    
	    $("#searchnow").keyup(function () {
	        var value = this.value.toLowerCase().trim();
	        $("table tr").each(function (index) {
	            if (!index) return;
	            $(this).find("td").each(function () {
	                var id = $(this).text().toLowerCase().trim();
	                var not_found = (id.indexOf(value) == -1);
	                $(this).closest('tr').toggle(!not_found);
	                return not_found;
	            });
	        });
	    });

</script>  
</body>
</html>