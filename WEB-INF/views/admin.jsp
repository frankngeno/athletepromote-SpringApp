
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "java.util.*" %>
<c:if test="${role eq 'USER'}">
<c:redirect url="/accessdenied"/>
<!-- <jsp:forward page="accessdenied.jsp"/> -->
</c:if>


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
             <h3>  Users 
             </h3> 
			 <hr>
          </div>
          
          <form class="form-inline" action="lookups" method="post" class="col-md-5">
			    <input id="searchnow" class="input-text required-entry" type="text" name="name" placeholder="Name">
			    <input class="input-text required-entry" type="email" name="email" placeholder="E-Mail">
			    <button class="btn btn-success btn-md" type="submit">Search </button>
			    <c:if test="${empty list}">
			    <a href="users" class="btn btn-info">Refresh <i class="fa fa-refresh"></i></a>
			    </c:if>
			  </form>
			  
          <div class="table-responsive">
            
              <fieldset>
                <table class="data-table " id="shopping-cart-table">
                  <thead>
                    <tr class="first last">
                      <th>#</th>
					 <th>Image</th>
					 <th>Name</th>
					 <th>Email</th>
					 <c:if test="${role eq 'ADMIN' || role eq 'DBA'}">
					 <th>Roles</th>					 
					 <th>Action</th>
					 </c:if>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <c:forEach var="item" items="${list}">
				    <tr class="text-body">
					<td>${list.indexOf(item)+1}.
					</td>	
					<td class="image">
					
					<c:choose>
					<c:when test="${not empty item.image}">
					<img class="product-image" src="static/img/users/${item.id}/profile/${item.image}" 
						 alt="${item.fname} ${item.lname}" style="width: 50px; height: 45px; border-radius: 50%;">
					</c:when>
					<c:when test="${not empty item.fileType}">
					<img src="data:${item.fileType};base64,${Base64.getEncoder().encodeToString(item.getData())}" 
			  		style="width: 50px; height: 45px; border-radius: 50%;" class="img-responsive">
					</c:when>
					<c:otherwise>
					
					<c:if test="${empty user_account.fileType && empty item.image}">
					<i class="fa fa-image"></i>
					</c:if>
					</c:otherwise>
					</c:choose>
					</td>
					<td><h2 class="product-name">${item.fname} ${item.lname}</h2></td>	
					<td><h2 class="product-name">${item.email}</h2></td>	
					<c:if test="${role eq 'ADMIN' || role eq 'DBA'}">
					<td>
					<form method="POST" action="editrole" >		    									
							<input type="hidden" name="id" value="${item.id}" />		    	 
							<select onchange="this.form.submit()" name="role"  class="input-text required-entry">
							<option value="${item.role}">${item.role}</option>
							<option value="USER">USER </option>
							<option value="DBA">DBA</option>
							<option value="ADMIN">ADMIN</option>												  
						 </select>												
					 </form>
					</td>					
					<td>
					<a class="button remove-item" title="Remove item"  href="removeuser?id=${item.id}" onclick="confirmed(); return false;" title="Delete member ${item.fname} ${item.lname}" class="btn btn-danger"> 
					<span><span>Remove item</span></span></a>
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
        
      </div>
    </div>
  </section>
  </div>
  <br>
  <!-- Footer -->  
     <jsp:include page="components/footer.jsp"/>
     
		<c:forEach var="item" items="${list}">
            <div class="modal fade" id="edits${item.id}">
					    <div class="modal-dialog modal-sm">
						<div class="modal-content">	
						<div class="modal-header">
			                <h5 class="modal-">Edit User</h5>
			                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
			    		  <form:form action="updateUsers" modelAttribute="user" method="post">
			                  <div class="form-group">
			                    <label for="fn">Name</label><br>
			                    <form:input path="fname"  value="${item.fname}" class="input-text required-entry" placeholder="First Name"/>
			                    <form:input type="hidden" path="id" value="${item.id}" class="input-text required-entry" />
			                  </div>
			                  <div class="form-group">
			                    <label for="lname">Last Name</label><br>
			                    <form:input path="lname"  value="${item.lname}" class="input-text required-entry" placeholder="Last Name"/>			                    
			                  </div>
			                  <div class="form-group">
			                    <label for="role">Role</label><br>
			                    	<form:select path="role" class="input-text required-entry">
			                    	<option value="${item.role}">${item.role}</option>
			                    	<option value="USER">USER</option>
									<option value="DBA">DBA</option>
									<option value="ADMIN">ADMIN</option>
									</form:select>
			                  </div>
			                  <div>
			                    <button type="submit" class="btn btn-primary"><i class="fa fa-user"></i> Save</button>
			                    <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger">Close</button>
			                  </div>
			                </form:form>
			    		  
	                     </div>
					    </div>	
				      </div>
					  </div>
           			 </c:forEach>
<!-- JavaScript --> 

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