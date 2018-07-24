debugger;

var origin = new Array($("#Thor").offset().left, $("#Thor").offset().top);

function sleep(delay)
{
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}

function scrollWrapper(x, y){
    var wrapper = document.getElementById('wrapper');
    wrapper.scrollLeft += x;
    wrapper.scrollTop += y;
}



// practise ES5:
//function Kill_count() {
//    this.kill = 0;
//}

//var kill_number = new kill_count();

function Kill_count(initial) {
    var kill = initial || 0;
    return {
        inc: function () {
            kill += 1;
            return kill;
        },
        get: function () {
            return kill;
        },
        reset: function(kill_number){
            kill = kill_number;
            return kill;
        }
    }
}

var kill_number = Kill_count();

// window.onload=function(){
//   if (UserID != -1){
//     var request = getXmlHTTP();
//   	request.onreadystatechange = function () {
//   	    if (request.readyState === 4) {
//   	    		if (request.status === 200) {
//   	    				var responseJSON = JSON.parse(request.responseText);
//                 if (responseJSON.Type == "kill_number"){
//                     kill_number.reset(responseJSON.number);
//                 }
//   	    		} else {
//   	    				//return fail(request.status);
//   	    		}
//   	    } //else {
//   	    //}
//   		}
//   	request.open('GET', '/CheckLogServlet');
//   	request.send();
//   }
// }

// function sendkill(){
//     var request = getXmlHTTP();
//     xmlhttp.open("POST","",true);
//     xmlhttp.send("fname=Henry&lname=Ford");
// }

class Creature {
    constructor(species) {
        this.species = species;
        if (species == "enemy"){
            this.hp = 30;
        }else if (species == "Thor"){
            this.hp = 150;
            this.speed = 12;
            this.attackspeed = 620;
        }
        this.iswalking =0;
        this.isattacking = 0;
        this.isbeingAttacked = 0;
        this.isDead = 0;
        this.temp_direction = 0;
    }
    turn()
    {
      var current = (0 + this.direction * 90);
      document.getElementById(this.htmlID).style.webkitTransform = "rotateY("+current+"deg)";
      document.getElementById(this.htmlID).style.transform = "rotateY("+current+"deg)";
      document.getElementById(this.htmlID).style.moztransform = "rotateY("+current+"deg)";
      [this.direction, this.temp_direction] = [this.temp_direction, this.direction];
    }
    bind (object, func) {
      return function() {
          return func.apply(object, arguments); // because we dont want func run Immediately
      }
    }                              ////////////////really interesting lololololololololololololol~~~~~~~~~~
    resetwalking()
    {
      this.iswalking =0;
      document.getElementById(this.htmlID).src=this.stance;
    }
    attack()
    {
      if (this.isattacking == 0 && this.isDead == 0 &&this.isbeingAttacked ==0)
      {
        this.isattacking = 1;
        this.model.src = this.attacking;
        setTimeout(this.bind(this,this.resetattacking),this.attackspeed);
        // setTimeout(this.resetattacking.bind(this),this.attackspeed); this is also fine
      }
      if (this.species == "Thor"){
        var distance = (this.direction-1)*170;
        //alert("Thor's left: "+this.left);

        for (var i = 0; i < trolls.length; i ++){
            //alert("troll's left: " + i + ": "+trolls[i].left);
            if (trolls[i].left <= this.left && trolls[i].left - distance > this.left){
                trolls[i].underattack(this.power);
            }else if (trolls[i].left >= this.left && trolls[i].left - distance < this.left){
                trolls[i].underattack(this.power);
            }
          }

        //bad loop
        //trolls.forEach(function(victim, index){
        //  var distance = (this.direction-1)*170;
        //  //alert("thor's left: " + this.left);
        //  //alert("torll's left: "+ troll.left);
        //  if (victim.left <= this.left && victim.left - distance > this.left){
        //    trolls[index].underattack(this.power);
        //  }else if (victim.left >= this.left && victim.left - distance < this.left){
        //    trolls[index].underattack(this.power);
        //  }
        //}, this)
      }
    }
    resetattacking()
    {
      this.isattacking = 0;
      document.getElementById(this.htmlID).src= this.stance;
    }
    underattack(power)
    {
      if (this.isDead == 0){
          this.isbeingAttacked = 1;
          this.iswalking =0;
          this.isattacking =0;
          //this.model.src= this.beAttacked;   // why??? Because we changed the HTML
          this.hp -= power;
          document.getElementById(this.htmlID).src= this.beAttacked;
          //alert(trolls.length);
          //check if they are died
          if (this.hp <= 0){
              document.getElementById(this.htmlID).src = this.dead;
              this.isDead = 1;
              setTimeout(this.bind(this,this.die),4000);
          }else{
            setTimeout(this.bind(this,this.resetBeAttacked),500);
          }
      }
    }
    resetBeAttacked()
    {
      if (this.isDead == 0){
          this.isbeingAttacked = 0;
          document.getElementById(this.htmlID).src= this.stance;
      }
    }
    move(feet){
      if(this.iswalking ==0 && this.isDead == 0 &&this.isbeingAttacked ==0){
        document.getElementById(this.htmlID).src =this.walking;
        this.iswalking =1;
      }
      if ( (feet > 0 && this.left< ($("#BackGround").offset().left + 2905)) || (feet < 0 && this.left > ($("#BackGround").offset().left))){
        this.movethis(feet);
      }
    }
    die(){
      if (this.species == "enemy"){
          if (this.enemysSpecies == "Troll"){
              $("#kill_number").text("Kill: "+kill_number.inc());
              if (UserID != -1){

              }
              //set kill number;
              var dead = document.getElementById("parentOf_" + this.htmlID);
              dead.parentNode.removeChild(dead);
              deadTrools.push(this.id);
              trolls.splice(trolls.indexOf(this),1);
          }
      }
    }
}

