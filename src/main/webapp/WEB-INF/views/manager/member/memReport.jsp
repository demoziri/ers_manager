<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="height:100%;width:100%;">
  <fmt:formatDate value="${report.regDate }" pattern="yyyy-MM-dd" var="regDate" />
  
  <table class="table table-bordered">
    <tr>
      <th>작성자</th>
      <td>${report.name}
      <c:if test="${report.WType eq 1 }">[응급관리요원]</c:if>
      <c:if test="${report.WType eq 2 }">[생활지원사]</c:if>
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
      <td>첨부파일.pdf<i class="bi bi-file-earmark-text-fill"></i></td>
      <th>비고</th>
      <td>-</td>
    </tr>
  </table>
</div>

<!-- 보고서 종류별 양식 만들어야함 -->