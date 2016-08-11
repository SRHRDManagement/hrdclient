/**
* Theme: Ubold Admin Template
* Author: Coderthemes
* Dashboard 2
*/

!function($) {
    "use strict";

    var Dashboard2 = function() {
    	this.$realData = []
    };
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    //creates area chart with dotted
    Dashboard2.prototype.createBarChart  = function(element, data, xkey, ykeys, labels, lineColors) {
        Morris.Bar({
            element: element,
            data: data,
            xkey: xkey,
            xLabels:"m",
            xLabelFormat: function(x) {
                var month = months[x.x];
                return month;
            },
            dateFormat: function(x) {
                var month = months[new Date(x).getMonth()];
                return month;
            },
            ykeys: ykeys,
            labels: labels,
            hideHover: 'auto',
            resize: true, //defaulted to true
            gridLineColor: '#eeeeee',
            barColors: lineColors
        });
    },
    Dashboard2.prototype.init = function() {

        //creating bar chart
        var $barData  = [
            { m: '2016-01', s: 100, k: 90 , b: 40, p: 70 },
            { m: '2016-02', s: 75,  k: 65 , b: 20, p: 70 },
            { m: '2016-03', s: 50,  k: 40 , b: 50, p: 70 },
            { m: '2016-04', s: 75,  k: 65 , b: 95, p: 70 },
            { m: '2016-05', s: 50,  k: 40 , b: 22, p: 70 },
            { m: '2016-06', s: 75,  k: 65 , b: 56, p: 70 },
            { m: '2016-07', s: 100, k: 90 , b: 60, p: 70 }
        ];
        this.createBarChart('morris-bar-example', $barData, 'm', ['s', 'k', 'b', 'p'], ['SiemReap', 'KampongSom', 'Battambang', 'PhnomPenh'], ['#ffbd4a', '#34d3eb', '#68c448', '#fa528b']);
    },
    //init
    $.Dashboard2 = new Dashboard2, $.Dashboard2.Constructor = Dashboard2
}(window.jQuery),

//initializing
function($) {
    "use strict";
    $.Dashboard2.init();
}(window.jQuery);