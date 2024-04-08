
<%@page import="kimJeongTae.ReservationBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kimJeongTae.TrainScheduleMgr"%>
<%@page import="kimJeongTae.TrainScheduleBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="scheduleMgr" class = "kimJeongTae.TrainScheduleMgr"/>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>            
        window.addEventListener('DOMContentLoaded', event => {
        // Toggle the side navigation
        const sidebarToggle = document.body.querySelector('#sidebarToggle');
        if (sidebarToggle) {
            // Uncomment Below to persist sidebar toggle between refreshes
            // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
            //     document.body.classList.toggle('sb-sidenav-toggled');
            // }
            sidebarToggle.addEventListener('click', event => {
                event.preventDefault();
                document.body.classList.toggle('sb-sidenav-toggled');
                localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
            });
        }
        });
        </script>
        <!--달력-->
        <script src='dist/index.global.js'></script>
<script>
	<%
	Vector<TrainScheduleBean> vlist = scheduleMgr.getTrainSchedule(); // 백터 데이터 가져오기
	Vector<String> TrainerNameList = new Vector<String>(); 
	Vector<String> startTimeList = new Vector<String>();
	
	try {
	    //vlist의 각 Trainer를 순회하며 Trainer의 이름을 가져와 TrainerNameList에 추가
	    for (int i = 0; i < vlist.size(); i++) {
	        int trainerNum = vlist.get(i).getTrainer(); // 현재 Trainer의 번호 가져오기
	        String trainerName = scheduleMgr.getTrainerName(trainerNum); // Trainer 번호로 Trainer의 이름 가져오기
	        TrainerNameList.add(trainerName); // TrainerNameList에 Trainer 이름 추가
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜 포맷 
	try {
	    //vlist의 각 Trainer를 순회하며 Trainer의 이름을 가져와 TrainerNameList에 추가
	    for (int i = 0; i < vlist.size(); i++) {
	        Date startTime = scheduleMgr.getTrainDate(vlist.get(i).getNum()); // Trainer 번호로 Trainer의 이름 가져오기
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = dateFormat.format(startTime);
	        startTimeList.add(formattedDate);
	       
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
	%>

	var timeList = JSON.parse(JSON.stringify("<%=startTimeList%>"));
 	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var events = [
        <% for (int i = 0; i < vlist.size(); i++) {%>
        {
        	title: '<%=TrainerNameList.get(i)%>',
        	start: '<%=startTimeList.get(i)%>',
        	extendedProps:{
        		num: '<%=vlist.get(i).getNum()%>',
	        	trainerName: '<%=TrainerNameList.get(i)%>',
	        	lcontent: '<%=vlist.get(i).getLcontent()%>',
	        	date: '<%=vlist.get(i).getDate()%>',
	        	time: '<%=vlist.get(i).getStarttime() + "~" + vlist.get(i).getEndtime()%>',
        		user: '<%=vlist.get(i).getUser()%>'
        	}
        },
        <% } %>
    ];
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2024-04-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: false,
      select: function(arg) {
    	  //이벤트 추가 메소드
    	  document.getElementById("content1-date").value = arg.startStr;
          
          
          	var frm = document.getElementById('scheduleApplicationForm');
          	alert("스케줄의 추가를 진행하겠습니다.");
			frm.setAttribute("action", "newScheduleProc.jsp");
			frm.submit();


      },
      eventClick: function(arg) {
    	  //각각의 요소에 값을 넣고
    	  document.getElementById("content1-num").value = arg.event.extendedProps.num;
    	  document.getElementById("content1-trainer").value = arg.event.extendedProps.trainerName;
          document.getElementById("content1-lcontent").value = arg.event.extendedProps.lcontent;
          document.getElementById("content1-date").value = arg.event.extendedProps.date;
          document.getElementById("content1-time").value = arg.event.extendedProps.time;
          document.getElementById("content1-user").value = arg.event.extendedProps.user;
          
      },
      editable: false,
      dayMaxEvents: false, // allow "more" link when too many events
      events: events
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
    max-width: 1000px;
    margin: 50px;
  }

</style>

<!--구매내역-->
<script>
    window.addEventListener('DOMContentLoaded', event => {
        const datatablesSimple = document.getElementById('datatablesSimple');
        if (datatablesSimple) {
            const table = new simpleDatatables.DataTable(datatablesSimple);
            
            // 페이지네이션 객체 가져오기
            const pager = table.pager;

            // 시작 페이지를 3으로 설정
            pager.page = 3;

            // 페이지네이션 업데이트
            pager.render();
        }
        });
</script>   
</head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>       
                    <style>
                        main{
                            background-image: 
                            linear-gradient(to bottom, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1)),
                            url("img/reviewBackground.png");                  
                            align-items: center;        
                            background-size: 100% 400px;
                            background-repeat: no-repeat;
                            padding-top: 350px;
                            margin: 0;
                            height: 2000px;
                        }
                    </style>
                    <div id="output"></div>
                    <!--리뷰 택스트-->
                    <div class="container border-bottom border-danger" id="review_title">
                        <style>
                            #review_title{
                                padding-top: 100px;
                                font-size: 40pt;
                                justify-content: center;
                                align-items: center;
                                text-align: center;
                                max-width: 250px;
                            }
                        </style>
                        REVIEW
                    </div>
                    <!--마이페이지 컨텐츠 부분.-->
                   
                    <div id="review_group_button_container">
                        <style>
                            #review_group_button_container{
                                margin: 50px;
                                text-align: center;
                                
                                
                            }
                            .btn {
                                min-width: 150px; /* 최소 가로 크기를 200px로 설정 */
                                cursor: pointer; /* 커서 스타일 설정 */
                                max-width: 350px;
                            }
                            .content {
                                display: none; /* 기본적으로 숨김 처리 */
                            }
                            .content.active {
                                display: block; /* 활성화된 콘텐츠만 표시 */
                            }
                        </style>
                        
                        <div id="review_group_button_container">
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                                <label class="btn btn-outline-primary" for="btnradio1" onclick="showContent(1)">스케줄</label>
                        
                                <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btnradio4" onclick="showContent(4)">개인정보</label>
                            </div>
                        </div>
                    </div>

                    <div id="content1" class="content active">
                        <!-- 스케줄 (점포의 트레이너 스케줄을 읽어들이고 출력할수 있어야 한다.) -->
                        <div class="row justify-content-center" id="review-content-row">
                            <style>
                                #calendar-sideContents{
                                    max-width: 350px;
                                    padding-top: 50px;
                                    padding-bottom: 50px;
                                    
                                }
                                #review-content-row{
                                    text-align: center;
                                    
                                }
                            </style>
                            <script>
                          //상품정보에 대해 각종 변수를 입력해서 출력해보자.
                            var itemName = "<%=scheduleMgr.userItem(1).getItemname()%>"; //회원번호 기반으로 최신 구매 상품정보 가져오기.
                            var endDate = "<%=scheduleMgr.userItem(1).getFcperiod()%>";//구매날짜
                            var endDate2 = "<%=scheduleMgr.userItem(1).getFcperiod()%>";//구매날짜와 상품정보 대조해서 정보빼오기.
                            var gxCount = <%=scheduleMgr.userItem(1).getGxnum()%>;
                            var ptCount = <%=scheduleMgr.userItem(1).getPtnum()%>;

                            document.addEventListener("DOMContentLoaded", function() {
                                document.getElementById("itemNamePrint").innerText = itemName;
                                document.getElementById("endDatePrint").innerText = endDate;
                                document.getElementById("endDate2Print").innerText = endDate2;
                                document.getElementById("gxCountPrint").innerText = gxCount+"회";
                                document.getElementById("ptCountPrint").innerText = ptCount+"회";
                            });
                            </script>
                            <div class="col" id='calendar'></div>
                            <div class="col" id="calendar-sideContents" style="display: flex; flex-direction: column;">
                                
                                <div class="col" id="calendar-sideContents" style="display: flex; flex-direction: column;">
                                <!-- 위 => 출결현황,하 => 문의 전화 -->
                                <div class="container rounded border border-primary border-dashed" style="flex: 1; margin: 10px; padding: 10px; max-height: 200px;">
                                    <div style="text-align: left; font-size: 24px;" class="container border-bottom border-danger">
                                        상품 정보
                                    </div>
                                    <div class="container text-center" style="padding: 10px;min-height:auto;">
                                        <div class="row justify-content-md-center">
                                          <div class="col">
                                            상품명
                                          </div>
                                          <div class="col-md-auto"> 
                                          </div>
                                          <div class="col" id="itemNamePrint">
                                            상품넘버123
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col">
                                            만료 기한
                                          </div>
                                          <div class="col-md-auto">
                                          </div>
                                          <div class="col" id = "endDatePrint">
                                            2024-05-01
                                          </div>
                                        </div>
                                        
                                        <!--싸이즈박스-->
                                        <div class="sizedbox" style="height: 10px;"></div>
                                        <div class="row">
                                            <div class="col">
                                              시설 이용
                                            </div>
                                            <div class="col-md-auto">
                                            </div>
                                            <div class="col" id="endDate2Print">
                                              2024-05-01
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                              G X
                                            </div>
                                            <div class="col-md-auto">
                                            </div>
                                            <div class="col" id="gxCountPrint">
                                              5회
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                              P T
                                            </div>
                                            <div class="col-md-auto">
                                            </div>
                                            <div class="col" id="ptCountPrint">
                                              4회
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <div class="container rounded border border-primary border-dashed" style="flex: 1; margin: 10px;max-height: 200px;">
                                    <div style="text-align: left; font-size: 24px;" class="container border-bottom border-danger">
                                        수업 정보
                                    </div>
                                    <div class="container text-center" style="padding: 10px;min-height:auto;">
                                        <script>
                                       		var content1_num = 없음;
                                            var content1_trainer = 없음;
                                            var content1_lcontent = 없음;
                                            var content1_date = 없음;
                                            var content1_time = 없음;
                                            var content1_user = 없음;

                                            document.addEventListener("DOMContentLoaded", function() {
                                            document.getElementById("content1-num").value = content1_num;
                                            document.getElementById("content1-trainer").value = content1_trainer;
                                            document.getElementById("content1-lcontent").value = content1_lcontent;
                                            document.getElementById("content1-date").value = content1_date;
                                            document.getElementById("content1-time").value = content1_time;
                                            document.getElementById("content1-user").value = content1_user;
                                            });
                                        </script>
                                        <form action="scheduleApplicationProc.jsp" id="scheduleApplicationForm">
                                        <div class="row">
                                            <div class="col">
                                              수업번호
                                            </div>
                                            <div class="col-md-auto" >
                                            </div>
                                            <div class="col" >
                                            	<input type="text" class="col" id="content1-num" name="content1-num" value="수업번호" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                              강사
                                            </div>
                                            <div class="col-md-auto" >
                                            </div>
                                            <div class="col" >
                                            	<input type="text" class="col" id="content1-trainer" name="content1-trainer" value="강사이름" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col" >
                                              유형
                                            </div>
                                            <div class="col-md-auto" >
                                            </div>
                                            <div class="col" >
                                              <input type="text" class="col" id="content1-lcontent" name="content1-lcontent" value="강의정보" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                              날짜
                                            </div>
                                            <div class="col-md-auto" >
                                            </div>
                                            <div class="col" >
                                     	        <input type="text" class="col" id="content1-date" name="content1-date" value="날짜" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                              시간
                                            </div>
                                            <div class="col-md-auto" >
                                            </div>
                                            <div class="col">
                                             	<input type="text" class="col" id="content1-time" name="content1-time" value="시간" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                              자리
                                            </div>
                                            <div class="col-md-auto" >
                                            </div>
                                            <div class="col">
                                             	<input type="text" class="col" id="content1-user" name="content1-user" value="자리" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                            </div>
                                        </div>
                                        <div class="row">
                                        <div class="col"></div>
                                    	<button type="button" class="btn btn-warning col" onclick="scheduleCancle()">취소</button>
                                    	</div>
                                    	</form>
                                    	<script>
                                    		
                                    		function scheduleCancle(){
                                    			var frm = document.getElementById('scheduleApplicationForm');
                                    			var today = new Date();
												if(document.getElementById('content1-date').value <= today){
													alert("취소할수 없는 스케줄입니다.1");
													return;
												}else if(document.getElementById('content1-user').value == '1'){
													alert("본인스케줄의 취소를 진행하겠습니다.")
													frm.setAttribute("action", "scheduleCancleProc.jsp");
													frm.submit();
												}else {
													alert("취소할수 없는 스케줄입니다.2");
													return;
												}
                                    		}
                                    	</script>
                                    	
                                        
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 개인 정보 -->
                    <div id="content4" class="content">
                        <div class="row d-flex justify-content-center" style="margin: 50px;">
                            <div class="col border-top border-secondary border-4" style="max-width: 1000px; min-width: 100px; font-size: 24px; text-align: left; padding: 30px;">
                            
                                회원 정보
                                <form id = "myForm" action = "myPageUserInfoProc.jsp" method="get">
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1">회원 번호</span>
                                    <input type="text" class="form-control" placeholder="<%=scheduleMgr.getUserBean(1).getNum()%>" aria-label="username" aria-describedby="basic-addon1" style="pointer-events: none;">
                                </div>
                                  
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon2">상품정보</span>
                                    <input type="text" class="form-control" placeholder="<%=scheduleMgr.userItem(1).getItemname() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                    <span class="input-group-text" id="basic-addon2">이용기간</span>
                                    <input type="text" class="form-control" placeholder="<%=scheduleMgr.userItem(1).getFcperiod() %> 까지" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                </div>
                                <div class="form-text" id="basic-addon4">상품정보가 다를경우 따지지 마세요</div>
                                  
                                <div class="mb-3">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon2">이름</span>
                                        <input type="text" class="form-control" placeholder="<%=scheduleMgr.getUserBean(1).getName() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                        <span class="input-group-text" id="basic-addon2">계정</span>
                                        <input type="text" class="form-control" placeholder="<%=scheduleMgr.getUserBean(1).getId() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon2">연락처</span>
                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="<%=scheduleMgr.getUserBean(1).getPhontnum() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" >
                                        <span class="input-group-text" id="basic-addon2">이메일</span>
                                        <input type="text" class="form-control" id="email" name="email" placeholder="<%=scheduleMgr.getUserBean(1).getEmail() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" >
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon2">아이디</span>
                                        <input type="text" class="form-control" placeholder="<%=scheduleMgr.getUserBean(1).getId() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                        <span class="input-group-text" id="basic-addon2">비밀번호</span>
                                        <input type="text" class="form-control" id="password" name="password" placeholder="<%=scheduleMgr.getUserBean(1).getPwd() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" >
                                    </div>
                                </div>
                                  <!--주소 입력-->
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon2">주소</span>
                                        <input type="text" class="form-control" id="address" name="address" value="<%=scheduleMgr.getUserBean(1).getPostnum() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                        <button type="button" style="font-size: 14px;" onclick="DaumPostcode()">우편번호 찾기</button>
                                        <script>
                                        	function DaumPostcode() {
                                        		new daum.Postcode({
                                                    oncomplete: function(data) {
                                                    	 var addr = '';

                                         	            if (data.userSelectedType === 'R') {
                                         	                addr = data.address;
                                         	            } else {
                                         	                addr = data.address;
                                         	            }
                                         	            console.log(data.address);
                                         	            document.getElementById('address').value = data.address;
                                         	            }
                                                }).open();
                                            }
                                        </script>
                                </div>
                                 
                                <div class="input-group">
                                    <span class="input-group-text" id="basic-addon2">소속</span>
                                    <input type="text" class="form-control" placeholder="<%=scheduleMgr.getUserBean(1).getCompany() %>" aria-label="Recipient's username" aria-describedby="basic-addon2" style="pointer-events: none;">
                                    <div class="form-text" id="basic-addon4" style="font-size: 14px;">*소속변경은 직접 문의해주세요</div>
                                </div>
                                <button type="button" class="btn btn-secondary" onclick = "sendFixedUserInfo()" style="margin: 10px;">변경사항 저장하기</button>
                                
                                </form>
                                <script>
                            function sendFixedUserInfo(){
                                //연락처 이메일 비밀번호 주소를 확인하고 폼으로 전송해야한다.
                                //전화번호 확인하는 법
                                const phoneInput = document.getElementById('phone');
                                const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;

                                const emailInput = document.getElementById('email');
                                const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                                const passwordInput = document.getElementById('password');
                                const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{":;'?/><.,])(?=.*[^\s]).{8,}$/;

                                const addressInput = document.getElementById("address");
                                
                                if(phonePattern.test(phoneInput.value)==false){
                                    //전화번호 형식
                                    alert("전화번호의 형식을 확인해 주세요");
                                    return;
                                }else if(emailPattern.test(emailInput.value)==false){
                                    //이메일
                                    alert("이메일 형식을 확인해 주세요");
                                    return;
                                }else if(passwordPattern.test(passwordInput.value)==false){
                                    // 비밀번호는 최소 8자 이상이어야 합니다.
                                    // 최소한 하나의 숫자, 하나의 대문자, 하나의 소문자, 하나의 특수 문자를 포함해야 합니다.
                                    alert("비밀번호의 형식을 확인해 주세요 8글자이상 그리고 최소한 하나의 숫자, 하나의 대문자, 하나의1소문자, 하나의 특수문자를 포함해야 합니다.");
                                    return;
                                }
                         
                                //이후 서버로 데이터 전송하고 프록스에서 db저장처리하면됌
                                var frm = document.getElementById('myForm');
                                frm.submit();
                               alert("수정되었습니다.");
                                
                            }
                        </script>
                            </div> 
                    </div>
                    </div>
                    <script>
                        // 버튼 클릭 시 호출되는 함수
                        function showContent(index) {
                            // 모든 콘텐츠 숨김 처리
                            var contents = document.querySelectorAll('.content');
                            contents.forEach(function(content) {
                                content.classList.remove('active');
                            });
                            // 클릭된 버튼에 해당하는 콘텐츠만 활성화
                            var contentToShow = document.getElementById('content' + index);
                            contentToShow.classList.add('active');
                        }
                    </script>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
