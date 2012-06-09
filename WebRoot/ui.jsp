<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">

var counter = function(field,counter,maxlimit){
var charcnt = field.value.length;
if (charcnt > maxlimit){
field.value = field.value.substring(0,maxlimit);
}else{
document.getElementById(counter).innerHTML=maxlimit-charcnt;
}
}

function changeicon(obj,flag){
	if(flag){
		obj.style.background="url(images/delete2.png) no-repeat";
		}else{
			obj.style.background="url(images/delete.png) no-repeat";
			}
	}
</script>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<!--This is the main user interface-->
<title>Micro Blog</title>
<link href="css/ui.css" type="text/css" rel="stylesheet"/>
</head>
<body style="font-family:'微软雅黑'">
<!--index bar-->
<div id="index">
  <div><a id="logo" href="/" ></a></div>
  <div>
    <ul id="indexList">
      <li> 首页 </li>
      <li> 广场 </li>
      <li> 微群 </li>
      <li> 应用 </li>
      <li> 游戏 </li>
    </ul>
  </div>
  <!--Search panel at the right of the indexlist-->
  <div id="searchPanel">
    <ul id="searchList">
      <li>
        <input type="text" id="search" size="23" />
        <a href="#"><img alt="searchButton" id="searchButton" src="images/SearchMetro.png" /></a> </li>
    </ul>
  </div>
  <div id="aboutMe">
    <ul id="aboutMeList">
      <li> wangxinalex </li>
      <li> 手机 </li>
      <li> 找人 </li>
      <li> 消息 </li>
      <li><a href="login.html"> 登出</a></li>
    </ul>
  </div>
</div>
<div id="container">
 <div id="main">
 <!--main blog box-->
    <div id="blogBox"> <span><img alt="title" src="images/title.png"/></span>
      <form method="post" action="home.jsp" enctype="multipart/form-data">
      <!--text area to post a new blog-->
        <div class="textBox" >
          <textarea id="blogContent" cols="20" rows="2" tabindex="1"></textarea>
        </div>
        <div class="funBox">
         
            <input class="icon" type="button" id="expression_icon" value=""></input>
            
         
            <input class="icon" id="picture_icon" type="button" value=""></input>
            
          <input class="icon" id="video_icon" type="button" value=""></input>
          <input class="icon" id="music_icon" type="button" value=""></input>
          <input id="sendBlog" type="submit" value=""/>
         
          <span class="count">Remaining <em id="remainNumber">140</em> words</span> 
          <script type="text/javascript">
    document.getElementById('sendBlog').onmouseover = function(){this.style.background="url(images/twitter2.png) no-repeat "
	this.style.align="right"}
	document.getElementById('sendBlog').onmouseout = function(){this.style.background="url(images/twitter.png) no-repeat"
	this.style.align="right"}

	</script> 
  <!--Not more than 140 words-->
    <script type="text/javascript">
