const AppStructureCompany = function() {
    let __this = this;
    __this.init = function (args) {
        new Vue({
            el: '#AppStructureCompany',
            data() {
                return {
                    code: args.code,
                    graph: args.system.graph,
                    general: args.system.general,
                    prima: args.system.prima,
                    opercentage: args.system.percentage,
                    currency: '',
                    percentage: 0
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
                onLoad: function () {
                    this.onGraphGroup(this.graph.general);
                },
                onCurrency: function (percentage, currency) {
                    this.currency = currency;
                    this.percentage = percentage;
                    $('#modal-currency').modal();
                },
                onPercentageInvestment: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('code', this.code);
                    sweet2.loading(false); sweet2.loading();
                    fetch("/system/onPercentageInvestment", {method: "POST", body: formData })
                    .then(function(res){ return res.json(); })
                    .then(function(rsp){
                        sweet2.loading(false);
                        if (rsp.success) {
                            let data = rsp.data.system;
                            _this.graph = data.graph;
                            _this.general = data.general;
                            _this.prima = data.prima;
                            _this.opercentage = data.percentage;
                            _this.onGraphGroup(_this.graph.general);
                        } else {
                            sweet2.show({type: rsp.success ? 'success' : 'error', text:rsp.message});
                        }
                    })
                    .catch(function () {
                        sweet2.show({type:'error', text:'Hubo un error en el sistema.'});
                    });
                },
                onFormPercentage: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('code', this.code);
                    sweet2.loading(false); sweet2.loading();
                    fetch("/system/onPercentageCurrencyCompany", {method: "POST", body: formData })
                    .then(function(res){ return res.json(); })
                    .then(function(rsp){
                        sweet2.loading(false);
                        if (rsp.success) {
                            $('#modal-currency').modal('hide');
                            let data = rsp.data.system;
                            _this.graph = data.graph;
                            _this.general = data.general;
                            _this.prima = data.prima;
                            _this.opercentage = data.percentage;
                            _this.onGraphGroup(_this.graph.general);
                        } else {
                            sweet2.show({type: rsp.success ? 'success' : 'error', text:rsp.message});
                        }
                    })
                    .catch(function () {
                        sweet2.show({type:'error', text:'Hubo un error en el sistema.'});
                    });
                },
                onGraphGroup: function (data) {
                    am4core.ready(function() {
                        AppChartSystem.onGroupSM({scope:'groupChart', data:data});
                    });
                },
            }
        });
    }
}

window.AppStructureCompany = new AppStructureCompany();