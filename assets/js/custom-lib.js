
function showView() {
    if (document.body.clientWidth <= mobileViewSize) { //for mobile view
        $("#tvcmsdesktop-logo img.logo").attr("style", "object-fit: none; object-position: 0 0; width: 52px; height: 53px;");
        moveDataInMobileView('#tvcmsdesktop-logo', '#tvcmsmobile-header-logo');
        
        moveDataInMobileView('#_desktop_cart', '#tvmobile-cart');
        moveDataInMobileView('#tvcmsdesktop-account-button', '#tvcmsmobile-account-button');
        moveDataInMobileView('#tvdesktop-megamenu', '#tvmobile-megamenu');
        // moveDataInMobileView('#tvcmsdesktop-vertical-menu', '#tvcmsmobile-vertical-menu');
        moveDataInMobileView('#_desktop_search', '#tvcmsmobile-search');
        // moveDataInMobileView('.tvsearch-header-display-wrappper', '#tvcmsmobile-vertical-menu');
        //console.log('moveDataInMobileView');
    } else { //for desktop view
        
        moveDataInDesktopView('#tvcmsdesktop-logo', '#tvcmsmobile-header-logo');
        $("#tvcmsdesktop-logo img.logo").removeAttr("style");

        moveDataInDesktopView('#_desktop_cart', '#tvmobile-cart');
        moveDataInDesktopView('#tvcmsdesktop-account-button', '#tvcmsmobile-account-button');
        moveDataInDesktopView('#tvdesktop-megamenu', '#tvmobile-megamenu');
        // moveDataInDesktopView('#tvcmsdesktop-vertical-menu', '#tvcmsmobile-vertical-menu');
        moveDataInDesktopView('#_desktop_search', '#tvcmsmobile-search');
        // console.log('moveDataInDesktopView');
    }
} //showView