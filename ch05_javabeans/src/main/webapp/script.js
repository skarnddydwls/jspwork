function inputCheck() {
	if(memForm.id.value == "") {
		alert("아이디를 넣어주세요");
		memForm.id.focus();
		return;
	}
	if(memForm.pwd.value == "") {
		alert("비밀번호를 넣어주세요");
		memForm.pwd.focus();
		return;
	}
	if(memForm.repwd.value == "") {
		alert("비밀번호를 다시 한번 넣어주세요");
		memForm.repwd.focus();
		return;
	}
	if(memForm.pwd.value != memForm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다");
		memForm.repwd.focus();
		return;
	}
	if(memForm.name.value == "") {
		alert("이름을 넣어주세요");
		memForm.name.focus();
		return;
	}
	memForm.submit();
}