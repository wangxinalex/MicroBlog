
<%
	String duplicated = request.getParameter("duplicated");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<!--This is the register interface-->
		<title>Register</title>
		<link rel="stylesheet" type="text/css" href="css/register.css" />
		<script src="js/regValidation.js" language="javascript"
			type="text/javascript"></script>
	</head>

	<body style="font-family: '微软雅黑'">
		<div id="register">

			<form name="registerForm" id="registerForm" action="servlet/RegServlet"
				method="post">
				<fieldset>

					<div id="banner">

					</div>
					<table>
						<tr>
							<td class="label">
								<label for="username">
									<span class="required">*</span>您的邮箱
								</label>
							</td>
							<td class="form">
								<input type="text" name="username" id="username" />
							</td>
							<td class="message">

								<div id="mailMes">
									<%
										if ("true".equals(duplicated)) {
									%>
									用户名已存在<%
										} else {
									%>
									&nbsp;
									<%
										}
									%>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td class="label">
								<label for="nickname">
									<span class="required">*</span>昵称
								</label>

							</td>
							<td class="form">
								<input type="text" name="nickname" id="nickname" maxlength="16"
									onfocus="checkMail()" />


							</td>
							<td class="message">
								<div id="nameMes">
									&nbsp;
								</div>
							</td>
						</tr>

						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>

						<tr>
							<td class="label">
								<label for="password">
									<span class="required">*</span>密码
								</label>
							</td>
							<td class="form">
								<input type="password" name="password" id="password"
									maxlength="12" onfocus="checkNickName()"
									onkeydown="checkPass()" />
								<!--Error informaiton-->

								
							</td>
							<td class="message">
									<div id="passwdMes">
										&nbsp;
									</div>
								</td>
						</tr>
						<tr>
							<td class="label">
								<label for="passwordconf">
									<span class="required">*</span>确认密码
								</label>
							</td>
							<td class="form">
								<input type="password" name="passwordconf" id="passwordconf"
									maxlength="12" onfocus="checkPass()" />
							</td>
							<td class="message">
								<div id="confirmwdMes">
									&nbsp;
								</div>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td class="label">
								<label for="comefrom">
									来源地
								</label>
							</td>
							<td class="form">
								<input type="text" name="comefrom" id="comefrom" maxlength="12"
									onfocus="checkConfirm()" />
							</td>
							<td class="message">
								<div id="fromMes">
									&nbsp;
								</div>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<table>



						<tr>
							<td width="150">
								&nbsp;
							</td>
							<td>
								<div class="login" style="display: inline">
									<input id="submitButton" type="button" value=""
										onclick="checkAll()" />
									<script type="text/javascript">
	document.getElementById('submitButton').onmouseover = function() {
		this.style.background = "url(images/loginMouseOver.png) no-repeat "
		this.style.align = "right"
	}
	document.getElementById('submitButton').onmouseout = function() {
		this.style.background = "url(images/login2.png) no-repeat"
		this.style.align = "right"
	}
</script>
									<a href="login.jsp">已有账号？立即登录</a>
								</div>
								<div style="display: inline" class="required">
									*
								</div>
								为必填项
							</td>
						</tr>
					</table>
				</fieldset>
			</form>
		</div>
	</body>
</html>
