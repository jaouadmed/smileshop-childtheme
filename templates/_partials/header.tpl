
{extends file='parent:_partials/header.tpl'}


{block name='header_top'}
<div class="tvcmsdesktop-top-header-wrapper ">
    <div class='container-fluid tvcmsdesktop-top-second hidden-md-down'>
        <div class="container">
            <div class="row tvcmsdesktop-top-header-box">
                <div class=' col-xl-3 col-md-3 col-sm-12 col-xs-2 tvcms-header-logo-wrapper'>
                    <div class="hidden-sm-down tvcms-header-logo" id="tvcmsdesktop-logo">
                        <div class="tv-header-logo">
                            <a href="{$urls.base_url}">
                                <img class="logo img-responsive" style="display: none;" src="{$shop.logo}" alt="{$shop.name}"  width="200">
                                <img class="logo img-responsive" style="display: none; max-height: 3.2em" src="{$shop.logo_mobile}" alt="{$shop.name}">
                            </a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-5 col-md-5 col-xl-4 col-sm-12 col-xs-10 tvcmsheader-search">
                    <div class='tvcmssearch-wrapper' id="_desktop_search">
                        {hook h='displayNavSearchBlock'}
                    </div>
                </div>
                <div class=" col-lg-2 col-md-2 col-xl-4 col-sm-12 col-xs-10 tvmobile-lang">
                    {hook h='displayNavLanguageBlock'}
                </div>
                <div class="col-sm-12 col-lg-4 col-md-4 col-xl-4 tvcmsheader-nav-right">
                    <div class="tv-contact-account-cart-wrapper">
                        <div id='tvcmsdesktop-account-button'>
                            <div class="tvcms-header-myaccount">
                                <div class="tv-header-account">
                                    <div class="tv-account-wrapper">
                                        <button class="btn-unstyle tv-myaccount-btn">
                                            <i class='material-icons'>&#xe7ff;</i>
                                            {if $customer.is_logged }
                                                <span class="tvcms_customer_name">{$customer.gender.name[$customer.gender.id]} {$customer.firstname} {$customer.lastname}</span>
                                            {else}
                                                <span>{l s='My Account' d='Shop.Theme.Catalog'}</span>
                                            {/if}
                                        </button>
                                        <ul class="dropdown-menu tv-account-dropdown tv-dropdown">
                                            {if $customer.is_logged }
                                                <li><a href="{$urls.pages.my_account}" class="tvmyccount">{l s='My Account' d='Shop.Theme.Catalog'}</a></li>
                                            {/if}
                                            <li>{hook h='displayNavWishlistBlock'}</li>
                                            <li>{hook h='displayNavProductCompareBlock'}</li>
                                            <li>{hook h='displayNavCustomerSignInBlock'}</li>
                                            <li class="tvmobile-lang hidden-lg-up"></li>
                                            <li class="tvmobile-curr hidden-lg-up"></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {hook h='displayNavShoppingCartBlock'}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tvcms-header-menu-offer-wrapper tvcmsheader-sticky">
        <div class="position-static tvcms-header-menu">
            <div class='tvcmsmain-menu-wrapper container'>
                <div id='tvdesktop-megamenu'>
                    {hook h='displayMegamenu'}
                </div>
            </div>
        </div>
    </div>
    {* <div id="mobile_top_menu_wrapper" class="row hidden-md-up">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
            <div id="_mobile_currency_selector"></div>
            <div id="_mobile_language_selector"></div>
            <div id="_mobile_contact_link"></div>
        </div>
    </div> *}
</div>
{hook h='displayNavFullWidth'}
{/block}

{block name='include_mobile_header'}
    <div id='tvcms-mobile-view-header' class="hidden-lg-up">

        <div class="tvcmsmobile-top-wrapper">
            <div class='tvmobileheader-offer-wrapper col-sm-12'>
                {hook h='displayTopOfferText'}
            </div>
        </div>

        <div class='tvcmsmobile-header-search-logo-wrapper'>
            <div class="tvcmsmobile-header-logo-right-wrapper col-md-3 col-sm-12 col-xs-2" style="padding-right: 0px;padding-left: 5px;">
                <div id='tvcmsmobile-header-logo'></div>
            </div>
            <div class="tvcmsmobile-header-search col-md-9 col-sm-12 col-xs-10" style="padding-left: 0px;">
                <div id="tvcmsmobile-search">{* {hook h='displayMobileSearchBlockXX'} *}</div>
            </div>
        </div>
        <div class='tvcmsmobile-header-menu-offer-text'>
            <div class="tvcmsmobile-header-menu col-sm-2 col-xs-1">
                <div id='tvmobile-megamenu'></div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-5" style="padding:0;">
                {*include file="modules/ps_socialfollow/ps_socialfollow.tpl"*}
            </div>

            <div class="col-md-5 col-sm-6 col-xs-6 tvcmsmobile-cart-acount-text">
                <div id="tvcmsmobile-account-button"></div>
                <div id="tvmobile-cart"></div>
            </div>
        </div>

    </div>
{/block}