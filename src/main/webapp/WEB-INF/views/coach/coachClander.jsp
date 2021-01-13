<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8' />
<link href='css/mainclander.css' rel='stylesheet' />
<script src='js/mainclander.js'></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            // 控制日曆最上方的按鈕
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                // 預設： 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                right: 'timeGridWeek',
            },
            initialDate: '2021-01-10',
            // 預設一開始渲染的View
            initialView: 'timeGridWeek',
            // 語言中文化
            locale: 'zh-tw',
            // 預設是true，改false後可禁止點擊 9/7(週一) 進入日模式
            navLinks: false, // can click day/week names to navigate views
            nowIndicator: true,

            weekNumbers: true,
            weekNumberCalculation: 'ISO',

            editable: false,
            selectable: false,
            dayMaxEvents: true, // allow "more" link when too many events

            // 可控制日曆上只呈現幾點到幾點
            slotMinTime: '09:00:00',
            slotMaxTime: '24:00:00',

            // 是否顯示 all-day 選項
            allDaySlot: false,

            // 控制每週的第一天是.. 0=Sunday 1=Monday ... 6=Saturday
            firstDay: 0,

            // 點擊某事件後...
            eventClick: function(info) {
            	if(info.event.title=="可預約"){
            	if(confirm("確定預約此時段?"+info.event.start)){
            		
             	$.ajax({
            		url : "<c:url value='/addOrderTime'/>",
            		type : "POST",
            		dataType : "JSON",
            		data : {"orderId":info.event.id, "coachId":${coach.coachId} }, 
            		success : function (data) {
            		console.log(data)
            		}
            		})
            		
            		
            		
            		
            		alert("成功預約");
             		calendar.refetchEvents();
            	
            	
            	}else{}
            		      }
            	else{alert("此時段已經被預約 "); }
            	
   
            },

            // 日曆上的事件
            events: 'http://localhost:8080/GymProject/findall/${coach.coachId}.html'
        });

        calendar.render();
    });
    </script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: auto;
}
</style>
</head>

<body>
	<div id='calendar'></div>
</body>

</html>