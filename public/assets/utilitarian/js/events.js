let frmSubscription = document.querySelector("#frmSubscription");
if (frmSubscription) {
    frmSubscription.addEventListener("submit", (e) => {
        e.preventDefault();
        let formData = new FormData(e.currentTarget);

        let _this = this;
        swal2.show({
            text: `Al subscribirte aceptas nuestras políticas de privacidad.`,
            footer: '<p>Revisa nuestra <a href="/politica_privacidad" target="_blank">  políticas de provacidad</a></p>',
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar',
            icon: 'warning',
            showCancelButton: true,
            onOk: function () {
                swal2.loading();
                
                console.log(formData);
                fetch("/contact/suscription", {method: "POST", body: formData})
                .then(function(res){ return res.json(); })
                .then(function(rsp){
                    if (rsp.success) {
                        swal2.show({
                            text: rsp.message,
                            icon: rsp.success ? 'success' : 'error',
                            showCancelButton: false
                        });    
                    } else {
                        swal2.show({
                            text: rsp.message,
                            icon: rsp.success ? 'success' : 'error',
                            showCancelButton: false
                        });    
                    }
                })
                .catch(function (err) {
                    console.error(err);
                    swal2.loading(false);
                    alert('Hubo un error en el sistema.');
                });
            }
        });
    })
}

let frmMessage = document.querySelector("#frmMessage");
if (frmMessage) {
    frmMessage.addEventListener("submit", (e) => {
        e.preventDefault();
        let formData = new FormData(e.currentTarget);

        let _this = this;
        swal2.show({
            text: `Al envíar tus datos aceptas nuestras políticas de privacidad.`,
            footer: `<p style="text-align:center">Revisa nuestras <a href="/politicas-de-privacidad" target="_blank">  políticas de privacidad</a> y <a href="/terminos-y-condiciones" target="_blank">  terminos y condiciones</a></p>`,
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Cancelar',
            icon: 'warning',
            showCancelButton: true,
            onOk: function () {
                swal2.loading();
                
                console.log(formData);
                fetch("/contact/message", {method: "POST", body: formData})
                .then(function(res){ return res.json(); })
                .then(function(rsp){
                    if (rsp.success) {
                        frmMessage.reset();
                        swal2.show({
                            text: rsp.message, //`Envío exitoso, nos pondremos en contacto contigo.`,
                            icon: rsp.success ? 'success' : 'error',
                            showCancelButton: false
                        });    
                    } else {
                        swal2.show({
                            text: rsp.message,
                            icon: rsp.success ? 'success' : 'error',
                            showCancelButton: false
                        });    
                    }
                })
                .catch(function (err) {
                    console.error(err);
                    swal2.loading(false);
                    alert('Hubo un error en el sistema.');
                });
            }
        });
    })
}