document.getElementById("blogContent").onfocus =
document.getElementById("blogContent").onkeydown =
document.getElementById("blogContent").onkeyup =
function(){
counter(this,"remainNumber",140);
}
</script>
        </div>
      </form>
    </div>
    <div id="allblogs">
      <div id="blogtitle">
        <ul class="myblogtitle">
          <li ><a class="allblog" href="#">All twitter</a></li>
          <li ><a class="myblog" href="#">My twitter</a></li>
          <li ><a class="favourite" href="#">Favourite</a></li>
        </ul>
      </div>
      <!--The list for the blog contents-->
      <ul id="bloglist">
        <li class="blogitem">
          <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
          <div class="blogmessage">
          <div class="blogauthor"><a href="#" class="author">喜羊羊</a>：开心闯龙年</div>
          <div class="bloginfo">
         <div class="blogdate">02月07日 15:39:11 来自网页</div>
         <!--Some functional buttons-->
         <div class="blogfunc"><input value=""  type="button" class="comment" onclick="$('.blogreply').eq(0).toggle(1000)"></input><input type="button" value="" class="forward"></input><input type="button" value="" id="delete" onmouseover="changeicon(this,true)" onmouseout="changeicon(this,false)"></input></div>
         </div>
           <div class="blogreply"> <input type="text" class="replytext" size="45"></input><input id="replybutton" type="button" value="" ></input></div>
         <script type="text/javascript">
    document.getElementById('replybutton').onmouseover = function(){this.style.background="url(images/addreply2.png) no-repeat "
	}
	document.getElementById('replybutton').onmouseout = function(){this.style.background="url(images/addreply.png) no-repeat"
	}
	</script> 
         </div>
        
        </li>
        <!--a blog is an item-->
         <li class="blogitem">
          <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
          <div class="blogmessage">
          <div class="blogauthor"><a href="#" class="author">喜羊羊</a>：开心闯龙年2</div>
          <div class="bloginfo">
         <div class="blogdate">02月07日 15:39:11 来自网页</div>
         <div class="blogfunc"><input value=""  type="button" class="comment" onclick="$('.blogreply').eq(1).toggle(1000)"></input><input type="button" value="" class="forward"></input><input type="button" value="" id="delete" onmouseover="changeicon(this,true)" onmouseout="changeicon(this,false)"></input></div>
         </div>
         <!--To add a reply-->
         <div class="blogreply"> <input type="text" class="replytext" size="45"></input><input id="replybutton" type="button" value="" ></input></div>
         <script type="text/javascript">
    document.getElementById('replybutton').onmouseover = function(){this.style.background="url(images/addreply2.png) no-repeat "
	}
	document.getElementById('replybutton').onmouseout = function(){this.style.background="url(images/addreply.png) no-repeat"
	}
	</script> 
         </div>
        
        </li>
        <li class="blogitem">
        <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
          <div class="blogmessage">
          <div class="blogauthor"><a href="#" class="author">喜羊羊</a>：转发微博</div>
          <!--Forward a blog-->
          <div class="forwardblog">
          <div class="blogmessage">
           <div class="blogauthor"><a href="#" class="author">懒羊羊</a>：灰太狼什么的最讨厌了</div>
          <div class="bloginfo">
         <div class="blogdate">02月07日 15:39:11 来自网页 <a href="#">查看转发(1)</a></div>
         
         </div>
          </div></div>
         <div class="bloginfo">
         <div class="blogdate">02月07日 15:39:11 来自网页</div>
        <div class="blogfunc"><input value=""  type="button" class="comment"></input><input type="button" value="" class="forward"></input><input type="button" value="" id="delete" onmouseover="changeicon(this,true)" onmouseout="changeicon(this,false)"></input></div>
         </div>
         </div>
        
        </li>
        <li class="blogitem">
        <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
          <div class="blogmessage">
          <div class="blogauthor"><a href="#" class="author">喜羊羊</a>：Microsoft Windows 8</div>
          <div class="forwardblog">
          <div class="blogvideo">
      <embed src="http://www.tudou.com/v/7hxLyqHls0s/&resourceId=0_05_05_99/v.swf" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" wmode="opaque" width="480" height="400"></embed>
          
          </div>
         </div>
         <div class="bloginfo">
         <div class="blogdate">02月07日 15:39:11 来自网页</div>
      <div class="blogfunc"><input value=""  type="button" class="comment"></input><input type="button" value="" class="forward"></input><input type="button" value="" id="delete" onmouseover="changeicon(this,true)" onmouseout="changeicon(this,false)"></input></div>
         </div>
         </div>
        
        </li>
      </ul>
      
    </div>
  </div>
  <!--right functional area-->
  <div id="globallink"><span></span></div>
  <div id="parameter">
  <!--information about the author-->
    <div id="author">
      <dl id="avatar">
        <dt class="mydescription"><a href="login.html">wangxinalex</a></dt>
        <dd class="mypic"><img alt="caption" src="images/caption.png" width="90" /></dd>
        <dd class="mydetail">Pudong<br/>Shanghai<br/>Fudan University</dd>
      </dl>
      <div class="myfans">
        <ul>
          <li>54
            <div class="secondLine">Following</div>
          </li>
        </ul>
        <ul>
          <li>55
            <div class="secondLine">Follower</div>
          </li>
        </ul>
        <ul>
          <li>56
            <div class="secondLine">Twitter</div>
          </li>
        </ul>
      </div>
    </div>
    <!--some functional buttons and links-->
    <div id="lcategory">
      <ul>
        <li><a class="function" href="#">我的首页</a></li>
        <li><a class="function" href="#">@到我的</a></li>
        <li><a class="function" href="#">我的评论</a></li>
        <li><a class="function" href="#">我的私信</a></li>
        <li><a class="function" href="#">我的收藏</a></li>
      </ul>
    </div>
    <!--hot followers-->
    <div id="llinks">
      <h4 class="follower"><img src="images/friends.png" alt="friends"/><span>&nbsp;热门用户</span></h4>
      <ul>
        <li><img alt="xiyangyang" src="images/avatars/xiyangyang.png"/> <a class="caption" href="#">喜羊羊</a></li>
        <li><img alt="meiyangyang" src="images/avatars/meiyangyang.png"/> <a class="caption" href="#">美羊羊</a></li>
        <li><img alt="lanyangyang" src="images/avatars/lanyangyang.png"/> <a class="caption" href="#">懒羊羊</a></li>
        <li><img alt="feiyangyang" src="images/avatars/feiyangyang.png"/> <a class="caption" href="#">沸羊羊</a></li>
        <li><img alt="manyangyang" src="images/avatars/manyangyang.png"/> <a class="caption" href="#">慢羊羊</a></li>
        <li><img alt="nuanyangyang" src="images/avatars/nuanyangyang.png"/> <a class="caption" href="#">暖羊羊</a></li>
        <li><img alt="hongtailang" src="images/avatars/hongtailang.png"/> <a class="caption" href="#">红太狼</a></li>
        <li><img alt="huitailang" src="images/avatars/huitailang.png"/> <a class="caption" href="#">灰太狼</a></li>
        <li><img alt="xiaohuihui" src="images/avatars/xiaohuihui.png"/> <a class="caption" href="#">小灰灰</a></li>
      </ul>
      <br/>
    </div>
    <!--latest blogs-->
    <div id="llatest">
      <h4 class="latest"><img src="images/article.png" alt="article"/><span>&nbsp;最新文章列表</span></h4>
      <ul>
        <li><a class="article" href="#">《雪花秘扇》之水墨乡土</a></li>
        <li><a class="article" href="#">《宋家皇朝》之家国情怀</a></li>
        <li><a class="article" href="#">《星空》下的念念不忘</a></li>
        <li><a class="article" href="#">《情书》寄给年华</a></li>
        <li><a class="article" href="#">《霸王别姬》戏梦人生</a></li>
        <li><a class="article" href="#">《太阳照常升起》</a></li>
      </ul>
      <br/>
    </div>
    <!--friend links-->
    <div id="lfriend">
      <h4 class="friend"><img src="images/friendlink.png" alt="friendlink"/><span>&nbsp;友情链接</span></h4>
      <ul>
        <li><a class="friendlink" href="#">新浪微博</a></li>
        <li><a class="friendlink" href="#">豆瓣读书</a></li>
        <li><a class="friendlink" href="#">每日一文</a></li>
        <li><a class="friendlink" href="#">时间胶囊</a></li>
        <li><a class="friendlink" href="#">果壳网</a></li>
        <li><a class="friendlink" href="#">点点网</a></li>
      </ul>
    </div>
  </div> 

</div>
<!--copytright information-->
<div id="footer">
  <p>Updated: 2012-03-24 23:17:07 &copy;All Rights Reserved </p>
</div>
</body>
</html>

