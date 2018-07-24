
document.getElementById("myAudio").volume = 0.25;

function playAudio() {
    var x = document.getElementById("myAudio");
    var y = document.getElementById("play");
    if (x.paused)
    {
        x.play();
        y.style.backgroundImage = 'url("img/pause.png")';
    }
    else
    {
        x.pause();
        y.style.backgroundImage = 'url("img/play.png")';
    }
}
