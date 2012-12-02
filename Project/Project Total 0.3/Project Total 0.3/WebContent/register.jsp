<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link href="stylesheets/login/register.css" rel="stylesheet" type="text/css">
<link href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css" rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet" type="text/css">
<script src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>

<script>
	function joinAgree() {

		var chkEm = document.forms[0].chk;

		if (!chkEm[0].checked) {
			alert("약관에 동의해 주십시오");
			return false;
		} else if (!chkEm[1].checked) {
			alert("개인정보취급방침에 동의해 주십시오");
			return false;
		}

		return true;
	}
</script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<!--전체 크기 -->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="information.jsp">공연</a></li>
						<li><a href="reserve.jsp">예약 </a></li>
						<li><a href="review.jsp">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="reserve_detail">
				<!--예매상세내역-->
				<form class="well" action="UserManageController" method="post"
					onsubmit="return joinAgree()">
					<h2>&lt; 회 원 가 입 &gt;</h2>
					<br /> <br />
					<ul>
						<li>
							<h3>* 필수 입력사항</h3> <!-- 내용부 -->
							<table>
								<tr>
									<th>희망 ID</th>
									<td><input type="text" name="userid" maxlength="10" /> <input
										type="button" name="IDcheck" value="중복확인" /></td>
								</tr>
								<tr>
									<th>Password</th>
									<td><input type="password" name="password" maxlength="10" /></td>
								</tr>
								<tr>
									<th>Password 확인</th>
									<td><input type="password" name="passwordCheck"
										maxlength="10" /></td>
								</tr>
								<tr>
									<th>성명(한글)</th>
									<td><input type="text" name="name" maxlength="6" /></td>
								</tr>
								<tr>
									<th>주민등록번호</th>
									<td><input type="text" name="ssn1" maxlength="6" /> -<input
										type="password" name="ssn2" maxlength="7" /></td>
								</tr>
								<tr>
									<th>facebook 아이디&nbsp;</th>
									<td><input type="text" name="facebookid" maxlength="30" />
									</td>
								</tr>
							</table>
						</li>
						<li>
							<div class="agree">
								<div class="leftside">
									<table>
										<tr>
											<td>
												<h3>* 서비스 이용약관</h3> <textarea readonly cols="40" rows="8"
													name="intro"> 
제 1 조 (목적)
본 약관은 프리머스시네마 멤버십회원이 프리머스시네마 주식회사(이하 "프리머스시네마")가 제공하는 프리머스시네마 멤버십서비스를 이용함에 있어 프리머스시네마 멤버십 회원의 제반 권리, 의무 및 관련 절차 등을 규정하는데 그 목적이 있습니다. 본 약관은 오프라인 매장에서의 서비스에 관한 계약 내용으로 개인정보 취급 방침 및 온라인(홈페이지)에 관한 서비스 약관은 당사 홈페이지(www.primuscinema.com)에 기술되어 있습니다.  

제 2 조 (정의)
① "프리머스시네마 멤버십서비스"(이하 "멤버십서비스")라 함은 프리머스시네마 멤버십회원을 위해 프리머스시네마가 제공하는 서비스로서 그 개요는 본 약관 제4조에 기술된 바와 같습니다.
* "프리머스시네마 멤버십카드"(이하 "멤버십카드")란 프리머스시네마 멤버십회원이 멤버십서비스를 정상적으로 이용할 수 있도록 프리머스시네마가 승인한 카드로서 프리머스시네마 또는 프리머스시네마의 제휴카드사에서 발급합니다. 
“프리머스시네마 가족카드” (이하 “가족카드”)라 함은 가족 아이디 중 대표ID를 선정하여,  
가족구성원으로 포인트를 통합 조회하고 이용하는 가족 통합 멤버십 카드를 말합니다.
* "프리머스시네마 멤버십회원"(이하 "회원")이란 멤버십카드를 발급 받아 정상적으로 사용할 수 있는 권한을 부여 받은 자를 말합니다.
* "프리머스시네마 멤버십 제휴사" 및 "프리머스시네마 멤버십 제휴점"(이하 "제휴점")이란 프리머스시네마와 제휴점 사이에 계약을 체결하고 프리머스시네마 멤버십회원에게 혜택을 제공하는 업소를 말합니다.
* "프리머스시네마 멤버십포인트"(이하 "포인트")라 함은 회원이 멤버십서비스를 이용하기 위하여 취득하는 것으로서 그 취득 및 사용 등에 관한 구체적인 사항은 본 약관 제5조, 제6조, 제7조에 기술된 바와 같습니다.   

