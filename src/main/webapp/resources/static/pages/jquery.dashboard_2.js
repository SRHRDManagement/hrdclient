
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
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "Novemboer", "December"];
    //creates area chart with dotted
    Dashboard2.prototype.createAreaChartDotted = function(element, pointSize, lineWidth, data, xkey, ykeys, labels, Pfillcolor, Pstockcolor, lineColors) {
        Morris.Area({
            element: element,
            pointSize: 0,
            lineWidth: 0,
            data: data,
            xkey:xkey,
            xLabels:"month",
            xLabelFormat: function(x) { // <--- x.getMonth() returns valid index
                var month = months[x.getMonth()];
                return month;
            },
            dateFormat: function(x) {
                var month = months[new Date(x).getMonth()];
                return month;
            },
            ykeys: ykeys,
            labels: labels,
            hideHover: 'auto',
            pointFillColors: Pfillcolor,
            pointStrokeColors: Pstockcolor,
            resize: true,
            gridLineColor: '#eef0f2',
            lineColors: lineColors
        });
   },
    Dashboard2.prototype.init = function() {

        //creating area chart
        var $areaDotData = [
                { month: '2016-04', a: 100,  b: 20, c:30, d: 90 },
                { month: '2016-05', a: 75,  b: 65, c:30, d: 90 },
                { month: '2016-06', a: 50,  b: 40, c:30, d: 90 },
                { month: '2016-07', a: 75,  b: 65, c:30, d: 90 },
                { month: '2016-08', a: 50,  b: 40, c:30, d: 90 },
                { month: '2016-09', a: 75,  b: 65, c:30, d: 90 }
            ];
        this.createAreaChartDotted('morris-area-with-dotted', 0, 0, $areaDotData, 'month', ['a', 'b', 'c', 'd'], ['SiemReap ', 'KampongSom ', 'Battambang ', 'PhnomPenh '],['#ffffff'],['#999999'], ['#d1a701', '#02a9ef','#00e396', '#e40000']);
    },
    //init
    $.Dashboard2 = new Dashboard2, $.Dashboard2.Constructor = Dashboard2
}(window.jQuery),

//initializing
function($) {
    "use strict";
    $.Dashboard2.init();
}(window.jQuery);