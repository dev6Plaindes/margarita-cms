const AppDashboardAdmin = function () {
    let __this = this;
    __this.index = function (args) {
        new Vue({
            el: '#AppDashboardAdmin',
            data() {
                return {
                    graph: args.graph,
                    inscriptions: args.inscriptions,
                    recents: args.recents,
                    inscription: {}
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
                    var chart = AmCharts.makeChart("kt_amcharts", {
                        "rtl": KTUtil.isRTL(),
                        "type": "serial",
                        "theme": "light",
                        "dataProvider": this.graph.status,
                        "valueAxes": [{
                            "gridColor": "#FFFFFF",
                            "dashLength": 0,
                        }],
                        "gridAboveGraphs": true,
                        "startDuration": 1,
                        "graphs": [{
                            "balloonText": "[[category]]: <b>[[value]]</b> Cursos",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "type": "column",
                            "valueField": "quantity"
                        }],
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": true
                        },
                        "categoryField": "label",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "gridAlpha": 0,
                            "tickPosition": "start",
                            "tickLength": 20
                        },
                        "export": {
                            "enabled": true
                        }
                    });
                    let table = $('#table-inscriptions').DataTable({
                        language: help.dataTable.language,
                        responsive: true,
                        paging: false,
                        "scrollX": true,
                        "scrollY": 600,
                        "scrollCollapse": true,
                    });
                    $('#status').on('change', function () {
                        table.columns(5).search($(this).val()).draw();                
                    });

                    $('#search').on('keyup', function () {
                        table.search($(this).val()).draw();                
                    });
                },
                onModal: function (index) {
                    this.inscription = this.inscriptions[index];
                    $('#modal-manage').modal();
                },
                onFormInscription: function (e) {
                    e.preventDefault();
                    let _this = this,
                    formData = new FormData(e.target);
                    formData.append('id', this.inscription.id);
                    swal2.show({
                        text: '¿Estás seguro de guardar cambios?',
                        icon: 'question',
                        showCancelButton: true,
                        onOk: function () {
                            swal2.loading();
                            fetch("/admin/inscription/manage", {method: "POST", body: formData})
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                if (rsp.success) {
                                    $('#table-inscriptions').DataTable().destroy();
                                    _this.graph = rsp.data.dashboard.graph;
                                    _this.inscriptions = rsp.data.dashboard.inscriptions;
                                    _this.recents = rsp.data.dashboard.recents;
                                    _this.inscription = {};
                                    setTimeout(() => {
                                        _this.onLoad();
                                        $('#modal-manage').modal('hide');
                                        $('#status').trigger('change');
                                        $('#formInscription').trigger("reset");
                                        $('#search').val('');
                                        let sent = formData.get('send');
                                        if (sent) {
                                            rsp.success = rsp.data.mail.success;
                                            rsp.message = rsp.data.mail.message;
                                        }
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

window.AppDashboardAdmin = new AppDashboardAdmin();