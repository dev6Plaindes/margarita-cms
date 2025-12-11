const AppGalleryAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        new Vue({
            el: '#AppGalleryAdmin',
            data() {
                return {
                    galleries: [],
                    images: [],
                    all: args.images,
                    gallery: Object.create({}),
                    index: -1,
                    element: {},
                    company_id: args.company_id,
                    modal: { title: 'CREAR ELEMENTO' },
                    nofound: '/assets/image/notfound.png',
                    image: '',
                    dropZoneUpload: {}
                }
            },
            created: function() {
            },
            mounted: function () {
                this.onLoad();
                this.onDropzone();
            },
            watch: {
                
            },
            methods: {
                onLoad:function () {
                    let galleries = [];
                    let images = [];
                    for (let i = 0; i < this.all.length; i++) {
                        const elem = this.all[i];
                        if (elem.gallery == 1) {
                            galleries.push(elem);
                        } else {
                            images.push(elem);                            
                        }
                    }
                    this.galleries = galleries;
                    this.images = images;
                    this.image = this.nofound;
                    // this.onItemRender();                    
                    // let kt_images = new KTImageInput('kt_images');
                    // this.onRepeat();
                },
                onFormModal: function (index) {
                    this.index = index;
                    this.modal.title = 'SUBIR IMÁGENES';
                    if (index >= 0) {
                        this.modal.title = 'EDITAR ELEMENTO';
                    }
                    this.element = Object.create((index >=0 ? this.images[index] : {}));
                    $('#modalForm').modal();
                },
                onFormModalOrder: function (index) {
                    if (index >= 0) {
                        this.gallery = Object.create((index >=0 ? this.galleries[index] : {}));
                        console.log(this.gallery);
                        $('#modalFormOrder').modal();   
                    }
                },
                onAdd: function (id) {
                    let formData = new FormData();
                    formData.append('id', id);
                    formData.append('company_id', this.company_id);
                    formData.append('gallery', 1);
                    this.onHandle(formData, '¿Estás seguro de agregar a la galería?');
                },
                onRemove: function (id) {
                    let formData = new FormData();
                    formData.append('id', id);
                    formData.append('company_id', this.company_id);
                    formData.append('gallery', 0);
                    this.onHandle(formData, '¿Estás seguro de quitar de la galería?');
                },
                onHandle: function (formData, text) {
                    let _this = this;
                    swal2.show({
                        text: text,
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/landing/galeria/handle", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    _this.all = rsp.data.images;
                                    _this.onLoad();
                                }
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false
                                });
                            })
                            .catch(function (err) {
                                swal2.show({ html: err, icon: 'error'});
                            });
                        }
                    });
                },
                onDelete: function (id) {
                    let _this = this;
                    let formData = new FormData();
                    formData.append('id', id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar este elemento?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/landing/galeria/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    _this.all = rsp.data.images;
                                    _this.onLoad();
                                }
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false
                                });
                            })
                            .catch(function (err) {
                                swal2.show({ html: err, icon: 'error'});
                            });
                        }
                    });
                },
                onFormSave: function (e) {
                    e.preventDefault();
                    let _this = this;
                    // let formData = new FormData(e.currentTarget);
                    // formData.append('company_id', _this.company_id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            try {
                                if (_this.dropZoneUpload.getQueuedFiles().length == 0) {
                                    throw 'Debe de agregar al menos una imagen';
                                }
                                swal2.loading();
                                const acceptedFiles = _this.dropZoneUpload.getAcceptedFiles();
                                for (let i = 0; i < acceptedFiles.length; i++) {
                                    _this.dropZoneUpload.processFile(acceptedFiles[i])
                                }
                            } catch (error) {
                                swal2.show({ html: error, icon: 'error', showCancelButton: false });
                            }
                            /*
                            swal2.loading();
                            fetch("/admin/landing/galeria/save", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    document.getElementById("form_save").reset();
                                    _this.all = rsp.data.images;
                                    _this.onLoad();
                                    $('#modalForm').modal('hide');
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
                            */
                        }
                    });
                },
                onFormSaveOrder: function (e) {
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
                            fetch("/admin/landing/galeria/order", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    document.getElementById("form_save_order").reset();
                                    _this.all = rsp.data.images;
                                    _this.onLoad();
                                    $('#modalFormOrder').modal('hide');
                                }
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false
                                });
                            })
                            .catch(function (err) {
                                swal2.show({ html: err, icon: 'error'});
                            });
                        }
                    });
                },
                onDropzone: function () {
                    let _this = this;
                    _this.dropZoneUpload = new Dropzone('#kt_dropzone_2', {
                        url: "/admin/landing/galeria/save", // Set the url for your upload script location
                        paramName: "file", // The name that will be used to transfer the file
                        maxFiles: 10,
                        maxFilesize: 100, // MB
                        acceptedFiles: 'image/*',
                        addRemoveLinks: true,
                        autoProcessQueue: false,
                        params: {
                            company_id: this.company_id
                        },
                        /*accept: function(file, done) {
                            if (file.name == "justinbieber.jpg") {
                                done("Naha, you don't.");
                            } else {
                                done();
                            }
                        }*/
                    });
                    _this.dropZoneUpload.on('success', function(file, rsp) {
                        try {
                            rsp = JSON.parse(rsp)
                            if (rsp.success) {
                                if(_this.dropZoneUpload.getQueuedFiles().length === 0 && _this.dropZoneUpload.getUploadingFiles().length === 0){
                                    _this.all = rsp.data.images;
                                    $('#modalForm').modal('hide');
                                     _this.onLoad();
                                     _this.dropZoneUpload.removeAllFiles(true);
                                     swal2.show({ html: rsp.message, icon: 'success', showCancelButton: false });                                    
                                }
                            }
                        } catch (error) {
                            swal2.show({ html: error, icon: 'error', showCancelButton: false });
                        }
                    });  
                },
                onRepeat: function () {
                    let _this = this;
                    $('#kt_repeater_image').repeater({
                        initEmpty: false,
                        show: function() {
                            let $this = $(this);
                            $(this).slideDown();
                            $(this).find('.image-input-wrapper').css('background-image', 'url(' + _this.nofound + ')');
                            $(this).find('.btn-change-image .file').on('change', function (e) {
                                $this.find('.image-input-wrapper').css('background-image', 'url(' + window.URL.createObjectURL(e.target.files[0]) + ')');
                            });
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que quieres eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        }
                    });
                },
                onItemRender: function () {
                    let html = `                            
                    <div class="row">
                        <div data-repeater-list="images" class="col-lg-12" id="panel-repeat-images">
                            <div data-repeater-item="" class="form-group align-items-center col-lg-4 float-left">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <label class="col-xl-3 col-lg-3 col-form-label">Imagen</label>
                                        <div class="col-lx-9 col-xl-9">
                                            <div class="image-input image-input-outline" id="kt_images">
                                                <div class="image-input-wrapper" style="background-image: url(${ this.nofound })"></div>
                                                <label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow btn-change-image" data-action="change" data-toggle="tooltip" title="" data-original-title="Cambiar Imagen">
                                                    <i class="fa fa-pen icon-sm text-muted"></i>
                                                    <input class="file" type="file" name="image" accept=".png, .jpg, .jpeg" required/>
                                                    <input type="hidden" name="logo_remove" />
                                                </label>
                                                <span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="cancel" data-toggle="tooltip" title="Cancel avatar">
                                                    <i class="ki ki-bold-close icon-xs text-muted"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lx-4 col-lg-4 text-right">
                                        <a href="javascript:;" data-repeater-delete="" class="btn btn-sm font-weight-bolder btn-light-danger mt-10">
                                            Eliminar
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-lg-4">
                            <a href="javascript:;" data-repeater-create="" class="btn btn-sm font-weight-bolder btn-light-primary">
                            <i class="la la-plus"></i>Agregar</a>
                        </div>
                    </div>`;
                    $('#kt_repeater_image').html(html);
                }
            }
        });
    }
}

window.AppGalleryAdmin = new AppGalleryAdmin();