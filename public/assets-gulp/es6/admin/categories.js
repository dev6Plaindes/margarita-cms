const AppCategoryAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        new Vue({
            el: '#AppCategoryAdmin',
            data() {
                return {
                    categories: args.categories,
                    category: Object.create({}),
                    index: -1,
                    company_id: args.company_id,
                    modal: { title: 'CREAR CATEGORÍA' }
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
                onFormSave: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('company_id', _this.company_id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/category/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#kt_datatable').DataTable().destroy();
                                    if (_this.index >= 0) {
                                        Object.assign(_this.categories[_this.index], rsp.data.category);
                                    } else  {
                                        _this.categories.push(Object.create(rsp.data.category));
                                    }
                                    setTimeout(() => {
                                        _this.onDataTable();
                                        swal2.show({
                                            text: rsp.message,
                                            icon: rsp.success ? 'success' : 'error',
                                            showCancelButton: false
                                        });
                                        $('#modalForm').modal('hide');
                                    }, 10);    
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
                },
                onLoad:function () {
                    this.onDataTable();
                    this.onColorPicker();
                },
                onDataTable: function () {
                    $('#kt_datatable').DataTable({
                        language: help.dataTable.language
                    });                    
                },
                onColorPicker: function () {
                    $('.js-color').minicolors({
                        theme: 'bootstrap',
                        format: 'hex'
                    });
                },
                onFormModal: function (index) {
                    this.index = index;
                    this.modal.title = 'CREAR CATEGORÍA';
                    if (index >= 0) {
                        this.modal.title = 'EDITAR CATEGORÍA';
                    }
                    this.category = Object.create((index >=0 ? this.categories[index] : {}));
                    $('#modalForm').modal();
                    $('.js-color').minicolors('value', this.category.color);
                },
                onDelete: function (index) {
                    let _this = this,
                    category = this.categories[index],
                    formData = new FormData();
                    formData.append('id', category.id);
                    _this.index = index;
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/category/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#kt_datatable').DataTable().destroy();
                                    _this.categories.splice(_this.index, 1);
                                    setTimeout(() => {
                                        _this.onDataTable();
                                        swal2.show({
                                            text: rsp.message,
                                            icon: rsp.success ? 'success' : 'error',
                                            showCancelButton: false
                                        });
                                    }, 10);    
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
                }
            }
        });
    }
}

window.AppCategoryAdmin = new AppCategoryAdmin();