
var direction = 2;
var temp = 0;
var speed = 10;
var iswalking =0;

var thor = document.getElementById('Thor')
var isattacking = 0
var attackspeed = 620

function checkaction(event)
{
  if (event.keyCode == 	88)
    attack();
  else if (event.keyCode + direction == 39)
  {
    turn();
  }
   if ( (event.keyCode == 37 || event.keyCode == 39) && isattacking ==0)
  {
    var feet = (event.keyCode - 38) * speed;
    move (feet);
  }
  var a = thor.offsetLeft;
  a-=590;
  document.getElementById("demo").innerHTML="the coordinate is " + a;
}

function stopmoving (event)
{
  if (event.keyCode == 37 || event.keyCode == 39)
    resetwalking();
}

function turn()
{
  var current = (0 + direction * 90);
  thor.style.webkitTransform = "rotateY("+current+"deg)";
  thor.style.transform = "rotateY("+current+"deg)";
  thor.style.moztransform = "rotateY("+current+"deg)";
  [direction, temp] = [temp, direction];
}



function attack()
{
  if (isattacking == 0)
  {
    isattacking = 1;
    thor.src = "Ragnarok/viking/attacking.gif";
    setTimeout(resetattacking, attackspeed);
  }
}

function resetattacking()
{
  isattacking = 0;
  thor.src="Ragnarok/viking/stance.gif";
}

function resetwalking()
{
  iswalking =0;
  thor.src="Ragnarok/viking/stance.gif";
}


function move(feet){
  if (iswalking ==0){
    thor.src ="Ragnarok/viking/walking.gif";
    iswalking =1;
  }
  thor.style.left =  (thor.offsetLeft - 590 +feet) +"px";
}