제 3 조 (회원가입 및 멤버십카드 발급)
① 회원으로 가입하고자 하는 고객은 프리머스시네마가 정한 회원가입신청서(제휴카드인 경우 제휴사와 프리머스시네마가 협의로 정한 회원가입 신청서)에 정해진 사항을 기입한 후 본 약관에 동의함으로써 회원가입을 신청합니다.
② 고객으로부터 회원 가입 신청이 있는 경우 프리머스시네마는 자체 기준에 따른 심사(제휴카드인 경우 제휴사 및 프리머스시네마의 심사)를 거친 뒤 동 기준을 만족하는 회원가입신청 고객에게 멤버십카드를 발급하여 드립니다.
③ 구체적인 멤버십카드의 발급절차는 다음과 같습니다. 
(1) 프리머스 멤버십 카드
가. 만 14세 미만의 고객 : 부모 등 법정대리인의 동의가 있어야 회원 가입이 가능하며, 프리머스시네마 홈페이지를 통해서만 가입 가능합니다. 멤버십 가입 시 법정대리인의 성명, 이메일, 연락처를 받습니다. 법정 대리인의 이메일 주소로 서면 동의서를 보내 드리며, 법정대리인의 신분증 사본 및 동의서 수신 시 프리머스 멤버십 회원으로 가입됩니다. 동의서는 Fax (02)371-6630, 이메일 eunk@cj.net으로만 받습니다. 법정대리인의 개인정보는 만 14세 미만의 회원가입 동의의 목적으로만 사용되며, 다른 목적으로 사용시에는 개인정보 취급방침에 명시된 절차에 따라 동의를 받은 후 활용합니다.
나. 만 14세 이상의 고객 : 프리머스 각 극장을 통해 멤버십 가입 신청서 작성 후 받은 프리머스 멤버십카드를 사용할 수 있습니다. 멤버십 신청서를 작성하지 않고 프리머스 멤버십 카드를 홈페이지에서 등록하셔도 사용 가능합니다. 
(2) 프리머스 제휴카드
만 18세 이상의 자만 발급신청 가능하며, 프리머스 각 극장 및 홈페이지, 각 제휴카드 발급점을 통해 회원가입하고 발급신청을 하는 경우 발급절차를 거쳐 회원가입 신청서 상에 기입된 주소지로 발송됩니다.
④ 본 조 제1항 및 제2항에 정해진 바에 따라 발급되는 가족카드는 현장에서 발급하며, 대표아이디 포함 최대 5장 이내에서 추가 발급이 가능합니다. 카드 신청 및 추가 발급 시 대표 아이디 사용자와 추가 발급자가 현장에 방문하여야 합니다.

