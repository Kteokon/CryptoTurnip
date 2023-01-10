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
    if(month < 10)
    {
        month++;
        month = '0' + month;
    }
    switch (day) {
        case 1:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Понедельник";
            break;
        case 2:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Вторник";
            break;
        case 3:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Среда";
            break;
        case 4:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Четверг";
            break;
        case 5:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Пятница";
            break;
        case 6:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Суббота";
            break;
        case 7:
            document.getElementById('dayDisplay').innerHTML = date + '.' + month + ", Воскресенье";
            break;
    }
}
setInterval(getDay, 1000);
window.onload;