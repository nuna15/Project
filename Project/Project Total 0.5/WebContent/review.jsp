<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int i = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지1</title>
<link
	href="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="stylesheets/Mainpage_Layout.css" rel="stylesheet"
	type="text/css">
<link href="stylesheets/review/review.css" rel="stylesheet"
	type="text/css">
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script
	src="stylesheets/twitter-bootstrap-3b3dd3a/docs/assets/js/bootstrap-modal.js"></script>
<style type="text/css">
.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	z-index: 1050;
	width: 660px;
	margin: -300px 0 0 -280px;
	background-color: #ffffff;
	border: 1px solid #999;
	border: 1px solid rgba(0, 0, 0, 0.3);
	*border: 1px solid #999;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	outline: none;
	-webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
	box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
	-webkit-background-clip: padding-box;
	-moz-background-clip: padding-box;
	background-clip: padding-box;
}

.modal-body {
	max-height: 300px;
	padding: 15px;
	overflow-y: auto;
}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="share/header.jsp"></jsp:include>

		<!--전체 크기 -->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<ul class="nav">
						<li><a href="ConcertManageController?action=index">공연</a></li>
						<li><a href="ReservationManageController?action=index">예약
						</a></li>
						<li class="active"><a
							href="ReviewManageController?action=index">리뷰</a></li>
						<li><a href="membership.jsp">멤버십</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="content">
			<c:forEach var="list" items="${reviews}">
				<div id="${list.reviewid}" class="modal hide fade" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabel">
							<b>${list.reviewName}</b>
						</h3>
						<center>
							<img src="${list.imgUrl}" alt="위험한관계이미지"
								style="width: 650px; height: 300px">
						</center>
					</div>
					<div class="modal-body">
						<p>
						<div class='comment'>
							<p>${list.contents}</p>
						</div>
						</p>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
						<button class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</c:forEach>

			<!-- Modal -->
			<div id="review1" class="modal hide fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						<b>위험한 관계 - 위험하지 않은 사랑은 없다.</b>
					</h3>
					<center>
						<img
							src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76585/76585100354_727.jpg"
							alt="위험한관계이미지" style="width: 650px; height: 300px">
					</center>
				</div>
				<div class="modal-body">
					<p>
					<div class='comment'>
						사교계에서 이름 난 두 사람, 세이판(장동건)과 모지에위(장백지)는 내기를 한다. 두 사람은 모두 갖고 싶은 것 가져야
						하고 하고 싶은 건 해야 직성이 풀리는 성격이다. 모지에위는 자신을 배신한 남자에게 복수하기 위해 세이판에게 부탁을
						한다. 때 묻지 않은 어린 소녀 베이베이를 탐해 달라는, 이것부터가 상당히 위험한 게임이다. 모지에위는 이른 나이에
						남편을 잃고 험한 세상을 홀로 살아가면서 많은 사건을 겪은 여자다. 그러면서도 결코 다른 여자들의 속사정은 배려하지
						않는다. 사교계의 정상에 올라 많은 사람들의 시선들 앞에도 당당할 수 있는 그녀만의 노하우가 아닐까 싶다. 뻔뻔해지기,
						모지에위는 어떤 상황에서도 웃고 있으나 굽신거리지 않는다. 세이판이 자신의 부탁을 거절했음에도 불구하고 아쉬운 기색
						하나 없다. 오히려 그가 제안한 내기에 선뜻 참여하는 모습을 보인다. 그것이 <u>모지에위가 세이판을 사랑하는
							방식일 지도 모르겠다. 목표를 향해 열정적인 세이판을 길들이는 그녀만의 비법.</u>
					</div>

					<div class='comment'>
						세이판은 곧 모지에위가 자신의 여자가 될 것이라는 확신을 한다. 그만큼 뚜펀위(장쯔이)를 유혹하는 것이 쉽단 소리다.
						뚜펀위는 훌륭한 남편의 사상을 이어받아 자산사업을 하는 정절녀다. 상류계층이 누릴 만한 특권은 누려가면서도 조신함을
						잃지 않는다. 세이판의 추근거림에도 그녀는 흐트러지는 모습 하나 없다. 요리조리 영리하게도 피해다닌다. 어찌보면 그게
						세이판의 마음을 잡았는지도, 은근한 밀당이 아닐까 싶을 정도로 뚜펀위의 순수한 모습이 오히려 계산된 여우인 것처럼
						보인다. <u>자신의 신념 생각 사랑, 과거의 순수했던 추억에만 사로잡혀 사는 뚜펀위가 늘 새롭고 싶어 하는,
							지루한 일상이 싫은 세이판에게는 상당히 매력적으로 보였을 것이란 생각이다. 반듯한 틀에 갇혀 정해진 룰대로만 살아가는
							뚜펀위와 거칠것이 없는 세이판의 만남, 서로 상반된 두 사람의 만남 자체가, 내기와 상관없이 이미 위험한 관계다. 두
							사람이 사랑하게 된다면, 두 사람 모두 자신들의 기존에 살던 삶의 방식을 깨부숴야 하기 때문이다. </u>
					</div>

					<div class='comment'>
						<u>모지에위와 뚜펀위의 상반된 매력을 보는 재미도 쏠쏠하다. 화려하고 당당한 섹시한 여자 모지에위, 수줍고
							우아하고 지적인 여자 뚜펀위, 장백지와 장쯔이의 의상이나 헤어면에서도 그런 성격들이 고스란히 드러나 영화에 관객들이
							쉽게 몰입할 수 있도록 도와준다.</u> 물론 오랜 연기 생활로 유명해진 두 배우지만, 새삼스럽게 연기를 잘한다는 생각도
						들었다. 그들이 주고받는 중국어 속에 장동건의 중국어 연기도 자연스럽게 녹아 들어간다. 물론 한국배우가 중국어를 잘
						하기는 힘들다. 톤이나 억양이 어색한 것은 사실이지만, 장동건이라는 배우는 이미 오래 된 홍콩배우처럼 세이판 역에
						절묘하게 어울렸다
					</div>

					<div class='comment'>
						<u>세이판의 최종 목적지는 모지에위의 품 안이다. 그는 그녀를 갖기 위해 이런 쓸데없는 내기를 만들어 낸
							것이기도 했다. 그는 정말 그녀를 사랑했을까? 영화 스캔들-남녀조선상열지사 에서는 배용준의 첫사랑이 이미숙이다.
							우리나라 남자들에게 첫사랑은, 그 단어 자체만으로도 갖고 싶은 욕망을 불러일으킨다. 그것에 반해 위험한 관계에서
							세이판이 모지에위에게 느끼는 사랑은 조금 억지스러워 보인다.</u> 세이판에게 모지에위는 단지 아직도 정복하지 못한 여자에
						불과한 것은 아닐까, 그 이상의 사랑은 아닌 것 같다. 그걸 알기에 모지에위는 세이판의 마음을 끝내 받아들이지 않으려고
						노력한다. 세이판을 사랑하지 않으려는 그녀의 노력은 그가 다른 여자를 사랑하는 동안에도 이어졌다. 진심을 보이는 순간
						진다는 사실을 알고 있는 그녀, 그녀 인생에 패배란 있을 수 없다. 끝까지 그녀는 인정하지 않는다. 그것이 그녀의 삶을
						비극으로 이끄는 원인이다.﻿
					</div>

					<div class='comment'>끝내 사랑에 빠진 세이판과 뚜펀위, 사랑의 시작은 평온하다. 세이판을
						위해 만두를 빚는 뚜펀위의 모습은 연애를 막 시작한 여자의 풋풋함이 잘 살아 있다. 초반에 예상한 대로, 위험한 관계에
						있는 두 사람이 사랑에 빠졌으니, 서로를 위해 포기해야 할 것들이 생겼다. 뚜펀위는 남편의 유산을 포기한다. 그동안의
						명예로웠던 자리를 포기한다. 세이판은, 모지에위를 포기해야 했다. 그것은 단순히 갖고 싶었던 여자를 포기하는 것과는
						다르다. 상류층의 세계에서의 낙오를 뜻하는 것이다. 편하게 누리기만 했던 화려한 일상에서 쫓겨 날수도 있는 위험한
						상황인 것이다.</div>

					<div class='comment'>
						<u>영화의 후반부는 상당히 잘린 느낌이다. 세이판이 뚜펀위를 버리는 장면이, 너무 삼류 불륜장면처럼 보여졌기
							때문이다. 세이판이 사랑하지만 자신의 위치를 놓치기 싫어 어쩔 수 없이 선택하는, 그런 애절한 갈등이 보이지 않았다.
							그저 세이판을 빼앗긴 모지에위의 질투어린 행패밖에 보이지 않았다. 잘 달려 온 영화가 막판의 극단적인 결말을 맞이하기
							위해 성급했던 건 아닐까 하는 아쉬움이 남는다. 위험한 사랑의 끝에는 결코 행복이 있을 수 없다는, 주제에 충실하긴
							했지만 공감을 얻기에는 부족해 보인다.</u>
					</div>

					<div class='comment'>
						그래도 배우들의 같은 옷, 다른 느낌, 이라는 사진을 구경하는 것처럼 조선시대(스캔들 - 남녀상열지사)와 상하이
						1930년대(위험한 관계)를 비교해보는 재미는 있다. 물론 둘이 승부를 겨룬다면, 개인적으론 스캔들의 승리라고
						생각한다. 좀 더 인물들의 감정 흐름이 자연스럽다.
						<p>
							<u>세상에 위험하지 않은 사랑은 없다. 사랑에 빠지면 판단력이 흐려지기 때문이다.</u>
						<p>
					</div>
					</p>


				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Save changes</button>
				</div>
			</div>

			<div id="review2" class="modal hide fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						<b>내 꿈은 뭐였더라.</b>
					</h3>
					<center>
						<img
							src="http://imgnews.naver.net/image/140/2012/10/24/15_44_25__5084eb49a00fc_59_20121024023009.jpg"
							alt="위험한관계이미지" style="width: 650px; height: 300px">
					</center>
				</div>
				<div class="modal-body">
					<p>
					<div class='comment'>
						﻿토슈즈 냄새도 못맡아본 내가 영화를 , 그것도 발레에 관한 다큐를 보러간건 순전히<br /> 나의 이강훈 선생.
						신하균님의 나래이션 때문.<br /> 난 큰 충격을 받고 돌아왔다. ..
					</div>

					<div class='comment'>
						나의 꿈은 뭐였더라.<br /> 내나이 10살. 수녀가 되고 싶었다.<br /> 그러나. 배고파 쓰러질 때까지
						금식기도 해본적도 없고, 진득히 앉아 성경책을 독파해본적도 없다.<br /> 대통령이 되고 싶었던 적도 있었다.<br />
						그러나. 공부와는 담쌓은 내가 코피터져라 공부해본적도 없고, <br /> 쉬는 시간을 잡아 먹는 선생님들의 수업방식에
						<br /> 이의를 제기해본적도 없다.<br /> 기타를 배웠다. <br />
					</div>

					<div class='comment'>
						그러나. 손가락 껍질 벗겨져 가며 피 흘려 가며 그 고통을 참아내며 기타를 쳐본적도 없고, 싸구려 악기탔만 하고 있다.<br />
						살을 빼려고 헬쓰를 끊었다.<br /> 그러나. 비가오면 쉬고, 눈이 오면 쉬고, 바람 불면 쉬고, 오늘 조금
						피곤하면 쉬고....살은 안빠지고<br /> 이번에 요가를 배워 볼까 학원을 전전하고 있다. <br />
						피아니스트가 되고 싶었던 적도 있다.<br /> 그러나, 손톱이 닳아 없어질 만큼 연습을 한 적도 없고, 눈감고
						누우면 허공에 악보가 그려지는 대신<br /> 테트리스 조각들만 떠다녔던 적도 있다.<br /> 한때는 시나리오
						쓰는 사람이 되고 싶기도 했다.<br /> 그러나. 일기하나 매일 매일 쓰지를 못하고 있다.<br /> 책을 한권
						읽어도 끝에 가서는 조바심이 나고, 인내 하지 못해 내용을 슬렁 슬렁 보면서 결말만을 확인하고 덮어버리기도 한다.<br />
						하다못해 머리기르는 것도 인내심 부족으로 견디지 못하고 잘라대니....<br /> 결국 내가 꿈이었다고 말했던 것들은
						하나도 이루질 못하고 나이만 먹었다.<br />
					</div>

					<div class='comment'>
						<u>세이판의 최종 목적지는 모지에위의 품 안이다. 그는 그녀를 갖기 위해 이런 쓸데없는 내기를 만들어 낸
							것이기도 했다. 그는 정말 그녀를 사랑했을까? 영화 스캔들-남녀조선상열지사 에서는 배용준의 첫사랑이 이미숙이다.
							우리나라 남자들에게 첫사랑은, 그 단어 자체만으로도 갖고 싶은 욕망을 불러일으킨다. 그것에 반해 위험한 관계에서
							세이판이 모지에위에게 느끼는 사랑은 조금 억지스러워 보인다.</u> 세이판에게 모지에위는 단지 아직도 정복하지 못한 여자에
						불과한 것은 아닐까, 그 이상의 사랑은 아닌 것 같다. 그걸 알기에 모지에위는 세이판의 마음을 끝내 받아들이지 않으려고
						노력한다. 세이판을 사랑하지 않으려는 그녀의 노력은 그가 다른 여자를 사랑하는 동안에도 이어졌다. 진심을 보이는 순간
						진다는 사실을 알고 있는 그녀, 그녀 인생에 패배란 있을 수 없다. 끝까지 그녀는 인정하지 않는다. 그것이 그녀의 삶을
						비극으로 이끄는 원인이다.﻿
					</div>

					<div class='comment'>끝내 사랑에 빠진 세이판과 뚜펀위, 사랑의 시작은 평온하다. 세이판을
						위해 만두를 빚는 뚜펀위의 모습은 연애를 막 시작한 여자의 풋풋함이 잘 살아 있다. 초반에 예상한 대로, 위험한 관계에
						있는 두 사람이 사랑에 빠졌으니, 서로를 위해 포기해야 할 것들이 생겼다. 뚜펀위는 남편의 유산을 포기한다. 그동안의
						명예로웠던 자리를 포기한다. 세이판은, 모지에위를 포기해야 했다. 그것은 단순히 갖고 싶었던 여자를 포기하는 것과는
						다르다. 상류층의 세계에서의 낙오를 뜻하는 것이다. 편하게 누리기만 했던 화려한 일상에서 쫓겨 날수도 있는 위험한
						상황인 것이다.</div>

					<div class='comment'>
						<u>영화의 후반부는 상당히 잘린 느낌이다. 세이판이 뚜펀위를 버리는 장면이, 너무 삼류 불륜장면처럼 보여졌기
							때문이다. 세이판이 사랑하지만 자신의 위치를 놓치기 싫어 어쩔 수 없이 선택하는, 그런 애절한 갈등이 보이지 않았다.
							그저 세이판을 빼앗긴 모지에위의 질투어린 행패밖에 보이지 않았다. 잘 달려 온 영화가 막판의 극단적인 결말을 맞이하기
							위해 성급했던 건 아닐까 하는 아쉬움이 남는다. 위험한 사랑의 끝에는 결코 행복이 있을 수 없다는, 주제에 충실하긴
							했지만 공감을 얻기에는 부족해 보인다.</u>
					</div>

					<div class='comment'>
						그래도 배우들의 같은 옷, 다른 느낌, 이라는 사진을 구경하는 것처럼 조선시대(스캔들 - 남녀상열지사)와 상하이
						1930년대(위험한 관계)를 비교해보는 재미는 있다. 물론 둘이 승부를 겨룬다면, 개인적으론 스캔들의 승리라고
						생각한다. 좀 더 인물들의 감정 흐름이 자연스럽다.
						<p>
							<u>세상에 위험하지 않은 사랑은 없다. 사랑에 빠지면 판단력이 흐려지기 때문이다.</u>
						<p>
					</div>
					</p>


				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Save changes</button>
				</div>
			</div>

			<div id="review3" class="modal hide fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						<b>회사원..</b>
					</h3>
					<center>
						<img
							src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76581/7658199977_727.jpg"
							alt="위험한관계이미지" style="width: 650px; height: 300px">
					</center>
				</div>
				<div class="modal-body">
					<p>
					<div class='comment'>
						오랜만에 소지섭 출현으로 기대를 크게 했는데,<br /> 주연배우만 맘에들고, 스토리는 너무 아쉬운 부분이 많은 것
						같네요..<br /> 너무 기대를 크게 해서 그런가, 지루만 부분도 많았어요..<br /> 소지섭을 좋아하는
						광팬이라면 볼만하겠지만, 그렇지 않다면 영화본 후에 좀 실망할 수도 있을 것 같네요.

					</div>
					</p>

				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Save changes</button>
				</div>
			</div>

			<div id="review4" class="modal hide fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						<b>의문을 많이 갖게 한 영화</b>
						<center>
							<img
								src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76601/76601100373_727.jpg"
								alt="위험한관계이미지" style="width: 650px; height: 300px">
						</center>
					</h3>
				</div>
				<div class="modal-body">
					<p>
					<div class='comment'>영화관에서 혼자 본 건 이번이 처음이다. 췌장암에 걸린 여자는 어찌됐든
						돈 해결이 되었는데도 왜 죽음을 선택했는지, 50억 상속자인 여자는 어떤 죽음을 당했는지, 택시에서도 동일 인물이었는데
						그 여자는 이후에 어떻게 되었는지, 노량진 수산시장을 가자고 한 여자가 구타를 당했는지 조차도 의문투성이다. 왜
						그럴까? 하고 물음표를 던지며 각자의 상상력을 구한 것이 아니라면 너무 숨은 그림이 많다. 하느님을 사랑하라고 팻말을
						들고 쪽지를 돌리는 학생도 왜 그렇게 살아가는지... 엄마는 어떤 분인지... 구체적이지 않다. 이렇게 영화를 보면서
						의문을 많이 갖게 한 영화도 처음인 것 같다. 사채를 중심으로 그 속에서 얽혀진 이야기를 그린 영화라는 것은 알겠는데
						좀 깊이있게 보여줬으면 하는 아쉬움이 많다. 도시는 비정하다고 표현했지만 그런 색깔을 만든 사람들의 밑그림이 아닐까
						생각해본다.</div>
					</p>

				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- 실직적으로 보여질 정보들-->
			<div class="section_1" id="hotreview">
				<!--인기리뷰-->
				<p class="title">BEST REIVIEW</p>
				<a href="#review1" role="button" data-toggle="modal"> <img
					src="http://img.cgv.co.kr/Movie/Thumbnail/StillCut/000076/76585/76585100354_727.jpg"
					alt="위험한관계이미지">
					<p class="subtitle">위험한 관계 - 위험하지 않은 사랑은 없다.</p> <span>
						사교계에서 이름 난 두 사람, 세이판(장동건)과 모지에위(장백지)는 내기를 한다. 두 사람은 모두 갖고 싶은 것 가져야
						하고 하고 싶은 건 해야 직성이 풀리는 성격이다. 모지에위는 자신을 배신한 남자에게 복수하기 위해 세이판에게 부탁을
						한다. 때 묻지 않은 어린 소녀 베이베이를 탐해 달라는, 이것부터가 상당히 위험한 게임이다. 모지에위는 이른 나이에
						남편을 잃고 험한 세상을 홀로 살아가면서 ...</span></a>

			</div>

			<div class="section_2">
				<!--리뷰 1,2,3의 묶음-->
				<div class="section_2_left" id="review1">
					<!--리뷰1-->
					<a href="#review2" role="button" data-toggle="modal">
						<p class="minititle">[퍼스트 포지션]</p> <br />
						<p>
							<b>내 어릴적 꿈은 뭐였지?</b>
						</p> ﻿
						<p>토슈즈 냄새도 못맡아본 내가 영화를 , 그것도 발레에 관한 다큐를 보러간건 순전히 ...</p> <img
						src="http://img.cgv.co.kr/Community/Contents/2012/1031/퍼스트포지션.jpg"
						width="200px" align="center" alt="퍼스트포지션 이미지">
					</a>

				</div>
				<div class="section_2_middle" id="review2">
					<!--리뷰2-->
					<a href="#review3" role="button" data-toggle="modal">
						<p class="minititle">[회사원]</p> <br />
						<p>
							<b>남자친구와 본 소지섭!</b>
						</p> ﻿
						<p>오랜만에 소지섭 출현으로 기대를 크게 했는데, 주연배우만 맘에들고, 스토리는 너무...</p> <img
						src="http://img.cgv.co.kr/Community/Contents/2012/1031/회사원.jpg"
						width="200px" align="center" alt="회사원 이미지">
					</a>
				</div>
				<div class="section_2_right" id="review3">
					<!--리뷰3-->
					<a href="#review4" role="button" data-toggle="modal">
						<p class="minititle">[비정한 도시]</p> <br />
						<p>
							<b>영화관에서 혼자 본 영화!</b>
						</p> ﻿
						<p>영화관에서 혼자 본 건 이번이 처음이다. 췌장암에 걸린 여자는 어찌됐든 돈 해결이 되었는...</p> <img
						src="http://img.cgv.co.kr/Community/Contents/2012/1031/비정한도시.jpg"
						width="200px" align="center" alt="비정한도시 이미지">
					</a>
				</div>
			</div>

			<div class="section_3" id="reviewlist">
				<!-- 리뷰 리스트-->
				<p class="title">REVIEW</p>
				<div class="review" style="text-align: right; margin-right: 50px;">
					<a href="ReviewManageController?action=register"><input
						type="button" value="글쓰기"
						onclick="location.href('ReviewManageController?action=register')"></a>
				</div>
				<ul>
					<c:forEach var="review" items="${reviews}">

						<li><a href="#${review.reviewid}" role="button"
							data-toggle="modal"> <img src="${review.imgUrl}"
								width="180px" height="120px" alt="아르고 이미지">
								<p class="minititle">${review.reviewName}</p> ${review.contents}<br />
								<span> 10:23:39 | 조회수 740 | 추천수 3</span>
						</a></li>
					</c:forEach>
				</ul>

				<div class='paging'>
					<a href="#">Prev</a> <strong>1</strong> <a href="#">2</a> <a
						href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
				</div>
			</div>

			<jsp:include page="share/footer.jsp"></jsp:include>
		</div>
</body>
</html>