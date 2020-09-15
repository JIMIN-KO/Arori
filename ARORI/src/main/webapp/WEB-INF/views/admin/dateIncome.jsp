<jsp:include
   page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

   <div style="width: 60%">

      <div>

         <canvas id="logChart" height="450" width="600"></canvas>

      </div>

   </div>


<script>
var ctx = document.getElementById("logChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["아로리회원", "멤버회원"],
        datasets: [{


            data: ['${aroriCount}', '${memberCount}'], //컨트롤러에서 모델로 받아온다.
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)'

            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)'

            ],
            borderWidth: 1
        }
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>

