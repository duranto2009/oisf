var finalEnlishToBanglaNumber={'0':'০','1':'১','2':'২','3':'৩','4':'৪','5':'৫','6':'৬','7':'৭','8':'৮','9':'৯'};
var finalBanglaToEnglishNumber={'০':'0','১':'1','২':'2','৩':'3','৪':'4','৫':'5','৬':'6','৭':'7','৮':'8','৯':'9'};
window.alert = function ( text ) {
    console.log( 'tried to alert: ' + text ); return true;
};
String.prototype.getDigitBanglaFromEnglish = function() {
    var retStr = this;
    for (var x in finalEnlishToBanglaNumber) {
        retStr = retStr.replace(new RegExp(x, 'g'), finalEnlishToBanglaNumber[x]);
    }
    return retStr;
};
String.prototype.toEng = function() {
    var retStr = this;
    for (var x in finalBanglaToEnglishNumber) {
        retStr = retStr.replace(new RegExp(x, 'g'), finalBanglaToEnglishNumber[x]);
    }
    return retStr;
};
String.prototype.toBan = function() {
    var retStr = this;
    for (var x in finalEnlishToBanglaNumber) {
        retStr = retStr.replace(new RegExp(x, 'g'), finalEnlishToBanglaNumber[x]);
    }
    return retStr;
};

String.prototype.toNum = function(){
    return parseInt(this, 10);
}

function getDateTime(dateVal) {
    var now  = new Date(dateVal);
    if(typeof dateVal=='undefined'){
        now  =  new Date();
    }

    var year    = now.getFullYear();
    var month   = now.getMonth()+1;
    var day     = now.getDate();
    var hour    = now.getHours();
    var minute  = now.getMinutes();
    var second  = now.getSeconds();
    if(month.toString().length == 1) {
        var month = '0'+month;
    }
    if(day.toString().length == 1) {
        var day = '0'+day;
    }
    if(hour.toString().length == 1) {
        var hour = '0'+hour;
    }
    if(minute.toString().length == 1) {
        var minute = '0'+minute;
    }
    if(second.toString().length == 1) {
        var second = '0'+second;
    }
    var dateTime = year+'/'+month+'/'+day+' '+hour+':'+minute+':'+second;
    return dateTime.getDigitBanglaFromEnglish();
}

var entityMap = {
    "&": "&amp;",
    "<": "&lt;",
    ">": "&gt;",
    '"': '&quot;',
    "'": '&#39;',
    "/": '&#x2F;'
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'\/]/g, function (s) {
        return entityMap[s];
    });
}

jQuery.extend({
    getResponse: function(url) {
        var result = null;
        $.ajax({
            url: url,
            type: 'get',
            dataType: 'JSON',
            async: false,
            success: function(data) {
                result = data;
            }
        });
        return result;
    }
});