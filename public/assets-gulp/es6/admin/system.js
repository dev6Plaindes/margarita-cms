const AppSystemAdmin = function () {
    let __this = this;
    __this.settings = function (args) {
        new Vue({
            el: '#AppSystemAdmin',
            data() {
                return {
                }
            },
            created: function() {
            },
            mounted: function () {
                this.onLoad();
            },
            watch: {
            },
            methods: {
                onLoad:function () {
                },
                onFormSave: function (e) {
                    e.preventDefault();
                    let formData = new FormData(e.currentTarget);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/sistema/configuracion/save", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        if (rsp.success) {
                                            swal2.loading();
                                            window.location.reload();
                                        }
                                    }
                                });
                            })
                            .catch(function (err) {
                                swal2.show({ html: err, icon: 'error'});
                            });
                        }
                    });
                }
            }
        });
    }
}

window.AppSystemAdmin = new AppSystemAdmin();   