{**
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also avaitvle through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2020 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{strip}

    <div class="container_tv_megamenu">
        <div id="tv-menu-horizontal" class="tv-menu-horizontal clearfix">
            {$id_lang = Context::getContext()->language->id}
            <div class="title-menu-mobile">
                <a href="Javascript:void(0);" title=""><i class='material-icons'>&#xe5d2;</i></a>
            </div>
            <ul class="menu-content" style="padding: 5px 0">

                <li class="tvmega-menu-title" style="padding-bottom: 5px;margin-bottom: 0px;">
                    {*l s='SmileShop Menu' mod='tvcmsmegamenu'*}
                    {$shop_logo = Configuration::get('PS_LOGO')}
                    {*$shop|@var_dump*}
                    <img src="/img/{$shop_logo}" alt="smileshop.ma"  width="150">
                    <a href="Javascript:void(0);"><i style="margin:5px;top:5%;font-size: 28px;" class='material-icons'>&#xe14c;</i></a>
                </li>
                <li class="tvmega-menu-title" style="padding-bottom: 5px;margin-bottom: 0px;">
                    <div class="tvheader-language">{hook h='displayNavLanguageBlock'}</div>
                    <script>
                        $(document).ready(function() {
                            $('.tv-language-dropdown').removeClass('open').hide(); 
                        }     
                    </script>
                </li>
                {$isit = 0}
                {foreach from=$menus item=menu name=menus}
                    {if isset($menu.type) && $menu.type == 'CAT' && $menu.dropdown == 1}
                        {$menu.sub_menu|escape:'quotes':'UTF-8' nofilter}
                    {else}
                        {if isset($menu.type) && $menu.type == 'CAT' && $isit == 0}
                            <li style="padding: 5px 15px;border-bottom: 1px solid #E5EDEF;" class="catgr">
                                <span>{l s='Categories' d='Shop.Theme.Catalog'}</span>
                            </li>
                            {$isit = 1}
                        {/if}
                        <li style="border-bottom: 1px solid #E5EDEF;{if isset($menu.type) && $menu.type == 'CAT'}padding: 5px 30px;{else}padding: 5px 10px;{/if}" class="level-1 {$menu.class|escape:'html':'UTF-8'}{if count($menu.sub_menu) > 0} parent{/if}" >
                            {*{if $menu.type_icon == '0' && $menu.icon != ''}
                                <img class="img-icon" src="{$icon_path|escape:'html':'UTF-8'}{$menu.icon|escape:'html':'UTF-8'}" alt=""/>
                            {elseif  $menu.type_icon == '1' && $menu.icon != ''}
                                <i class="{$menu.icon|escape:'html':'UTF-8'}"></i>
                            {/if}*}
                            <a href="{$menu.link|escape:'html':'UTF-8'}">
                                 {if $menu.type_icon == '0' && $menu.icon != ''}
                                    <img width="15%" src="{$icon_path|escape:'html':'UTF-8'}{$menu.icon|escape:'html':'UTF-8'}" alt=""/>
                                {elseif  $menu.type_icon == '1' && $menu.icon != ''}
                                    <i class="{$menu.icon|escape:'html':'UTF-8'}"></i>
                                {/if}
                                <span>{$menu.title|escape:'html':'UTF-8'}</span>
                                {if $menu.subtitle != ''}
                                    <span class="menu-subtitle" {if $menu.sub_title_stylesheet != ''}style="{$menu.sub_title_stylesheet}"{/if}>
                                        {$menu.subtitle|escape:'html':'UTF-8'}
                                    </span>
                                {/if}
                            </a>
                            <span class="icon-drop-mobile"></span>
                            {if isset($menu.sub_menu) && count($menu.sub_menu) > 0}
                                <div class="tv-sub-menu menu-dropdown col-xs-12 {$menu.width_sub|escape:'html':'UTF-8'} {$menu.align_sub|escape:'html':'UTF-8'}" {if $menu.background_img}style="background-image:url({$background_path}{$menu.background_img});"{/if}>
                                    
                                    {foreach from=$menu.sub_menu item= menu_row name=menu_row}
                                        <div class="tv-menu-row row {$menu_row.class|escape:'html':'UTF-8'}">
                                            {if isset($menu_row.list_col) && count($menu_row.list_col) > 0}
                                                {foreach from=$menu_row.list_col item= menu_col name=menu_col}
                                                    <div class="tv-menu-col col-xs-12 {$menu_col.width|escape:'html':'UTF-8'} {$menu_col.class|escape:'html':'UTF-8'} {if !empty($menu.type)}{$menu.type|escape:'quotes':'UTF-8'}{/if}">
                                                        {if count($menu_col.list_menu_item) > 0}
                                                            <ul class="ul-column tv-megamenu-slider-wrapper {if $menu_col.class == 'tv-mega-menu-slider'} owl-carousel{/if}">
                                                                {foreach from=$menu_col.list_menu_item item= sub_menu_item name=sub_menu_item}
                                                                    <li class="{if $sub_menu_item.type_link != 4}tvmega-menu-link{/if} {if $menu_col.class == 'tv-mega-menu-slider'}item{/if} menu-item{if $sub_menu_item.type_item == 1} item-header{else} item-line{/if} {if $sub_menu_item.type_link == 4}product-block{/if}">
                                                                        {if $sub_menu_item.type_link == 4}
                                                                            {$id_lang = Context::getContext()->language->id}
                                                                            {$id_lang = Context::getContext()->language->id}
                                                                            {foreach from = $sub_menu_item.product item=product name=product}
                                                                        <div class="product-container clearfix">
                                                                            <div class="product-image-container">
                                                                                <a class="product_img_link" href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'htmlall':'UTF-8'}">
                                                                                    <img class="replace-2x img-responsive lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'htmlall':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'htmlall':'UTF-8'}{else}{$product.name|escape:'htmlall':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'htmlall':'UTF-8'}{else}{$product.name|escape:'htmlall':'UTF-8'}{/if}"/>
                                                                                </a>{* {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
                                                                                    <a class="sale-box" href="{$product.link|escape:'htmlall':'UTF-8'}">
                                                                                        <span class="sale-label">{l s='Sale' mod='tvcmsmegamenu'}</span>
                                                                                    </a>
                                                                                {/if} *}</div>
                                                                                    <div class="product-description">
                                                                                        {if $product.name|truncate:25:''|escape:'htmlall':'UTF-8'}
                                                                                        <div class="tvproduct-name">
                                                                                            <div class="product-title">
                                                                                                <a  href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'htmlall':'UTF-8'}" ><h6>{$product.name|truncate:25:''|escape:'htmlall':'UTF-8'}</h6></a>
                                                                                            </div>
                                                                                        </div>
                                                                                        {/if}
                                                                                        {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                                                                                            <div class="product-price-and-shipping">
                                                                                                {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                                                                                    <span class="price product-price">
                                                                                                        {Tools::displayPrice($product.price)|escape:'htmlall':'UTF-8'}
                                                                                                    </span>
                                                                                                    {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction)  && $product.specific_prices.reduction > 0}
                                                                                                        <span class="regular-price product-price">
                                                                                                            {Tools::displayPrice($product.price_without_reduction)|escape:'htmlall':'UTF-8'}
                                                                                                        </span>
                                                                                                    {/if}
                                                                                                    {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction)  && $product.specific_prices.reduction > 0}

                                                                                                        {if $product.specific_prices.reduction_type == 'percentage'}
                                                                                                            <span class="price-percent-reduction discount-percentage discount-product tvproduct-discount-price">-{$product.specific_prices.reduction|escape:'htmlall':'UTF-8' * 100}%</span>
                                                                                                        {/if}
                                                                                                        {hook h="displayProductPriceBlock" product=$product type="old_price"}
                                                                                                        
                                                                                                        {hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
                                                                                                    {/if}
                                                                                                    {hook h="displayProductPriceBlock" product=$product type="price"}
                                                                                                    {hook h="displayProductPriceBlock" product=$product type="unit_price"}
                                                                                                {/if}
                                                                                            </div>
                                                                                        {/if}
                                                                                    </div>
                                                                                </div>
                                                                            {/foreach}
                                                                        {else if $sub_menu_item.type_link == 3}
                                                                            {if $sub_menu_item.title|escape:'html':'UTF-8'}
                                                                            <a href="{$sub_menu_item.link|escape:'html':'UTF-8'}">{$sub_menu_item.title|escape:'html':'UTF-8'}</a>
                                                                            {/if}
                                                                            <div class="html-block">
                                                                                {$sub_menu_item.text|escape:'quotes':'UTF-8' nofilter}
                                                                            </div>
                                                                        {else}
                                                                            {if $sub_menu_item.title|escape:'html':'UTF-8'}
                                                                            <a href="{$sub_menu_item.link|escape:'html':'UTF-8'}">
                                                                                {$sub_menu_item.title|escape:'html':'UTF-8' nofilter}
                                                                            </a>
                                                                            {/if}
                                                                        {/if}
                                                                    </li>
                                                                {/foreach}
                                                            </ul>{* {if $menu_col.class == 'tv-mega-menu-slider'} 
                                                                <div class='tvcms-mega-menu-pagination-wrapper'>
                                                                    <div class="tvcms-mega-menu-pagination">
                                                                        <div class="tvcms-mega-menu-next-pre-btn">
                                                                            <div class="tvmega-menu-slider-prev tvcmsprev-btn"><i class='material-icons'>&#xe5c4;</i></div>
                                                                            <div class="tvmega-menu-slider-next tvcmsnext-btn"><i class='material-icons'>&#xe5c8;</i></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            {/if} 
                                                            *} {/if}
                                                    </div>
                                                {/foreach}
                                            {/if}
                                        </div>
                                    {/foreach}
                                </div>
                            {/if}
                        </li>
                    {/if}
                {/foreach}                
            </ul>
            <div id="modal-backdrop-menu" style="background-color: rgba(0,0,0,0.3);
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 99;
                -webkit-transition: all 0.1s ease-in-out;
                transition: all 0.1s ease-in-out;
                display:none;">
            </div>
            <script>
                $('.title-menu-mobile').on('click', function() {
                    $('#modal-backdrop-menu').toggle();
                });
                
                $('#modal-backdrop-menu').on('click', function() {
                    if ($('.menu-content').hasClass('open')) {
                        $('.menu-content').removeClass('open');
                        $('.title-menu-mobile').removeClass('open');
                    }
                    $('#modal-backdrop-menu').toggle();
                });
            </script>
        </div>
    </div>
{/strip}