<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="clearboth">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/mangoplate-logo-horizontal.svg" alt="anff �ΰ�" />
    </div>
    <div class="search">
      <form action="">
        <input type="text" id="keyword"/>
        <div class="icon_w"><i class="fa fa-search" aria-hidden="true"></i></div>
        <div class="optionBox hidden">
          <ul class="optionTab clearboth">
            <li class="on">�з�</li>
            <li>��ġ</li>
            <li>���ݴ�</li>
          </ul>
          <div class="select clearboth tab_1">
         	<c:forEach items="${cateList}" var="t">
         		<c:out value="cc" /> ${t.no}
         	</c:forEach>
            <div>
              <label for="foodtype_1">�ѽ�</label>
              <input id="foodtype_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_2">�н�</label>
              <input id="foodtype_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_3">���</label>
              <input id="foodtype_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_4">�˽�</label>
              <input id="foodtype_4" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="checkedtype_1">�߽�</label>
              <input id="checkedtype_1" type="checkbox" class="hidden" />
            </div>
          </div>
          <!-- tab_1 -->
          <div class="select clearboth tab_2 hidden">
            <div>
              <label for="foodtype_1">������</label>
              <input id="foodtype_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_2">��������</label>
              <input id="foodtype_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_3">��걸</label>
              <input id="foodtype_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_4">������</label>
              <input id="foodtype_4" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="checkedtype_1">���ʱ�</label>
              <input id="checkedtype_1" type="checkbox" class="hidden" />
            </div>

          </div>
          <!-- tab_2 -->
          <div class="select clearboth tab_3 hidden">
            <div>
              <label for="foodtype_1">1���� �̸�</label>
              <input id="foodtype_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_2">1������</label>
              <input id="foodtype_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_3">2������</label>
              <input id="foodtype_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_4">3������</label>
              <input id="foodtype_4" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="checkedtype_1">4���� �̻�</label>
              <input id="checkedtype_1" type="checkbox" class="hidden" />
            </div>

          </div>
          <!-- tab_3 -->

          <div class="userselect">
              <div>
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
            </div>
            <!-- userselect-->
        </div>
      </form>
    </div>
    <div class="float_r">
      <ul>
        <li><a href="#">���ֺ�����</a></li>
        <li><a href="#">NFF Awards</a></li>
        <li><i class="fa fa-bell-o" aria-hidden="true"></i></li>
        <li><i class="fa fa-user-o" aria-hidden="true"></i></li>

      </ul>
    </div>
  </header>