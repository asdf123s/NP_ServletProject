<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>뉴핏</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/inc/asset.jsp"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style>
.highcharts-figure, .highcharts-data-table table {
	min-width: 90%;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-axis-labels{
	width:2em;
}
.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}



.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.highcharts-label.highcharts-data-label.highcharts-data-label-color-0 text
	{
	width: 100px;
}

.highcharts-text-outline {
	stroke: black;
	stroke-width: 0.15px;
}

.highcharts-no-tooltip {
	display: none;
}

.highcharts-figure {
	height: 200px;
}

.highcharts-color-0 {
	fill: #EAE7B1;
}

.highcharts-color-1 {
	fill: #A6BB8D;
}

.recommend-top {
	margin-bottom: 50px;
}

.recommend-top h3 {
	margin-bottom: 50px;
	
}
.recommend-result-items{
	width: 90%;
    margin: 0 auto;
    margin-bottom: 30px;
}
.result-wrap{
	margin-bottom:100px;
}
.fa-circle-exclamation{
	color:tomato;
	font-size:2.5rem;
	margin-right:15px;
}
.warning-title{
	display: flex;
    font-size: 1.5rem;
    align-items: center;
    width:90%;
    font-weight:bold;
    color:black;
    margin:0 auto;
    margin-bottom:50px;
}

.warning-item{
	display: inline-block;
	width:90%;
	margin:0 auto;
	display:flex;
	
}
.warning-text{
	display:inline-block;
	width:60%;
}
.warning-top-item{
	width:30%;
	margin-left: 50px;
    margin-right: 50px;
}
.recommend-result-h3{
	margin-top:50px;
}
</style>
</head>
<body class="goto-here">


	<%@ include file="/WEB-INF/inc/header.jsp"%>


	<div class="container">
		<div class="recommend-top">
			<h1>
				<i class="fa-regular fa-lightbulb" style="color:#FFB100;"></i> 분석/추천 결과
			</h1>
			<h3>현재 먹고있는 약에 각 성분의 용량이 하루 평균 용량에 맞게 섭취하고 있는지 체크해보세요.</h3>

			
			
			<c:forEach items="${list}" var="dto">
			<div class="ingredientName">${dto.ingredientName }</div>
			<figure class="highcharts-figure">
				<div id="${dto.ingredientName }" style="height: 200px;"></div>
			</figure>
			</c:forEach>
			
		</div>
		
		<c:if test="${not empty warningList}">
			<div class="warning-title"><i class="fa-solid fa-circle-exclamation"></i> 주의점</div>
			
			<c:forEach items="${warningList }" var="wdto">
				<div class="warning-item">
					<div class="search-item recommend-result-items warning-top-item">
						<div class="search-item-img">
							<img src="/np/asset/images/${wdto.productImage }">
						</div>
						<div class="search-item-name">
							<div>뉴핏</div>
							<div>${wdto.productName }</div>
						</div>
					</div>
					
					<div class="warning-text">
						${wdto.warning }
					</div>
				</div>
				
			</c:forEach>
			
		</c:if>
		
		
		<c:if test="${not empty vwlist }">
		<div class="recommend-result-items result-wrap">
			<h3 class="recommend-result-h3"><b>'홍길동'</b>님의 하루 섭취량에 맞는 영양제를 추천해드려요!</h3>
			
			<c:forEach items="${vwlist }" var="vdto">
				<div class="search-item recommend-result-items">
					<div class="search-item-img">
						<img src="/np/asset/images/${vdto.productImage }">
					</div>
					<div class="search-item-name">
						<div>뉴핏</div>
						<div>${vdto.productName }</div>
					</div>
					<div class="search-item-btn">
						<button type="button">바로가기</button>
					</div>
				</div>
			</c:forEach>
			
		</div>
		</c:if>
	</div>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<%@ include file="/WEB-INF/inc/asset2.jsp"%>

	<script>
	
	const num = 1;
	
	<c:forEach items="${list}" var="list">
		
		Highcharts
				.chart(
						'${list.ingredientName }',
						{
							chart : {
								type : 'bar'
							},
							title : {
								text : '',
								align : 'left'
							},
							subtitle : {
								text : '',
								align : 'left'
							},
							xAxis : {
								categories : [ '' ],
								title : {
									text : null
								}
							},
							yAxis : {
								min : 0,
								title : {
									text : '${list.measure}',
									align : 'high'
								},
								labels : {
									overflow : 'justify'
								}
							},
							tooltip : {
								valueSuffix : '${list.ingredientIntake}'
							},
							plotOptions : {
								bar : {
									dataLabels : {
										enabled : true
									}
								}
							},
							legend : {
								layout : 'vertical',
								align : 'right',
								verticalAlign : 'top',
								x : -40,
								y : 80,
								floating : true,
								borderWidth : 1,
								backgroundColor : Highcharts.defaultOptions.legend.backgroundColor
										|| '#FFFFFF',
								shadow : true
							},
							credits : {
								enabled : false
							},
							series : [ {
								name : '현재 섭취 용량',
								data : [ ${list.nutritionalIntake} ]
							}, {
								name : '하루 평균 용량',
								data : [ ${list.ingredientIntake} ]
							} ]
						});

		</c:forEach>

		
		
		
	</script>

</body>
</html>