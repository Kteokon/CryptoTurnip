function getTime()
{
    var date = new Date();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    var day = date.getDay();
    //По надобности условие ниже повторить с minutes и hours
    if(seconds < 10)
    {
        seconds = '0' + seconds;
    }
    if(minutes < 10)
    {
        minutes = '0' + minutes;
    }
    if (hours < 10){
        hours = '0' + hours;
    }
    document.getElementById('timeDisplay').innerHTML = hours + ':' + minutes + ':' + seconds;
}
setInterval(getTime, 0);
window.onload;