var canvas = document.querySelector('canvas');
console.log(canvas);

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

var c = canvas.getContext('2d');
console.log(c);


// //rectangle
// c.fillStyle = 'rgba(255,0,0,.5)';
// c.fillRect(100,100,100,100);
// c.fillStyle = 'rgba(0,255,0,.5)';
// c.fillRect(400,100,100,100);
// c.fillStyle = 'rgba(0,0,255,.5)';
// c.fillRect(100,300,100,100);
// c.fillStyle = 'rgba(0,255,255,.5)';
// c.fillRect(300,300,100,100);


// //line
// c.beginPath();
// c.moveTo(50,300);
// c.lineTo(300,100);
// c.lineTo(400,300);
// c.strokeStyle ="#fa34a3";
// c.stroke();


// //arc
// c.beginPath();
// c.arc(300,300,30,0,Math.PI*2,false);
// c.stroke();


var multipleCircle =[];
var colorArray =[
	'#0C383B',
	'#789F8A',
	'#E2D8A3',
	'#E1B753',
	'#E1694E'];
var circleCount =40;

//mouse control
var mousePosition={
	x:0,
	y:0
}

window.addEventListener('mousemove',function(event){
	mousePosition.x=event.x;
	mousePosition.y=event.y;
});

//browser resize control
window.addEventListener('resize',function(){
	canvas.width = window.innerWidth;
	canvas.height = window.innerHeight;
	createMultipleCircle(circleCount);
});




function Circle(position,velocity,radius){
	this.position = position;
	this.velocity = velocity;
	this.radius = radius;
	this.minRadius = radius;
	this.color = colorArray[Math.floor(Math.random()*colorArray.length)];
	this.draw =function(){
		c.beginPath();
		c.arc(this.position.x,this.position.y,this.radius,0,Math.PI*2,false);
		c.save();
		c.strokeStyle='blue';
		c.stroke();
		c.restore();
		//c.fillStyle = colorArray[Math.floor(Math.random()*colorArray.length)];//for glitering
		c.fillStyle = this.color;
		c.fill();
	};

	this.update =function(){
		if((this.position.x+this.radius)>canvas.width || (this.position.x-this.radius)<0)this.velocity.dx = - this.velocity.dx;
		if((this.position.y+this.radius)>canvas.height || (this.position.y-this.radius)<0)this.velocity.dy = - this.velocity.dy;
		this.position.x+=this.velocity.dx;
		this.position.y+=this.velocity.dy;
		//this.mouseactivity(this.position,mousePosition);
		this.draw();
	};

	this.mouseactivity = function (circle_position, mouse_position){
		if(mouse_position.x-circle_position.x<50 && mouse_position.x-circle_position.x>-50 && mouse_position.y-circle_position.y<50 && mouse_position.y-circle_position.y>-50){
			if(this.radius<40)this.radius++;
		}
		else if(this.radius>this.minRadius)this.radius--;
    }

}

function createMultipleCircle(limit){
	multipleCircle =[];
	for (var i = 0; i < limit; i++) {
		var scale = 10;
		var radius = Math.random()*scale+1;
		var position = {
			x:Math.random()*(canvas.width-2*radius)+radius,
			y:Math.random()*(canvas.height-2*radius)+radius
		};
		var velocity = {
			dx:(Math.random()-0.5)*scale,
			dy:(Math.random()-0.5)*scale
		};
		multipleCircle.push(new Circle(position,velocity,radius));
	
	}
}

createMultipleCircle(circleCount);
console.log(multipleCircle);



//animate
function animateAllObject(){
	for (var i = 0; i <multipleCircle.length; i++) {
	        multipleCircle[i].update();
	}
}

function animate(){
	requestAnimationFrame(animate);
	c.clearRect(0,0,canvas.width, canvas.height);
	animateAllObject();
}

animate();
