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
    {strip}
    {extends file=$layout}
    {block name='head_seo' prepend}
    <link rel="canonical" href="{$product.canonical_url}">
    {/block}
    {block name='head' append}
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
    <meta property="og:type" content="product">
    <meta property="og:url" content="{$urls.current_url}">
    <meta property="og:title" content="{$page.meta.title}">
    <meta property="og:site_name" content="{$shop.name}">
    <meta property="og:description" content="{$page.meta.description}">
    <meta property="og:image" content="{$product.cover.large.url}">
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
    {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
    {/block}
    {block name='content'}
    <div id="main" itemscope itemtype="https://schema.org/Product">
        <meta itemprop="url" content="{$product.url}">
        <div class="tvproduct-page-wrapper">
            <div class="tvprduct-image-info-wrapper clearfix">
                <div class="col-md-6 tv-product-page-image">
                    {block name='page_content_container'}
                    <div class="page-contents" id="content">
                        {block name='page_content'}
                        <div class="row">
                            {block name='product_cover_thumbnails'}
                            {block name='product_cover'}
                            <div class="product-cover col-sm-9">
                                <div class="tvproduct-image-slider">
                                    {block name='product_flags'}
                                    <ul class="tvproduct-flags tvproduct-online-new-wrapper">
                                        {foreach from=$product.flags item=flag}
                                        {if $flag.type == 'online-only' || $flag.type == 'new'}
                                        <li class="product-flag {$flag.type}">{$flag.label}</li>
                                        {/if}
                                        {/foreach}
                                    </ul>
                                    <ul class="tvproduct-flags tvproduct-sale-pack-wrapper">
                                        {foreach from=$product.flags item=flag}
                                        {if $flag.type == 'on-sale' || $flag.type == 'pack'}
                                        <li class="product-flag {$flag.type}">{$flag.label}</li>
                                        {/if}
                                        {/foreach}
                                    </ul>
                                    {/block}
                                    {if $product.cover}
                                    <img class="js-qv-product-cover" src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
                                    <div class="layer" data-toggle="modal" data-target="#product-modal">
                                        <i class='material-icons'>&#xe3c2;</i>
                                    </div>
                                    {else}
                                    <img src="{$urls.no_picture_image.bySize.large_default.url}">
                                    {/if}
                                </div>
                            </div>
                            {/block}
                            {/block}
                            {block name='product_images'}
                            <div class="tvvertical-slider col-sm-3">
                                <ul class="product-images">
                                    {foreach from=$product.images item=image}
                                    <li class="tvcmsVerticalSlider item">
                                       {* <img class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}" data-image-medium-src="{$image.bySize.medium_default.url}" data-image-large-src="{$image.bySize.large_default.url}" src="{$image.bySize.home_default.url}" alt="{$image.legend}" title="{$image.legend}" itemprop="image"> *}
                                        <picture>
                                          <source srcset="{$image.bySize.medium_default.url}" media="(max-width: 768px)">
                                          <img src="{$image.bySize.home_default.url}" class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}" data-image-medium-src="{$image.bySize.medium_default.url}" data-image-large-src="{$image.bySize.large_default.url}" alt="{$image.legend}" title="{$image.legend}" itemprop="image" >
                                        </picture>
                                    </li>
                                    {/foreach}
                                </ul>
                                <div class="arrows js-arrows">
                                    <i class="tvvertical-slider-next material-icons arrow-up js-arrow-up">&#xE316;</i>
                                    <i class="tvvertical-slider-pre material-icons arrow-down js-arrow-down">&#xE313;</i>
                                </div>
                            </div>
                            {/block}
                        </div>
                        {/block}
                    </div>
                    {/block}
                </div>
                <div class="col-md-6 tv-product-page-content">
                    <div class="tvproduct-title-brandimage" itemprop="itemReviewed" itemscope itemtype="http://schema.org/Thing">
                        {block name='page_header_container'}
                        {block name='page_header'}
                        <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                        {/block}
                        {/block}
                        {if isset($manufacturer_image_url)}
                        <a href="{$product_brand_url}" class="tvproduct-brand">
                            <img src="{$manufacturer_image_url}" alt="{$product_manufacturer->name}" title="{$product_manufacturer->name}" width="170">
                        </a>
                        {/if}
                    </div>
                    {* Start Product Comment *}
                    {hook h='displayReviewProductList' product=$product}
                    {* End Product Comment *}
                    {block name='product_prices'}
                        {include file='catalog/_partials/product-prices.tpl'}
                    {/block}
                    {block name='product_availability'}
                        {if $product.show_availability && $product.availability_message}
                        <span id="product-availability">
                            {if $product.availability == 'available'}
                            <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
                            {elseif $product.availability == 'last_remaining_items'}
                            <i class="material-icons product-last-items">&#xE002;</i>
                            {else}
                            <i class="material-icons product-unavailable">&#xE14B;</i>
                            {/if}
                            {$product.availability_message}
                        </span>
                        {/if}
                    {/block}
                    {block name='product_description_short'}
                        {if $product.description_short }
                        <div id="product-description-short-{$product.id}" itemscope itemprop="description" class="tvproduct-page-decs">{$product.description_short nofilter}</div>
                        {/if}
                    {/block}
                    {if !empty($product.specific_prices.from) && !empty($product.specific_prices.to) && $product.specific_prices.from != '0000-00-00 00:00:00' && $product.specific_prices.to != '0000-00-00 00:00:00'}
                        {include file='catalog/_partials/miniatures/product-timer.tpl' timer=$product.specific_prices.to}
                    {/if}                    
                    <div class="product-information tvproduct-special-desc">
                        {if $product.is_customizable && count($product.customizations.fields)}
                        {block name='product_customization'}
                            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                        {/block}
                        {/if}
                        {hook h ='displayTableBooking'}
                        <div class="product-actions">
                            {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
                                {block name='product_variants'}
                                {include file='catalog/_partials/product-variants.tpl'}
                                {/block}
                                {block name='product_pack'}
                                {if $packItems}
                                <div class="product-pack">
                                    <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                                    {foreach from=$packItems item="product_pack"}
                                    {block name='product_miniature'}
                                    {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                                    {/block}
                                    {/foreach}
                                </div>
                                {/if}
                                {/block}
                                {block name='product_discounts'}
                                {include file='catalog/_partials/product-discounts.tpl'}
                                {/block}
                                {block name='product_add_to_cart'}
                                {include file='catalog/_partials/product-add-to-cart.tpl'}
                                {/block}

                                {hook h='displayCustomtab'}
                                {block name='product_additional_info'}
                                {include file='catalog/_partials/product-additional-info.tpl'}
                                {/block}
                                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                                {block name='product_refresh'}{/block}
                            </form>
                            {/block}
                        </div>
                    </div>
                    {block name='hook_display_reassurance'}
                    {hook h='displayReassurance'}
                    {/block}
                </div>
            </div>
            {block name='product_tabs'}
            <div class="tabs tvproduct-description-tab">
                <ul class="nav nav-tabs" role="tablist">
                    {if $product.description}
                    <li class="nav-item">
                        <a class="nav-link{if $product.description} active{/if}" data-toggle="tab" href="#description" role="tab" aria-controls="description" {if $product.description} aria-selected="true" {/if}> {l s='Description' d='Shop.Theme.Catalog' } </a> </li> {/if} <li class="nav-item">
                            <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#product-details" role="tab" aria-controls="product-details" {if !$product.description} aria-selected="true" {/if}> {l s='Product Details' d='Shop.Theme.Catalog' } </a> </li> {if $product.attachments} <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#attachments" role="tab" aria-controls="attachments">
                                    {l s='Attachments' d='Shop.Theme.Catalog'}
                                </a>
                    </li>
                    {/if}
                    {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}" role="tab" aria-controls="extra-{$extraKey}">
                            {$extra.title}
                        </a>
                    </li>
                    {/foreach}
                    {* start product comment tab hook *}
                    {hook h='displayProductListReviewsTab'}
                    {* End product comment tab hook *}
                </ul>
                <div class="tab-content" id="tab-content">
                    <div class="tab-pane fade in {if $product.description} active {/if}" id="description" role="tabpanel">
                        {block name='product_description'}
                        <div class="product-description">{$product.description nofilter}</div>
                        {/block}
                    </div>
                    {block name='product_details'}
                    {include file='catalog/_partials/product-details.tpl'}
                    {/block}
                    {block name='product_attachments'}
                    {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                        <div class="product-attachments">
                            <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                            {foreach from=$product.attachments item=attachment}
                            <div class="attachment">
                                <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                                <p>{$attachment.description}</p>
                                <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                    {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                </a>
                            </div>
                            {/foreach}
                        </div>
                    </div>
                    {/if}
                    {/block}
                    {foreach from=$product.extraContent item=extra key=extraKey}
                    <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key=> $val} {$key}="{$val}"{/foreach}>
                        {$extra.content nofilter}
                    </div>
                    {/foreach}
                    {* start product comment tab content hook *}
                    {hook h='displayProductListReviewsTabContent' product=$product}
                    {* End product comment tab content hook *}
                </div>
            </div>
            {/block}
        </div>
        {block name='product_accessories'}
        {if $accessories}
        <div class="tvcmslike-product container-fluid">
            <div class='tvlike-product-wrapper-box container'>
                <div class='tvcmsmain-title-wrapper'>
                    <div class="tvcms-main-title">
                        <div class='tvmain-title'>
                            <h2>{l s='You might also like' d='Shop.Theme.Catalog'}</h2>
                        </div>
                    </div>
                </div>
                <div class="tvlike-product">
                    <div class="products owl-theme owl-carousel tvlike-product-wrapper tvproduct-wrapper-content-box">
                        {foreach $accessories as $product}
                        {include file="catalog/_partials/miniatures/product.tpl" product=$product tv_product_type="like_product"}
                        {/foreach}
                    </div>
                </div>
                <div class='tvlike-pagination-wrapper tv-pagination-wrapper'>
                    <div class="tvcmslike-next-pre-btn tvcms-next-pre-btn">
                        <div class="tvcmslike-prev tvcmsprev-btn" data-parent="tvcmslike-product"><i class='material-icons'>keyboard_arrow_left</i></div>
                        <div class="tvcmslike-next tvcmsnext-btn" data-parent="tvcmslike-product"><i class='material-icons'>keyboard_arrow_right</i></div>
                    </div>
                </div>
            </div>
        </div>
        {/if}
        {/block}
        {block name='product_footer'}
        {hook h='displayFooterProduct' product=$product category=$category}
        {/block}
        {block name='product_images_modal'}
        {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}
        {block name='page_footer_container'}
        <div class="tvfooter-product-sticky-bottom">
            <div class="container">
                <div class="tvflex-items">
                    <div class="tvproduct-image-title-price">
                        {if $product.cover}
                        <div class="product-image">
                            <img src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
                        </div>
                        <div class="tvtitle-price">
                            {block name='page_header'}
                            <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                            {/block}
                            {block name='product_prices'}
                            {include file='catalog/_partials/product-prices.tpl'}
                            {/block}
                        </div>
                        {/if}
                    </div>
                    <div>
                        <div class="product-actions" id="bottom_sticky_data"></div>
                    </div>  
                    {* <div class="product-information">
                            <div class="product-actions">
                                {block name='product_buy'}
                                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                    <input type="hidden" name="token" value="{$static_token}">
                                    <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                                    <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
                                    {block name='product_variants'}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                    {/block}
                                    {block name='product_discounts'}
                                    {include file='catalog/_partials/product-discounts.tpl'}
                                    {/block}
                                    {block name='product_add_to_cart'}
                                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                                    {block}
                                   
                                    {block name='product_refresh'}{/block}
                                </form>
                                {/block}
                            </div>
                        </div> *}
                </div>
            </div>
        </div>
     
        <footer class="page-footer">
            {block name='page_footer'}
            <!-- Footer content -->
            {/block}
        </footer>
        {/block}
    </div>
    {/block}
    {/strip}