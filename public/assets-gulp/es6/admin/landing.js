const AppLandingAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        new Vue({
            el: '#AppLandingAdmin',
            data() {
                return {
                    menus: args.menus,
                    menu: Object.create({}),
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
                    console.log(this.menus);
                    this.onScheme(0);
                },
                onMovedSection: function () {
                    swal2.show({
                        title: '¿Estás seguro de cambiar de posición?',
                        html: `
                        <div class="form-group">
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>                        
                        `,
                        icon: 'info',
                        showCancelButton: true,
                        onOk: function () {
                        }
                    });
                },
                onScheme: function (index) {
                    if (this.menus[index] != undefined) {
                        this.menu = Object.create(this.menus[index]);
                    }
                },
                onLiberateSection: function (child, parent) {
                    console.log(child, parent);
                    let formData = new FormData();
                    formData.append('section_id', child.id);
                    formData.append('menu_id', parent.id);
                    swal2.show({
                        text: '¿Estás seguro de liberarlo?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/section/liberate", {method: "POST", body: formData})
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
                render: function () {
                    return {
                        position: ``
                    };
                }
            }
        });
    }
}

window.AppLandingAdmin = new AppLandingAdmin();