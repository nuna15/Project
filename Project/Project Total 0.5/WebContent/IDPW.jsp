<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link href="stylesheets/login/IDPW.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="con_wrap">
		<div class="headbx">
			<h3>"아이디 / 비밀번호 찾기"</h3>
		</div>
		<div class="box_wrap">
			<div class="box">
				<div class="head">
					<center>
						<h4>아이디 찾기</h4>
					</center>
				</div>
				<form action="UserManageController" method="post" name="findidform"
					onsubmit="return check_findidform(this)">
					<input type="hidden" name="type" value="id_result"> <input
						type="hidden" name="type2" value="normal">
					<div class="input_wrap">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<th>이름</th>
									<td><input type="text"
										style="border-color: rgb(204, 204, 204); width: 90px;"
										name="name" maxlength="20" autocomplete="off"></td>
								</tr>
								<tr>
									<th>주민등록번호</th>
									<td><input type="text" name="jumin1" maxlength="6"
										style="border-color: rgb(204, 204, 204); width: 90px;">
										<input type="password" maxlength="7" name="jumin2"
										style="border-color: rgb(204, 204, 204); width: 90px;">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn">
						<center>
							<input type="image"
								src="https://www.ygosu.com/images/btn_ok5.gif" alt="확인">
						</center>
					</div>
					<input type="hidden" name="action" value="check"></input>
				</form>
			</div>
			<div class="box">
				<form action="UserManageController" method="post" name=:findpwdform
					" onsubmit="return check_findpwdform(this)">
					<input type="hidden" name="type" value="pwd_result"> <input
						type="hidden" name="type2" value="normal">
					<div class="head">
						<center><h4>주민번호 인증</h4></center>
					</div>
					<div class="input_wrap">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<th>아이디</th>
									<td><input type="text"
										style="border-color: rgb(204, 204, 204); width: 90px;"
										name="id" maxlength="12" autocomplete="off"></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text"
										style="border-color: rgb(204, 204, 204);; width: 90px;"
										name" maxlength="20" autocomplete="off"></td>
								</tr>
								<tr>
									<th>주민등록번호</th>
									<td><input type="text" name="jumin1" maxlength="6"
										style="border-color: rgb(204, 204, 204); width: 90px;">
										<input type="password" maxlength="7" name="jumin2"
										style="border-color: rgb(204, 204, 204); width: 90px;">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn">
						<center>
							<input type="image"
								src="https://www.ygosu.com/images/btn_ok5.gif" alt="확인">
						</center>
					</div>
					<input type="hidden" name="action" value="check"></input>
				</form>
			</div>
		</div>
	</div>

</body>
</html>