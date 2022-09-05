function isDate(txtDate) {

    var currVal = txtDate;

    if (currVal.length > 10) {
        currVal = currVal.substring(0, 10);
    }
    
    if (currVal == '')
        return false;

    var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; //Declare Regex
    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null)
        return false;

    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[3];
    dtDay = dtArray[1];
    dtYear = dtArray[5];

    if (dtMonth < 1 || dtMonth > 12)
        return false;
    else if (dtDay < 1 || dtDay > 31)
        return false;
    else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
        return false;
    else if (dtMonth == 2) {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay > 29 || (dtDay == 29 && !isleap))
            return false;
    }

    return true;
}

function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    return regex.test(email);
}

function validateMultipleEmailsCommaSeparated(emails) {
    var emailRegex = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
    var split = emails.split(/[\s;,]+/);

    for (i in split)
    {
        var email = split[i];
        if (!emailRegex.test(email)) {
            return false;
        }
    }

    return true;
}

function GetActualYear() {
    var d = new Date();
    return d.getFullYear();
}

function validarFechaMenorActual(date) {
    var x = new Date();
    var fecha = date.split("/");
    x.setFullYear(fecha[2], fecha[1] - 1, fecha[0]);
    var today = new Date();

    if (x >= today)
        return false;
    else
        return true;
}

function SoloNum(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8) return true;
    if (tecla == 13) {
        //document.forms[0].submit();
        //return false;
    }
    patron = /\d/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}
