// javascript for auto-complete
var fudongDiv = {
	content : "",
	g : function(id) {
		return document.getElementById(id);
	},

	inputBox : function(obj) {
		this.content = "";
		var content = obj.value;
		var contentCopy = obj.value;

		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@126.com";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@163.com";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@yeah.net";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@qq.com";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@gmail.com";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@sina.com";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@yahoo.com.cn";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\" onblur=\"javascript:fudongDiv.CloseBox()\">"
				+ contentCopy + "</a><br/>";
		contentCopy = content + "@fudan.edu.cn";
		this.content += "<a onclick='fudongDiv.ShowClick(this)' onmouseover=\"this.style.background='#999'\" onmouseout=\"this.style.background=''\">"
				+ contentCopy + "</a><br/>";
		this.g("showUser").style.display = "block";
		this.g("showUser").style.background = "#A0C9E9";
		this.g("showUser")['style']['left'] = (parseInt(obj.offsetLeft) + 80)
				+ "px";
		this.g("showUser")['style']['top'] = (parseInt(obj.offsetTop) + 90)
				+ "px";

		this.g("showUser").innerHTML = this.content
				+ "<p align='right'><a href='javascript:fudongDiv.CloseBox()'>Close</a></p>";

	},
	ShowClick : function(obj) {
		userName.value = obj.innerHTML;
		this.g("showUser").style.display = "none";
	},
	CloseBox : function() {
		this.g("showUser").style.display = "none";
	},
	CloseMune : function() {
		this.g("mune").style.display = "none";
	},

	showMunes : function() {
		this.g("mune").style.display = "block";
	}
}

function checkLogin(){
	var mailFormat = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	var mailValue = document.getElementById("username").value;
	if(!mailFormat.test(mailValue)){
		$("#mailMes").toggle(1000);
	}else{
		$("#loginForm").submit();
		
	}
	
	
}