제 4 조 (멤버십서비스)
① 회원은 프리머스시네마 전 극장에서 영화 관람 시, 포인트를 적립 받을 수 있습니다. 구체적인 적립방법과 적립 기준은 본 약관 제5조의 포인트 적립 기준에 따라 제공됩니다.
② 회원은 적립한 포인트를 사용하여, 프리머스시네마가 제공하는 포인트선물로 교환할 수 있습니다. 구체적인 포인트 사용방법과 사용기준은 본 약관 제6조의 포인트 사용기준에 따라 제공됩니다.
③ 회원은 제휴점에서 멤버십카드 제시 시, 프리머스시네마와 제휴점 사이에 체결한 계약에 따라, 할인 등 별도 혜택을 받을 수 있습니다.
④ 매년 회원 중 VIP회원으로 선정된 회원은 VIP회원으로 선정된 당해년도에 한해, VIP카드와 함께 프리머스시네마가 제공하는 각종 VIP서비스를 제공받을 수 있습니다. VIP회원의 선정기준은 프리머스시네마의 자체 기준에 따라 매년 변경되며, VIP회원 기준, 등록방법 및 카드 교체방법은 약관 제17조 제1항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.
⑤ 본 조 제4항의 VIP회원에 대한 혜택은 프리머스시네마 홈페이지에 공지되며, 본 혜택은 프리머스시네마 회사 사정에 따라 변경될 수 있습니다.  
제 5 조 (멤버십포인트 적립)
① 멤버십카드를 발급받은 회원에 한해 프리머스시네마 전 극장에서 티켓 구매 시, 유료 영화관람금액의 10%에 해당되는 포인트를 적립할 수 있으며, 영화관람 다음날 적립 확인할 수 있습니다.
② 회원은 반드시 티켓을 구입할 때 멤버십카드를 함께 제시하여야만 적립이 가능하며, 적립 포인트의 한도는 없습니다.
③ 프리머스시네마 영화관람권을 이용해서 영화를 관람한 회원은 관람권의 형태에 따라 포인트의 적용 여부가 결정됩니다.
④ 회원은 프리머스시네마가 사전 공지한 행사의 참여를 통해 포인트를 추가로 적립 받을 수 있습니다. 이 경우 적립되는 포인트는 행사 공지 시 별도로 공지된 기준에 따라 적립되게 됩니다.
⑤ 이미 결제한 내용을 환불할 경우, 해당 환불액에 해당하는 포인트가 적립 취소됩니다.
  
제 6 조 (멤버십포인트 사용)
① 포인트를 보유한 회원은 프리머스시네마 극장과 홈페이지에서 멤버십카드와 신분증 제시 등 프리머스시네마가 정한 소정의 절차에 따라 포인트 별 혜택을 수령할 수 있으며, 포인트 별 혜택에 대한 내용은 프리머스시네마 홈페이지에 별도 공지합니다.
② 각 포인트별 혜택은 프리머스시네마 회사 상황에 따라 변경될 수 있습니다.
③ 프리머스시네마는 일정 기준 이상의 포인트를 달성한 회원을 대상으로 이벤트를 실시할 수 있으며, 해당 경품 및 참여 가능 포인트는 이벤트 실시 시점에 사전 공지합니다.
④ 본 조 제1항, 제2항, 제3항에서처럼 포인트 별 혜택을 받을 경우, 그에 해당하는 멤버십 포인트는 소멸되며, 기 수령한 포인트 혜택은 환불이 불가능 합니다.
⑤ 가족카드를 보유한 회원은 카드 발급 지점 또는 홈페이지에서 가족카드 제시, 신분증 제시 등 프리머스 시네마가 정한 소정의 절차에 따라 가족카드 할인 혜택 및 포인트를 통합 관리하실 수 있습니다.

제 7 조 (멤버십포인트 정정, 취소 및 소멸)
① 멤버십포인트 적립에 오류가 있을 경우, 회원은 오류발생 시점부터 60일 이내에 프리머스시네마에 정정 신청을 하여야 하며, 프리머스시네마는 회원의 정정 신청일로부터 3개월 이내에 조정할 수 있습니다. 단, 회원은 멤버십포인트 적립의 오류를 증명할 수 있는 전표나 자료를 프리머스시네마에 제시하여야 합니다.
② 적립된 포인트의 사용기간은 적립일로부터 차차년도 4월 30일까지이며, 이 기간 내에 사용하지 않은 포인트는 매년 4월 30일 회사 영업 종료시점에 자동 소멸됩니다. 단, 회원의 자격은 계속 유지됩니다.  
③ 가족카드는 대표 아이디 1명을 선정하여 해당아이디로 포인트를 통합 적립 및 사용할 
수 있습니다. 단, 가족카드로 포인트 통합 후 회원의 사정에 의한 가족카드 카드별 포인트 분리는 불가합니다.

