// console.log(swal2.loading());
const AppMenuAdmin = function () {
    let __this = this;
    __this.manage = function (args) {
        Vue.component('tree-item', {
            template: '#item-template',
            props: {
              item: Object
            },
            data() {
                return {
                    defaults: {
                        notfound: '/assets/image/notfound.png'
                    }
                }
            },
            computed: {
            },
            methods: {
            }
        });

        new Vue({
            el: '#AppMenuAdmin',
            data() {
                return {
                    menus: args.menus,
                    menu: Object.create({}),
                    company_id: args.company_id,
                    all: args.all,
                    templates_views: args.templates_views,
                    modal: {
                        title: 'Nuevo Menú'
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
            computed: {
                isImage: function () {
                    return this.menu.image ? this.menu.image : '/assets/image/notfound.png';
                }
            },
            methods: {
                onLoad:function () {
                    this.kt_image_1 = new KTImageInput('kt_image');
                    this.onTreeView();
                },
                onFormMenu: function (menu) {
                    document.getElementById('form_save_menu').reset();
                    if (menu) {
                        this.menu = menu;
                        this.modal.title = 'Editar Menú';
                    } else {
                        this.modal.title = 'Nuevo Menú';
                        this.menu = Object.create({});
                    }
                    $('#modalFormMenu').modal();
                },
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
                            fetch("/admin/menu/saveData", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#modalFormMenu').modal('hide');
                                }
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        if (rsp.success) {
                                            swal2.loading();
                                            window.location = '/admin/landing/menus';    
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
                onDelete: function (id) {
                    let _this = this,
                    formData = new FormData();
                    formData.append('id', id);
                    swal2.show({
                        text: '¿Estás seguro de eliminar?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/menu/remove", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#modalFormMenu').modal('hide');
                                }
                                swal2.show({
                                    text: rsp.message,
                                    icon: rsp.success ? 'success' : 'error',
                                    showCancelButton: false,
                                    onOk: function () {
                                        if (rsp.success) {
                                            swal2.loading();
                                            window.location = '/admin/landing/menus';    
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
                onTreeView: function () {
                    let _this = this;
                    $('#kt_tree_menu').jstree({
                        "core": {
                            "themes": {
                                "responsive": false
                            }
                        },
                        "types": {
                            "default": {
                                "icon": "fa fa-folder text-warning"
                            },
                            "file": {
                                "icon": "fa fa-file  text-warning"
                            }
                        },
                        "plugins": ["types"]
                    });

                    $('#kt_tree_menu').on("changed.jstree", function (e, data) {
                        let id = data.node.a_attr.dataid;
                        _this.menu = _this.findNode(id, {id:0, children:_this.menus});
                        _this.onFormMenu(_this.menu);
                    });
                },
                findNode: function(id, currentNode) {
                    var i,
                        currentChild,
                        result;
                    if (id == currentNode.id) {
                        return currentNode;
                    } else {
                        // Use a for loop instead of forEach to avoid nested functions
                        // Otherwise "return" will not work properly
                        for (i = 0; i < currentNode.children.length; i += 1) {
                            currentChild = currentNode.children[i];
                
                            // Search in the current child
                            result = this.findNode(id, currentChild);
                
                            // Return the result if the node has been found
                            if (result !== false) {
                                return result;
                            }
                        }
                        // The node has not been found and we have no more options
                        return false;
                    }
                }
            }
        });
    }
}

window.AppMenuAdmin = new AppMenuAdmin();