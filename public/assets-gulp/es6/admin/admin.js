function _singout() {
    swal2.show({
        text: '¿Estás seguro de cerrar sesión?',
        icon: 'question',
        showCancelButton: true,
        onOk: function () {
            swal2.loading();
            let formData = new FormData();
            fetch("/admin/signout", {method: "POST", body: formData})
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
                location.href ="/";
            })
            .catch(function (err) {
                console.error(err);
                swal2.loading(false);
                alert('Hubo un error en el sistema.');
            });
        }
    });
}