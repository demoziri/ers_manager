<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="jobForm">
	<input type="hidden" name="page" value="" />
	<!-- <input type="hidden" name="perPageNum" value="" /> -->
	<input type="hidden" name="gu" value="" />
	<input type="hidden" name="dong" value="" />
	<input type="hidden" name="name" value="" />
	<input type="hidden" name="memType" value="" />
	
</form>
	<c:if test="${pageMaker.totalCount gt cri.perPageNum }">
	<nav aria-label="Navigation">
		<ul class="pagination justify-content-center m-0">
			<li class="paginate_button page-item ">
				<a href="javascript:list_go(1);" class="page-link">
					<i class="bi bi-chevron-double-left"></i>
				</a>
			</li>
			<li class="page-item">
				<a href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : cri.page});" class="page-link">
					<i class="bi bi-chevron-left"></i>
				</a>
			</li>	<!-- 단순반복(step 안주면 default:1) -->
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
				<li class="page-item ${cri.page == pageNum? 'active' : '' }">
					<a href="javascript:list_go(${pageNum })" class="page-link">
						${pageNum }
					</a>
				</li>
			</c:forEach>
			<li class="page-item">
				<a href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 : cri.page })" class="page-link">
					<i class="bi bi-chevron-right"></i>
				</a>
			</li>
			<li class="paginate_button page-item ">
				<a href="javascript:list_go(${pageMaker.realEndPage });" class="page-link">
					<i class="bi bi-chevron-double-right"></i>
				</a>
			</li>
			
		</ul>
	</nav>    
	</c:if>