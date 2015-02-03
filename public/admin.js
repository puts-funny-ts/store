
var name_buttons = document.querySelectorAll('.name-button');


for (var i = 0; i < name_buttons.length; i++) {
	var button = name_buttons[i];
	console.log(button);
	button.addEventListener('click', function(){
		console.log(button);
		var id = button.id.substring(6);
		console.log(id);
	});
}


var addTypeToTable = function(type,tr){

};

var getUpdate = function(tr, idtd, name, price, avail){
	var obj = {
		name: name.value,
		price: price.value,
		available: avail.value
	};
	var id = idtd.innerHTML;
	var xhr = new XMLHttpRequest();
	xhr.open('put', 'http://localhost:4567/shirt/' + id);
	xhr.addEventListener('load', function(){
		var shirt = JSON.parse(xhr.responseText);
		setShirtToTr(shirt, tr);
	});;
	xhr.send(JSON.stringify(obj));
}


var editPage = function(shirt, tr){
	tr.innerHTML = '';
	var id = document.createElement('td');
	id.innerHTML = shirt.id;
	tr.appendChild(id);
	var name = document.createElement('td');
	var name_i = document.createElement('input');
	name_i.setAttribute('type','text');
	name_i.value = shirt.name;
	name.appendChild(name_i);
	tr.appendChild(name);
	var price = document.createElement('td');
	var price_i = document.createElement('input');
	price.setAttribute('type','text');
	price_i.value = shirt.price;
	price.appendChild(price_i);
	tr.appendChild(price);
	var avail = document.createElement('td');
	var avail_i = document.createElement('input');
	avail_i.setAttribute('type','text');
	avail_i.value = shirt.available;
	avail.appendChild(avail_i);
	tr.appendChild(avail);
	var update_td = document.createElement('td');
	var update = document.createElement('button');
	update.innerHTML = 'Update';
	update_td.appendChild(update);
	tr.appendChild(update_td);
	update.addEventListener('click', function(){
		getUpdate(tr,id,name_i,price_i,avail_i);
	});
};

var getStyles = function(shirt){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'http://localhost:4567/type/' + shirt.id);
	xhr.addEventListener('load', function(){
		var styles = JSON.parse(xhr.responseText);
		// setStyleToTr(style, tr);
		console.log(styles);
	});;
	xhr.send();
};


var setShirtToTr = function(shirt, tr){
	tr.innerHTML = '';
	var id = document.createElement('td');
	id.innerHTML = shirt.id;
	tr.appendChild(id);
	var name = document.createElement('td');
	name.innerHTML = shirt.name
	tr.appendChild(name);
	var price = document.createElement('td');
	price.innerHTML = shirt.price;
	tr.appendChild(price);
	var available = document.createElement('td');
	available.innerHTML = shirt.available;
	tr.appendChild(available);
	var edit_td = document.createElement('td');
	var edit = document.createElement('button');
	edit.addEventListener('click', function(){
		editPage(shirt,tr)
	})
	edit.innerHTML = 'Edit';
	edit_td.appendChild(edit);
	tr.appendChild(edit_td);
	show = document.createElement('button');
	show.innerHTML = 'Show Styles';
	show.addEventListener('click', function(){
		getStyles(shirt);
	});
	show_td = document.createElement('td');
	show_td.appendChild(show);
	tr.appendChild(show_td);
};

var addShirtToTable = function(shirt){
	var tr = document.createElement('tr');
	setShirtToTr(shirt, tr);
	var table = document.getElementById('name-tbody');
	// var table = document.getElementById('name-table');
	table.appendChild(tr);
}

var getAllItems = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET', 'http://localhost:4567/shirts');
	xhr.addEventListener('load', function(){
		var shirts = JSON.parse(xhr.responseText);
		shirts.forEach(function(shirt){
			console.log(shirt)
			addShirtToTable(shirt);
		});
	});
	xhr.send();
};
	
getAllItems();