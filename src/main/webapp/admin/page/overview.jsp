<html>
<head>
    <title>jQuery MiniUI Demo</title>
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <script src="/admin/js/baobiao/jquery-1.8.3.min.js"></script>
    <script src="/admin/js/baobiao/highcharts.js"></script>
    <script src="/admin/js/baobiao/highcharts-3d.js"></script>
    <script src="/admin/js/baobiao/exporting.js"></script>
    <script src="/admin/js/baobiao/highcharts-zh_CN.js"></script>
    <style type="text/css">
    html,html body {
        font-family:宋体;
        font-size:13px;
    }
    h2 {
        font-family: "Trebuchet MS",Arial,sans-serif;
    }
    p {
        line-height:22px;
    }
    </style>
    <script>

        $(function () {
            $('#container').highcharts({
                credits: { enabled:false},
                chart: {
                    type: 'pie',  /*line   bar   pie*/
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    }
                },
                title: {
                    text: '当前产品占比',
                    style: {     fontSize:"30px"  }
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}',
                            style: {     fontSize:"20px", }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '产品占比',
                    data:${baob}
                }]
            });
        });

    </script>
</head>
<body>
<div id="container" style="height: 300px;width:500px;margin: 0 auto"></div>
</body>
</html>
