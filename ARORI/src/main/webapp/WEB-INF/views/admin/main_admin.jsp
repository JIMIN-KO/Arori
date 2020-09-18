<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<style>

	#chart {
		width:700px;
		height:600px;
	}
</style>


<script>

	$(function(){
		
		// 2D그리기 도구를 ctx라는 이름으로 저장
		var ctx = document.getElementById('chart').getContext('2d');
		
		// 차트 생성 코드
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'line'
		    
		    // 실제 차트를 구성하는 데이터
		    data: {
		    	// 축에 표시될 라벨 정보
		        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		        
		        // 실제 데이터
		        datasets: [{
		            label: 'My First dataset',
		            backgroundColor: '#4A70F6',
		            borderColor: '#4A70F6',
		            data: [0, 10, 5, 2, 20, 30, 45]
		        }]
		    },

		    // 기타 제어용 옵션
		    options: {}
		});
		
	})

</script>

 <body>
 
<canvas id="chart">
 
</canvas>

 </body>
                
               
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>

