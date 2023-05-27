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

<style>
  .nav-link {
    color: black;
  }

  .active {
    background-color: #4191B3 !important;
    color: white !important;
  }
</style>

<div class="container-fluid">
  <!-- 장비보유현황 -->
  <div class="row bg-primary bg-secondary" style="height:80px; line-height:80px;">
    <div class="col-4">
      <h1 class="align-self-center " style="line-height:80px; color:white; margin-left:20px; font-size:25px;">장비 보유 현황</h1>
    </div>
    <div class="col-8" style="">
      <div class="row" style="position:relative; height:90%; align-items:center;">
        <div class="col-1 "></div>
      	<div class="col-1 "></div>
        <div class="col-2 text-center" style="line-height:normal;">
          <i class="bi bi-lightning" style="color:white; font-size:50px; "></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:13px;">센서 총 개수</div>
            <div style="color:white; font-size:23px;">${totalCount.totalCount }</div>
          </div>
        </div>
        <div class="col-2 text-center" style="line-height:normal;">
        
          <i class="bi bi-robot" style="color:white; font-size:50px; "></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:13px;">게이트웨이</div>
            <div style="color:white; font-size:20px;">${totalCount.gateway }</div>
          </div>
        </div>
        <div class="col-2 text-center" style="line-height:normal;">
          <i class="fa-solid fa-fire" style="color:white; font-size:50px; "></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:13px;">화재감지기</div>
            <div style="color:white; font-size:20px;">${totalCount.firesensor }</div>
          </div>
        </div>
        <div class="col-2 text-center" style="line-height:normal;">
          <i class="bi bi-person-check" style="color:white; font-size:50px; "></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:13px;">활동감지기</div>
            <div style="color:white; font-size:20px;">${totalCount.activesensor }</div>
          </div>
        </div>
        <div class="col-2 text-center" style="line-height:normal;">
          <i class="bi bi-door-open" style="color:white; font-size:50px;"></i>
          <div class="d-inline-block">
            <div style="color:white; font-size:13px;">출입문 감지기</div>
            <div style="color:white; font-size:20px;">${totalCount.doorsensor }</div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-8">
      <!-- 미처리 업무 -->
      <div class="row mt-3" style="height:250px;">

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
                      <fmt:formatDate value="${AS.week_start }" pattern="yyyy-MM-dd" var="start" />
                      <fmt:formatDate value="${AS.week_end }" pattern="yyyy-MM-dd" var="end" />
                      <tr onclick="asDetail_go('${start }','${end }','${AS.cnum }');">
                        <td>${AS.c_name }</td>
                        <td>${AS.asRequestCnt }</td>
                        <td style="font-size:0.8rem;vertical-align:middle;">
                          ${start } ~ ${end }
                        </td>
                      </tr>
                    </c:forEach>

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
              <span class="fs-3 mt-3" style="border-bottom:2px solid gray;">장비 조회</span>
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
    <div class="col-4 mt-3">
      <div id="template_button">
        <span class="fs-3 " id="template_title" style="border-bottom:2px solid #dfdfdf;">보유재고</span>
      </div>
      <div class="card card-body py-0 px-0" style="height:532px; border:1px solid gray;" >
        <!-- nav-tab들어갈 자리 -->
        <div>
          <ul class="nav nav-tabs">
            <li class="nav-item" style="width:17%;font-size:0.8rem;">
              <a class="nav-link active" onclick="machineList_go('');" id="allLink" style="background-color: #4191B3;text-align:center;">전체</a>
            </li>
            <li class="nav-item" style="width:20%;font-size:0.73rem;">
              <a class="nav-link" onclick="machineList_go('M01');" id="gateLink">게이트웨이</a>
            </li>
            <li class="nav-item" style="width:20%;font-size:0.73rem;">
              <a class="nav-link" onclick="machineList_go('M04');" id="fireLink">화재감지기</a>
            </li>
            <li class="nav-item" style="width:23%;font-size:0.73rem;">
              <a class="nav-link" onclick="machineList_go('M03');" id="doorLink">출입문감지기</a>
            </li>
            <li class="nav-item" style="width:20%;font-size:0.73rem;text-align:center;">
              <a class="nav-link" onclick="machineList_go('M02');" id="activityLink">활동감지기</a>
            </li>
          </ul>
        </div>
        
        <div class="w-100" id="asDetail" style="height:300px;overflow:scroll;overflow-x:hidden;">
        </div>
        <div  style="height:232px; background-color:#dfdfdf;">
        </div>
        
      </div>

    </div>

  </div>

  <script type="text/x-handlebars-template" id="as-list-template">
    <table class="table table-bordered text-center as_table">
 	 <thead style="background-color:#dfdfdf;position:sticky;top:0;">
    <tr>
      <th style="width:30%;">장비명</th>
      <th style="width:20%;">일련번호</th>
      <th style="width:40%;">요청일자</th>
      <th style="width:10%;">선택</th>
    </tr>
  </thead>
  <tbody style="overflow:auto;">
    {{#each .}}
    <tr onclick="">
      <td>{{mc_name}}</td>
      <td style="vertical-align:middle;">{{mnum}}</td>
      <td>{{asSendFormatted}}</td>
      <td>
        <input type="checkbox" />
      </td>
    </tr>
    {{/each}}
  </tbody>
</table>
</script>


<script type="text/x-handlebars-template" id="machine-list-template">
    <table class="table table-bordered text-center machine_table">
 	 <thead style="background-color:#dfdfdf;position:sticky;top:0;">
    <tr>
      <th style="width:30%;">장비명</th>
      <th style="width:20%;">일련번호</th>
      <th style="width:40%;">등록일자</th>
    </tr>
  </thead>
  <tbody style="overflow:auto;">
    {{#each .}}
    <tr onclick="">
      <td>{{mc_name}}</td>
      <td style="vertical-align:middle;">{{mnum}}</td>
      <td>{{redDateFormatted}}</td>
    </tr>
    {{/each}}
  </tbody>
</table>
</script>




  <script>
    var allLink = document.getElementById("allLink");
    var fireLink = document.getElementById("fireLink");
    var doorLink = document.getElementById("doorLink");
    var gateLink = document.getElementById("gateLink");
    var activityLink = document.getElementById("activityLink");
    allLink.addEventListener("click", function() {
      setActiveLink(allLink);
    });
    fireLink.addEventListener("click", function() {
      setActiveLink(fireLink);
    });
    doorLink.addEventListener("click", function() {
      setActiveLink(doorLink);
    });
    activityLink.addEventListener("click", function() {
      setActiveLink(activityLink);
    });
    gateLink.addEventListener("click", function() {
      setActiveLink(gateLink);
    });

    function setActiveLink(link) {
      var links = document.getElementsByClassName("nav-link");
      for (var i = 0; i < links.length; i++) {
        links[i].classList.remove("active");
        links[i].style.color = "black";
        links[i].style.backgroundColor = "";
      }
      link.classList.add("active");
      link.style.color = "white";
      link.style.backgroundColor = "#4191B3";
    }
  </script>

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

    
    function asDetail_go(start, end, cnum) {
    	  $('#template_title').remove("#template_button");
    	  data = {
    	    "week_start": start,
    	    "week_end": end,
    	    "cnum": cnum
    	  };
    	  $.ajax({
    	    url: "asDetail",
    	    type: "get",
    	    data: data,
    	    success: function(data) {
    	      // 날짜 형식 변환
    	      data.forEach(function(item) {
    	        var date = new Date(item.asSend);
    	        var year = date.getFullYear();
    	        var month = String(date.getMonth() + 1).padStart(2, '0');
    	        var day = String(date.getDate()).padStart(2, '0');
    	        item.asSendFormatted = year + '-' + month + '-' + day;
    	      });
    	      let template = Handlebars.compile($('#as-list-template').html());
    	      let html = template(data);
    	      $('#asDetail').html(html);

    	      $('#template_title').text("AS 요청 상세");

    	      // Check if the button already exists
    	      if ($('#list').length === 0) {
    	        // Add new button tag
    	        $('#template_button').append("<button id='list' type='button' onclick='machineList_go();' class='btn btn-warning btn-sm mt-1' style='float:right;align-items:center;'>보유재고보기</button>");
    	      }
    	    }
    	  });
    	}
    
    window.onload=function(){
    	machineList_go('');
    }
    
	function machineList_go(mcode){
    	
    	$.ajax({
    		url:"machineList?mcode="+mcode,
    		type:"get",
    		success:function(data){
  	        // 날짜 형식 변환
  	          data.forEach(function(item) {
  	            var date = new Date(item.regDate);
  	            var year = date.getFullYear();
  	            var month = String(date.getMonth() + 1).padStart(2, '0');
  	            var day = String(date.getDate()).padStart(2, '0');
  	            item.redDateFormatted = year + '-' + month + '-' + day;
    			});
  	        let template = Handlebars.compile($('#machine-list-template').html());
            let html = template(data);
            $('#asDetail').html(html);
    		}
    	});
    }
   
    
    
    
    
  </script>

  <%@include file="../common/foot.jspf" %>