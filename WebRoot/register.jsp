<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--This is the register interface-->
<title>Register</title>
<link rel="stylesheet" type="text/css" href="css/register.css"/>
<script src="js/regValidation.js" language = "javascript" type="text/javascript"></script>
</head>

<body style="font-family:'微软雅黑'">
<div id="register">

<form name="frmExample" action="" method="post">
<fieldset>

<div id="banner">

</div>
<table>
<tr>
<td class ="label">
<label for="email"><span class="required">*</span>您的邮箱</label>
</td>
<td class="form">
<input type="text" name="username" id="email" />
</td>
</tr>
 <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr>
<td class="label">
<label for="fname"><span class="required">*</span>昵称</label>

</td>
<td class="form">
<input type="text" name="nickname" id="fname" maxlength="16"/>


</td>
</tr>

<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr>
<td class="label" >
<label for="pwd"><span class="required">*</span>密码</label>
</td>
<td class="form">
<input type="password" name="password" id="pwd" maxlength="12"/>
<!--Error informaiton-->
<span class="small">密码过于简单，请更换</span>
</td>

</tr>
<tr>
<td class="label">
<label for="pwdConf"><span class="required">*</span>确认密码</label>
</td>
<td class="form">
<input type="password" name="passwordconf" id ="pwdConf" maxlength="12"/>
</td>
</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr>
<td class="label">
<label for="fromPlace">来源地</label>
</td>
<td class="form">
<input type="text" name="comefrom" id ="fromPlace" maxlength="12"/>
</td>
</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
</table>
 <table>
 
 
 
 <tr>
 <td width="150">&nbsp;</td>
 <td>
 <div class="login" style="display:inline">
 <input id="submit" type="submit" value=""/>
  <script type="text/javascript">
    document.getElementById('submit').onmouseover = function(){this.style.background="url(images/loginMouseOver.png) no-repeat "
	this.style.align="right"}
	document.getElementById('submit').onmouseout = function(){this.style.background="url(images/login2.png) no-repeat"
	this.style.align="right"}
</script>
<a href="login.html">已有账号？立即登录</a></div>
<div style="display:inline" class="required">*</div>为必填项</td>
</tr>
</table>
</fieldset>
</form>
</div>
</body>
</html>