class Thor extends Creature {
    constructor() {
       super("Thor");
       this.direction = 2;
       this.htmlID = 'Thor';
       this.model = document.getElementById('Thor');
       this.stance = "Ragnarok/viking/stance.gif";
       this.attacking = "Ragnarok/viking/attacking.gif";
       this.walking = "Ragnarok/viking/walking.gif";
       this.power = 10;
       this.left = origin[0];
       this.top = origin[1];
       this.beAttacked = null;
   }
   movethis(x){
     $("#Thor").animate({
       left: '+='+x+'px'
     }, 0)
     this.left = $("#Thor").offset().left;
   }
}

class Enemy extends Creature {
    constructor(species) {
       super("enemy");
       this.camp = 2;
       this.enemysSpecies = species;
   }
}

class Troll extends Enemy {
    constructor(trollnumber) {
       super("Troll");
       this.id = trollnumber;
       this.htmlID = 'Troll' + trollnumber;
       this.create(this.htmlID);
       this.model = document.getElementById(this.htmlID);
       this.speed = 10;
       this.stance = "Ragnarok/troll/stance.gif";
       //this.attacking = "Ragnarok/troll/attacking.gif";
       this.walking = "Ragnarok/troll/walking.gif";
       this.beAttacked = "Ragnarok/troll/attacked.gif";
       this.dead = "Ragnarok/troll/dead.gif";
       var ramdomNumber = Math.random();
       this.direction = 2;
       if (ramdomNumber > 0.5){
         this.turn();
       }
       this.label = $("#" + this.htmlID);
       this.label.offset({top: this.label.offset().top - 200, left: ramdomNumber * 2905 + $("#BackGround").offset().left});
       this.left = $("#" + this.htmlID).offset().left;
       setTimeout(this.bind(this,this.ramdomlyMove),2000);
   }
   create(htmlID){
     //add to html;Trolls
       $('#Trolls').html(
         $("#Trolls").html() + '<creature id = "parentOf_' + this.htmlID  +'" style = "position:absolute;"> <img id= ' +  this.htmlID + ' src = "Ragnarok/troll/stance.gif"/> </creature>'
       ); // So I cannot use this.model here!!!!!!!!!!!!!!! because it will reset allllllllllllll elementes!!!
   }
   ramdomlyMove()
   {
     if (this.dead == 1){
       return;
     }else if (this.isbeingAttacked == 1){
         setTimeout(this.bind(this,this.ramdomlyMove),300);
     }else{
         var ramdomNumber = Math.random();
         if (ramdomNumber < 0.5){
           this.turn();
         }
         this.move(this.speed*(this.direction-1));
      }
   }
   resetwalking()
   {
     if (this.dead == 1){
       return;
     }else if (this.isbeingAttacked == 1){
         setTimeout(this.bind(this,this.resetwalking),300);
     }else if (this.iswalking == 1){
         super.resetwalking();
         setTimeout(this.bind(this,this.ramdomlyMove),2000);
     }else{
         setTimeout(this.bind(this,this.ramdomlyMove),1200);
     }
   }
   move(feet){
       document.getElementById(this.htmlID).src =this.walking;
       this.iswalking =1;
       this.movePerSec(feet, 1000);
   }
   movePerSec(feet, timeleft){
     if (this.dead == 0){
         return;
     }else if (this.isbeingAttacked==1){
         this.resetwalking();
         return;
     }else if (timeleft != 0){
         if ( (feet > 0 && this.left< ($("#BackGround").offset().left + 2905)) || (feet < 0 && this.left > ($("#BackGround").offset().left))){
             this.movethis(feet);
         }
         setTimeout(this.bind(this,function(){ return this.movePerSec(feet, timeleft-50);}),50);
     }else{
       this.resetwalking();
     }
   }
   movethis(x){
     $("#" + this.htmlID).animate({
       left: '+='+x+'px'
     }, 50)
     this.left = $("#" + this.htmlID).offset().left;
   }
}

var trollnumber = 0;
var trolls = [];
var deadTrools = [];
var time_reborn = 1500;
var max_trolls = 6;
setInterval(check_trolls_number, time_reborn);
function check_trolls_number()
{
	if(trolls.length < max_trolls){
		trolls_add();
	}
}
function trolls_add()
{
    var TrollID = trolls.length+1;
    if (deadTrools.length > 0)
        TrollID = deadTrools.pop();
    trolls.push(new Troll(TrollID));
}


var player = new Thor();

$(document).keydown(function checkaction(event)
{
  if (event.keyCode == 	88)
    player.attack(); //trolls[0].underattack(10);
  else if (event.keyCode + player.direction == 39)
  {
    player.turn();
  }
   if ( (event.keyCode == 37 || event.keyCode == 39) && player.isattacking ==0)
  {
    var feet = (event.keyCode - 38) * player.speed;
    player.move(feet);
    if(player.left <= ($("#BackGround").offset().left + 2509) && player.left >= ($("#BackGround").offset().left + 580)){
        scrollWrapper(feet);
    }
  }
});


$(document).keyup(function stopmoving (event)
{
  if (event.keyCode == 37 || event.keyCode == 39)
    player.resetwalking();
});
