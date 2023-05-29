<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="게시물 내용"/>


	<!-- 대상자 상세정보 -->
      <div class="col-7">
    
        <div class="card card-body" style="border:2px dotted gray;height:400px;">
          <div style="position:relative;">
            <span class="fs-3" style="border-bottom:2px solid gray;">대상자 정보</span>
            <button type="button" class="btn btn-success" style="position:absolute;bottom:0;right:0;">신규 대상자 등록</button>
          </div>
          
          
          <div class="row" id="mem_Detail" style="height:100%;margin-top:5px;border:2px solid gray;">
            <!-- 대상자 사진 -->
            <div class="col-3 border">
              <div id="pictureView" class="manPicture mt-2" data-id="${member.id }" style="border: 1px solid green; height: 180px; width: 140px; margin: 0 auto;"></div>
              <div style="text-align:center;margin-top:10px;">
                <span class="fs-4">${member.name }</span><span>님</span>
              </div>
            </div>
            <!-- 대상자 상세정보 -->
            <div class="col-9 border">
              <table class="table table-bordered mb-0 mt-1" style="height:75%;">
                <tr>
                  <th>대상자 구분</th>
                  <td>${member.memType }</td>
                  <th>나이</th>
                  <c:set var="now" value="<%=new java.util.Date()%>" />
                  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
                  <c:set var="memberYear" value="19${member.birth.substring(0,2) }"/>
                  <fmt:parseNumber value = "${sysYear}" var = "now"/>
				  <fmt:parseNumber value = "${memberYear}" var = "mem"/>
                  <td>
				  	<span style="font-weight:bold;">${now - mem + 1 }</span>세
                  </td>
                </tr>
                <tr>
                  <th>성별</th>
                  <td>${member.gender }</td>
                  <th>전화번호</th>
                  <td>${member.phone }</td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td colspan="3">${member.address }</td>
                </tr>
                <tr>
                  <th>고위험도</th>
                  <td>${member.caution }</td>
                  <th>상태</th>
                  <c:if test="${member.status eq 1}">
                  <td>서비스 이용중</td>
                  </c:if>
                  <c:if test="${member.status eq 2}">
                  <td>장기부재</td>
                  </c:if>
                  <c:if test="${member.status eq 3}">
                  <td>해지</td>
                  </c:if>
                </tr>
                <tr>
                  <th>신청서</th>
                 
                  <td>${member.applyfile.filename.split("\\$\\$")[1]}<i class="bi bi-file-earmark-text-fill" onclick="location.href='<%=request.getContextPath() %>/ers/manager/member/getFile?id=${member.applyfile.id }'"></i></td>
                  <th>생활지원사</th>
                  <td id="lsName" style="text-align:center;">
                  <c:if test="${empty member.wid && member.machineCk eq 4}">
                    <button class="btn btn-primary btn-sm" id="openModalBtn"  style="height:25px;">배정하기</button>
                  </c:if>
                  <c:if test="${empty member.wid && member.machineCk ne 4}">
                    <button class="btn btn-danger btn-sm" id=""  style="height:25px;">배정불가</button>
                  </c:if>
                  	${member.w_Name}
                  </td>
                </tr>
                <tr>
                  <th>장비설치유무</th>
                  <c:if test="${member.machineCk eq 4}">
                  <td>설치완료</td>
                  </c:if>
                  <c:if test="${member.machineCk ne 4}">
                  <td>미설치</td>
                  </c:if>
                  <th></th>
                  <td>
                  </td>
                </tr>
                <tr>
                 <th>
                 	<button class="btn btn-danger btn-sm" id="openPhoneModal">비상연락망</button>
                 </th>
                  <td><span id="ecallCount" style="font-weight:bold;">${member.e_count }</span>/3</td>
                </tr>
              </table>
              <div >
                <button type="button" onclick="memModifyForm_go(${member.id });" class="btn btn-warning btn-sm my-1" style="float:right;color:white;">정보 수정</button>
              </div>
            </div>
          </div>
          </div>
        
      </div>
      <!-- 대상자 상세정보 끝-->
    </div>

    <div class="row">
      <!-- 보고서 목록 -->
      <div class="col-5" id="report_template">
      <form id="reportSearch" action="">
        <div class="card card-body pt-0 mt-3" id="report_form" style="border:1px solid gray;height:250px;">
          <div>
            <span class="fs-3" style="border-bottom:2px solid gray;">보고서 목록</span>
          </div>
          <div>
            <select name="reType" id="" style="height:100%;">
            <option value="" selected>보고서 구분</option>
            <option value="2">고객면담</option>
            <option value="7">장비점검</option>
            <option value="4">서비스취소</option>
            <option value="6">악성대상자신고</option>
            <option value="1">응급보고서</option>
            <option value="5">장기부재신청</option>
            <option value="3">건강상태</option>
          </select>
           &ensp;기간&nbsp;<input type="date" style="width:120px;" name="start_day" />&nbsp;-&nbsp;<input type="date" name="end_day" style="width:120px;" />
          <button type="button"  onclick="repList_go('${id}');"class="btn btn-primary btn-sm" style="width:50px;float:right;">조회</button>
        </div>
          <div id="re_List" style="height: 100%;width: 100%;margin-top: 5px;overflow-x: hidden;overflow: scroll;overflow-x: hidden;">
          
            <table class="table table-bordered  text-center re_table">
              <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                <tr>
                  <th>보고서번호</th>
                  <th>보고서구분</th>
                  <th>제출일</th>
                  <th>작성자구분</th>
                </tr>
                <thead>
                <tbody style="overflow:auto;" id="report_list">
                <c:if test="${empty reportList  }">
                 <div class="h-100 d-flex justify-content-center align-items-center" style="background-color:#dfdfdf;">
                 	등록된 보고서가 없습니다.
                 </div>
                 </c:if>
                 <c:if test="${not empty reportList }">
                <c:forEach items="${reportList }" var="report">
                <fmt:formatDate value="${report.regDate }" pattern="yyyy-MM-dd" var="regDate" />
                  <tr onclick="memReport_go('${report.RNo }');">
                    <td>${report.RNo }</td>
                    <c:if test="${report.reType eq 1 }">
                    <td>응급상황</td>
                    </c:if>
                    <c:if test="${report.reType eq 2 }">
                    <td>고객면담</td>
                    </c:if>
                    <c:if test="${report.reType eq 3 }">
                    <td>건강상태</td>
                    </c:if>
                    <c:if test="${report.reType eq 4 }">
                    <td style="color:red;font-weight:bold;">서비스취소</td>
                    </c:if>
                    <c:if test="${report.reType eq 5 }">
                    <td style="color:red;font-weight:bold;">장기부재</td>
                    </c:if>
                    <c:if test="${report.reType eq 6 }">
                    <td style="color:red;font-weight:bold;">악성대상자신고</td>
                    </c:if>
                    <c:if test="${report.reType eq 7 }">
                    <td>장비점검</td>
                    </c:if>
                    <td>${regDate }</td>
                    <c:if test="${report.WType eq 2 }">
                    <td>응급관리요원</td>
                    </c:if>
                    <c:if test="${report.WType eq 1 }">
                    <td>생활지원사</td>
                    </c:if>
                  </tr>
                 </c:forEach>
                </c:if>
                </tbody>
            </table>
                  <input type="hidden" name="id" value="${id}" />
          	
			
          </div>
        </div>
        </form>
      </div>
        <!-- 보고서 목록 끝 -->
      
    <!-- 보고서 상세 끝 -->
  </div>
  
  
 
  
  
  
<%@include file="../common/foot.jspf" %>