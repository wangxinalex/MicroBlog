function postblog() {
	
	var blogtext = $("#blogContent").val();
	
	if (blogtext == "") {
		$("#wordcount").html("字数不能为零");
		error=true;
	} else if(blogtext.length>140){
		$("#wordcount").html("不能超过140字");
		error=true;
	}else {
		
		error=false;
		$("#blogtext").val(blogtext);

		$("#postBlog").submit();
	}
}


function submitForward(i){
	var number = $("#blogforward"+i+" #forwardContent").val().length;
	var forwardtext = $("#blogforward"+i+" #forwardContent").val();
	if(number<=140){
		$("#blogforward"+i+" #forwardContent").val(forwardtext);
		//$("#blogforward"+i+" form").submit();
	}
}

