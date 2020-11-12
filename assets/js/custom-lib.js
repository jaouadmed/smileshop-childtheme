$(document).ready(function() {
    var xsmall = 991;
    
    function showMobileLogo() {
        if (document.body.clientWidth <= xsmall) { //for mobile view
            $("img.logo.img-responsive:first-child").toggle();
            $("img.logo.img-responsive:last-child").toggle();
        } else { //for desktop view
            $("img.logo.img-responsive:first-child").toggle();
            $("img.logo.img-responsive:last-child").toggle();
        }
    }

    $(window).resize(function() {
        showMobileLogo();
    });
}