제 8 조 (멤버십카드 이용 및 관리)
① 멤버십카드는 회원 본인이 직접 사용하여야 하며, 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없습니다.
② 멤버십카드는 회원 스스로의 책임하에 관리하여야 하며, 회원의 고의 또는 과실로 멤버십카드가 훼손, 분실, 도난 등의 사고(이하 “사고”)가 발생한 경우, 회원은 즉시 그 사실을 프리머스시네마에 통지하여야 합니다.
③ 회원으로부터 본 조 제2항에 따른 통지를 받은 경우, 프리머스시네마는 즉시 사고 등록 및 당해 멤버십카드의 사용을 중지하는 등 필요한 제반 조치를 취합니다. 단, 프리머스시네마는 당해 회원이 본 조 제2항에 따른 통지를 한 시점 이전에 발생한 손해에 대해서는 어떠한 책임도 지지 않습니다.
④ 회원이 제휴점에서 멤버십서비스를 이용하고자 할 경우에는 제휴점에 멤버십카드를 제시하여야 합니다. 단, 여기에서 "멤버십카드를 제시한다" 함은 멤버십카드를 제휴점에 보여주는 행위, 멤버십카드번호를 입력하는 행위, 멤버십카드 비밀번호를 입력하는 행위 등 멤버십서비스를 이용하고자 하는 고객이 프리머스시네마로부터 적법하게 인정된 회원임을 증명하는 행위를 말합니다. 
⑤ 회원이 멤버십서비스를 이용하고자 멤버십카드를 제휴점에 제시할 경우 제휴점은 회원에게 본인 확인을 위한 신분증 제시를 요청할 수 있습니다. 이 경우 회원은 제휴가맹점의 요청을 준수하여야 정상적인 멤버십서비스를 제공 받을 수 있습니다.  

제 9 조 (회원의 의무)
① 회원은 이 약관에서 규정하는 사항과 이용안내 또는 공지사항 등을 통하여 프리머스시네마가 공지하는 사항을 준수하여야 하며, 기타 프리머스시네마의 업무에 방해되는 행위를 하여서는 안됩니다.
② 회원은 프리머스시네마가 제공한 멤버십서비스와 멤버십서비스가 제공한 혜택(포인트, 경품 등)을 이용하여 영업 활동을 할 수 없습니다.
③ 회원은 구매한 티켓을 다른 고객에게 재 판매할 수 없으며, 위반 시에는 제공받았던 멤버십 서비스가 제공한 혜택 (포인트, 경품 등)을 반환하여야 합니다.
④ 회원은 멤버십서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.  


제 10 조 (회원의 탈퇴 및 자격상실)
① 회원은 언제든지 서면, E-MAIL, 전화 및 기타 프리머스시네마가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, 프리머스시네마는 회원의 요청에 따라 조속히 멤버십회원 탈퇴에 필요한 제반 절차를 수행합니다. 
② 회원이 다음 각 호의 사유에 해당하는 경우, 프리머스시네마는 당해 회원에 대한 통보로서 회원의 자격을 상실시킬 수 있습니다.   
1. 회원이 멤버십서비스 가입 신청 시에 허위의 내용을 등록한 경우   
2. 회원이 본 약관 제9조의 회원의 의무를 위반했을 경우   
3. 회원이 프리머스시네마가 정하지 않은 방법으로 멤버십카드를 부정 발급하거나, 멤버십서비스와 포인트를 부정한 방법으로 사용 및 적립한 경우
③ 프리머스 멤버십 회원이 사망한 경우에는 별도의 통보 없이 당연히 자격이 상실됩니다.
④ 본 조 제2항의 사유로 멤버십회원 자격이 상실된 회원은 본 조 제2항 각호의 사유가 자신의 고의 또는 과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 프리머스시네마는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금    정상적인 멤버십서비스를 이용할 수 있도록 합니다.
⑤ 회원탈퇴 또는 자격의 상실이 확정될 경우, 회원에게 적립된 멤버십포인트도 함께 소멸됩니다.  

