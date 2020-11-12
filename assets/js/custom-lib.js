$(document).load(function() {
    var xsmall = 414;
    if (document.body.clientWidth <= xsmall) { //for mobile view
        if(desk.is(':visible')) desk.toggle();
        if(!mob.is(':visible')) mob.toggle();
    }
    $(window).resize(function() {
            var desk = $("img.logo.img-responsive:first-child"), mob = $("img.logo.img-responsive:last-child");
            if (document.body.clientWidth <= xsmall) { //for mobile view
                if(desk.is(':visible')) desk.toggle();
                if(!mob.is(':visible')) mob.toggle();
            } else { //for desktop view
                if(!desk.is(':visible')) desk.toggle();
                if(mob.is(':visible')) mob.toggle();
            }
    });
});