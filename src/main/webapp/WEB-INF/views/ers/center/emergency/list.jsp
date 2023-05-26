<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
    /*Modal*/
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin-top: 5%;
        margin-left: 34%;
        padding: 20px;
        border: 1px solid #888;
        width: 900px;
        ;
        height: 845px;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    /* bottom-nav */
    .relative {
        position: relative;
    }

    .btm-nav {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        display: flex;
        width: 100%;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        padding-bottom: env(safe-area-inset-bottom);
        height: 4rem;
        --tw-bg-opacity: 1;
        background-color: hsl(var(--b1)/var(--tw-bg-opacity));
        color: currentColor;
    }

    .btm-nav>*:not(.active) {
        padding-top: 0.125rem;
    }

    .btm-nav>* {
        position: relative;
        display: flex;
        height: 100%;
        flex-basis: 100%;
        cursor: pointer;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 0.25rem;
        border-color: currentColor;
    }

    .btm-nav>*:not(.active) {
        padding-top: 0.125rem;
    }

    .btm-nav>* {
        position: relative;
        display: flex;
        height: 100%;
        flex-basis: 100%;
        cursor: pointer;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 0.25rem;
        border-color: currentColor;
    }


    .btm-nav>*:where(.active) {
        border-top-width: 2px;
        --tw-bg-opacity: 1;
        background-color: hsl(var(--b1)/var(--tw-bg-opacity));
    }
</style>


<div class="pt-2 pb-2 pr-5 pl-5" style="height: 85%">

    <div class="flex ...">
        <div class="h-16 ... mt-3" style="flex: 0.48 0 1%">
            <i class="fa-regular fa-bell dashboard_icon flex text-lg     ">
                <p class="pl-2 text-lg   " style="font-weight: bold;'">
                    응급발생목록
                </p>
            </i>
        </div>
    </div>
    <div class="flex ...">
        <div class="grow ... pb-2" style=" display: flex;flex-direction: column-reverse;">
            <p class="m-0">
                [총 응급발생 건수 &nbsp;:&nbsp; <em>${pageMaker.totalCount }9</em>건]
            </p>
        </div>
        <div class="shrink-1 ...">
            <label>시작일</label>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<label>종료일</label>
            <form>
                <input type='date' id='StartDate' class="border-2 border-black mb-2 pl-2" style="width: 130px;" />&ensp;&ensp;
                <input type="date" id="EedDate" name="SearchEnd" class="border-2 border-black mb-2 pl-2" style="width: 130px;" />
            </form>
            <!-- SELECT -->
            <label>사건분류</label>
            <select class="border-2 border-black/50">
                <option>전체</option>
                <option>응급발생</option>
                <option>119</option>
                <option>화재</option>
            </select>&ensp;&ensp;
            <!-- SELECT -->
            <label>지역구 선택</label>
            <select class="border-2 border-black/50">
                <option>전체</option>
                <option>동구</option>
                <option>중구</option>
                <option>서구</option>
                <option>유성구</option>
                <option>대덕구</option>
            </select>&ensp;&ensp;
            <label>처리상태</label>
            <select class="border-2 border-black/50">
                <option>전체</option>
                <option>처리</option>
                <option>미처리</option>
            </select>
        </div>
    </div>



    <table class="table table-hover text-nowrap border-2">
        <colgroup>
            <col width="50" />
            <col width="150" />
            <col width="200" />
            <col width="200" />
            <col width="200" />
            <col width="200" />
            <col width="auto" />
            <col width="100" />
            <col />
        </colgroup>
        <thead class="bg-neutral-100" style="text-align: center;">
            <tr>
                <th></th>
                <th>대상자 구분</th>
                <th>이름</th>
                <th>접수 센터</th>
                <th>담당 수행기관</th>
                <th>사건분류</th>
                <th>사건 발생 시간</th>
                <th>처리상태</th>
            </tr>
        </thead>
        <tbody class="bg-white" style="text-align: center;">
            <tr>
                <th>1</th>
                <td>독거노인</td>
                <td><a onclick="openModal('김형민');">김형민</a></td>
                <td>서구관제센터</td>
                <td>둔산1동 수행처</td>
                <td>119</td>
                <td>2023-04-06 11:11</td>
                <td>처리</td>
            </tr>
            <tr>
                <th>2</th>
                <td>독거노인</td>
                <td>김형민</td>
                <td>서구관제센터</td>
                <td>둔산1동 수행처</td>
                <td>119</td>
                <td>2023-04-06 11:11</td>
                <td>처리</td>
            </tr>
            <tr>
                <th>3</th>
                <td>독거노인</td>
                <td>김형민</td>
                <td>서구관제센터</td>
                <td>둔산1동 수행처</td>
                <td>119</td>
                <td>2023-04-06 11:11</td>
                <td>처리</td>
            </tr>
            <tr>
                <th>4</th>
                <td>독거노인</td>
                <td>김형민</td>
                <td>서구관제센터</td>
                <td>둔산1동 수행처</td>
                <td>119</td>
                <td>2023-04-06 11:11</td>
                <td>처리</td>
            </tr>
            <tr>
                <th>5</th>
                <td>독거노인</td>
                <td>김형민</td>
                <td>서구관제센터</td>
                <td>둔산1동 수행처</td>
                <td>119</td>
                <td>2023-04-06 11:11</td>
                <td>처리</td>
            </tr>
           


        </tbody>
    </table>


</div>



<div class="btm-nav" style="height:5%;">
    <a href="chart" class="nav-link">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
        </svg>
    </a>

    <a href="list" class="nav-link active">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h7"></path>
        </svg>
    </a>
</div>


<!-- pagination -->
<form id="jobForm">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="" />
    <input type='hidden' name="searchType" value="" />
    <input type='hidden' name="keyword" value="" />
</form>

<nav aria-label="Navigation" style="height: 15%;">
    <ul class="pagination justify-content-center m-0" >
        <li class="page-item ">
            <a href="javascript:list_go(1);" class="page-link">
                <i class="fas fa-angle-double-left"></i>
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 :cri.page });">
                <i class="fas fa-angle-left"></i>
            </a>
        </li>
        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
            <li class="page-item ${cri.page == pageNum?'active':''}">
                <a class="page-link" href="javascript:list_go(${pageNum });">
                    ${pageNum }
                </a>
            </li>
        </c:forEach>
        <li class="page-item">
            <a class="page-link" href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 : cri.page });">
                <i class="fas fa-angle-right"></i>
            </a>
        </li>
        <li class="page-item ">
            <a href="javascript:list_go(${pageMaker.realEndPage });" class="page-link">
                <i class="fas fa-angle-double-right"></i>
            </a>
        </li>
    </ul>
</nav>




















<!-- Modal 창 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <p id="modalContent"></p>
    </div>
</div>

<!--캘린더 현재 날짜-->
<script>
    document.getElementById('StartDate').value = new Date().toISOString().substring(0, 10);;
</script>

<script>
    $(document).ready(function() {
        window.openModal = function(name) {
            // 모달 창을 열 때 실행되는 함수
            // name 매개변수를 사용하여 모달 내용을 동적으로 생성
            $('#modalContent').html('<h2>' + name + '님에 대한 상세 정보</h2>');
            // 모달 창 보이기
            $('#myModal').css('display', 'block');
        }

        window.closeModal = function() {
            // 모달 창을 닫을 때 실행되는 함수
            // 모달 숨기기
            $('#myModal').css('display', 'none');
        }

        // 모달 닫기 버튼 클릭 이벤트 처리
        $('.close').click(function() {
            closeModal();
        });
    });
</script>







<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>