제 11 조 (멤버십서비스 종료)
① 프리머스시네마는 본 약관에서 정한 바에 따라 계속적이고 안정적인 멤버십서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리 복구하여야 합니다. 다만, 천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 멤버십서비스를 일시 중지하거나 종료할 수 있습니다.
② 멤버십서비스를 정상적으로 종료하고자 할 경우, 프리머스시네마는 멤버십서비스를 종료하고자 하는 날로부터 1개월 이전에 아래에 규정된 방법 중 1가지 이상의 통지방법을 준용하여 회원에게 고지하여 드립니다.
1.E-MAIL 통보  2.서면 통보  3.홈페이지(www.primuscinema.com)내 게시  4.프리머스 극장 내 게시
③ 전 항의 서비스 종료일 이후 회원은 멤버십 포인트 적립혜택을 받지 못하며, 멤버십 포인트는 자동으로 소멸됩니다.

제 12 조 (회원에 정보 전달)
① 프리머스시네마는 이벤트 및 당첨 정보를 전달하기 위해서 회원이 등록한 E-MAIL 주소 또는 SMS등을 이용 할 수 있습니다.
② 회원은 E-MAIL 주소 또는 SMS등으로 메시지를 수신 받기를 원하지 않을 경우, 프리머스시네마 홈페이지에서 개인정보 수정을 통해 수신거부 할 수 있습니다.
③ 프리머스시네마는 이용자가 동의하지 않은 영리목적의 광고성 전자우편을 발송하지 않습니다.

제 13 조 (약관개정)
① 본 약관은 수시로 개정될 수 있으며 약관을 개정하고자 할 경우 프리머스시네마는 개정된 약관을 적용하고자 하는 날(이하 "효력 발생일"이라고 합니다)로부터 7일 이전에 약관이 개정된다는 사실과 개정된 내용 등을 아래에 규정된 방법 중 1가지 이상의 방법으로 회원에게 고지하여 드립니다. 다만 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예 기간을 두고 공지합니다.     
1.E-MAIL 통보 2.서면 통보 3.프리머스시네마 홈페이지(www.primuscinema.com)내 게시  4.프리머스시네마 극장 내 게시
② 프리머스시네마가 E-MAIL 통보 또는 서면통보의 방법으로 본 약관이 개정된 사실 및 개정된 내용을 회원에게 고지하는 경우에는 회원이 프리머스시네마에 기제공한 E-MAIL 주소나 주소지 중 가장 최근에 제공된 E-MAIL 주소나 주소지로 통보합니다.
③ 본 조의 규정에 의하여 개정된 약관(이하 ‘개정약관’)은 원칙적으로 그 효력 발생일로부터 장래를 향하여 유효합니다.
④ 회원은 개정약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 개정약관의 효력 발생 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.   

제 14 조 (손해배상)
① 회원이 본 약관의 규정을 위반함으로 인하여 프리머스시네마에 손해가 발생한 경우, 이 약관을 위반한 회원은 프리머스시네마에 발생하는 모든 손해를 배상해야 합니다.
③ 회원이 서비스를 이용함에 있어 행한 불법행위나 본 약관 위배행위로 인하여 프리머스시네마가 회원 이외의 제 3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의 제기를 받은 경우 회원은 자신의 책임과 비용으로 프리머스시네마를 면책시켜야 하며, 프리머스시네마가 면책되지 못한 경우 당해 회원은 그로 인하여 프리머스시네마에 발생한 모든 손해를 배상하여야 합니다.  

제 15 조 (면책사항)
① 프리머스시네마는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
② 프리머스시네마는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
③ 프리머스시네마는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
④ 프리머스시네마는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
⑤ 프리머스시네마는 서비스 이용과 관련하여 가입자에게 발생한 손해 가운데 가입자의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.  

제 16 조 (관할법원)
① 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다. 다만, 협의가 이루어지지 아니한 경우에는 양 당사자는 민사소송법상의 관할법원에 소송을 제기할 수 있습니다.  

