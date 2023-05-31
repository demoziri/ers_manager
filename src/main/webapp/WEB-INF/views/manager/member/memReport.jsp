<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div  style="height:100%;width:100%;margin-top:10px;">
  <fmt:formatDate value="${report.regDate }" pattern="yyyy-MM-dd" var="regDate" />

  <div>
    <span class="fs-3" style="border-bottom:2px solid gray;">보고서 상세</span>
    &ensp;
    <span id="reportName" style="font-weight:bold;color:#4191B3">
    	<c:if test="${report.reType eq 1 }">응급상황 보고서</c:if>
    	<c:if test="${report.reType eq 2 }">고객면담 보고서</c:if>
    	<c:if test="${report.reType eq 3 }">건강상태 보고서</c:if>
    	<c:if test="${report.reType eq 4 }">서비스 취소</c:if>
    	<c:if test="${report.reType eq 5 }">장기부재</c:if>
    	<c:if test="${report.reType eq 6 }">악성대상자신고</c:if>
    	<c:if test="${report.reType eq 7 }">장비점검</c:if>
    </span>
  </div>
  <div id="reportDetail" style="height:100%;width:100%;">
    <table class="table table-bordered">
      <tr>
        <th>작성자</th>
        <td>${report.name}
          <c:if test="${report.WType eq 2 }">[응급관리요원]</c:if>
          <c:if test="${report.WType eq 1 }">[생활지원사]</c:if>
        </td>
        <th>등록일</th>
        <td>${regDate }</td>
      </tr>
      <tr style="height:100px;vertical-align:middle;">
        <th>특이사항</th>
        <td colspan="3">${report.content }</td>
      </tr>
      <tr>
        <th>첨부파일</th>
        <td>
        ${report.reportfile.filename.split("\\$\\$")[1]}
        
        
        <i class="bi bi-file-earmark-text-fill" onclick="location.href='<%=request.getContextPath() %>/ers/lsupporter/getFile?sfNo=${report.reportfile.sfNo }'"></i></td>
        <th>비고</th>
        <td>-</td>
      </tr>
    </table>
  </div>
  <!-- 보고서 상세가 여기로 오겠지 -->
</div>

<!-- 보고서 종류별 양식 만들어야함 -->