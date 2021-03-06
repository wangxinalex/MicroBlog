﻿<%@page import="org.bll.*"%>
<%@page import="java.util.*"%>
<%@page import="org.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript">
	//<!--a function to judge the word number-->
	var counter = function(field, counter, maxlimit) {
		var charcnt = field.value.length;
		if (charcnt > maxlimit) {
			field.value = field.value.substring(0, maxlimit);
		} else {
			document.getElementById(counter).innerHTML = maxlimit - charcnt;
		}
	}
	//<!--change the icon-->
	function changeicon(obj, flag) {
		if (flag) {
			obj.style.background = "url(images/delete2.png) no-repeat";
		} else {
			obj.style.background = "url(images/delete.png) no-repeat";
		}
	}
</script>
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
		<!--This is the main user interface-->
		<title>Micro Blog</title>
		<link href="css/userlist.css" type="text/css" rel="stylesheet" />
	</head>
	<%
		//System.out.println(basePath);
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.sendRedirect("./login.jsp");
			return;
		}
		ArrayList<User> userList = (ArrayList<User>) request.getSession()
				.getAttribute("userList");
		ArrayList<Blog> bloglist = (ArrayList<Blog>) request.getSession()
				.getAttribute("blogList");
		int type = (Integer) request.getSession().getAttribute("type");
	%>
	<body>
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
				<div id="allblogs">
					<%
						if (type != ConnectionUtil.SEARCH) {
					%>
					<div id="liststatus">
						<div id="status">
							<%
								if (type == ConnectionUtil.FOLLOWING) {
							%>
							<span id="followers">你关注了<em id="followernumber"><%=userList.size()%></em>人</span>
							<%
								} else if (type == ConnectionUtil.FOLLOWER) {
							%>
							<span id="followers">已有<em id="followernumber"><%=userList.size()%></em>人关注你</span>
							<%
								}
							%>

						</div>
						<div id="listmethod">
							<div id="listmethodtext">
								排序方式:
							</div>
							<div id="listmethodselect">
								<a href="#" id="listbytime" class="listselect">关注时间</a><a
									href="#" id="listbyrelation" class="listselect" type="button">最近联系</a><a
									href="#" id="listbyfav" class="listselect" type="button">粉丝数</a>
							</div>
						</div>
						<div id="issue">
							排序结果仅供参考
						</div>
					</div>
					<%
						}
					%>
					<!--The list for the blog contents-->
					<ul id="userlist">
						<%
							if (userList != null) {
								for (int i = 0; i < userList.size(); i++) {
									User useritem = userList.get(i);
									int followersOfUser = RelationAction.getRelationByTarget(
											useritem.getId()).size();
									ArrayList<Blog> blogList = BlogAction
											.selectBlogByPublisher(useritem.getId());
						%>
						<li class="useritem">
							<div class="userphoto">
								<a href="#"><img alt="userpic"
										src="<%=useritem.getHeadurl()%>" /> </a>
							</div>
							<div class="usermessage">
								<div class="username">
									<a href="servlet/LoginServlet?userid=<%=useritem.getId()%>"
										class="author"><%=useritem.getNickname()%></a>
								</div>
								<div class="userinfo">
									<div class="usercomefrom">
										来自&nbsp;
										<span class="comefromspan"><%=useritem.getComefrom()%></span>
									</div>
									<!--Some functional buttons-->
									<div class="havefollowers">
										拥有粉丝
										<em class="havefollowersnumber"><%=followersOfUser%></em>人
										<form class="changeRelationForm"
											action="servlet/ChangeRelationServlet" method="post">
											<input type="hidden" class="userid" name="userid"
												value="<%=user.getId()%>" />
											<%
												if (RelationAction.getRelationBySourceAndTarget(
																user.getId(), useritem.getId())) {
											%>
											<input type="hidden" class="deletefollowing"
												name="deletefollowing" value="<%=useritem.getId()%>" />
											<input type="submit" class="deleterelation"
												name="deleterelation" value="" />

											<%
												} else {
											%>
											<input type="hidden" class="addfollowing" name="addfollowing"
												value="<%=useritem.getId()%>" />
											<input type="submit" class="addrelation" name="addrelation"
												value="" />
											<%
												}
											%>
										</form>
									</div>
									<%
										if (blogList != null && blogList.size() != 0) {
									%>
									<div class="lastblog">
										<div class="lastblogmessage">
											<%=blogList.get(0).getText()%></div>
										<div class="lastblogtime">
											<%=blogList.get(0).getTimeStr()%>
										</div>
									</div>
									<%
										}
									%>

								</div>
							</div>
						</li>
						<%
							}
							}
						%>

					</ul>

					<!--The list for the blog contents-->
					<ul id="bloglist">
						<%
							if (bloglist != null && type != ConnectionUtil.FOLLOWER
									&& type != ConnectionUtil.FOLLOWING) {
								for (int i = 0; i < bloglist.size(); i++) {
									Blog blog = bloglist.get(i);

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
									<a href="servlet/LoginServlet?userid=<%=publisher.getId()%>"
										class="author"><%=publisher.getNickname()%></a>：<%=blog.getText()%></div>
								<div class="bloginfo">
									<div class="blogdate"><%=blog.getTimeStr()%>&nbsp;(<%=commentlist.size()%>)
									</div>
									<!--Some functional buttons-->
									<div class="blogfunc">
										<input value="" type="button" class="comment"
											onclick="$('.blogreply').eq(<%=i%>).toggle(1000)"></input>
										<input type="button" value="" class="forward"></input>

									</div>
								</div>
								<div class="blogreply">
									<form class="commentForm" action="servlet/CommentServlet"
										method="post">
										<input type="hidden" name="userid" value="<%=user.getId()%>"></input>
										<input type="hidden" name="targetblogid"
											value="<%=blog.getId()%>"></input>
										<input type="text" id="commenttext" name="commenttext"
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
											<form id="deleteCommentForm"
												action="servlet/DeleteCommentServlet" method="post">
												<input type="hidden" name="deleteCommentId"
													value="<%=comment.getId()%>" />
												<input id="deleteComment" type="submit" value="" />
											</form>
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
						<%
							}
							}
						%>
						<li style="display: none">
							&nbsp;
						</li>
					</ul>


				</div>
			</div>
			<!--right functional area-->
			<div id="globallink">
				<span>&nbsp;</span>
			</div>
			<div id="parameter">
				<!--information about the author-->
				<%
					ArrayList<User> followersList = RelationAction
							.getRelationByTarget(user.getId());
					int followers = followersList.size();

					ArrayList<User> followingList = RelationAction
							.getRelationBySource(user.getId());
					int following = followingList.size();
				%>
				<div id="author">
					<dl id="avatar">
						<dt class="mydescription">
							<a href="login.jsp"><%=user.getNickname()%></a>
						</dt>
						<dd class="mypic">
							<img alt="caption" src="<%=user.getHeadurl()%>" width="90"
								height="100" />
							<p id="changeswitch" onclick="$('#uploadimage').toggle(1000)"></p>
						</dd>
						<dd class="mydetail">
							<%=user.getComefrom()%>
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

			<p>
				Updated: 2012-03-24 23:17:07
				<a href="mailto:wangxinalex@gmail.com?subject=About%20MicroBlog">wangxinalex</a>&copy;All
				Rights Reserved
			</p>

		</div>
	</body>
</html>
