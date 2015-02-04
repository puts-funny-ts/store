
var name_buttons = document.querySelectorAll('.name-button');
var styleTrs = [];
var addStyle = document.querySelector('#addStyle');
var addItem = document.querySelector('#addItem');



addStyle.addEventListener('click', function(){

});

addItem.addEventListener('click', function(){

});

// for (var i = 0; i < name_buttons.length; i++) {
// 	var button = name_buttons[i];
// 	console.log(button);
// 	button.addEventListener('click', function(){
// 		console.log(button);
// 		var id = button.id.substring(6);
// 		console.log(id);
// 	});
// }

var editStyle = function(style, tr){
	tr.innerHTML = '';
	var id = document.createElement('td');
	id.innerHTML = style.id;
	tr.appendChild(id);
	var tname_id = document.createElement('td');
	tname_id.innerHTML = style.tname_id;
	tr.appendChild(tname_id);
	var color = document.createElement('td');
	var color_i = document.createElement('input');
	color_i.setAttribute('type','text');
	color_i.value = style.color;
	color.appendChild(color_i);
	tr.appendChild(color);
	var size = document.createElement('td');
	var size_i = document.createElement('input');
	size_i.setAttribute('type','text');
	size_i.value = style.size;
	size.appendChild(size_i);
	tr.appendChild(size);
	var gender = document.createElement('td');
	var gender_i = document.createElement('input');
	gender_i.setAttribute('type','text');
	gender_i.value = style.gender;
	gender.appendChild(gender_i);
	tr.appendChild(gender);
	var quantity = document.createElement('td');
	var quantity_i = document.createElement('input');
	quantity_i.setAttribute('type','text');
	quantity_i.value = style.quantity;
	quantity.appendChild(quantity_i);
	tr.appendChild(quantity);
	update = document.createElement('button');
	update.addEventListener('click', function(){
		getNewStyle(tr, id, color_i, size_i, gender_i, quantity_i);
	});
	update.innerHTML = 'Update';
	var update_td = document.createElement('td');
	update_td.appendChild(update);
	tr.appendChild(update_td);
};

var setStyleToTr = function(style,tr){
	tr.innerHTML = '';
	var id = document.createElement('td');
	id.innerHTML = style.id;
	tr.appendChild(id);
	var tname_id = document.createElement('td');
	tname_id.innerHTML = style.tname_id;
	tr.appendChild(tname_id);
	var color = document.createElement('td');
	color.innerHTML = style.color
	tr.appendChild(color);
	var size = document.createElement('td');
	size.innerHTML = style.size;
	tr.appendChild(size);
	var gender = document.createElement('td');
	gender.innerHTML = style.gender;
	tr.appendChild(gender);
	var quantity = document.createElement('td');
	quantity.innerHTML = style.quantity;
	tr.appendChild(quantity);
	var edit_td = document.createElement('td');
	var edit = document.createElement('button');
	edit.addEventListener('click', function(){
		editStyle(style,tr);
	})
	edit.innerHTML = 'Edit';
	edit_td.appendChild(edit);
	tr.appendChild(edit_td);
};

var getNewStyle = function(tr, idtd, color, size, gender, quantity){
	var obj = {
		color: color.value,
		size: size.value,
		gender: gender.value,
		quantity: quantity.value
	};
	console.log(obj);
	var id = idtd.innerHTML;
	var xhr = new XMLHttpRequest();
	xhr.open('put', 'http://localhost:4567/type/' + id);
	xhr.addEventListener('load', function(){
		var style = JSON.parse(xhr.responseText);
		setStyleToTr(style, tr);
	});
	xhr.send(JSON.stringify(obj));
};

var getStyles = function(shirt){
	var xhr = new XMLHttpRequest();
	xhr.open('get', 'http://localhost:4567/type/' + shirt.id);
	xhr.addEventListener('load', function(){
		styleTrs.forEach(function(leave){
			leave.remove();
		})
		var styles = JSON.parse(xhr.responseText);
		styles.forEach(function(style){
			addStyleToTable(style);
		})
	});
	xhr.send();
};



var addStyleToTable = function(style){
	var tr = document.createElement('tr');
	setStyleToTr(style, tr);
	var table = document.getElementById('style-tbody');
	table.appendChild(tr);
	styleTrs.push(tr);
}

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