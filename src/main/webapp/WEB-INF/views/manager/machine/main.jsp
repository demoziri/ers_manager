<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="장비 관리" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<%@include file="../common/head.jspf" %>

<c:set var="stockList" value="${dataMap.stockList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.machineCri }" />



<div class="container-fluid">
  <!-- 장비보유현황 -->
  <div class="row bg-primary bg-secondary" style="height:80px; line-height:80px;">
		<div class="col-5" >
			<h1 class="align-self-center " style="line-height:80px; color:white; margin-left:20px; font-size:25px;">장비 보유 현황</h1>
		</div>
		<div class="col-7" style="">
			<div class="row" style="position:relative; height:90%; align-items:center;">
				<div class="col-3 text-center" style="line-height:normal;">
					<i class="bi bi-lightning" style="color:white; font-size:50px; "></i>
					<div class="d-inline-block" >
						<div style="color:white; font-size:16px;">센서 총 개수</div>
						<div style="color:white; font-size:25px;">300개</div>
					</div>
				</div>
				<div class="col-3 text-center" style="line-height:normal;">
					
					<i class="fa-solid fa-fire"style="color:white; font-size:50px; "></i>
					
					
					<div class="d-inline-block" >
						<div style="color:white; font-size:16px;">화재감지기</div>
						<div style="color:white; font-size:25px;">100개</div>
					</div>
				</div>
				<div class="col-3 text-center" style="line-height:normal;">
					<i class="bi bi-person-check" style="color:white; font-size:50px; "></i>
					<div class="d-inline-block" >
						<div style="color:white; font-size:16px;">활동량 감지기</div>
						<div style="color:white; font-size:25px;">100개</div>
					</div>
				</div>
				<div class="col-3 text-center" style="line-height:normal;">
					<i class="bi bi-door-open" style="color:white; font-size:50px;"></i>
					<div class="d-inline-block" >
						<div style="color:white; font-size:16px;">출입문 감지기</div>
						<div style="color:white; font-size:25px;">100개</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  <div class="row mt-2">
    <div class="col-8">
      <!-- 미처리 업무 -->
      <div class="row" style="height:250px;">

        <div>
          <span class="fs-3" style="border-bottom:2px solid gray;">미처리 업무</span>
        </div>

        <!-- 장비재고 부족 -->
        <div class="col-6">
          <div class="card card-body" style="border:1px solid;height:220px;">
            <div>
              <span class="fs-5" style="border-bottom:2px solid gray;">재고요청</span>
            </div>
            <div id="" style="overflow:scroll;overflow-x:hidden;">

              <table class="table table-bordered  text-center re_table">
                <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                  <tr>
                    <th>장비명</th>
                    <th>요청일자</th>
                    <th>수행기관</th>
                  </tr>
                  <thead>
                  <tbody style="overflow:auto;">
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>둔산동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>활동량감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>괴정동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>출입문감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>갈마동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>둔산동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>활동량감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>괴정동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>출입문감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>갈마동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>둔산동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>활동량감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>괴정동센터</td>
                    </tr>
                    <tr onclick="">
                      <td>출입문감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                      <td>갈마동센터</td>
                    </tr>

                  </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- AS 요청내역 -->
        <div class="col-6">
          <div class="card card-body" style="border:1px solid;height:220px;">
            <div>
              <span class="fs-5" style="border-bottom:2px solid gray;">AS요청</span>
            </div>
            <div id="" style="overflow:scroll;overflow-x:hidden;">

              <table class="table table-bordered  text-center re_table">
                <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                  <tr>
                    <th style="width:30%;">수행기관</th>
                    <th style="width:20%;">건수</th>
                    <th style="width:50%;">누적기간</th>
                  </tr>
                  <thead>
                  <tbody style="overflow:auto;">
                  <c:forEach items="${asList }" var="AS">
                    <tr onclick="">
                      <td>${as.c_name }</td>
                      <td>${as.asRequestCnt }</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">
	                      <fmt:formatDate value="${as.week_start }" pattern="yyyy-MM-dd" var="week_start" />
	                       ~
	                      <fmt:formatDate value="${as.week_end }" pattern="yyyy-MM-dd" var="week_end" />
                       </td>
                    </tr>
                  </c:forEach>
                    <tr onclick="">
                      <td>괴정동센터</td>
                      <td>8건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>갈마동센터</td>
                      <td>2건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>둔산동 센터</td>
                      <td>12건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>괴정동센터</td>
                      <td>8건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>갈마동센터</td>
                      <td>2건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>둔산동 센터</td>
                      <td>12건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>괴정동센터</td>
                      <td>8건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>갈마동센터</td>
                      <td>2건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>둔산동 센터</td>
                      <td>12건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>괴정동센터</td>
                      <td>8건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                    <tr onclick="">
                      <td>갈마동센터</td>
                      <td>2건</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14 ~ 2023-05-20</td>
                    </tr>
                  </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- 장비조회 -->
      <div class="row mt-2">
        <div class="col-12 mt-1">
          <div class="row">
            <div>
              <span class="fs-3" style="border-bottom:2px solid gray;">장비 조회</span>
            </div>
            <div class="mb-1">
              <select name="gu" onchange="dongList_go(this.value)" style="height:100%;width:100px;">
                <option value="" ${cri.gu eq 'selected' ? 'selected' : "" }>지역구 선택</option>
                <option value="중구" ${cri.gu eq '중구' ? 'selected' : "" }>중구</option>
                <option value="동구" ${cri.gu eq '동구' ? 'selected' : "" }>동구</option>
                <option value="서구" ${cri.gu eq '서구' ? 'selected' : "" }>서구</option>
                <option value="대덕구" ${cri.gu eq '대덕구' ? 'selected' : "" }>대덕구</option>
                <option value="유성구" ${cri.gu eq '유성구' ? 'selected' : "" }>유성구</option>
              </select>
              <select id="dongList" name="dong" style="height:100%;width:100px;">
                <option value="" selected>동 선택</option>
              </select>
              <button onclick="list_go(1);" class="btn btn-primary btn-sm" style="width:100px;">조회</button>
            </div>
          </div>
          <div class="card card-body" style="border:1px solid;height:235px;">
            <div id="memList">
              <table class="table table-bordered border-2 mt-1 text-center mem_table">
                <thead style="background-color:#dfdfdf;">
                  <tr>
                    <th>지역구</th>
                    <th>수행기관</th>
                    <th>화재감지센서</th>
                    <th>활동량감지센서</th>
                    <th>출입문감지센서</th>
                  </tr>
                  <thead>
                  <tbody class="table-group-divider">
                    <%-- <fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd" var="regDate" /> --%>
                    <c:forEach items="${stockList }" var="stock">
                    <tr>
                      <td>${stock.l_name }</td>
                      <td>${stock.c_name }</td>
                      <td>${stock.firesensor }</td>
                      <td>${stock.activesensor }</td>
                      <td>${stock.doorsensor }</td>
                    </tr>
                    </c:forEach>
                    
                  </tbody>
              </table>
            </div>
            <%@ include file="/WEB-INF/views/manager/module/pagination.jsp" %>
          </div>
        </div>
      </div>

    </div>

    <!-- 장비 재고 -->
    <div class="col-4">
      <div>
        <span class="fs-3" style="border-bottom:2px solid gray;">보유재고</span>
      </div>
      <div class="card card-body" style="border:1px solid;height:532px;">
      	<ul class="nav nav-tabs" >
		  <li class="nav-item" >
      	  
		    <a class="nav-link text-dark"  style="border:1px solid;"aria-current="page" href="#">전체</a>
	
		  </li>
		  
		  <li class="nav-item">
		    <a class="nav-link text-dark" style="border:1px solid; href="#">화재감지기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link text-dark" style="border:1px solid; href="#">출입문감지기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link text-dark" style="border:1px solid; href="#">활동량감지기</a>
		  </li>
		</ul>
		<div id="" style="overflow:scroll;overflow-x:hidden;height:300px;">
              <table class="table table-bordered  text-center re_table">
                <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                  <tr>
                    <th style="width:30%;">장비명</th>
                    <th style="width:60%;">일련번호</th>
                    <th style="width:10%;">선택</th>
                  </tr>
                  <thead>
                  <tbody style="overflow:auto;">
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                    <tr onclick="">
                      <td>화재감지기</td>
                      <td style="font-size:0.8rem;vertical-align:middle;">2345</td>
                      <td>
                      	<input type="checkbox" />
                      </td>
                    </tr>
                  </tbody>
              </table>
            </div>
		
		
      </div>
    </div>

  </div>

</div>

<script>
function list_go(page, url) {
    if (!url) url = "main";
    var page = $("form#jobForm input[name='page']").val(page);
   
    var gu = $("form#jobForm input[name='gu']").val($('select[name="gu"]').val());
    var dong = $("form#jobForm input[name='dong']").val($('select[name="dong"]').val());
    
    $('form#jobForm').attr({
      action: url,
      method: 'get'
    }).submit();
  }



</script>






<%@include file="../common/foot.jspf" %>