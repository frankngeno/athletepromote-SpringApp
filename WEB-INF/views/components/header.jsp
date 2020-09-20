<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
    <div class="header-container">
      <div class="header-top">
        <div class="container">
          <div class="row"> 
            <!-- Header Language -->
            <div class="col-xs-7 col-sm-6">
           <!--    <div class="dropdown block-language-wrapper hidden-xs"> <a role="button" data-toggle="dropdown" data-target="#" class="block-language dropdown-toggle" href="#"> <img src="static/images/english.png" alt="language"> English <span class="caret"></span> </a>
                <ul class="dropdown-menu" role="menu">
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="static/images/english.png" alt="language"> English </a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="static/images/francais.png" alt="language"> French </a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="static/images/german.png" alt="language"> German </a></li>
                </ul>
              </div> -->
              <!-- End Header Language --> 
              
              <!-- Header Currency -->
              
              <!-- End Header Currency -->
              
              <div class="welcome-msg hidden-l"> Welcome </div>
            </div>
            <div class="col-xs-5 col-sm-6"> 
              
<!--               <div class="top-cart-contain pull-right"> 
            Top Cart
            <div class="mini-cart">
              <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"><a href="#"  class="view-cart"> Shop <span class="cart_count"></span></a></div>
              <div>
                <div class="top-cart-content" style="display: none;">
                  <div class="actions">
                    <button class="btn-checkout" title="Checkout" type="button"><span>Checkout</span></button>
                    <a href="#" class="view-cart" ><span>View Cart</span></a> </div>
                  block-subtitle
                  <ul class="mini-products-list" id="cart-sidebar">
                    
                    <li class="item first">
                      <div class="item-inner"><a class="product-image" title="timi &amp; leslie Sophia Diaper Bag, Lemon Yellow/Shadow White" href="#l"><img alt="timi &amp; leslie Sophia Diaper Bag, Lemon Yellow/Shadow White" src="static/products-images/product.jpg"></a>
                        <div class="product-details">
                          <div class="access"><a class="btn-remove1" title="Remove This Item" href="#">Remove</a> <a class="btn-edit" title="Edit item" href="#"><i class="icon-pencil"></i><span class="hidden">Edit item</span></a> </div>
                          <p class="product-name"><a href="#"></a></p>
                        </div>
                      </div>
                    </li>
                    
                  </ul>
                  actions 
                </div>
              </div>
            </div>
            Top Cart
            <div id="ajaxconfig_info" style="display:none"><a href="#/"></a>
              <input value="" type="hidden">
              <input id="enable_module" value="1" type="hidden">
              <input class="effect_to_cart" value="1" type="hidden">
              <input class="title_shopping_cart" value="Go to shopping cart" type="hidden">
            </div>
          </div> -->
          
          <div class="top-search">
            <div class="block-icon pull-right"> <a data-target=".bs-example-modal-lg" data-toggle="modal" class="search-focus dropdown-toggle links"> <i class="fa fa-search"></i> </a>
              <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button aria-label="Close" data-dismiss="modal" class="close" type="button"><img src="static/images/interstitial-close.png" alt="close"> </button>
                    </div>
                    <div class="modal-body">
                      <form class="navbar-form" action="athletesearch" method="post">
                        <div id="search">
                          <div class="input-group">
                            <input name="keyword" placeholder="Search" class="form-control" type="text">
                            <button type="submit" class="btn-search"><i class="fa fa-search"></i></button>
                         <%--  	<c:if test="${!list.hasContent()}">
			    			<a href="athletes"> </a>
			    			</c:if> --%>
                          
                          </div>
                        </div>
                      </form>
                      
                 
                        
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          
              <!-- Header Top Links -->
              <div class="toplinks">
                <div class="links">
                
                <c:choose>
                <c:when test="${empty loggedInuser}">
                <div class="login"><a href="login" id="lg_id"><span class="hidden-xs">Log In</span></a></div>
	            <div class="login"><a href="register" id="sn_d"><span class="hidden-xs">Register</span></a></div>
                </c:when>
                <c:otherwise>
               
                <div class="myaccount"><a title="My Account" href="profile"><span class="hidden-xs">My Account</span></a></div>
                <c:if test="${role eq 'ADMIN' or role eq 'DBA'}">
                
                <div class="myaccount"><a title="Admin" href="admin"><span class="hidden-xs">Admin</span></a></div>
                           
                </c:if>
               
                <div class="myaccount"><a title="Members" href="users"><span class="hidden-xs">Members</span></a></div>
	        
	            <div class="myaccount"><a title="Logout" href="logout" id="logout_link"><span class="hidden-xs">Logout</span></a></div>
                
                </c:otherwise>
                </c:choose> 
                  <!-- Header Company -->
                  
                 </div>
                
              </div>
              <!-- End Header Top Links --> 
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  
    <nav>
    <div class="container">
        <div class="mm-toggle-wrap">
          <div class="mm-toggle"><i class="fa fa-reorder"></i><span class="mm-label">Menu</span> </div>
        </div>
     
          <ul class="nav hidden-xs menu-item menu-item-left">
            <li class="level0 parent drop-menu ${home}"><a href="home"><span>Home</span></a>
              
            </li>
            <li class="mega-menu ${about}"><a class="level-top" href="about"><span>About</span></a>
              
            </li>
            <li class="mega-menu ${contact}"><a class="level-top" href="contact"><span>Contact</span></a>
              
            </li>
            <li class="mega-menu ${athletes}"><a class="level-top" href="athletes"><span>Athletes</span></a>
              
            </li>
            </ul>
            
          
       
    </div>
  </nav>