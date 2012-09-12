<%@page import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.bll.*"%>
<%@page import="org.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript">
var error=false;
var commenterror=false;
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
		<script type="text/javascript" src="js/ui.js"></script>
		<script type="text/javascript" src="js/dialog.js"></script>
		<!--This is the main user interface-->
		<title>Micro Blog</title>
		<link href="css/ui.css" type="text/css" rel="stylesheet" />
		<link href="css/dialog.css" type="text/css" rel="stylesheet" />
	</head>
	<%
		//System.out.println(basePath);
		User user = new User();
		boolean isMyPage = true;
		if (request.getSession().getAttribute("tempUser") != null) {
			user = (User) request.getSession().getAttribute("tempUser");
			isMyPage=false;
			// System.out.println("tempUser = "+user);
		} else {
			user = (User) request.getSession().getAttribute("user");
		}
		if (user == null) {
			response.sendRedirect("./login.jsp");
			return;
		}
		ArrayList<Blog> bloglist = (ArrayList<Blog>) request.getSession()
				.getAttribute("blogList");
	%>
	<body style="font-family: '微软雅黑'">
		<!--index bar-->
		<div id="index">
			<div>
				<a id="logo" href="/"></a>
			</div>
			<div>
				<ul id="indexList">
					<li>
						首页
					</li>
					<li>
						广场
					</li>
					<li>
						微群
					</li>
					<li>
						应用
					</li>
					<li>
						游戏
					</li>
				</ul>
			</div>
			<!--Search panel at the right of the indexlist-->
			<div id="searchPanel">
				<ul id="searchList">
					<li>
						<form id="searchForm" action="servlet/SearchServlet" method="post">
							<input type="text" id="search" name="searchContent" size="23" />
							<!-- 	<a href="#"><img alt="searchButton" id="searchButton"
								src="images/SearchMetro.png" /> </a> -->
							<input type="submit" id="searchSubmit" value="" />
						</form>
					</li>
				</ul>
			</div>
			<div id="aboutMe">
				<ul id="aboutMeList">
					<li>
						wangxinalex
					</li>
					<li>
						手机
					</li>
					<li>
						找人
					</li>
					<li>
						消息
					</li>
					<li>
						<a href="login.jsp"> 登出</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="container">
			<div id="main">
				<!--main blog box-->
				<div id="blogBox">
					<span><img alt="title" src="images/title.png" /> </span>
					<form method="post" id="postBlog" action="servlet/PostServlet">
						<!--text area to post a new blog-->
						<div class="textBox">
							<textarea id="blogContent" cols="20" rows="2" tabindex="1"></textarea>
						</div>
						<div class="funBox">

							<input class="icon" type="button" id="expression_icon" value=""></input>


							<input class="icon" id="picture_icon" type="button" value=""></input>

							<input class="icon" id="video_icon" type="button" value=""></input>
							<input class="icon" id="music_icon" type="button" value=""></input>
							<input type="hidden" name="blogtext" id="blogtext"></input>
							<input type="hidden" name="publisherid" value="<%=user.getId()%>"></input>
							<input id="sendBlog" type="button" value="" onclick="postblog()" />

							<span class="count" id="wordcount">Remaining <em
								id="remainNumber">140</em> words</span>

							<script type="text/javascript">
    document.getElementById('sendBlog').onmouseover = function(){this.style.background="url(images/twitter2.png) no-repeat "
	this.style.align="right"};
	document.getElementById('sendBlog').onmouseout = function(){this.style.background="url(images/twitter.png) no-repeat"
	this.style.align="right"};

	</script>
							<!--Not more than 140 words-->
							<script type="text/javascript">
document.getElementById("blogContent").onfocus =
document.getElementById("blogContent").onkeydown =
document.getElementById("blogContent").onkeyup =
function(){
	if(error){
	//<![CDATA[
		document.getElementById("wordcount").innerHTML="Remaining <em id='remainNumber'>140<\/em> words";
	//]]>
		error=false;
	}else{
counter(this,"remainNumber",140);
}

}

