

var change=document.getElementById("txt")

var time = 250

var pic1 = "Ragnarok/jstest/1.png";
var pic2 = "Ragnarok/jstest/2.png";
var pic3 = "Ragnarok/jstest/3.png";
var pic4 = "Ragnarok/jstest/4.png";
var picArr = [pic1, pic2, pic3, pic4];
var picnumber =0;

setInterval(Jumpattack, time);
function Jumpattack()
{
	var jtr = document.getElementById("jumpthor");
	if(picnumber == picArr.length-1){
		picnumber = 0;
	}else{
		picnumber += 1;
	}
	jtr.src = picArr[picnumber];
}

box1.onclick=function (ev) {
    change.innerHTML = '<div class = fullbox> <p> Do you think Gavin is the most handsome man in this world? </p> <input type="button" onclick="congratulations()" value="Yes" /> <input type="button"  onclick="prompt_chance()" value="No" /> </div>'
}

box2.onclick=function (ev) {
  change.innerHTML = '<div class = fullbox> <p> This is not a stupid GIF or the very stupid flash, this is GREAT Javascript! You just need to know how to use array and setInterval()! </p> <img id="jumpthor" style="margin:50px 0 0 50px;" src ="Ragnarok/jstest/1.png" /> </div>'
}
function congratulations()
{
  confirm("Congratulations! You are right! You are smarter than most people in this world except Gavin!")
}


function prompt_chance()
  {
  var name=prompt("You gave the wrong answer! Even the Amoebas are SMARTER than YOU! Now we give you another chance. Do you think Gavin is the most handsome man in this world? SAY YES!","Yes")
  if (name=="yes" || name=="Yes" || name=="YES")
    {
    confirm("Yes! This time you made the right choice!")
    }
  else {
    alert("You are the most stupid person in this world!")
  }
  }
