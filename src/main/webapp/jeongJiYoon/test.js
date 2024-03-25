function requestPay() {
	//IMP.request_pay(param, callback) 결제창 호출
	IMP.init("imp05733874");
	IMP.request_pay({ //param
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: createOrderNum, //주문번호 생성(하단)
		name: "테스트", //주문명
		amount: "100", //가격
		buyer_email: "aaa@naver.com", //메일
		buyer_name: "홍길동", //이름
		buyer_tel: "01001000100 ", //전화번호
		buyer_addr: "부산광역시 진구", //주소
		buyer_postcode: "2" //우편번호
		}, function (rsp) { //callback
		if (rsp.success) {
			//결제성공시 로직
			
		} else { //결제 실패
			alert("결재 실패\n" + rsp.error_msg);
		}
	});
}

//주문번호 만들기
function createOrderNum() {
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");
	let orderNum = year + month + day;
	for(let i=0;i<10;i++) {
		orderNum += Math.floor(Math.random() * 8);	
	}
	return orderNum;
}