</script>
						</div>
					</form>
				</div>
				<div id="allblogs">
					<div id="blogtitle">
						<ul class="myblogtitle">
							<li>
								<a class="allblog" href="servlet/AllBlogServlet">All twitter</a>
							</li>
							<li>
								<a class="myblog" href="servlet/LoginServlet">My twitter</a>
							</li>
							<li>
								<a class="favourite" href="servlet/FavouriteServlet">Favourite</a>
							</li>
						</ul>
					</div>
					<!--The list for the blog contents-->
					<ul id="bloglist">
						<%
							if (bloglist != null) {
								for (int i = 0; i < bloglist.size(); i++) {
									Blog blog = bloglist.get(i);
									Blog originalBlog = BlogAction.getTheOriginalBlog(blog
											.getId());

									User publisher = UserAction.getUserById(blog
											.getPublisherid());
									System.out.println("blog = " + blog);
									ArrayList<Comment> commentlist = CommentAction
											.selectCommentByTarget(blog.getId());
						%>
						<li class="blogitem">
							<div class="userphoto">
								<a href="#"><img alt="userpic"
										src="<%=publisher.getHeadurl()%>" /> </a>
							</div>
							<div class="blogmessage">
								<div class="blogauthor">


									<%
										if (originalBlog.getId() != blog.getId()) {
									%>
									<a href="servlet/LoginServlet?userid=<%=publisher.getId()%>"
										class="author"><%=publisher.getNickname()%></a>：<%=blog.getText()%></div>
								<div class="forwardblog">
									<div class="blogmessage">
										<div class="blogauthor">
											<a href="servlet/LoginServlet?userid=<%=originalBlog.getId()%>" class="author"><%=BlogAction
								.getPublisherNameByBlogId(originalBlog.getId())%></a>：<%=originalBlog.getText()%></div>
										<div class="bloginfo">
											<div class="blogdate"><%=originalBlog.getTimeStr()%>
												<a href="#"></a>
											</div>
										</div>
									</div>
								</div>
								<%
									} else {
								%>
								<a href="servlet/LoginServlet?userid=<%=publisher.getId()%>" class="author"><%=publisher.getNickname()%></a>：<%=blog.getText()%></div>
							<%
								}
							%>
							<div class="bloginfo">
								<div class="blogdate"><%=blog.getTimeStr()%>&nbsp;(<%=commentlist.size()%>)
								</div>
								<!--Some functional buttons-->
								<div class="blogfunc">
									<input value="" type="button" class="comment"
										onclick="$('.blogreply').eq(<%=i%>).toggle(1000)"></input>
									<input type="button" value="" class="forward"
										onclick="new Dialog({type:'id',value:'blogforward<%=i%>',title:'Forward'}).show()"></input>
									<!-- Test whether it is a blog from myself -->
									<%if(user.getId()==publisher.getId()&&isMyPage){ %>
									<input type="button" value="" class="delete"
										onclick="$('.deleteForm').eq(<%=i%>).submit()"
										onmouseover="changeicon(this,true)"
										onmouseout="changeicon(this,false)"></input><%} %>
									<form class="deleteForm" action="servlet/DeleteServlet"
										method="post">
										<input type="hidden" name="deleteblogid" 
											value="<%=blog.getId()%>" />
										<input type="hidden" name="publisherid" 
											value="<%=blog.getPublisherid()%>" />
									</form>
									
								</div>
							</div>
							<div id="blogforward<%=i%>" class="blogforward">
								<form class="forwardForm"
									action="servlet/ForwardServlet" method="post">
									<div class="originalblog"><%=("@"
							+ BlogAction.getPublisherNameByBlogId(originalBlog
									.getId()) + ":" + originalBlog.getText())%></div>
									<!-- <textarea  cols="30" rows="2" tabindex="1" id = "forwardContentArea<%=i%>" class = "forwardContentArea" ><%=BlogAction.getForwardAttach(blog.getId())%></textarea> -->

									<input type="text" name="forwardContent"
										class="forwardContent"
										value="<%=BlogAction.getForwardAttach(blog.getId())%>"></input>
									<input type="hidden" name="publisherid"
										value="<%=user.getId()%>" />
									<input type="hidden" name="originalblogid"
										value="<%=blog.getId()%>" />

									<input type="submit" name="forwardSubmit" class="forwardSubmit"
										value="" onclick="submitForward(<%=i%>)" />
								</form>

							</div>

							<div class="blogreply">
								<form class="commentForm" action="servlet/CommentServlet"
									method="post">
									<input type="hidden" name="userid" value="<%=user.getId()%>"></input>
									<input type="hidden" name="targetblogid"
										value="<%=blog.getId()%>"></input>
									<input type="text"  name="commenttext"
										class="replytext" size="45"></input>
									<input class="replybutton" type="button" value=""
										onclick="addComment(<%=i%>)"></input>
								</form>
								<div class="commenterrorbox"></div>
								<script type="text/javascript">
           function addComment( num){
  var commenttext = $(".replytext").eq(num).val();
  if(commenttext==""){
	 
	 $(".commenterrorbox").eq(num).html("评论内容不能为空");
	   $(".commenterrorbox").eq(num).css("display","block");
  }else if(commenttext.length>100){
		   $(".commenterrorbox").eq(num).html("评论内容不能超过100字"); 
		     $(".commenterrorbox").eq(num).css("display","block");
  }else{
			  $(".commenterrorbox").eq(num).css("display","none");
	  
	  $(".commentForm").eq(num).submit();
  }
}
           
           
           </script>

								<%
									if (commentlist != null) {
												for (int j = 0; j < commentlist.size(); j++) {
													Comment comment = commentlist.get(j);
													User commentUser = UserAction.getUserById(comment
															.getPublisherid());
								%>

								<div class="blogcomment">
									<div class="blogauthor">
										<div class="commentphoto">
											<a href="#"><img alt="userpic"
													src="<%=commentUser.getHeadurl()%>" /> </a>
										</div>
										<a href="#" class="author"><%=commentUser.getNickname()%></a>：<%=comment.getText()%></div>
									<div class="commentdate"><%=comment.getCommentTimeStr()%>
										<%if(commentUser.getId()==user.getId()){ %>
										<form class="deleteCommentForm"
											action="servlet/DeleteCommentServlet" method="post">
											<input type="hidden" name="deleteCommentId"
												value="<%=comment.getId()%>" />
											<input class="deleteComment" type="submit" value="" />
										</form>
										<%} %>
									</div>
								</div>
								<%
									}
											}
								%>
								<script type="text/javascript">
    $(".replybutton").eq("<%=i%>").bind("mouseover",function(event){
    	$(".replybutton").eq("<%=i%>").css("background","url(images/addreply2.png) no-repeat");
    });
	 $(".replybutton").eq("<%=i%>").bind("mouseout",function(event){
    	$(".replybutton").eq("<%=i%>").css("background","url(images/addreply.png) no-repeat");
    });
	</script>
							</div>
				</div>
				</li>
				<!-- End of a blog -->
				<%
					}
					}
				%>

				</ul>

			</div>
		</div>
		<%
			ArrayList<User> followersList = RelationAction
					.getRelationByTarget(user.getId());
			int followers = followersList.size();

			ArrayList<User> followingList = RelationAction
					.getRelationBySource(user.getId());
			int following = followingList.size();
		%>
		<!--right functional area-->
		<div id="globallink">
			<span>&nbsp;</span>
		</div>
		<div id="parameter">
			<!--information about the author-->
			<div id="author">
				<dl id="avatar">
					<dt class="mydescription">
						
						<%User trueUser = (User)(request.getSession().getAttribute("user"));
						if(user.getId()!=trueUser.getId()) {%>
						<form id="changeRelationForm"
											action="servlet/ChangeRelationServlet" method="post">
											<input type="hidden" id="userid" name="userid"
												value="<%=trueUser.getId()%>" />
												<input type="hidden" id="otherhomepage"
												name="otherhomepage" value="true" />
											<%
												if (RelationAction.getRelationBySourceAndTarget(
																trueUser.getId(), user.getId())) {
											%>
											<input type="hidden" id="deletefollowing"
												name="deletefollowing" value="<%=user.getId()%>" />
												
											<input type="submit" id="deleterelation"
												name="deleterelation" value="" />
												

											<%
												} else {
											%>
											<input type="hidden" id="addfollowing" name="addfollowing"
												value="<%=user.getId()%>" />
												
											<input type="submit" id="addrelation" name="addrelation"
												value="" />
											<%
												}
											%>
										</form>
						<%} %>
						<a href="servlet/AllBlogServlet"><%=user.getNickname()%></a>
					</dt>
					<dd class="mypic">
						<img alt="caption" src="<%=user.getHeadurl()%>" width="90"
							height="100" />
						<p id="changeswitch" onclick="$('#uploadimage').toggle(1000)"></p>
					</dd>
					<dd class="mydetail">
						<%=user.getComefrom() %>
					</dd>
				</dl>

				<div id="uploadimage">
					<form action="servlet/UploadServlet" method="post"
						enctype="multipart/form-data" name="uploadform">

						<input type="file" name="uploadfile" id="uploadfile" />
						<input type="submit" value="upload" id="uploadbutton" />
					</form>
				</div>
				<div class="myfans">
					<ul>
						<li><%=following%>
							<div class="secondLine">
								Following
							</div>
						</li>
					</ul>
					<ul>
						<li><%=followers%>
							<div class="secondLine">
								Follower
							</div>
						</li>
					</ul>
					<ul>
						<li><%=BlogAction.selectBlogByPublisher(user.getId()).size()%>
							<div class="secondLine">
								Twitter
							</div>
						</li>
					</ul>
				</div>

			</div>
			<!--some functional buttons and links-->
			<div id="lcategory">
				<ul>
					<li>
						<a class="function" href="servlet/AllBlogServlet">我的首页</a>
					</li>
					<li>
						<a class="function" href="servlet/FollowingServlet">我的关注</a>
					</li>
					<li>
						<a class="function" href="servlet/FollowerServlet">我的粉丝</a>
					</li>
					<li>
						<a class="function" href="#">我的私信</a>
					</li>
					<li>
						<a class="function" href="#">我的收藏</a>
					</li>
				</ul>
			</div>
			<!--hot followers-->
			<div id="llinks">
				<h4 class="follower">
					<img src="images/friends.png" alt="friends" />
					<span>&nbsp;热门用户</span>
				</h4>
				<ul>
					<li>
						<img alt="xiyangyang" src="images/avatars/xiyangyang.png" />
						<a class="caption" href="#">喜羊羊</a>
					</li>
					<li>
						<img alt="meiyangyang" src="images/avatars/meiyangyang.png" />
						<a class="caption" href="#">美羊羊</a>
					</li>
					<li>
						<img alt="lanyangyang" src="images/avatars/lanyangyang.png" />
						<a class="caption" href="#">懒羊羊</a>
					</li>
					<li>
						<img alt="feiyangyang" src="images/avatars/feiyangyang.png" />
						<a class="caption" href="#">沸羊羊</a>
					</li>
					<li>
						<img alt="manyangyang" src="images/avatars/manyangyang.png" />
						<a class="caption" href="#">慢羊羊</a>
					</li>
					<li>
						<img alt="nuanyangyang" src="images/avatars/nuanyangyang.png" />
						<a class="caption" href="#">暖羊羊</a>
					</li>
					<li>
						<img alt="hongtailang" src="images/avatars/hongtailang.png" />
						<a class="caption" href="#">红太狼</a>
					</li>
					<li>
						<img alt="huitailang" src="images/avatars/huitailang.png" />
						<a class="caption" href="#">灰太狼</a>
					</li>
					<li>
						<img alt="xiaohuihui" src="images/avatars/xiaohuihui.png" />
						<a class="caption" href="#">小灰灰</a>
					</li>
				</ul>
				<br />
			</div>
			<!--latest blogs-->
			<div id="llatest">
				<h4 class="latest">
					<img src="images/article.png" alt="article" />
					<span>&nbsp;最新文章列表</span>
				</h4>
				<ul>
					<li>
						<a class="article" href="#">《雪花秘扇》之水墨乡土</a>
					</li>
					<li>
						<a class="article" href="#">《宋家皇朝》之家国情怀</a>
					</li>
					<li>
						<a class="article" href="#">《星空》下的念念不忘</a>
					</li>
					<li>
						<a class="article" href="#">《情书》寄给年华</a>
					</li>
					<li>
						<a class="article" href="#">《霸王别姬》戏梦人生</a>
					</li>
					<li>
						<a class="article" href="#">《太阳照常升起》</a>
					</li>
				</ul>
				<br />
			</div>
			<!--friend links-->
			<div id="lfriend">
				<h4 class="friend">
					<img src="images/friendlink.png" alt="friendlink" />
					<span>&nbsp;友情链接</span>
				</h4>
				<ul>
					<li>
						<a class="friendlink" href="#">新浪微博</a>
					</li>
					<li>
						<a class="friendlink" href="#">豆瓣读书</a>
					</li>
					<li>
						<a class="friendlink" href="#">每日一文</a>
					</li>
					<li>
						<a class="friendlink" href="#">时间胶囊</a>
					</li>
					<li>
						<a class="friendlink" href="#">果壳网</a>
					</li>
					<li>
						<a class="friendlink" href="#">点点网</a>
					</li>
				</ul>
			</div>
		</div>

		</div>
		<!--copytright information-->
		<div id="footer">
			
  <p>Updated: 2012-03-24 23:17:07 <a href="mailto:wangxinalex@gmail.com?subject=About%20MicroBlog">wangxinalex</a>&copy;All Rights Reserved </p>
			
		</div>
	</body>
</html>

