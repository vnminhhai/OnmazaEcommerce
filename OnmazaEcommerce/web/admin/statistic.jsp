<%-- 
    Document   : statistic
    Created on : Mar 21, 2024, 4:08:01 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin site</title>
        <%@include file="../components/headerLink.html" %>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
    </head>
    <body>
        <%@include file="../components/adminHeader.jsp" %>
        <main class="m-5 row">
            <div class="d-flex justify-center col-6">
                <div class="container m-4 ms-5 card p-3">
                    <div class="col-12">
                        <canvas id="myChart" class="m-auto" style="max-width: 700px;"></canvas>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-center col-6">
                <div class="container m-4 ms-5 card p-3">
                    <div>
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
            </div> 
        </main>
        <script>
            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
              type: 'bar',
              data: {
                labels: ["Electronics", "Clothing", "Home", "Beauty", "Food", "Other"],
                datasets: [{
                  label: 'Number of suppliers',
                  data: [12, 19, 3, 5, 2, 3],
                  backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                  ],
                  borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                  ],
                  borderWidth: 1
                }]
              },
              options: {
                scales: {
                  yAxes: [{
                    ticks: {
                      beginAtZero: true
                    }
                  }]
                }
              }
            });
            
            //line
        var ctxL = document.getElementById("lineChart").getContext('2d');
        var myLineChart = new Chart(ctxL, {
          type: 'line',
          data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
              label: "Web visit",
              data: [65, 59, 80, 81, 56, 55, 40],
              backgroundColor: [
                'rgba(105, 0, 132, .2)',
              ],
              borderColor: [
                'rgba(200, 99, 132, .7)',
              ],
              borderWidth: 2
            },
            {
              label: "Order Purchased",
              data: [28, 48, 40, 19, 86, 27, 90],
              backgroundColor: [
                'rgba(0, 137, 132, .2)',
              ],
              borderColor: [
                'rgba(0, 10, 130, .7)',
              ],
              borderWidth: 2
            }
            ]
          },
          options: {
            responsive: true
          }
        });
        </script>
    </body>
</html>
