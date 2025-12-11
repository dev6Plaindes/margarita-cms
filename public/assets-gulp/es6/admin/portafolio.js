const AppPortafolioAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        console.log(args);
        new Vue({
            el: '#AppPortafolioAdmin',
            data() {
                return {
                    products: args?.products?.length > 0 ? args.products : [],
                    product: Object.create({}),
                    index: -1,
                    company_id: args.company_id,
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
                    this.onDataTable();
                },
                onDataTable: function () {
                    $('#kt_datatable').DataTable({
                        language: help.dataTable.language
                    });                    
                },
                onDelete: function (index) {
                    let _this = this,
                    product = this.products[index],
                    formData = new FormData();
                    formData.append('id', product.id);
                    _this.index = index;
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/portafolio/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#kt_datatable').DataTable().destroy();
                                    _this.products.splice(_this.index, 1);
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
    __this.form = function (args) {
        new Vue({
            el: '#AppPortafolioAdmin',
            data() {
                return {
                    product: args.product?.length > 0 ? args.product : Object.create({}),
                    categories: args.categories,
                    teachers: args.teachers,
                    type_id: args.type_id,
                    menus: args.menus,
                    index: -1,
                    sections: [],
                    company_id: args.company_id,
                    menus_selected: [],
                    panel: {
                        title: 'Crear Portafolio'
                    },
                    defaults: {
                        notfound: '/assets/image/notfound.png'
                    },
                    category_selected: {id: 0, color:'transparent', name: '[ Seleccione ]'}
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
                onFormData: function (e) {
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
                            fetch("/admin/portafolio/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (_this.product.id == undefined) {
                                    swal2.show({
                                        text: rsp.message,
                                        icon: rsp.success ? 'success' : 'error',
                                        showCancelButton: false,
                                        onOk: function () {
                                            swal2.loading();
                                            window.location.href = '/admin/portafolios/portafolios/editar/'+rsp.data.product.id;
                                        }
                                    });
                                } else {
                                    swal2.show({
                                        text: rsp.message,
                                        icon: rsp.success ? 'success' : 'error',
                                        showCancelButton: false,
                                        onOk: function () {
                                            swal2.loading();
                                            window.location.reload();
                                        }
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
                    this.onSummernote();
                    this.onSelectPicker();
                    this.onImagePicker();
                    this.onRepeat();
                    this.panel.title = this.product.id == undefined ? 'Crear Portafolio' : 'Editar Portafolio';
                    for (let i = 0; i < this.categories.length; i++) {
                        if (this.categories[i].id == this.product.category_id) {
                            this.category_selected = this.categories[i];
                        }  
                    }
                },
                onSummernote: function () {
                    $('.summernote').summernote({
                        height: 200,
                        popover: {
                            image: [],
                            link: [],
                            air: []
                        },
                        tabsize: 2,
                        toolbar: [
                            ['style', ['style']],
                            ['font-style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                            ['font', ['fontname']],
                            ['font-size',['fontsize']],
                            ['font-color', ['color']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['table', ['table']],
                            ['insert', ['link', 'video', 'hr']],
                            ['misc', ['fullscreen', 'codeview', 'help']]
                        ]
                    });
                },
                onImagePicker: function () {
                    let kt_image_1 = new KTImageInput('kt_image_1'),
                    kt_images = new KTImageInput('kt_images');  
                },
                onSelectPicker: function () {
                    this.menus_selected = [];
                    if(this.product.menus && this.product.menus.length > 0) {
                        this.product.menus.forEach(o => {
                            this.menus_selected.push(o.id);
                        });
                    }
                    $('.selectpicker').val(this.menus_selected);
                    $('.selectpicker').selectpicker('refresh');
                },
                onRepeat: function () {
                    let _this = this;
                    $('#kt_repeater_color').repeater({
                        initEmpty: false,
                        show: function() {
                            $(this).slideDown();
                            help.colorPickers.init();
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que deseas eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        }      
                    });
                    
                    $('#kt_repeater_image').repeater({
                        initEmpty: false,
                        show: function() {
                            let $this = $(this);
                            $(this).slideDown();
                            $(this).find('.image-input-wrapper').css('background-image', 'url(' + _this.defaults.notfound + ')');
                            $('.btn-change-image .file').on('change', function (e) {
                                $this.find('.image-input-wrapper').css('background-image', 'url(' + window.URL.createObjectURL(e.target.files[0]) + ')');
                            });
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que deseas eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        },   
                    });
                },
                onCategory: function (category) {
                    this.category_selected = category;
                }
            }
        });
    }
    __this.edit = function (args) {
        new Vue({
            el: '#AppPortafolioAdmin',
            data() {
                return {
                    product: args.product,
                    categories: args.categories,
                    teachers: args.teachers,
                    type_id: args.product.type_id,
                    designs_icons: args.designs_icons,
                    menus: args.menus,
                    topics: args.topics,
                    topic: Object.create({}),
                    subtopic: Object.create({}),
                    index: -1,
                    sections: [],
                    company_id: args.company_id,
                    menus_selected: [],
                    panel: {
                        title: 'Crear Producto'
                    },
                    defaults: {
                        notfound: '/assets/image/notfound.png'
                    },
                    modal:{
                        topic: {
                            title: ''
                        },
                        subtopic: {
                            title: ''
                        }
                    },
                    category_selected: {id: 0, color:'transparent', name: '[ Seleccione ]'}
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
                onFormData: function (e) {
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
                            fetch("/admin/portafolio/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (_this.product.id == undefined) {
                                    swal2.show({
                                        text: rsp.message,
                                        icon: rsp.success ? 'success' : 'error',
                                        showCancelButton: false,
                                        onOk: function () {
                                            swal2.loading();
                                            window.location = '/admin/portafolios/portafolios';
                                        }
                                    });    
                                } else {
                                    swal2.show({
                                        text: rsp.message,
                                        icon: rsp.success ? 'success' : 'error',
                                        showCancelButton: false,
                                        onOk: function () {
                                            swal2.loading();
                                            window.location.reload();
                                        }
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
                    this.onSummernote();
                    this.onSelectPicker();
                    this.onImagePicker();
                    this.onRepeat();
                    this.panel.title = this.product.id == undefined ? 'Crear Producto' : 'Editar Producto';
                    for (let i = 0; i < this.categories.length; i++) {
                        if (this.categories[i].id == this.product.category_id) {
                            this.category_selected = this.categories[i];
                        }  
                    }
                },
                onSummernote: function () {
                    $('.summernote').summernote({
                        height: 250,
                        popover: {
                            image: [],
                            link: [],
                            air: []
                        },
                        tabsize: 2,
                        toolbar: [
                            ['style', ['style']],
                            ['font-style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                            ['font', ['fontname']],
                            ['font-size',['fontsize']],
                            ['font-color', ['color']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['table', ['table']],
                            ['insert', ['link', 'video', 'hr']],
                            ['misc', ['fullscreen', 'codeview', 'help']]
                        ]
                    });
                },
                onImagePicker: function () {
                    let kt_image_1 = new KTImageInput('kt_image_1'),
                    kt_images = new KTImageInput('kt_images');  
                },
                onSelectPicker: function () {
                    this.menus_selected = [];
                    if(this.product.menus && this.product.menus.length > 0) {
                        this.product.menus.forEach(o => {
                            this.menus_selected.push(o.id);
                        });
                    }
                    $('.selectpicker').val(this.menus_selected);
                    $('.selectpicker').selectpicker('refresh');
                },
                onFormcharacteristic: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('product_id', _this.product.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/product/characteristic/saveData", {method: "POST", body: formData})
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
                onDeleteCharacteristic: function (id) {
                    formData = new FormData();
                    formData.append('id', id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/product/characteristic/remove", {method: "POST", body: formData})
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
                onRepeat: function () {
                    let _this = this;
                    $('#kt_repeater_color').repeater({
                        initEmpty: false,
                        show: function() {
                            $(this).slideDown();
                            help.colorPickers.init();
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que deseas eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        }      
                    });
                    $('#kt_repeater_image').repeater({
                        initEmpty: false,
                        show: function() {
                            let $this = $(this);
                            $(this).slideDown();
                            $(this).find('.image-input-wrapper').css('background-image', 'url(' + _this.defaults.notfound + ')');
                            $('.btn-change-image .file').on('change', function (e) {
                                $this.find('.image-input-wrapper').css('background-image', 'url(' + window.URL.createObjectURL(e.target.files[0]) + ')');
                            });
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que deseas eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        },   
                    });
                },
                onModalTopic: function (index) {
                    this.modal.topic.title = index == -1 ? 'CREAR TEMA BLOG' : 'EDITAR TEMA BLOG';
                    this.topic = index == -1 ? Object.create({}) : this.topics[index];
                    $('#modalTopic').modal();
                },
                onFormTopic: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('portafolio_id', _this.product.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/topic_p/save", {method: "POST", body: formData})
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
                onDeleteTopic: function (id) {
                    let
                    formData = new FormData();
                    formData.append('id', id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/topic/remove", {method: "POST", body: formData})
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
                onModalSubTopic: function (index, index2) {
                    this.modal.subtopic.title = index == -1 ? 'CREAR SUBTEMA BLOG' : 'EDITAR SUBTEMA BLOG';
                    this.subtopic = index == -1 ? Object.create({}) : this.topics[index2].subtopics_portafolios[index];
                    $('#modalSubTopic').modal();
                },
                onFormSubTopic: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('portafolio_id', _this.product.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/subtopic_p/save", {method: "POST", body: formData})
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
                onDeleteSubTopic: function (id) {
                    let
                    formData = new FormData();
                    formData.append('id', id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/subtopic/remove", {method: "POST", body: formData})
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
                onCategory: function (category) {
                    this.category_selected = category;
                }
            }
        });
    }
}

window.AppPortafolioAdmin = new AppPortafolioAdmin();