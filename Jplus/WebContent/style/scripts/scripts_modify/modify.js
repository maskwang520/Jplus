var p1 = true;
var p2 = true;
var p3 = true;
$(function() {
	$('#old').focus(
			function() {
				$("#oldspan").text('密码应该为6-20位之间').removeClass('state1')
						.addClass('state2');
			}).blur(
			function() {
				if ($(this).val().length >= 6 && $(this).val().length <= 20
						&& $(this).val() != '') {
					$("#oldspan").text('输入成功').removeClass('state1').addClass(
							'state4');
				} else {
					$("#oldspan").text('密码应该为6-20位之间').removeClass('state1')
							.addClass('state3');
					p1 = false;
				}

			});

	$('#new').focus(
			function() {
				$("#newspan").text('密码应该为6-20位之间').removeClass('state1')
						.addClass('state2');
			}).blur(
			function() {
				if ($(this).val().length >= 6 && $(this).val().length <= 20
						&& $(this).val() != '') {
					$("#newspan").text('输入成功').removeClass('state1').addClass(
							'state4');
				} else {
					$("#newspan").text('密码应该为6-20位之间').removeClass('state1')
							.addClass('state3');
					p2 = false;
				}

			});

	$('#renew').focus(
			function() {
				$("#renewspan").text('请再次输入密码').removeClass('state1').addClass(
						'state2');
			}).blur(
			function() {

				if ($(this).val().length >= 6 && $(this).val().length <= 20
						&& $(this).val() != ''
						&& $(this).val() == $("#new").val()) {
					$("#renewspan").text('输入成功').removeClass('state1')
							.addClass('state4');
				} else {
					$("#renewspan").text('两次密码输入不一致').removeClass('state1')
							.addClass('state3');
					p3 = false;
				}
			});
	$("#qrxg").click(function() {
		if (p1 && p2 && p3) {
			$("#xgform").submit();
			return true;
		} else {
			return false;
		}
	});

});