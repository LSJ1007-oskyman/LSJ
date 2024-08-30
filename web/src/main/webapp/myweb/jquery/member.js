

function openDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {   // 콜백함수
			document.getElementById('post').value = data.zonecode;//우편번호
			document.getElementById('address').value = data.address;//주소
		}
	}).open();
}



$(document).ready(function() {
	//1.ID중복검사
	$('#idcheck').click(function() {
		if ($('#id').val() == '') {
			alert('ID를 입력하세요.');
			$('#id').focus();
			return false;
		} else {	//open("팝업창에 실행될 문서명","윈도우 이름","옵션")
			var ref = 'idcheck.jsp?id=' + $("#id").val();
			window.open(ref, "mywin", "width=250,height=150");
		}
	});


	//2.주민번호 뒷자리 포커스 이동
	$('#jumin1').keyup(function() {
		//주민번호 앞자리가 6자리이면
		if ($('#jumin1').val().length == 6) {
			$('#jumin2').focus();
		}
	});

	//3.도메인 검사

	$('#email').change(function() {
		if ($('#email').val() == '') {		//'직접입력' 선택
			$("#domain").val('').focus();
			$("#domain").attr('readonly', false);
		} else {							//'도메인명' 선택
			$("#domain").val($('#email').val());
			$("#domain").attr('readonly', true);
		}
	});
	//4.유효성 검사
	$('form').submit(function() {
		if ($('#id').val() == '') {
			alert('ID를 입력하세요.');
			$('#id').focus();
			return false;
		}

		if ($('#passwd').val() == '') {
			alert('비밀번호를 입력하세요.');
			$('#passwd').focus();
			return false;
		}

		if ($('#name').val() == '') {
			alert('이름을 입력하세요.');
			$('#name').focus();
			return false;
		}

		if ($('#jumin1').val() == '') {
			alert('주민번호 앞자리를 입력하세요.');
			$('#jumin1').focus();
			return false;
		}

		if ($('#jumin1').val().length != 6) {
			alert('주민번호 앞자리 6자리를입력하세요.');
			$('#jumin1').val('').focus();
			return false;
		}

		if (isNaN($('#jumin1').val())) {
			alert('주민번호 앞자리에 숫자만 입력 하세요');
			$('#jumin1').val('').focus();
			return false;
		}

		if ($('#jumin2').val() == '') {
			alert('주민번호 뒷자리를 입력하세요.');
			$('#jumin2').focus();
			return false;
		}

		if ($('#jumin2').val().length != 7) {
			alert('주민번호 앞자리 7자리를입력하세요.');
			$('#jumin2').val('').focus();
			return false;
		}

		if (isNaN($('#jumin2').val())) {
			alert('주민번호 뒷자리에 숫자만 입력 하세요');
			$('#jumin2').val('').focus();
			return false;
		}

		if ($("#mailid").val() == '') {
			alert('EMail주소를 입력 하세요.');
			$("#mailid").focus();
			return false;
		}

		if ($('#domain').val() == '') {
			alert('도메인명을 입력 하세요.');
			$('#domain').focus();
			return false;
		}

		if ($('#tel1').val() == '') {
			alert('전화번호 앞자리를 입력 하세요.');
			$('#tel1').focus();
			return false;
		}

		if (isNaN($('#tel1').val())) {
			alert('전화번호 앞자리에 숫자만 입력 하세요');
			$('#tel1').val('').focus();
			return false;
		}

		if ($('#tel2').val() == '') {
			alert('전화번호 중간자리를 입력 하세요.');
			$('#tel2').focus();
			return false;
		}

		if (isNaN($('#tel2').val())) {
			alert('전화번호 중간자리에 숫자만 입력 하세요');
			$('#tel2').val('').focus();
			return false;
		}

		if ($('#tel3').val() == '') {
			alert('전화번호 뒷자리를 입력 하세요.');
			$('#tel3').focus();
			return false;
		}

		if (isNaN($('#tel3').val())) {
			alert('전화번호 뒷자리에 숫자만 입력 하세요');
			$('#tel3').val('').focus();
			return false;
		}

		if ($('#phone1').val() == '') {
			alert('핸드폰 번호 앞자리를 선택하세요.');
			$('#phone1').focus();
			return false;
		}

		if ($('#phone2').val() == '') {
			alert('핸드폰번호 중간자리를 입력 하세요.');
			$('#phone2').focus();
			return false;
		}

		if (isNaN($('#phone2').val())) {
			alert('핸드폰번호 중간자리에 숫자만 입력 하세요');
			$('#phone2').val('').focus();
			return false;
		}

		if ($('#phone3').val() == '') {
			alert('핸드폰번호 뒷자리를 입력 하세요.');
			$('#phone3').focus();
			return false;
		}

		if (isNaN($('#phone3').val())) {
			alert('핸드폰번호 뒷자리에 숫자만 입력 하세요');
			$('#phone3').val('').focus();
			return false;
		}

		if ($('#post').val() == '') {
			alert('우편번호를 입력 하세요.');
			$('#post').focus();
			return false;
		}

		if ($('#address').val() == '') {
			alert('주소를 입력 하세요.');
			$('#address').focus();
			return false;
		}

		//라디오 버튼 : 방법1
		// 			if($('#male').is(':checked')==false && $('#male').is(':checked')==false){
		// 				alert("성별을 선택하세요.");
		// 				return false;
		// 			}

		//라디오 버튼 : 방법2
		//:radio - input type=radio 로 되어있는 태그를 모두 구해오는  필터 선택자
		// 			if($(':radio').is(':checked')==false){
		// 				alert("성별을 선택하세요.");
		// 				return false;
		// 			}

		//라디오 버튼 : 방법3
		if ($("input:radio[name='gender']:checked").length < 1) {
			alert("성별을 선택하세요.");
			return false;
		}

		//checkbox 2개 이상 선택 : 방법1
		// 			var cnt = 0;
		// 			if($('#h1').is(':check')) cnt++;			
		// 			if($('#h2').is(':check')) cnt++;			
		// 			if($('#h3').is(':check')) cnt++;			
		// 			if($('#h4').is(':check')) cnt++;			
		// 			if($('#h5').is(':check')) cnt++;
		// 			if(cnt<2){
		// 				alert('취미를 2개 이상 선택하세요.');
		// 				return false;
		// 			}

		//checkbox 2개 이상 선택 : 방법2
		if ($("input:checkbox[name='hobby']:checked").length < 2) {
			alert('취미를 2개 이상 선택하세요.');
			return false;
		}

		if ($('#intro').val() == '') {
			alert('자기소개를 입력 하세요.');
			$('#intro').focus();
			return false;
		}

		if ($('#intro').val().length > 100) {
			alert('자기소개를 100자 이내로 입력 하세요.');
			$('#intro').focus();
			return false;
		}
	});


});