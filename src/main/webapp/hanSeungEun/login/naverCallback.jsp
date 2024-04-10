<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>														
<script type="text/javascript">
  var naver_id_login = new naver_id_login("d5LTGWv1q9MJSH1J27mw", "http://113.198.238.107/teamProject_jsp/hanSeungEun/login/naverCallback.jsp");
  // 접근 토큰 값 출력                                                          
  $('body').append('<h4>접속토큰:'+naver_id_login.oauthParams.access_token+'</h4>');
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	const id = naver_id_login.getProfileData('id');
	const name = naver_id_login.getProfileData('name');
    const email = naver_id_login.getProfileData('email');
    const mobile = naver_id_login.getProfileData('mobile');
    const birthyear = naver_id_login.getProfileData('birthyear');
    const birth = naver_id_login.getProfileData('birthday');
    const gender = naver_id_login.getProfileData('gender');
    
	let body = $('body');
	body.append('로그인 성공!');
	body.append('<h4>아이디:'+id+'</h4>');
	body.append('<h4>이름:'+name+'</h4>');
	body.append('<h4>이메일:'+email+'</h4>');
	body.append('<h4>전화번호:'+mobile+'</h4>');
	body.append('<h4>출생년도:'+birthyear+'</h4>');
	body.append('<h4>생년월일:'+birth+'</h4>');
	body.append('<h4>성별:'+gender+'</h4>');
  }
</script>
</body>
</html>