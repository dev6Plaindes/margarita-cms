const AppCompanyAdmin = function () {
    let __this = this;
    __this.general = function (args) {
        new Vue({
            el: '#AppDataCompanyAdmin',
            data() {
                return {
                    company: args.company
                }
            },
            created: function() {
            },
            mounted: function () {
                this.onSummernote();
            },
            watch: {
            },
            computed: {
            },
            methods: {
                onFormData:function (e) {
                    e.preventDefault();
                    let formData = new FormData(e.currentTarget);
                    formData.append('company_id', this.company.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/company/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
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
                onSummernote: function (e) {
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
                }
            }
        });
    }
    __this.interface = function (args) {
        new Vue({
            el: '#AppInterfaceCompanyAdmin',
            data() {
                return {
                    company: args.company,
                    colors: args.colors,
                    logos: args.logos,
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
            computed: {
            },
            methods: {
                onFormInterface:function (e) {
                    e.preventDefault();
                    let formData = new FormData(e.currentTarget);
                    formData.append('company_id', this.company.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/company/saveInterface", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
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
                    let kt_image_1 = new KTImageInput('kt_image_1'),
                        kt_image_2 = new KTImageInput('kt_image_2'),
                        kt_images = new KTImageInput('kt_images');

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
                    // https://github.com/DubFriend/jquery.repeater/tree/master/test
                    $('#kt_repeater_logo').repeater({
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
            }
        });
    }
    __this.payment = function (args) {
        new Vue({
            el: '#AppPaymentCompanyAdmin',
            data() {
                return {
                    company: args.company,
                    banks: args.banks,
                    mobiles: args.mobiles
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
                onFormTransfer:function (e) {
                    e.preventDefault();
                    let formData = new FormData(e.currentTarget);
                    let data = $('#kt_repeater_bank').repeaterVal();

                    formData.append('company_id', this.company.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/company/savePayment", {method: "POST", body: formData})
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
                onLoad: function () {
                    this.onRepeat();
                },
                onRepeat: function () {
                    function EventFileInput() {
                        $('.custom-file-input').off('change');
                        $('.custom-file-input').on('change', function (e) {
                            if (e.target.files.length > 0) {;
                                $(this).next().text(e.target.files[0].name);
                            } else {
                                $(this).next().text('Seleccionar');
                            }
                        });
                    }
                    EventFileInput();
                    $('#kt_repeater_bank').repeater({
                        initEmpty: false,
                        show: function() {
                            $(this).slideDown();
                            $(this).find('.custom-file-label').text('Seleccionar');
                            EventFileInput();
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que quieres eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        }
                    });
                    $('#kt_repeater_mobile').repeater({
                        initEmpty: false,
                        show: function() {
                            $(this).slideDown();
                            $(this).find('.custom-file-label').text('Seleccionar');
                            EventFileInput();
                        },
                        hide: function(deleteElement) {                 
                            if(confirm('¿Estás seguro de que quieres eliminar este elemento?')) {
                                $(this).slideUp(deleteElement);
                            }                                
                        }      
                    });
                }
            }
        });
    }
}

window.AppCompanyAdmin = new AppCompanyAdmin();