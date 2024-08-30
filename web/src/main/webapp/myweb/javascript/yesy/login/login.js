function check(){
		var id = document.getElementById('id');
		var passwd = document.getElementById('passwd');
		
		if(id.value == ""){
			alert("ID를 입력 하세요.");
			id.focus();
			return false;		// check()함수를 빠져 나가도록 해준다.
		}
		if(passwd.value == ""){
			alert("비밀번호를 입력하세요.");
			passwd.focus();
			return false;
		}
}