[제정] (2011. 2. 29 개정) 
본 약관은 2012년 4월 19일부터 시행합니다.

                                		</textarea>
											</td>
										</tr>
									</table>
									<input type="checkbox" class="check" name="chk" />약관에 동의합니다.
								</div>
								<div class="rightside">
									<table>
										<tr>
											<td>
												<h3>* 개인정보수집 및 활용동의</h3> <textarea readonly cols="40"
													rows="8" name="intro"> 
1. 수집하는 개인정보 항목 
■필수입력사항 : 
- 이름, 생년월일, 아이디, 비밀번호, 이메일, 전화번호나 휴대폰번호, 주소, 선호극장, 법정대리인 정보(미성년자 가입의 경우), 마케팅 정보수신 동의 여부 
■선택입력항목 : 
- 기념일, 선호장르, 관심분야, 궁금한 정보등 개인별 서비스 제공을 위해 필요한 항목 및 추가 입력 사항 
■서비스 이용 또는 사업처리 과정에서 생성 수집되는 각종 거래 및 개인 성향 정보
- 서비스 이용기록, 접속로그, 쿠키, 접속IP정보, 결제기록 등 


2. 개인정보의 수집 목적
■이름, 아이디, 비밀번호: 회원제 서비스 이용에 따른 본인 확인(인증) 절차에 이용
■IP: 주민번호 도용 등 개인정보 침해 사고에 대한 대비
■이메일, 주소, 전화번호, 핸드폰 번호, 이메일/SMS 수신여부, 선호극장: 고지사항 전달/불만 처리 등을 위한 원활한 의사소통 경로의 확보, 새로운 서비스 및 신상품이나 이벤트 정보 등의 안내 및 경품 및 물품 배송에 대한 정확한 배송 정보 확보
■은행계좌정보, 신용카드정보: 상품 구매에 대한 결제
■법정 대리인 정보 : 회원가입 미성년자 보호자 동의 확인을 위한 메일 발송 및 동의 확인 절차


3. 개인정보의 보유/이용기간
■당사와 제휴사는 수집된 회원의 개인정보는 수집 목적 또는 제공 받은 목적이 달성되면 지체없이 파기함을 원칙으로 합니다. 다만, 다음 각 호의 경우 일정기간 동안 예외적으로 수집한 회원정보의 전부 또는 일부를 보관할 수 있습니다.
- 고객요구사항 처리 및 A/S의 목적 : 수집한 회원정보를 회원탈퇴 후 7일간 보유
당사는 회원탈퇴 시 7일 후 아이디를 제외한 관련 정보들을 모두 폐기합니다. 7일의 유예기간은 7일 내 변심으로 인한 재가입 시 이전 아이디의 사용 및 회원님의 활동 데이터를 복구하기 위함이며, 무분별한 회원탈퇴 및 재가입으로 인한 피해를 줄이기 위함입니다.
- 기타 당사 및 제휴사가 필요에 의해 별도로 동의를 득한 경우 : 별도 동의를 받은 범위 (회원정보 및 보유기간) 내에서 보유 
■상기 조항에도 불구하고 상법 및 '전자상거래 등에서 소비자보호에 관한 법률'등 관련 법령의 규정에 의하여 다음과 같이 일정기간 보유해야 할 필요가 있을 경우에는 관련 법령이 정한 기간 또는 다음 각 호의 기간 동안 회원정보를 보유할 수 있습니다.
- 계약 또는 청약철회 등에 관한 기록 : 5년
- 대금결제 및 재화등의 공급에 관한 기록 : 5년
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년


                                		</textarea>
											</td>
										</tr>
									</table>
									<input type="checkbox" class="check" name="chk" />약관에 동의합니다.
								</div>
							</div>
						</li>
						<li>
							<div class="submit">
								<input type="submit" value="회원가입" /> <input type="reset"
									value="취소" />
							</div>
						</li>
					</ul>
				</form>
			</div>
		</div>

		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>