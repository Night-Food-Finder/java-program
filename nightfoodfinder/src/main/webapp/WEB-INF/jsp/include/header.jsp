<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<header class="clearboth">
    <div class="logo" onclick="location.href='${pageContext.request.contextPath}/front/main/main.do'">
        <img src="${pageContext.request.contextPath}/resources/images/mangoplate-logo-horizontal.svg" alt="anff �ΰ�" />
    </div>
    <div class="search">
    <form id="sto_search" action="${pageContext.request.contextPath}/front/store/storelist.do" method="post">
    	<!-- �˻��� �Է� �κ� -->
		<input type="text" name="keyword"/>
		 <!-- �˻� ��ư �κ� -->
        <div class="icon_w" id="search_btn"><button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button></div>
        <div class="optionBox hidden">
        	<ul class="optionTab clearboth">
            	<li class="on">�з�</li>
            	<li>��ġ</li>
            	<li>���ݴ�</li>
        	</ul>
        	
        	<div class="select clearboth tab_1">
          		<!-- ī�װ� �� �˻�-->
         		<c:forEach items="${cateList}" var="t" >
	        		<div>
	            		<label for="foodtype_${t.categoryNo}" class="types">${t.categoryName}</label>
	            		<input id="foodtype_${t.categoryNo}" name="categoryCode" value="${t.categoryNo}" type="checkbox" class="hidden" />
	            	</div>
         		</c:forEach>
            </div>
          	<!-- tab_1 -->
          
          	<div class="select clearboth tab_2 hidden">
          		<!-- ������ �� �˻� -->
          		<c:forEach items="${cityList}" var="ct" varStatus="status">
	            	<div>
	              		<label for="city_${status.count}" class="types">${ct}</label>
	              		<input id="city_${status.count}" name="cities" value="${ct}" type="checkbox" class="hidden" />
	            	</div>
          		</c:forEach>
          	</div>
          	<!-- tab_2 -->
          
          
          	<div class="select clearboth tab_3 hidden">
          		<!-- ���ݺ� �˻� -->
          		<c:forEach items="${priceList}" var="price" varStatus="status">
	            	<div>
	              		<label for="price_${status.count}" class="types">${price.priceType}</label>
	              		<input id="price_${status.count}" type="checkbox" name="priceTypeNo" value="${price.priceTypeNo}" class="hidden" />
	            	</div>
          		</c:forEach>
          	</div>
          <!-- tab_3 -->

          	<div class="closedstore"> 
	      		<label for="closed" class="types">���� ������ ���Ե� �����ϱ�</label>
	      		<input id="closed" type="checkbox" name="includeClosed" value="1" class="price hidden"  />
          	</div> 
          <!-- userselect-->
		</div>
	</form>
    </div>
    <div class="float_r">
      <ul>
        <li><a href="#">���ֺ�����</a></li>
        <li><a href="${pageContext.request.contextPath}/front/award/awardlist.do">NFF Awards</a></li>
     <%--    <c:if test="${loginUser && loginStore}"> --%>
	        <li id="notice_btn" data-user="${loginUser}" data-store="${loginStore}">
	        	<i class="fa fa-bell-o" aria-hidden="true" ></i>
<!-- 	        	�� �˸� ���� �ѷ��� span
	        	<span class="newnotice"></span> -->
	        	<!-- �˸� ����Ʈ ���� div -->
	        	<div class="notice_list_box hidden">
		        	<div class="topshape"></div>
				    <!-- �˸� ����Ʈ ���� div -->
		        	<div class="notice_content">
	
		        	</div>
	        	</div>
	        </li>
        <%-- </c:if> --%>
        
        <li id="person_btn"><i class="fa fa-user-o" aria-hidden="true"></i>
		<!-- �˾� (�α��� X) -->
		<div class="pop_person nMember hidden">
	        <div class="topshape"></div>
	        <c:choose>
	        <c:when test="${loginUser != null}">
	        <div>
	        	<div id="history_box"></div>
	        	<label>
				<a href="${pageContext.request.contextPath}/front/login/userdetail.do?no=${loginUser.userNo}">MY PAGE</a>
	        	</label>
	        </div>
	        </c:when>
	        <c:when test="${loginStore != null}">
	        <div>
				<a href="${pageContext.request.contextPath}/front/store/storedetail.do?no=${loginStore.storeNo}">MY PAGE</a>
	        </div>
	        </c:when>
	        <c:otherwise>
	        <div>
	        	�α��� ��<br />
				�̿� �����մϴ�
	        </div>
	        </c:otherwise>
	        </c:choose>
	        
	        <div>
	           <c:choose>
				<c:when test="${loginUser != null}">
				<ul>
					<li><a href="${pageContext.request.contextPath}/front/login/logout.do">�α׾ƿ�</a></li>
				</ul>
				</c:when>
				<c:when test="${loginStore != null}">
				<ul>
					<li><a href="${pageContext.request.contextPath}/front/login/logout.do">�α׾ƿ�</a></li>
				</ul>
				</c:when>
				<c:otherwise>
	            <ul>
	                <li><a href="${pageContext.request.contextPath}/front/login/userLoginForm.do">�α��� / ȸ������</a></li>
	            </ul>
				</c:otherwise>
	           </c:choose>
	        </div>
	    </div>
		</li>
      </ul>
    </div>
  </header>
  <script type="text/javascript">
  /* if (window.sessionStorage) {
      console.dir(sessionStorage);
  } */
	let context = '${pageContext.request.contextPath}';
</script>
  <script src='${pageContext.request.contextPath}/resources/js/header.js' ></script>
  