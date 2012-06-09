<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/login.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/login.js">
	
</script>
<!--A function to change the icon-->
<script>
function changeicon(obj,flag){
	if(flag){
		obj.style.background="url(images/delete2.png) no-repeat";
		}else{
			obj.style.background="url(images/delete.png) no-repeat";
			}
	}	
</script>
<!--This is the login interface-->
<title>Login</title>
</head>
<body style="font-family:'微软雅黑'">
<div id="container">
  <div id="header">
    <div id="headerbanner"></div>
  </div>
  <div id="loginTable">
    <table width="298" class="datalist" id ="login" >
      <tr>
        <td class="register" colspan="2"><a href="register.html"><img alt="register" id="registerButton" src="images/register.png" align="right" /></a> 
          <script type="text/javascript">
    document.getElementById('registerButton').onmouseover = function(){this.src="images/registerMouseOver.png"}
	document.getElementById('registerButton').onmouseout = function(){this.src="images/register.png"}
</script></td>
      </tr>
      <tr>
        <td width="122" class = "caption"><label for="userName" >用户名:</label></td>
        <td width="168" class="form"><input type="text" id="userName" onkeyup="fudongDiv.inputBox(this)"  />
          <br/>
          <div id="showUser"></div></td>
      </tr>
      <tr>
        <td class="caption"><label for="userPass">密码:</label></td>
        <td class="form"><input type="password" id="userPass" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="small" ><input id="remember" type="checkbox"/>
          下次自动登录 <a href="forget.html" id="forget">忘记密码</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="36"  class="register"><input id="loginButton" type="submit" value="" />
          
          <script type="text/javascript">
    document.getElementById('loginButton').onmouseover = function(){this.style.background="url(images/loginMouseOver.png) no-repeat"}
	document.getElementById('loginButton').onmouseout = function(){this.style.background="url(images/login2.png) no-repeat"}
</script></td>
      </tr>
    </table>
  </div>
  <!--Panel for hot blogs-->
  <div id="allblogs" style="font-family:'微软雅黑'">
    <ul id="bloglist">
      <li class="blogitem">
        <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
        <div class="blogmessage">
          <div class="blogauthor"><a href="ui.html" class="author">喜羊羊</a>：开心闯龙年</div>
          <div class="bloginfo">
            <div class="blogdate">02月07日 15:39:11 来自网页</div>
            <div class="blogfunc">
              <input value=""  type="button" class="comment"/>
              
              <input type="button" value="" class="forward"/>
              
              <input type="button" value="" id="delete" onmouseover="changeicon(this,true)" onmouseout="changeicon(this,false)"/>
             
            </div>
          </div>
        </div>
      </li>
      <li class="blogitem">
        <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
        <div class="blogmessage">
          <div class="blogauthor"><a href="#" class="author">喜羊羊</a>：转发微博</div>
          <div class="forwardblog">
            <div class="blogmessage">
              <div class="blogauthor"><a href="#" class="author">懒羊羊</a>：灰太狼什么的最讨厌了</div>
              <div class="bloginfo">
                <div class="blogdate">02月07日 15:39:11 来自网页 <a href="#">查看转发(1)</a></div>
              </div>
            </div>
          </div>
          <div class="bloginfo">
            <div class="blogdate">02月07日 15:39:11 来自网页</div>
            <div class="blogfunc">
              <input value=""  type="button" class="comment"/>
             
              <input type="button" value="" class="forward"/>
              
              <input type="button" value="" id="delete" onmouseover="changeicon(this,true)" onmouseout="changeicon(this,false)"/>

            </div>
          </div>
        </div>
      </li>
    </ul>
    <div id="funcBox">
      <!--Panel for new users-->
      <div class="newUser">
      <span><img src="images/users.png" alt="user"/></span>
      <h4>这里的人</h4>
        <ul id="newuserlist">
          <li><a href="#"><img src="images/avatars/xiyangyang.png" alt="xiyangyang"/>喜羊羊</a></li>
          <li><a href="#"><img src="images/avatars/meiyangyang.png" alt="meiyangyang"/>美羊羊</a></li>
          <li><a href="#"><img src="images/avatars/lanyangyang.png" alt="lanyangyang"/>懒羊羊</a></li>
           <li><a href="#"><img src="images/avatars/feiyangyang.png" alt="feiyangyang"/>沸羊羊</a></li>
          <li><a href="#"><img src="images/avatars/manyangyang.png" alt="manyangyang"/>慢羊羊</a></li>
           <li><a href="#"><img src="images/avatars/nuanyangyang.png" alt="nuanyangyang"/>暖羊羊</a></li>
           <li><a href="#"><img src="images/avatars/hongtailang.png" alt="hongtailang"/>红太狼</a></li>
           <li><a href="#"><img src="images/avatars/huitailang.png" alt="huitailang"/>灰太狼</a></li>
        </ul>
      </div>
      <!--Panel for hot users-->
      <div class="hotusers">
      <img src="images/hotuser.png" alt="hotusers"/>
      <h4>热门用户<span class="fans">粉丝数</span></h4>
      <ul id="hotuserlist">
      <li><a href="#"> 喜羊羊</a><span>6</span></li>
      <li><a href="#"> 美羊羊</a><span>5</span></li>
      <li><a href="#"> 懒羊羊</a><span>4</span></li>
      <li><a href="#"> 沸羊羊</a><span>3</span></li>
      <li><a href="#"> 暖羊羊</a><span>2</span></li></ul>
      </div>
    </div>
  </div>
</div>
<!--Copyright information-->
<div id="footer">
  <p>Updated: 2012-03-24 23:17:07 &copy;All Rights Reserved </p>
</div>
</body>
</html>
