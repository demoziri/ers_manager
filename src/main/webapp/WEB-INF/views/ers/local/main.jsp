<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/lheader.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row m-0 pt-3 h-100">
   <div class="col-12">
      <div class="row m-0 h-30">
         <div class="col-6">
            <div class="card h-96">
               <div class="card-header border-0">
                  <h3 class="card-title"><i class="fa-solid fa-bell bell_color pr-3"></i>금일 총 응급발생 처리현황</h3>
                  <a href="${pageContext.request.contextPath}/ers/local/emergencyReport/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
               </div>
               <div class="card-body pb-0">
                  <div class="row justify-content-around" id="emergencyRepotListView">
                  
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6">
            <div class="card h-96">
               <div class="card-header border-0">
                  <h3 class="card-title"><i class="fa-solid fa-person dashboard_icon pr-3"></i>총 응급요원 수<span class="total_emanager_count">${emanager_totalCount}</span></h3>
                  <a href="${pageContext.request.contextPath }/ers/local/emanager/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
               </div>
               <div class="card-body pb-0">
                  <div class="row justify-content-around" id="emanagerListView">
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="row m-0 h-30">
         <div class="col-6">
            <div class="card h-96">
               <div class="card-header border-0">
                  <h3 class="card-title"><i class="fa-solid fa-bell bell_color pr-3"></i>대상자 활동현황</h3>
                  <a href="censorCheck/list?gubunVal=active" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
               </div>
               <div class="card-body pb-0">
                  <div class="row justify-content-around" id="personViewList">
                  
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6">
            <div class="card h-96">
               <div class="card-header border-0">
                  <h3 class="card-title"><i class="fa-solid fa-note-sticky dashboard_icon pr-3"></i>공지사항</h3>
                  <a href="${pageContext.request.contextPath }/ers/local/notice/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
               </div>
               <div class="card-body pb-0">
                  <div class="row justufy-content-center">
                     <table class="table-bordered w-100" style="font-size:0.3rem;">
                        <colgroup>
                           <col width="15%">
                           <col>
                           <col width="15%">
                        </colgroup>
                           <tbody>
                           <tr>
                                 <th class="pl-1 pr-1 text-center">공지번호</th>
                                 <th class="pl-1 pr-1">제목</th>
                                 <th class="pl-1 pr-1">작성일</th>
                              </tr>
                           <c:forEach var="notice" items="${noticeList}">
                              <tr>
                                 <th class="pl-1 pr-1 text-center">${notice.nno }</th>
                                 <td class="pl-1 pr-1">${notice.title }</td>
                                 <td class="pl-1 pr-1">
                                    <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/>
                                 </td>
                              </tr>
                           </c:forEach>
                           </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--  --><div class="row m-0 h-40">
         <div class="col-6">
            <div class="card h-96">
               <div class="card-header border-0">
                  <h3 class="card-title"><i class="fa-solid fa-house dashboard_icon pr-3"></i>점검 대상(가구) 장비 및 상태</h3>
                  <a href="householdCheck/list" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
               </div>
               <div class="card-body pb-0">
                  <div class="row justufy-content-center">
                     <table class="table-bordered w-100" style="font-size:0.3rem;">
                        <colgroup>
                           <col width="20%">
                           <col>
                           <col width="14%">
                           <col width="14%">
                        </colgroup>
                           <tbody>
                              <tr class="btn-secondary active">
                                 <th class="text-center pt-1 pb-1">대상자 이름</th>
                                 <th class="text-center">주소</th>
                                 <th class="text-center">점검장비</th>
                                 <th class="text-center">점검 분류</th>
                              </tr>
                              <c:forEach var="household" items="${householdList }">
                              <tr style="font-size:0.73rem;">
                                 <th class="text-center pt-2 pb-2">${household.m_name }</th>
                                 <td class="text-center">${household.address}</td>
                                 <td class="text-center">${household.ma_name}</td>
                                 <td class="text-center">${household.mstatus}</td>
                              </tr>
                              </c:forEach>
                              <c:if test="${householdList eq null || householdList.size() eq 0 }">
                              <tr>
                                 <td colspan="4" class="text-center py-2" style="font-size: 1rem;">점검대상 가구가 없습니다.</td>
                              </tr>
                              </c:if>
                           </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6">
            <div class="card h-96">
               <div class="card-header border-0">
                  <h3 class="card-title"><i class="fa-solid fa-wrench dashboard_icon pr-3"></i>댁내 장비 현황</h3>
                  <a href="${pageContext.request.contextPath }/ers/local/equipment/localList" class="float-right color-inherit"><i class="fa-solid fa-plus pr-2"></i>더보기</a>
               </div>
               <div class="card-body pb-0">
                  <div class="row justufy-content-center">
                     <table class="table-bordered w-100" style="font-size:0.3rem;">
                        <colgroup>
                           <col width="12.5%">
                           <col width="12.5%">
                           <col width="12.5%">
                           <col width="12.5%">
                           <col width="12.5%">
                           <col width="12.5%">
                           <col width="12.5%">
                           <col width="12.5%">
                        </colgroup>
                           <tbody>
                              <tr class="btn-secondary active">
                                 <th class="text-center pt-1 pb-1">장비</th>
                                 <th class="text-center">총 보유량</th>
                                 <th class="text-center">수신</th>
                                 <th class="text-center">미수신</th>
                                 <th class="text-center">연결해제</th>
                                 <th class="text-center">고장</th>
                                 <th class="text-center">재고</th>
                                 <th class="text-center">정상 가동률(%)</th>
                              </tr>
                              <c:forEach var="equipment" items="${equipmentList }">
                                 <tr style="font-size:0.73rem; font-weight:bold;">
                                    <th class="text-center pt-2 pb-2">${equipment.m_name}</th>
                                    <td class="text-center">${equipment.totalCount}</td>
                                    <td class="text-center text-green">${equipment.receive}</td>
                                    <td class="text-center ${equipment.noreceive eq 0 ? '' : 'text-red' }">${equipment.noreceive}</td>
                                    <td class="text-center ${equipment.unconnect eq 0 ? '' : 'text-red' }">${equipment.unconnect}</td>
                                    <td class="text-center ${equipment.trouble eq 0 ? '' : 'text-red' }">${equipment.trouble}</td>
                                    <td class="text-center">${equipment.stock}</td>
                                    <td class="text-center text-blue">${equipment.equipmentPercent}</td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
       -->
   </div>

</div>
<%@ include file="/WEB-INF/views/include/handlerLocal.jspf" %>
<%@ include file="/WEB-INF/views/include/lfooter.jspf"%>