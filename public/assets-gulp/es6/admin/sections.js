const AppSectionAdmin = function () {
    let __this = this,
    __default = {
        notfound: '/assets/image/notfound.png'
    },
    __render = {
        color: function (item, settings) {
            return `
            <div data-repeater-item class="form-group row">
                <input type="hidden" name="id" value="${item.id}"/>
                <div class="${settings.type == 'array' ? `col-lg-8 col-xl-8`: `col-lg-12 col-xl-12`}">
                    <input class="form-control form-control-solid form-control-lg js-color-content" name="color" type="text" value="${item.color}" autocomplete="off" />
                    <div class="d-md-none mb-2"></div>
                </div>
                ${ settings.type == 'array' ? `
                <div class="col-lg-4 col-xl-4 text-right">
                    <a href="javascript:;" data-repeater-delete class="btn btn-sm font-weight-bolder btn-light-danger">
                        <i class="la la-trash-o"></i>Eliminar
                    </a>
                </div>` : `` }
            </div>`;
        },
        image: function (item, settings) {
            return `
            <div data-repeater-item="" class="col-xl-4 col-md-4 col-sm-6 float-left form-group text-center">
                <input type="hidden" name="id" value="${ item.id }">
                <div class="image-input image-input-outline" id="kt_images">
                    <div class="image-input-wrapper" style="background-image: url('${ item.image ? item.image : __default.notfound }')"></div>
                    <label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow btn-change-image" data-action="change" data-toggle="tooltip" title="" data-original-title="Cambiar logo">
                        <i class="fa fa-pen icon-sm text-muted"></i>
                        <input class="file" type="file" name="image" accept=".png, .jpg, .jpeg" />
                        <input type="hidden" name="image_remove" />
                    </label>
                    <span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="cancel" data-toggle="tooltip" title="Cancel avatar">
                        <i class="ki ki-bold-close icon-xs text-muted"></i>
                    </span>
                </div>
                ${ settings.type == 'array' ? `
                <div class="d-block">
                    <a href="javascript:;" data-repeater-delete="" class="btn btn-sm font-weight-bolder btn-light-danger mt-5 mb-2">
                        <i class="la la-trash-o"></i>Eliminar
                    </a>
                </div>` : `` }
            </div>`;
        }
    };
    __this.index = function (args) {
        Vue.component('component-input', {
            template: '#component-input-template',
            props: {
                label: {
                    type: String
                },
                value: {
                    type: String
                },
                name: {
                    type: String,
                },
                content:{
                    type: Object
                },
                settings: {
                    type: Object
                }
            },
            data() {
                return {
                }
            },
            mounted: function () {
                this.onLoad();
            },
            methods: {
                onLoad: function () {
                    let plugin = this.settings && this.settings.plugin ? this.settings.plugin : false;
                    switch (plugin) {
                        case 'colors':
                            this.onRepeatColors();
                        break;
                        case 'images':
                            this.onRepeatImages();
                        break;
                        case 'summernote':
                            this.onSummernote();                                
                        break;
                        case 'files':
                            $('body').find('.custom-file-input').on('change', function (e) {
                                let filename = "Seleccionar Archivo";
                                if (e.target.files.length > 0) {
                                    let file = e.target.files[0];
                                    if (file) {
                                        filename = file.name;
                                    }
                                }
                                $(this).next().text(filename);
                            });
                        break;        
                        default:
                        break;
                    }
                },
                onRepeatColors: function () {
                    let _this = this;
                    this.onListColors()
                    .then(()=>{
                        setTimeout(() => {
                            _this.onColors('.js-color-content');
                            $('#kt_repeater_color').repeater({
                                initEmpty: false,
                                show: function() {
                                    $(this).slideDown();
                                    $('.js-color-content').minicolors('destroy');
                                    _this.onColors('.js-color-content');
                                },
                                hide: function(deleteElement) {                 
                                    if(confirm('¿Estás seguro de que deseas eliminar este elemento?')) {
                                        $(this).slideUp(deleteElement);
                                    }                                
                                },   
                            });
                        }, 300);
                    });            
                },
                onRepeatImages: function () {
                    this.onListImages()
                    .then(()=>{
                        setTimeout(() => {
                           let kt_images = new KTImageInput('kt_images');
                            $('#kt_repeater_image').repeater({
                                initEmpty: false,
                                show: function() {
                                    let $this = $(this);
                                    $(this).slideDown();
                                    $(this).find('.image-input-wrapper').css('background-image', 'url(' + __default.notfound + ')');
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
                        }, 300);
                    });
                },
                onSummernote: function () {
                    setTimeout(() => {
                        $('.summernote').summernote({
                            height: 150,
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
                    }, 300);
                },
                onListColors: function () {
                    return new Promise((resolve, reject)=>{
                        let html  = '';
                        if (this.content.colors && this.content.colors.length > 0) {
                            for (let i = 0; i < this.content.colors.length; i++) {
                                const elem = this.content.colors[i];
                                html += __render.color(elem, this.settings);
                            }    
                        } else {
                            html += __render.color(Object.create({id:0, color:''}), this.settings);
                        }
                        if (document.getElementById('list_colors')) {
                            document.getElementById('list_colors').innerHTML = html;
                        }
                        resolve();
                    });
                },
                onListImages: function () {
                    return new Promise((resolve, reject)=>{
                        let html  = '';
                        if (this.content.images && this.content.images.length > 0) {
                            for (let i = 0; i < this.content.images.length; i++) {
                                const elem = this.content.images[i];
                                html += __render.image(elem, this.settings);
                            }    
                        } else {
                            html += __render.image(Object.create({id:0, image:''}), this.settings);
                        }
                        if (document.getElementById('list_images')) {
                            document.getElementById('list_images').innerHTML = html;
                        }
                        resolve();
                    });
                },
                onColors: function (scope) {
                    $(scope).minicolors({
                        theme: 'bootstrap',
                        format: 'hex'
                    });
                },
            }
        });
        new Vue({
            el: '#AppSectionAdmin',
            data() {
                return {
                    selected: {
                        section: 0,
                    },
                    modal: {
                        section: { title: 'CREAR SECCIÓN', caption: '' },
                        content: { title: 'CREAR CONTENIDO', caption: '' }
                    },
                    index_content: 0,
                    sections: args.sections,
                    menus: args.menus,
                    section: Object.create({}),
                    index: -1,
                    company_id: args.company_id,
                    menus_selected: [],
                    contents: [],
                    content: Object.create({}),
                    contents_types_all: args.contents_types,
                    content_type: Object.create({}),
                    settings: Object.create({}),
                    content_type_id: 0,
                    formContent: false,
                    contents_types: [],
                    contents_types_selected: []
                }
            },
            created: function() {
            },
            mounted: function () {
                this.onInitPage();
            },
            watch: {
            },
            methods: {
                onInitPage: function () {
                    const 
                    queryString = window.location.search,
                    urlParams = new URLSearchParams(queryString),
                    section_id = urlParams.get('section'),
                    type_id = urlParams.get('type');
                    if (Number(section_id) > 0) {
                        this.section = this.sections.find(o=>o.id == section_id);
                        this.selected.section = this.section.id;
                        if (Number(type_id) > 0) {
                            if (this.section.contents_types.length > 0) {
                                this.contents_types = this.section.contents_types;
                                this.content_type = this.contents_types.find(o => o.id == type_id);
                                this.settings = this.content_type.settings;
                                this.content_type_id = this.content_type.id;    
                            } else {
                                window.location.href = '/admin/landing/secciones';
                            }
                        } else {
                            if (this.section.contents_types.length > 0) {
                                this.contents_types = this.section.contents_types;
                                this.content_type = this.contents_types[0];
                                this.settings = this.content_type.settings;
                                this.content_type_id = this.content_type.id;
                            }
                        }
                        if (this.content_type_id > 0) {
                            if (this.section.contents && this.section.contents.length > 0) {
                                this.contents = this.section.contents.filter(o => o.type_id == this.content_type_id);
                            }
                        }
                    }
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
                            fetch("/admin/section/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        if (rsp.success) {
                                            swal2.loading(); location.reload();
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
                onFormDataContent: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('company_id', _this.company_id);
                    formData.append('type_id', _this.content_type_id);
                    formData.append('section_id', _this.section.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/content/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    let index_section = _this.sections.indexOf(_this.section);
                                    if (_this.index_content >= 0) {
                                        let index_content = _this.sections[index_section].contents.indexOf(_this.contents[_this.index_content]);
                                        _this.sections[index_section].contents[index_content] = rsp.data.content;
                                    } else {
                                        _this.sections[index_section].contents.push(rsp.data.content);
                                    }
                                    _this.contents = _this.sections[index_section].contents.filter(o => o.type_id == _this.content_type_id);
                                    _this.contents.sort(_this.compareOrder);
                                    $('#modalFormContent').modal('hide');
                                    setTimeout(() => {
                                        _this.formContent = false;
                                    }, 300);
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
                onListContent: function (index) {
                    try {
                        this.section = this.sections[index];
                        if (this.section == undefined) {
                            throw 'No sé logró encontrar la sección para mostrar los contenidos';
                        }
                        this.selected.section = this.section.id;
                        if (this.section.contents_types.length > 0) {
                            this.contents_types = this.section.contents_types;
                            this.content_type = this.contents_types[0];
                            this.settings = this.content_type.settings;
                            this.content_type_id = this.content_type.id;
                            this.contents = this.section.contents.filter(o=>o.type_id==this.content_type_id);
                        } else {
                            this.contents_types = [];
                            this.content_type_id = false;
                        }
                        history.pushState({}, document.title, '/admin/landing/secciones?section='+this.section.id);   
                    } catch (error) {
                        swal2.show({
                            text: error,
                            icon: 'error',
                            showCancelButton: false
                        });
                    }
                },
                onContentType: function (type_id) {
                    this.content_type = this.contents_types.find(o=>o.id == type_id);
                    this.content_type_id = type_id;
                    this.settings = this.content_type.settings;
                    this.contents = this.section.contents.filter(o=>o.type_id==this.content_type_id);
                    history.pushState({}, document.title, '/admin/landing/secciones?section='+this.section.id+'&type='+this.content_type_id);
                },
                onLoadContent: function (index) {
                    return new Promise((resolve, reject) => {
                        this.modal.content.title = index == -1 ? 'CREAR CONTENIDO' : 'EDITAR CONTENIDO';
                        this.content = index == -1 ? Object.create({}) : this.contents[index];
                        if (this.content == undefined)
                            reject('No se logró encontrar el contenido');
                        this.contents_type = this.contents_types.find(o=>o.id == this.content_type_id);
                        this.modal.content.caption = this.contents_type.name;
                        if (this.contents_type == undefined)
                            reject('No se logró encontrar el tipo de contenido');
                        this.settings = this.contents_type.settings;
                        setTimeout(() => {
                            this.formContent = true;
                            this.index_content = index;    
                            resolve();
                        }, 300);
                    });
                },
                onFormContent: function (index) {
                    swal2.loading();
                    this.onLoadContent(index)
                    .then(() => {
                        setTimeout(() => {               
                            $('#modalFormContent').modal();
                            swal2.loading(false);
                        }, 300);
                    })
                    .catch((error) => {
                        swal2.show({
                            html: error,
                            icon: 'error',
                            showCancelButton: false
                        });
                    });
                },
                onFormModalSection: function (index) {
                    this.menus_selected = [];
                    this.contents_types_selected = [];
                    this.modal.section.title = 'CREAR SECCIÓN';
                    if (index >= 0) {
                        this.sections[index].menus.forEach(o => {
                            this.menus_selected.push(o.id);
                        });
                        this.sections[index].contents_types.forEach(o => {
                            this.contents_types_selected.push(o.id);
                        });
                        this.modal.section.title = 'EDITAR SECCIÓN';
                    }
                    this.section = Object.create((index >= 0 ? this.sections[index] : {}));
                    $('.selectpicker-menus').val(this.menus_selected);
                    $('.selectpicker-types').val(this.contents_types_selected);
                    $('.selectpicker').selectpicker('refresh');
                    $('#modalFormSection').modal();
                },
                onDeleteSection: function (index) {
                    let             
                    _this = this,
                    section = this.sections[index],
                    formData = new FormData();
                    formData.append('id', section.id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/section/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        if (rsp.success) {
                                            swal2.loading();
                                            if (_this.section.id == section.id) {
                                                location.href = '/admin/landing/secciones';
                                            } else {
                                                location.reload();
                                            }
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
                onDeleteContent: function (index) {
                    let _this = this,
                    content = _this.contents[index],
                    formData = new FormData();
                    formData.append('id', content.id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar este contenido?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/content/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        if (rsp.success) {
                                            // _this.section.contents.splice(index, 1);
                                            swal2.loading(); location.reload();
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
                onDestroyClearForm: function () {
                    $('#modalFormContent').modal('hide');
                    setTimeout(() => {
                        this.formContent = false;
                    }, 300);
                },
                compareOrder: function( a, b ) {
                    if ( a.order < b.order ){
                      return -1;
                    }
                    if ( a.order > b.order ){
                      return 1;
                    }
                    return 0;
                }
            }
        });
    }
}

window.AppSectionAdmin = new AppSectionAdmin();