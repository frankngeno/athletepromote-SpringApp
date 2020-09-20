									
								<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
							         
              
                                  <c:if test="${list.hasContent()}">	
					                 <div class="pages">
                  						<ul class="pagination">
							                        <c:set var="prev" value="0"/>
							                        <c:if test="${list.hasContent()}">
							                            <c:set var="prev" value="${list.getNumber()-1}"/>
							                        </c:if>
							                        <c:if test="${list.hasPrevious()}">
							                             <li class='page-item'>
							                                <a class="page-link" href="users?page=0&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-left margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>							                                
							                                <a class="page-link"href="users?page=${prev}&size=${list.getSize()}">
							                                <i class="fa fa-long-arrow-alt-left margin-5px-right xs-display-none"></i> Prev</a>
							                            </li>
							                        </c:if>
							                        
							                        <c:forEach var="i" begin="0" end="${list.totalPages -1}">
							                            <li class='page-item <c:if test="${list.getNumber() eq i || (empty list.getNumber() && i eq 0)}">active</c:if>'>
							                                <a class="page-link" href="users?page=${i}&size=${list.getSize()}">${i+1} </a>
							                            </li>
							                     
							                        </c:forEach>
							                        <c:if test="${list.hasNext()}">
							                            <li class='page-item'>
							                                <a class="page-link" href="users?page=${list.getNumber() + 1}&size=${list.getSize()}">Next
							                                <i class="fa fa-long-arrow-alt-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>
							                                <a class="page-link" href="users?page=${list.totalPages -1}&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                        </c:if>
							                     </ul>
               								 </div>
							            </c:if>	
							            					         
							        			