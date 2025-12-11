$("#kt_login_signin_form").on('submit', function (e) {
    e.preventDefault();
    console.log('123');
    swal2.loading();
    let formData = new FormData(e.currentTarget);
    fetch("/admin/postlogin", {method: "POST", body: formData})
    .then(function(res){ return res.json(); })
    .then(function(rsp){
        if (!rsp.success){
            swal2.show({
                text: rsp.message,
                icon: rsp.success ? 'success' : 'error',
                showCancelButton: false
            });
            return;
        }
        location.href ="/admin";
    })
    .catch(function () {
        swal2.loading(false);
        alert('Hubo un error en el sistema.');
    });    
});

$('#kt_login_forgot').on('click', function (e) {
    e.preventDefault();
    $('.login-signin').hide();
    $('.login.login-1.login-signin-on .login-forgot').show("fade");
    // $('.login-signin').addClass('d-none');
    // $('.login.login-1.login-signin-on .login-forgot').css('display','block');
});


$('#kt_login_forgot_cancel').on('click', function (e) {
    e.preventDefault();
    $('.login.login-1.login-signin-on .login-forgot').hide();
    $('.login-signin').show("fade");
    // $('.login-signin').removeClass('d-none');
    // $('.login.login-1.login-signin-on .login-forgot').css('display','none');
});
