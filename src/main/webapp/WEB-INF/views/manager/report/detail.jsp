<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:formatDate value="${report.regDate }" pattern="yyyy-MM-dd" var="regDate" />
<table class="table table-bordered mt-2">
  <tr>
    <th>보고서번호</th>
    <td>${report.RNo }</td>
    <th>보고서 구분</th>
    <c:if test="${report.reType eq 1 }">
      <td>응급상황보고서</td>
    </c:if>
    <c:if test="${report.reType eq 2 }">
      <td>고객면담 보고서</td>
    </c:if>
    <c:if test="${report.reType eq 3 }">
      <td>건강상태 보고서</td>
    </c:if>
    <c:if test="${report.reType eq 4 }">
      <td>서비스 취소</td>
    </c:if>
    <c:if test="${report.reType eq 5 }">
      <td>장기부재</td>장기부재
    </c:if>
    <c:if test="${report.reType eq 6 }">
      <td>악성대상자신고</td>
    </c:if>
    <c:if test="${report.reType eq 7 }">
      <td>장비점검</td>
    </c:if>

  </tr>
  <tr>
    <th>작성자</th>
    <td>${report.name}
      <c:if test="${report.WType eq 2 }">[응급관리요원]</c:if>
      <c:if test="${report.WType eq 1 }">[생활지원사]</c:if>
    </td>
    <th>등록일</th>
    <td>2023-04-05</td>
  </tr>
  <tr>
    <th>대상자명</th>
    <td>${report.m_name }</td>
    <th></th>
    <td></td>
  </tr>
  <tr>
    <th>상담목적</th>
    <td>정기방문</td>
    <th>상담경로</th>
    <td>방문</td>
  </tr>
  <tr style="height:350px;vertical-align:middle;">
    <th>특이사항</th>
    <td colspan="3">${report.content }</td>
  </tr>
  <tr>
    <th>첨부파일</th>
    <td>
      ${report.reportfile.filename.split("\\$\\$")[1]}
	<c:if test="${empty report.reportfile }">
	 없음
	</c:if>
		<c:if test="${not empty report.reportfile }">
      <i class="bi bi-file-earmark-text-fill" onclick="location.href='<%=request.getContextPath() %>/ers/lsupporter/getFile?sfNo=${report.reportfile.sfNo }'"></i>
      </c:if>
    </td>
    <th>비고</th>
    <td>-</td>
  </tr>
</table>