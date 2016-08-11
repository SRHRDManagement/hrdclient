function editField(id){
	id-=1;
	table =  document.getElementById("table1");
	cell1 = table.rows[id].cells[1].innerHTML;
	cell2 = table.rows[id].cells[2].innerHTML;
	cell3 = table.rows[id].cells[3].innerHTML;
	cell4 = table.rows[id].cells[4].innerHTML;
	cell5 = table.rows[id].cells[5].innerHTML;
	cell6 = table.rows[id].cells[6].innerHTML;

	document.getElementById("field-1").value = cell1;
	document.getElementById("field-2").value = cell2;
	document.getElementById("field-3").value = cell3;
	document.getElementById("field-4").value = cell4;
	document.getElementById("field-5").value = cell5;
	document.getElementById("field-6").value = cell6;
}
function changeUser(){
	n  = document.getElementById("field-1").value;
	ln = document.getElementById("field-2").value;
	un = document.getElementById("field-3").value;
	r  = document.getElementById("field-4").value;
	pw = document.getElementById("field-5").value;
	cp = document.getElementById("field-6").value;

	table.rows[0].cells[1].innerHTML = n;
	table.rows[0].cells[2].innerHTML = ln;
	table.rows[0].cells[3].innerHTML = un;
	table.rows[0].cells[4].innerHTML = r;
	table.rows[0].cells[5].innerHTML = pw;
	table.rows[0].cells[6].innerHTML = cp;

	/*var cell = row.insertCell(0).innerHTML = n;
    var cell2 = row.insertCell(1).innerHTML = g;
    var cell3 = row.insertCell(2).innerHTML = s;
    var cell4 = row.insertCell(3).innerHTML = c;*/
}
$(document).ready(function(){
	changeActiveLink();
	$("#plusButton").click(function(){
		$("#generation-layout").slideToggle();
		if($("#plusButton").val()=='plus') {
			$("#plusButton").val('minus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
		}
		else{
			$("#plusButton").val('plus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
		}
	 });

	$("#saveCourse").click(function(){
		var cname=$("#couName").val();
		var cdate=$("#couDate").val();
		var ccolor=$("#couColor").val();
		var cdes=$("#couDescription").val();
		$("#result").append(
				"<div class='col-sm-3 col-md-3 spacecourse' style='background-color: "+ccolor+";box-shadow:2px 2px 6px rgba(35, 35, 40, 0.83)'> <h3 style='color: rgba(210, 255, 214, 0.83)'><b style='color: #ffffff'>"+cname+"</b></h3> <p style='color: white;'><i>Added: "+cdate+"</i></p> <div> <button type='button' class='btn-white col-md-6'> <span class='ion ion-eye-disabled'></span>Disable </button> <button type='button' class='btn-white col-md-6'> <span class='fa  fa-pencil'></span>Edit </button> </div> </div>"
		);
	});

	$('#btnPhoto').change( function(event) {
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$("#profilePhoto").fadeIn(3000).attr('src',tmppath);
	});

	$("#saveClass").click(function(){
		var clname=$("#className").val();
		var cldate=$("#classDate").val();
		var clcolor=$("#classColor").val();
		$("#resultClass").append(
			"<div class='col-xs-6 col-sm-2 col-md-2'><div class='spacecourse' style='background-color: "+clcolor+"; box-shadow:2px 2px 6px rgba(35, 35, 40, 0.83)'><p style='color: white; text-align: center'><i>"+cldate+"</i></p> <h4 style='color: rgba(210, 255, 214, 0.83); text-align: center'><b style='color: #000'>"+clname.toUpperCase()+"</b></h4> <div class='row' style='align-items: center'><button type='button' class='btn-custom btn-white btn-rounded col-xxs-6 col-xs-6 col-sm-6 col-md-6'><span class='ion ion-eye-disabled'></span></button><button type='button' class='btn-custom btn-white btn-rounded col-xxs-6 col-xs-6 col-sm-6 col-md-6'><span class='fa fa-pencil'></span></button></div></div></div>"
		);
	});

	$("#saveSubject").click(function(){
		var subname=$("#subName").val();
		var subdate=$("#subDate").val();
		var subdesc=$("#subDesc").val();
		$("#resultSubject").append(
			"<tr><td><span class='glyphicon glyphicon-pencil'></span></td><td>id(db)</td> <td>"+subname+"</td><td>"+subdate+"</td><td>"+subdesc+"</td><td><button class='btn btn-success btn-xs'>active</button></td></tr>"
		);
	});
});

function changeActiveLink() {
	  var currentLocation = window.location.href;
	  currentLocation = currentLocation.replace('//', '/').split('/');
	  var page = currentLocation[2];
	  alert(page);
	  if (page == "") { page = 'index.html'; }

	  $('#sidebar-menu a[href*="'+ page +'"]').addClass('active');
	}



