<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 05-09-2017
  Time: PM 01:11
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PEA:Reminder</title>
    <asset:stylesheet src="reminder.css"/>
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">

    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'verticalMenu.css')}" type="text/css">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Cherry Swash' rel='stylesheet'>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<div class="mainContainer">
    <div class="topHeader">
        <div class="logoHeader">

            <asset:image class="logo" src="personalLogo.PNG"></asset:image>
            <div class="projectTitle">Personal Expense Analyzer</div>
            <div class="navbar1">

                <a href="#">Welcome ${session.user}  |</a>
            </div>
        </div>
    </div>
    <!--LeftSide Menu Starts-->
    <nav class="navbar navbar-default sidebar" role="navigation">
        <div class="container-fluid" id="reminderContainer">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li style="height: 70px; font-size: 18px"><g:link action="onLogin" controller="dashboard"> Dashboard<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home "></span></g:link></li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index" controller="account">Account<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index1" controller="expense"> Expense<span style="font-size:19px; " class="pull-right hidden-xs showopacity glyphicon glyphicon-paperclip"></span></g:link></li>
                    <li  class="active" style="height: 70px; font-size: 18px; "><g:link controller="reminder" action="index">Reminder<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-dashboard"></span></g:link></li>
                    <li  style="height: 70px; font-size: 18px; "><g:link controller="dashboard" action="profile">Profile<span style="font-size:19px; " class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
    <!--LeftSide Menu End-->
%{--Current Month Expenses Calculaction--}%
    <script type="text/javascript">
        var inlineDataForThisMonth=[['Category', 'Amount']];
        $(document).ready(function() {
            // Load google charts
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChartThis);

            $.ajax({
                type: 'GET',
                url: '/Connection/api/expenses',
                dataType: "json",
                success: function(data) {
                    console.log(data);
                    console.log(data.aggregatedExpenses);
                    var resultThis = data.aggregatedExpenses;
                    var resultDataThis = [];
                    var entryThis = [];
                    entryThis.push('Category');
                    entryThis.push('Amount');

                    resultDataThis.push(entryThis);
                    var keysThis = Object.keys(resultThis);
                    console.log(keysThis);

                    keysThis.forEach(function(elementThis) {
                        console.log(elementThis);
                        var entryThis = [];
                        entryThis.push(elementThis);
                        entryThis.push(resultThis[elementThis]);
                        resultDataThis.push(entryThis);
                    });

                    console.log(resultDataThis);
                    inlineDataForThisMonth = resultDataThis;
                    drawChartThis();
                }

            });
        });

        function drawChartThis() {

            if(google.visualization){
                var dataThis = google.visualization.arrayToDataTable(inlineDataForThisMonth);

                // Optional; add a title and set the width and height of the chart
                var optionsThis = {'title':'Current Month Expenses', 'width':600, 'height':500};

                // Display the chart inside the <div> element with id="piechart"
                var chartThis = new google.visualization.PieChart(document.getElementById('piechart'));
                chartThis.draw(dataThis, optionsThis);
            }

        }
    </script>
    %{--Current Month Expenses Calculation Closed--}%

    %{--Last Month Expenses Calculation --}%

    <script type="text/javascript">
        var inlineData=[['Category', 'Amount']];
        $(document).ready(function() {
            // Load google charts
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            $.ajax({
                type: 'GET',
                url: '/Connection/api/expenses',
                dataType: "json",
                success: function(data) {
                    console.log(data);
                    console.log(data.aggregatedExpensesForLastMonth);
                    var result = data.aggregatedExpensesForLastMonth;
                    var resultData = [];
                    var entry = [];
                    entry.push('Category');
                    entry.push('Amount');

                    resultData.push(entry);
                    var keys = Object.keys(result);
                    console.log(keys);

                    keys.forEach(function(element) {
                        console.log(element);
                        var entry = [];
                        entry.push(element);
                        entry.push(result[element]);
                        resultData.push(entry);
                    });

                    console.log(resultData);
                    inlineData = resultData;
                    drawChart();
                }

            });
        });

        function drawChart() {

            if(google.visualization){
                var data = google.visualization.arrayToDataTable(inlineData);

                // Optional; add a title and set the width and height of the chart
                var options = {'title':'Last Month Expenses', 'width':600, 'height':500};

                // Display the chart inside the <div> element with id="piechart"
                var chart = new google.visualization.PieChart(document.getElementById('piechartForLastMonth'));
                chart.draw(data, options);
            }

        }
    </script>




    %{--PieChart Starts--}%
    <div class="reminderDetail">${new Date()}</div>
    <div id="piechart"></div>

    <div id="piechartForLastMonth"></div>






    %{--Footer--}%
    <div id="reminderFooter">
        <div class="container">
            <p class="footer-block"> &copy; 2017 Personal Expense Analyzer

            &nbsp;&nbsp;&nbsp;&nbsp;

            Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
        </div>
    </div>

</div>
</body>
</html>
