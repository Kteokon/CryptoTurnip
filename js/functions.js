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

function blockBuyButton(){
    var day = new Date();
    var hour = day.getHours();
    if (day != 7 || hour < 11 || hour > 14){
        document.getElementById('buyBtn').setAttribute("disabled", "disabled")
    }
    else  
    {document.getElementById('buyBtn').setAttribute("active", "active")}
}

function blockSellButton(){
    var day = new Date();
    var hour = day.getHours();
    if (day != 7 || hour < 8 || hour > 22){
        document.getElementById('sellBtn').setAttribute("disabled", "disabled")
    }
    else  
    {document.getElementById('sellBtn').setAttribute("active", "active")}
}

function blockUtilizButton(){
    var day = new Date();
    var hour = day.getHours();
    if (day != 7 || hour < 0 || hour > 11){
        document.getElementById('utilizBtn').setAttribute("disabled", "disabled")
    }
    else  
    {document.getElementById('utilizBtn').setAttribute("active", "active")}
}
$(document).ready(function(){
    blockBuyButton();
    blockSellButton();
    blockUtilizButton();
});