const AppContentAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        new Vue({
            el: '#AppContentAdmin',
            data() {
                return {
                    contents: args.contents,
                    index: -1,
                    content: Object.create({}),
                    company_id: args.company_id
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
                    content = this.contents[index],
                    formData = new FormData();
                    formData.append('id', content.id);
                    _this.index = index;
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/content/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#kt_datatable').DataTable().destroy();
                                    _this.contents.splice(_this.index, 1);
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
            el: '#AppContentAdmin',
            data() {
                return {
                    content: args.content,
                    index: -1,
                    sections: args.sections,
                    company_id: args.company_id,
                    sections_selected: [],
                    panel: {
                        title: 'Crear Contenido'
                    },
                    defaults: {
                        notfound: '/assets/image/notfound.png'
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
                            fetch("/admin/content/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (_this.content.id == undefined) {
                                    swal2.show({
                                        text: rsp.message,
                                        icon: rsp.success ? 'success' : 'error',
                                        showCancelButton: false,
                                        onOk: function () {
                                            swal2.loading();
                                            window.location = '/admin/landing/contenidos';
                                        }
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
                },
                onLoad:function () {
                    this.onSummernote();
                    this.onSelectPicker();
                    this.onImagePicker();
                    this.onRepeat();
                    this.panel.title = this.content.id == undefined ? 'Crear Contenido' : 'Editar Contenido';
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
                    this.sections_selected = [];
                    this.content.sections.forEach(o => {
                        this.sections_selected.push(o.id);
                    });
                    $('.selectpicker').val(this.sections_selected);
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
                }
            }
        });
    }
    __this.edit = function (args) {
        new Vue({
            el: '#AppContentAdmin',
            data() {
                return {
                    content: args.content,
                    index: -1,
                    sections: args.sections,
                    company_id: args.company_id,
                    sections_selected: [],
                    panel: {
                        title: 'Crear Contenido'
                    },
                    defaults: {
                        notfound: '/assets/image/notfound.png'
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
                onFormData: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.target);
                    formData.append('company_id', this.company_id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/content/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (_this.content.id == undefined) {
                                    swal2.show({
                                        text: rsp.message,
                                        icon: rsp.success ? 'success' : 'error',
                                        showCancelButton: false,
                                        onOk: function () {
                                            swal2.loading();
                                            window.location = '/admin/landing/contenidos';
                                        }
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
                },
                onLoad:function () {
                    this.onSummernote();
                    this.onSelectPicker();
                    this.onImagePicker();
                    this.onRepeat();
                    this.panel.title = this.content.id == undefined ? 'Crear Contenido' : 'Editar Contenido';
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
                    let images = document.querySelectorAll('.repeater_image');
                    for (let i = 0; i < images.length; i++) {
                        const elem = images[i], elem_id = elem.getAttribute('id');
                        if (elem_id) {
                            new KTImageInput(elem_id)
                        }
                    }
                    // let kt_image_1 = new KTImageInput('kt_image_1'),
                    // kt_images = new KTImageInput('kt_images');  
                },
                onSelectPicker: function () {
                    this.sections_selected = [];
                    this.content.sections.forEach(o => {
                        this.sections_selected.push(o.id);
                    });
                    $('.selectpicker').val(this.sections_selected);
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
                }
            }
        });
    }
}

window.AppContentAdmin = new AppContentAdmin();