<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="clearboth">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/mangoplate-logo-horizontal.svg" alt="anff �ΰ�" />
    </div>
    <div class="search">
      <form name="sto_search" action="#" method="post">
        <input type="text" id="keyword"/>
        <div class="icon_w"><i class="fa fa-search" aria-hidden="true"></i></div> <!-- �˻� ��ư �κ� -->
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
	              <label for="foodtype_${t.categoryNo}">${t.categoryName}</label>
	              <input id="foodtype_${t.categoryNo}" type="checkbox" class="hidden" />
	            </div>
         	</c:forEach>
          </div>
          <!-- tab_1 -->
          
          <div class="select clearboth tab_2 hidden">
          	<!-- ������ �� �˻� -->
          	<c:forEach items="${cityList}" var="ct" varStatus="status">
	            <div>
	              <label for="city_${status.count}">${ct}</label>
	              <input id="city_${status.count}" type="checkbox" class="hidden" />
	            </div>
          	</c:forEach>
          </div>
          <!-- tab_2 -->
          
          
          <div class="select clearboth tab_3 hidden">
          	<!-- ���ݺ� �˻� -->
            <div>
              <label for="price_1">1���� �̸�</label>
              <input id="price_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="price_2">1������</label>
              <input id="price_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="price_3">2������</label>
              <input id="price_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="price_4">3���� �̻�</label>
              <input id="price_4" type="checkbox" class="hidden" />
            </div>

          </div>
          <!-- tab_3 -->

          <div class="userselect"> <!-- �˻� ���� ���ý� �Ѿ�´� -->
             <!--  <div>
                <label for="checkedtype_2">�߽�<i class="fa fa-times" aria-hidden="true"></i></label>
                <input id="checkedtype_2" type="checkbox" checked class="hidden" />
              </div>
  
              <div>
                <label for="foodtype_5">���ʱ�<i class="fa fa-times" aria-hidden="true"></i></label>
                <input id="foodtype_5" type="checkbox" checked class="hidden" />
                
              </div>
              <div>
                <label for="checkedtype_3">3������<i class="fa fa-times" aria-hidden="true"></i></label>
                <input id="checkedtype_3" type="checkbox" checked class="hidden" />
              </div>
            </div> -->
            <!-- userselect-->
        </div>
      </form>
    </div>
    <div class="float_r">
      <ul>
        <li><a href="#">���ֺ�����</a></li>
        <li><a href="#">NFF Awards</a></li>
        <li><i class="fa fa-bell-o" aria-hidden="true"></i></li>
        <li id="person_btn"><i class="fa fa-user-o" aria-hidden="true"></i>
		<!-- �˾� (�α��� X) -->
		<div class="pop_person nMember hidden">
			<div class="topshape"></div>
			<div>
				�α��� ��<br />
				�̿� �����մϴ�
			</div>
			<div>
				<ul>
				<li><a href="#">�α����ϱ�</a></li>
				</ul>
			</div>
		</div>
		</li>

      </ul>
    </div>
  </header>