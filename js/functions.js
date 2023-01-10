function getTime()
{
    var date = new Date();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();

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
    document.getElementById('timeDisplay').innerHTML = "Время: " + hours + ':' + minutes + ':' + seconds;
}
setInterval(getTime, 0);
window.onload;

function getDay()
{
    var date = new Date();
    var day = date.getDay();
    var month = date.getMonth();
    var date = date.getDate();
    if(day < 10)
    {
        day = '0' + day;
    }
    if(month < 10)
    {
        month++;
        month = '0' + month;
    }

    document.getElementById('dayDisplay').innerHTML = date + '.' + month;
}
setInterval(getDay, 0);
window.onload;