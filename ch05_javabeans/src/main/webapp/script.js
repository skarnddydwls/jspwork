function inputCheck() {
	if(memForm.id.value == ""){
		alert("아이디를 입력하세요");
		memForm.id.focus();
		return;
	}
	if(memForm.pwd.value == ""){
		alert("비밀번호를 입력하세요");
		memForm.id.focus();
		return;
	}
	if(memForm.repwd.value == ""){
		alert("비밀번호를 다시 입력하세요");
		memForm.id.focus();
		return;
	}
	if(memForm.pwd.value != memForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		memForm.repwd.focus();
		return;
	}
	if(memForm.name.value == ""){
		alert("이름을 입력하세요");
		memForm.name.focus();
		return;
	}
	memForm.submit();	
}