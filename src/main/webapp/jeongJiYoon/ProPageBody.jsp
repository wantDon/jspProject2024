<!-- ProPageBody.jsp -->
<!-- 프로그램페이지의 바디 부분 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬스장 홈페이지</title>
    
    <style>
        body, html {
            margin: 0; /* body와 html 요소의 기본 마진을 제거 */
            padding: 0; /* body와 html 요소의 기본 패딩을 제거 */
            height: 100%; /* body와 html 요소의 높이를 100%로 설정 */
        }
        
        .image-container {
            display: flex; /* 이미지 컨테이너를 가로로 나열하기 위해 flex 사용 */
            justify-content: center; /* 가로 중앙 정렬 */
            margin-top: 50px; /* 이미지와 텍스트 사이 여백 조정 */
        }
        
        .image-container img {
            width: calc(80% / 3); /* 가로 스크롤이 없도록 3개의 이미지를 가로로 배치하고 각각의 너비를 1/3로 설정 */
            height: 600px; /* 이미지 높이 조정 */
            margin: 0 20px; /* 이미지 간격 조정 */
        }
        
        .text1 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 30px; /* 글자 크기 설정 */
            margin-top: 20px; /* 글 상단 여백 설정 */
        }
        
        .text2 {
	    text-align: center;
	    font-size: 20px;
	    margin-top: 20px;
	    white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 설정 */
		}
		
		.text2 span {
		    margin: 0 10px; /* 좌우 여백 조정 */
		}
		
		/* 추가적인 스타일링 */
		.text2 p {
		    margin: 10px 0;
		}
        
        .text3 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 15px; /* 글자 크기 설정 */
            margin-top: 20px; /* 글 상단 여백 설정 */
        }
        
        .text4 {
            text-align: center; /* 텍스트를 가운데 정렬 */
            font-size: 15px; /* 글자 크기 설정 */
            margin-top: 20px; /* 글 상단 여백 설정 */
        }
		
		.divider1 {
            width: 9%; /* 구분선의 너비 조정 */
            margin: 10px auto; /* 가운데 정렬 및 위아래 여백 설정 */
            border-top: 6px solid #EBDAC3; /* 갈색의 선을 위한 스타일 지정 */
        }
        
        /* 각 그룹에 대한 스타일 */
        .trainer-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px; /* 사진과 Program 텍스트 사이의 상단 간격 */
            margin-bottom: 100px; /* 사진과 이름 텍스트 사이의 하단 간격 */
        }
        
        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            background-color: #887159; /*버튼 색깔*/
            color: white; /*버튼의 글자 색깔*/
            padding: 20px 120px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin-top: 0px;
            margin-bottom: 100px;
            cursor: pointer;
            border-radius: 10px;
        }

        .btn:hover { /*마우스를 올렸을 때 바뀌는 색깔*/
            background-color: #AF9B87;
        }
        
    </style>
</head>

<body> 
    <!-- Program 텍스트 -->
    <div style="text-align: center; font-weight: bold; font-size: 50px; class="text1">
        Program
    </div>
    
    <div class="divider1"></div> 
    
    <!-- 드롭다운 메뉴 -->
	<div style="margin-top: 20px; margin-left: 200px; margin-bottom: 100px;">
	    <select name="DropdownBox" onchange="handleChange(this.value)">
	        <option value="option1">서울 ㅇㅇ피트니스 ㄱㄱ점</option>
	        <option value="option2">서울 ㅇㅇ피트니스 ㄴㄴ점</option>
	        <option value="option3">부산 ㅇㅇ피트니스 ㄷㄷ점</option>
	    </select>
	</div>
    
	<div style="display: flex; justify-content: space-between; width: 80%; margin: 0 auto;">
    <!-- 첫 번째 그룹 -->
    <div class="trainer-group">
        <img src="img/UI-UW-03(1).jpg" alt="Trainer 1" style="width: 450px; height: 600px; margin-bottom: 30px;">
        <div class="trainer-info" style="text-align: center;">
            <span style="font-weight: bold; font-size: 40px;">김안나</span>
            <span style="font-size: 30px;">트레이너</span>
            <br></br>
            <span style="font-size: 18px;">
                <p>생활 스포츠지도사 2급</p>
                <p>한국 피트니스 지도자</p>
                <p>스포츠 마사지 1급</p>
                <p>컨디셔닝 케어 스페셜리스트</p>
                <p>응급처치 심폐소생술 강사</p>
            </span>
        </div>
    </div>

    <!-- 두 번째 그룹 -->
    <div class="trainer-group">
        <img src="img/UI-UW-03(2).jpg" alt="Trainer 2" style="width: 450px; height: 600px; margin-bottom: 30px;">
        <div class="trainer-info" style="text-align: center;">
            <span style="font-weight: bold; font-size: 40px;">폴 킴</span>
            <span style="font-size: 30px;">트레이너</span>
            <br></br>
            <span style="font-size: 18px;">
                <p>생활 스포츠지도사 2급</p>
                <p>한국 피트니스 지도자</p>
                <p>스포츠 마사지 1급</p>
                <p>컨디셔닝 케어 스페셜리스트</p>
                <p>응급처치 심폐소생술 강사</p>
            </span>
        </div>
    </div>

    <!-- 세 번째 그룹 -->
    <div class="trainer-group">
        <img src="img/UI-UW-03(3).jpg" alt="Trainer 3" style="width: 450px; height: 600px; margin-bottom: 30px;">
        <div class="trainer-info" style="text-align: center;">
            <span style="font-weight: bold; font-size: 40px;">안나 리</span>
            <span style="font-size: 30px;">트레이너</span>
            <br></br>
            <span style="font-size: 18px;">
                <p>생활 스포츠지도사 2급</p>
                <p>한국 피트니스 지도자</p>
                <p>스포츠 마사지 1급</p>
                <p>컨디셔닝 케어 스페셜리스트</p>
                <p>응급처치 심폐소생술 강사</p>
            </span>
        </div>
    </div>
</div>

	<!-- 상담예약 버튼 -->
    <div style="text-align: center;">
        <a href="#" class="btn">상담예약</a>
    </div>
    
</body>
</html>