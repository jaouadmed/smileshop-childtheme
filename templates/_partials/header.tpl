{**
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author PrestaShop SA <contact@prestashop.com>
    * @copyright 2007-2019 PrestaShop SA
    * @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
    * International Registered Trademark & Property of PrestaShop SA
    *}
    
    {extends file='_partials/header.tpl'}

    {strip}
    {block name='header_banner'}
    <div class="tvcmsheader-banner">
        {hook h='displayBanner'}
    </div>
    {/block}
    {block name='header_nav'}
    {/block}
    {block name='header_top'}
    <div class="tvcmsdesktop-top-header-wrapper ">
        <div class='container-fluid tvcmsdesktop-top-header'>
            <div class="container tvcmsdesktop-top-wrapper">
                <div class='tvheader-offer-wrapper col-xl-6 col-lg-6 col-md-6 col-sm-12'>
                    {hook h='displayTopOfferText'}
                </div>
                <div class='tvheader-language-currency-wrapper col-xl-6 col-lg-6 col-md-6 col-sm-12'>
                    <div class="tvheader-language">{hook h='displayNavLanguageBlock'}</div>
                    <div class="tvheader-currency">{hook h='displayNavCurrencyBlock'}</div>
                </div>
            </div>
        </div>
        <div class='container-fluid tvcmsdesktop-top-second hidden-md-down'>
            <div class="container">
                <div class="row tvcmsdesktop-top-header-box">
                    <div class='col-md-4 col-xl-4 col-sm-12 tvcms-header-logo-wrapper'>
                        <div class="hidden-sm-down tvcms-header-logo" id="tvcmsdesktop-logo">
                            <div class="tv-header-logo">
                                <a href="{$urls.base_url}">
                                    <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}" height="34" width="200">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-lg-6 col-md-6 col-xl-4 tvcmsheader-search">
                        <div class='tvcmssearch-wrapper' id="_desktop_search">
                            {hook h='displayNavSearchBlock'}
                        </div>
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
    {include file='_partials/mobile-header.tpl'}
    {/strip}