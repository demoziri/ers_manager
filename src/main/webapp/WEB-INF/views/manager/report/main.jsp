<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="보고서 관리" />
<%@include file="../common/head.jspf" %>

<style>
  .mem_table>tbody>tr:hover {
    background-color: lightblue;
  }

  .re_table>tbody>tr:hover {
    background-color: lightblue;
  }
</style>


<div class="container-fluid">
  <div class="row">
    <div class="col-5">
      <!-- 미처리 보고서 -->
      <div class="row">
        <div class="card card-body border-0 mt-2" style="height:250px;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">미열람 보고서</span>
          </div>
          <div class="h-100 row card card-body  p-1">
            <!-- 장비 미처리 보고서 -->
            <div class="border h-100 col-6 d-inline-block pt-0">
              <div class="row text-center bg-success text-light"><span class="fs-5 border">장비 미열람 보고서</span></div>
              <div class="row h-75">
                <h3 class="d-flex m-0 justify-content-center align-items-center">${machineReportCount }<span class="fs-4">&nbsp;건</span></h3>
              </div>
            </div>
            <!-- 대상자 미처리 보고서 -->
            <div class="border h-100 col-6 d-inline-block pt-0">
              <div class="row text-center bg-primary text-light"><span class="fs-5 border">대상자 미열람 보고서</span></div>
              <div class="row h-75"  onclick="location.href='../member/main'">
                <h3 class="d-flex m-0 justify-content-center align-items-center">${memberReportCount}<span class="fs-4">&nbsp;건</span></h3>
              </div>
            </div>

          </div>
        </div>
      </div>
      <!-- 보고서 목록 -->
      <div class="row">
        <div class="card card-body mt-1" style="border:1px solid gray;height:400px;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">보고서 목록</span>
          </div>
          <form role="searchReport">
          <div class="mb-1">
          	<select name="viewcheck" onchange="viewcheck_go(this.value)">
          		<option value="" ${viewcheck eq 'selected' ? 'selected' : "" }>선택</option>
          		<option value="0" ${viewcheck eq '0' ? 'selected' : "" }>미열람</option>
          		<option value="1" ${viewcheck eq '1' ? 'selected' : "" }>열람</option>
          	</select>
            <select name="reType" onchange="reTypeCheck_go(this.value)" style="height:100%;" >
              <option value=""  ${cri.reType eq 'selected' ? 'selected' : "" }>보고서 구분</option>
              <option value="2" ${cri.reType eq '2' ? 'selected' : "" }>고객면담</option>
              <option value="7" ${cri.reType eq '7' ? 'selected' : "" }>장비점검</option>
              <option value="4" ${cri.reType eq '4' ? 'selected' : "" }>서비스취소</option>
              <option value="6" ${cri.reType eq '6' ? 'selected' : "" }>악성대상자신고</option>
              <option value="1" ${cri.reType eq '1' ? 'selected' : "" }>응급보고서</option>
              <option value="3" ${cri.reType eq '3' ? 'selected' : "" }>건강상태</option>
              <option value="5" ${cri.reType eq '5' ? 'selected' : "" }>장기부재</option>
            </select>
            &ensp;기간&nbsp;<input type="date" name="start_day" />&nbsp;-&nbsp;<input type="date" name="end_day"/>
            <button type="button"  onclick="searchReportList_go();" class="btn btn-primary btn-sm" style="width:50px;float:right;">조회</button>
          </div>
          </form>
          <div id="re_List" style="overflow:scroll;overflow-x:hidden;">

            <table class="table table-bordered  text-center re_table">
              <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                <tr>
                  <th>보고서번호</th>
                  <th>작성자구분</th>
                  <th>보고서구분</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>열람여부</th>
                </tr>
                <thead>
                <tbody style="overflow:auto;" id="searchReportList">
                  <c:if test="${not empty reportList }">
                <c:forEach items="${reportList }" var="report">
                <fmt:formatDate value="${report.regDate }" pattern="yyyy-MM-dd" var="regDate" />
                  <tr onclick="reportDetail_go('${report.RNo}');">
                    <td style="font-size:0.8rem;">${report.RNo }</td>
                    <c:if test="${report.WType eq 2 }">
                    <td style="font-size:0.8rem;">응급관리요원</td>
                    </c:if>
                    <c:if test="${report.WType eq 1 }">
                    <td style="font-size:0.8rem;">생활지원사</td>
                    </c:if>
                    <c:if test="${report.reType eq 1 }">
                    <td style="font-size:0.8rem;">응급상황</td>
                    </c:if>
                    <c:if test="${report.reType eq 2 }">
                    <td style="font-size:0.8rem;">고객면담</td>
                    </c:if>
                    <c:if test="${report.reType eq 3 }">
                    <td style="font-size:0.8rem;">건강상태</td>
                    </c:if>
                    <c:if test="${report.reType eq 4 }">
                    <td style="color:red;font-weight:bold;font-size:0.8rem;">서비스취소</td>
                    </c:if>
                    <c:if test="${report.reType eq 5 }">
                    <td style="color:red;font-weight:bold;font-size:0.8rem;">장기부재</td>
                    </c:if>
                    <c:if test="${report.reType eq 6 }">
                    <td style="color:red;font-weight:bold;font-size:0.8rem;">악성대상자신고</td>
                    </c:if>
                    <c:if test="${report.reType eq 7 }">
                    <td>장비점검</td>
                    </c:if>
                    <td style="font-size:0.8rem;">${report.name }</td>
                    <td style="font-size:0.8rem;">${regDate }</td>
                    <c:if test="${report.viewCheck eq 1 }">
                    <td>열람</td>
                    </c:if>
                    <c:if test="${report.viewCheck eq 0 }">
                    <td>미열람</td>
                    </c:if>
                    
                  </tr>
                 </c:forEach>
                </c:if>
                </tbody>
            </table>
          </div>
          
        </div>
      </div>
    </div>
    <!-- 보고서 상세 -->
    <div class="col-7 h-100">
      <div class="card card-body mt-2" style="border:1px solid gray;height:650px;">
        <div>
          <span class="fs-3" style="border-bottom:2px solid gray;">보고서 상세</span>
        </div>
		
        <div class="row" id="reDetail" style="height:100%;margin-top:5px;background-color:#dfdfdf;">
          <!-- 보고서 상세정보 들어갈 자리 -->
          <div class="h-100 d-flex justify-content-center align-items-center">보고서를 선택해주세요.</div>
       </div>
   
      </div>
    </div>

  </div>
</div>






<script>
	
	function reportDetail_go(rno){
		$.ajax({
			url:"detail?rno="+rno,
			type:"get",
			datatype:"html",
			success:function(data){
				$("#reDetail").css('background-color', "");
				$("#reDetail").html(data);
			}
		})
		
	}
	
	function viewcheck_go(viewcheck){
		
		$.ajax({
			url:"searchReport?viewcheck="+viewcheck,
			type:"get",
			dataType:"text",
			success:function(data){
				$("#searchReportList").html(data);
			}
		})
	}
	
	
	
	function searchReportList_go(){
		var data = $('form[role=searchReport]').serialize();
		
		
		$.ajax({
			url:"searchReport",
			type:"get",
			data:data,
			dataType:"text",
			success:function(data){
				$("#searchReportList").html(data);
			}
		})
		
		
	}


	function reTypeCheck_go(reType){
		
		$.ajax({
			url:"searchReport?reType="+reType,
			type:"get",
			dataType:"text",
			success:function(data){
				$("#searchReportList").html(data);
			}
		})
	}



</script>





<%@include file="../common/foot.jspf" %>