function AppEventFormHome() {
    let formEnrollmentUser = document.querySelector('#formEnrollmentUser');
    if (formEnrollmentUser) {
        formEnrollmentUser.addEventListener('submit', function (e) {
            e.preventDefault();
            swal2.loading();
            let 
            formData = new FormData(e.target);
            fetch(window.location.href, {method: "POST", body: formData})
            .then(function(res){ return res.json(); })
            .then(function(rsp){
                swal2.show({
                    html: rsp.message,
                    icon: rsp.success ? 'success' : 'error',
                    showCancelButton: false,
                    confirmButtonText: rsp.success ? 'Ir a medios de pago' : 'OK', 
                    onOk: function () {
                        if (rsp.success) {
                            formEnrollmentUser.reset();
                            swal2.loading();
                            window.location.href = '/pago/' + rsp.data.code;
                        }
                    }
                });
            })
            .catch(function (err) {
                console.error(err);
                swal2.loading(false);
                alert('Hubo un error en el sistema.');
            });
        });
    }

    let formPaymentUser = document.querySelector('#formPaymentUser');
    if (formPaymentUser) {
        formPaymentUser.addEventListener('submit', function (e) {
            e.preventDefault();
            let formData = new FormData(e.target);
            swal2.show({
                html: '¿Estás seguro de guardar cambios?',
                icon: 'question',
                showCancelButton: true,
                onOk: function () {
                    fetch(window.location.href, {method: "POST", body: formData})
                    .then(function(res){ return res.json(); })
                    .then(function(rsp){
                        swal2.show({
                            html: rsp.message,
                            icon: rsp.success ? 'success' : 'error',
                            showCancelButton: false,
                            onOk: function () {
                                if (rsp.success) {
                                    swal2.loading();
                                    window.location.href = '/pago/' + rsp.data.code;
                                }
                            }
                        });
                    })
                    .catch(function (err) {
                        console.error(err);
                        swal2.loading(false);
                        alert('Hubo un error en el sistema.');
                    });
                }
            });
        });
    }

    $('.custom-file-input').on('change', function (e) {
        let filename = "Seleccionar Archivo";
        if (e.target.files.length > 0) {
            let file = e.target.files[0];
            if (file) {
                filename = file.name;
            }
        }
        $(this).next().text(filename);
    });
}
window.addEventListener('load', AppEventFormHome());