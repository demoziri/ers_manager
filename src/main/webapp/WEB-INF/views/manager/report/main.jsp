<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="card card-body" style="border:1px solid red;height:250px;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">미처리 보고서</span>
          </div>
          <div class="h-100 row card card-body p-1">
            <!-- 장비 미처리 보고서 -->
            <div class="border h-100 col-6 d-inline-block pt-0">
              <div class="row text-center bg-success text-light"><span class="fs-5 border">장비 미처리 보고서</span></div>
              <div class="row h-75">
                <h3 class="d-flex m-0 justify-content-center align-items-center">N<span class="fs-4">&nbsp;건</span></h3>
              </div>
            </div>
            <!-- 대상자 미처리 보고서 -->
            <div class="border h-100 col-6 d-inline-block pt-0">
              <div class="row text-center bg-primary text-light"><span class="fs-5 border">대상자 미처리 보고서</span></div>
              <div class="row h-75"  onclick="location.href='../member/main'">
                <h3 class="d-flex m-0 justify-content-center align-items-center">N<span class="fs-4">&nbsp;건</span></h3>
              </div>
            </div>

          </div>
        </div>
      </div>
      <!-- 보고서 목록 -->
      <div class="row">
        <div class="card card-body" style="border:1px solid red;height:400px;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">보고서 목록</span>
          </div>
          <div>
            <select name="reType" id="" style="height:100%;">
              <option value="" selected>보고서 구분</option>
              <option value="">고객면담</option>
              <option value="">장비점검</option>
              <option value="">서비스취소</option>
              <option value="">악성대상자신고</option>
              <option value="">응급보고서</option>
            </select>
            &ensp;기간&nbsp;<input type="date" />&nbsp;-&nbsp;<input type="date" />
            <button type="submit" class="btn btn-primary btn-sm" style="width:100px;float:right;">조회</button>
          </div>
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
                <tbody style="overflow:auto;">
                  <tr onclick="reportDetail_go();">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                  <tr onclick="">
                    <td>2034</td>
                    <td>생활지원사</td>
                    <td>고객면담</td>
                    <td>이정호</td>
                    <td style="font-size:0.8rem;vertical-align:middle;">2023-05-14</td>
                    <td>미열람</td>
                  </tr>
                </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- 보고서 상세 -->
    <div class="col-7 h-100">
      <div class="card card-body" style="border:1px solid red;height:650px;">
        <div>
          <span class="fs-3" style="border-bottom:2px solid gray;">보고서 상세</span>
        </div>
		<div id="reDetail">
          	
        </div>
      </div>
    </div>

  </div>
</div>


<script>
	
	function reportDetail_go(){
		$.ajax({
			url:"detail",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#reDetail").html(data);
			}
		})
		
	}





</script>





<%@include file="../common/foot.jspf" %>