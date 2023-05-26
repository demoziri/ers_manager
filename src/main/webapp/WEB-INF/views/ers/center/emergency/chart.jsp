<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/cheader.jspf"%>

<script src="https://cdn.tailwindcss.com"></script>
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>


<style>
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

    .radio-inputs {
        display: flex;
        justify-content: center;
        align-items: center;
        max-width: 350px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .radio-inputs>* {
        margin: 6px;
    }

    .radio-input:checked+.radio-tile {
        border-color: #2260ff;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        color: #2260ff;
    }

    .radio-input:checked+.radio-tile:before {
        transform: scale(1);
        opacity: 1;
        background-color: #2260ff;
        border-color: #2260ff;
    }

    .radio-input:checked+.radio-tile .radio-icon svg {
        fill: #2260ff;
    }

    .radio-input:checked+.radio-tile .radio-label {
        color: #2260ff;
    }

    .radio-input:focus+.radio-tile {
        border-color: #2260ff;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1), 0 0 0 4px #b5c9fc;
    }

    .radio-input:focus+.radio-tile:before {
        transform: scale(1);
        opacity: 1;
    }

    .radio-tile {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 80px;
        min-height: 50px;
        border: 2px solid #b5bfd9;
        background-color: #fff;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        transition: 0.15s ease;
        cursor: pointer;
        position: relative;
    }

    .radio-tile:before {
        content: "";
        position: absolute;
        display: block;
        width: 0.75rem;
        height: 0.75rem;
        border: 2px solid #b5bfd9;
        background-color: #fff;
        border-radius: 50%;
        top: 0.25rem;
        left: 0.25rem;
        opacity: 0;
        transform: scale(0);
        transition: 0.25s ease;
    }

    .radio-tile:hover {
        border-color: #2260ff;
    }

    .radio-tile:hover:before {
        transform: scale(1);
        opacity: 1;
    }

    .radio-icon svg {
        width: 2rem;
        height: 2rem;
        fill: #494949;
    }

    .radio-label {
        color: #707070;
        transition: 0.375s ease;
        text-align: center;
        font-size: 13px;
    }

    .radio-input {
        clip: rect(0 0 0 0);
        -webkit-clip-path: inset(100%);
        clip-path: inset(100%);
        height: 1px;
        overflow: hidden;
        position: absolute;
        white-space: nowrap;
        width: 1px;
    }
</style>

<div class="pt-2 pb-2 pr-5 pl-5">

    <div class="flex ...">
        <div class="h-16 ... mt-3" style="flex: 0.48 0 1%">
            <i class="fa-regular fa-bell dashboard_icon flex text-lg	  ">
                <p class="pl-2 text-lg	" style="font-weight: bold;'">
                    지역별 응급발생
                </p>
            </i>
        </div>
        <div class="shrink-1 w-18 ... mt-3">
            <div class="radio-inputs">
                <label>
                    <input checked="" class="radio-input" type="radio" name="engine">
                    <span class="radio-tile">
                        <span class="radio-icon">
                        </span>
                        <span class="radio-label">월별</span>
                    </span>
                </label>
                <label>
                    <input class="radio-input" type="radio" name="engine">
                    <span class="radio-tile">
                        <span class="radio-icon">
                        </span>
                        <span class="radio-label">주별</span>
                    </span>
                </label>
                <label>
                    <input class="radio-input" type="radio" name="engine">
                    <span class="radio-tile">
                        <span class="radio-icon">
                        </span>
                        <span class="radio-label">일별</span>
                    </span>
                </label>
            </div>

        </div>
    </div>





    <div class="btm-nav">
        <a href="chart" class="nav-link active">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
            </svg>
        </a>

        <a href="list" class="nav-link">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h7"></path>
            </svg>
        </a>
    </div>

    <!-- SELECT -->
    <label>지역구 선택</label>
    <select class="border-2 border-black">
        <option>전체</option>
        <option>동구</option>
        <option>중구</option>
        <option>서구</option>
        <option>유성구</option>
        <option>대덕구</option>
    </select>

    <div class="chart-container" style="position: relative;">
        <canvas id="chart" style="height: 68vh;  width: 89vw;"></canvas>
    </div>
    <!-- 그래프 -->
    <script type="text/javascript">
        var barChartData = {
            labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            datasets: [{
                label: '화재발생',
                backgroundColor: "#FF3B30",
                data: [
                    22,
                    48,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100

                ]

            }, {
                label: '응급호출',
                backgroundColor: "#4CD964",
                data: [
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100
                ]
            }, {
                label: '119',
                backgroundColor: "#FFC041",
                data: [
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100,
                    Math.random() * 100
                ]
            }]
        };

        window.onload = function() {
            var ctx = $('#chart').get(0).getContext("2d");
            window.theChart = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {}
            });
        }

        function beforePrintHandler() {
            for (var id in Chart.instances) {
                Chart.instances[id].resize();
            }
        }
    </script>

</div>
<script>

</script>
<%@ include file="/WEB-INF/views/include/cfooter.jspf"%>