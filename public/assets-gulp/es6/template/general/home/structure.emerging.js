const AppStructureEmerging = function() {
    let __this = this;
    __this.init = function (args) {
        new Vue({
            el: '#AppStructureEmerging',
            data() {
                return {
                    code: args.code,
                    graph: args.system.graph,
                    general: args.system.general,
                    finance: args.system.finance,
                    countries: args.system.countries,
                    country: args.system.country
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
                onDevaluation: function (e) {
                    e.preventDefault();
                    let _this = this;
                    let formData = new FormData(e.currentTarget);
                    formData.append('code', this.code);
                    sweet2.question({
                        html:'¿Estás seguro de guardar cambios?',
                        onOk:function(){
                            sweet2.loading(false); 
                            sweet2.loading();
                            fetch("/system/onDevaluationEmerging", {method: "POST", body: formData })
                            .then(function(res){ return res.json(); })
                            .then(function(rsp){
                                sweet2.loading(false);
                                if (rsp.success) {
                                    let system = rsp.data.system; 
                                    _this.graph = system.graph;
                                    _this.general = system.general;
                                    _this.finance = system.finance;
                                    _this.country = system.country;
                                    _this.onGraphGroup(system.graph.general);
        
                                } else {
                                    sweet2.show({type: rsp.success ? 'success' : 'error', text:rsp.message});
                                }
                            })
                            .catch(function (e) {
                                console.error(e);
                                sweet2.loading(false); 
                                sweet2.show({type:'error', text:'Hubo un error en el sistema.'});
                            });
                        }
                    });
                },
                onCountry: function (e) {
                    let _this = this;
                    let country = e.target.value;
                    let isValid = false;
                    for (let i = 0; i < _this.countries.length; i++) {
                        if(country.trim() == _this.countries[i].trim()) {
                            isValid = true;
                        }
                    }
                    if (!isValid){
                        sweet2.show({type: 'error', text: 'Seleccione un país existente.'});
                        return;
                    }
                    let formData = new FormData();
                    formData.append('code', this.code);
                    formData.append('country', country);
                    sweet2.loading(false); sweet2.loading();
                    fetch("/system/onCountryEmerging", {method: "POST", body: formData })
                    .then(function(res){ return res.json(); })
                    .then(function(rsp){
                        sweet2.loading(false);
                        if (rsp.success) {
                            let system = rsp.data.system; 
                            _this.graph = system.graph;
                            _this.general = system.general;
                            _this.finance = system.finance;
                            _this.country = country;
                            _this.onGraphGroup(system.graph.general);

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
                }
            }
        });
    }
}

window.AppStructureEmerging = new AppStructureEmerging();