<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty reportList }">
<tr >
	<td colspan="6">조회된 보고서가 없습니다.</td>
</tr>
</c:if>


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
