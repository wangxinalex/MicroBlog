<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
//<!--a function to judge the word number-->
var counter = function(field,counter,maxlimit){
var charcnt = field.value.length;
if (charcnt > maxlimit){
field.value = field.value.substring(0,maxlimit);
}else{
document.getElementById(counter).innerHTML=maxlimit-charcnt;
}
}
//<!--change the icon-->
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
<link href="css/userlist.css" type="text/css" rel="stylesheet"/>
</head>
<body>
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
        <input type="text" id="search" size="25" />
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
    <div id="allblogs">
      <div id="liststatus">
        <div id="status"> <span id = "followers">已有<em id="followernumber">4</em>人关注你</span>
          <div id="searchfollower">
            <input type="text"  id="searchtool" size="25" />
            <a href="#"><img alt="searchfollowerButton" id="searchfollowerButton" src="images/SearchMetro.png" /></a></div>
        </div>
        <div id="listmethod">
          <div id="listmethodtext">排序方式:</div>
          <div id="listmethodselect"><a href="#" id="listbytime" class = "listselect" >关注时间</a><a href="#" id="listbyrelation" class = "listselect" type="button">最近联系</a><a href="#" id="listbyfav" class = "listselect" type="button">粉丝数</a> </div>
        </div>
        <div id="issue">排序结果仅供参考</div>
      </div>
      <!--The list for the blog contents-->
      <ul id="userlist">
        <li class="useritem">
          <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/xiyangyang.png" /></a> </div>
          <div class="usermessage">
            <div class="username"><a href="#" class="author">喜羊羊</a></div>
            <div class="userinfo">
              <div class="usercomefrom">青青草原</div>
              <!--Some functional buttons-->
              <div id = "havefollowers">拥有粉丝<em id = "havefollowersnumber">12</em>人</div>
              <div class="lastblog">
                <div class="lastblogmessage"> 喜羊羊是羊村中甚至是青青草原上号称最帅、最聪明、跑得最快的小羊。众所周知，喜羊羊是青青草原羊村的小英雄，他勇敢、机智、有正义感、乐观、好动、聪明。应对灰太狼的骚扰，喜羊羊是最有办法的，他总是能帮助同伴们从狼口逃生。 </div>
                <div class="lastblogtime">02月07日 15:39:11</div>
              </div>
            </div>
          </div>
        </li>
        <!--a blog is an item-->
        <li class="useritem">
          <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/lanyangyang.png" /></a> </div>
          <div class="usermessage">
            <div class="username"><a href="#" class="author">懒羊羊</a></div>
            <div class="userinfo">
              <div class="usercomefrom">青青草原</div>
              <!--Some functional buttons-->
              <div id = "havefollowers">拥有粉丝<em id = "havefollowersnumber">10</em>人</div>
              <div class="lastblog">
                <div class="lastblogmessage"> 别看懒羊羊很懒，很弱，但是，懒羊羊却有好运！有时，懒羊羊睡懒觉，就可以躲开灰太狼的攻击，甚至可以免被灰太狼煮！ </div>
                <div class="lastblogtime">02月07日 15:39:11</div>
              </div>
            </div>
          </div>
        </li>
        <li class="useritem">
          <div class="userphoto"><a href="#"><img alt="userpic" src="images/avatars/meiyangyang.png" /></a> </div>
          <div class="usermessage">
            <div class="username"><a href="#" class="author">美羊羊</a></div>
            <div class="userinfo">
              <div class="usercomefrom">青青草原</div>
              <!--Some functional buttons-->
              <div id = "havefollowers">拥有粉丝<em id = "havefollowersnumber">15</em>人</div>
              <div class="lastblog">
                <div class="lastblogmessage"> 美羊羊天真可爱，虽然不是很坚强，但很善解人意。爱美、爱打扮、心灵手巧，暗暗喜欢喜羊羊，有CP"喜美"。在羊村里很受羊羊们的欢迎，是大家跟风学习模仿的对象。美羊羊是羊村里的时尚名人，对化妆、缝衣服、种花等和美有关的事都相通。 </div>
                <div class="lastblogtime">02月07日 15:39:11</div>
              </div>
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
        <dd class="mydetail">Pudong<br/>
          Shanghai<br/>
          Fudan University</dd>
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
