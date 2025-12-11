const AppUserAdmin = function () {
    let __this = this;
    __this.profile = function (args) {
        console.log(args);
        new Vue({
            el: '#AppProfileUserAdmin',
            data() {
                return {
                    user: args.user
                }
            },
            created: function() {
            },
            mounted: function () {
                this.onLoad();
            },
            watch: {
            },
            computed: {
            },
            methods: {
                onFormData:function (e) {
                    e.preventDefault();
                    let formData = new FormData(e.currentTarget);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/user/saveProfile", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        location.href = '/admin/usuario/perfil';
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
                },
                onFormPassword: function (e) {
                    e.preventDefault();
                    let formData = new FormData(e.currentTarget);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/user/changePassword", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    document.getElementById('formPassword').reset();
                                }
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false
                                });
                            })
                            .catch(function (err) {
                                console.error(err);
                                swal2.loading(false);
                                alert('Hubo un error en el sistema.');
                            });
                        }
                    }); 
                },
                onLoad: function () {
                    let kt_image_1 = new KTImageInput('kt_image_1');
                }
            }
        });
    }
}

window.AppUserAdmin = new AppUserAdmin();