const AppTeacherAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        new Vue({
            el: '#AppTeacherAdmin',
            data() {
                return {
                    teachers: args.teachers,
                    teacher: Object.create({}),
                    company_id: args.company_id,
                    modal: {
                        title: 'CREAR DOCENTE'
                    }
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
                    let kt_image_teacher = new KTImageInput('kt_image_teacher');
                },
                onFormModal: function (index) {
                    this.modal.title = index == -1 ? 'CREAR DOCENTE' : 'EDITAR DOCENTE';
                    this.teacher = index == -1 ? Object.create({}) : this.teachers[index];
                    $('#modalFormTeacher').modal();
                },
                onFormSave: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('company_id', this.company_id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/teacher/save", {method: "POST", body: formData})
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
                                console.error(err);
                                swal2.loading(false);
                                alert('Hubo un error en el sistema.');
                            });
                        }
                    });
                },
                onDelete: function (index) {
                    let _this = this,
                    teacher = this.teachers[index],
                    formData = new FormData();
                    formData.append('id', teacher.id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/teacher/remove", {method: "POST", body: formData})
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
                                console.error(err);
                                swal2.loading(false);
                                alert('Hubo un error en el sistema.');
                            });
                        }
                    });
                }
            }
        });
    }
}

window.AppTeacherAdmin = new AppTeacherAdmin();