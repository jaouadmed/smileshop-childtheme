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
    {extends file='_partials/miniatures/category-product-slider.tpl'}

    {strip}
    {block name='product_miniature_item'}
    <article class="item product-miniature js-product-miniature tvall-product-wrapper-info-box" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        <div class="thumbnail-container">
            <div class="tvproduct-wrapper grid">
                {block name='product_thumbnail'}
                <div class="tvproduct-image">
                    {if $product.cover}
                    <a href="{$product.url}" class="thumbnail product-thumbnail">
                        <img data-src="{$product.cover.bySize['home_default']['url']}" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}" class="tvproduct-defult-img lazy" height="{$product.cover.bySize['home_default']['height']}" width="{$product.cover.bySize['home_default']['width']}">
                        {if isset($product.images.0.bySize['home_default']['url']) && empty($product.images.0.cover)}
                        <img class="tvproduct-hover-img lazy" data-src="{$product.images.0.bySize['home_default']['url']}" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="{$product.name}" height="{$product.images.0.bySize['home_default']['height']}" width="{$product.images.0.bySize['home_default']['width']}">
                        {elseif isset($product.images.1.bySize['home_default']['url']) && empty($product.images.1.cover)}
                        <img class="tvproduct-hover-img lazy" data-src="{$product.images.1.bySize['home_default']['url']}" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="{$product.name}" height="{$product.images.1.bySize['home_default']['height']}" width="{$product.images.1.bySize['home_default']['width']}">
                        {/if}
                    </a>
                    {else}
                    <a href="{$product.url}" class="thumbnail product-thumbnail">
                        <img class="lazy" data-src="{$urls.no_picture_image.bySize[$image_size]['url']}" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" height="{$urls.no_picture_image.bySize[$image_size]['height']}" width="{$urls.no_picture_image.bySize[$image_size]['width']}" />
                    </a>
                    {/if}
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
                        
                        {if $flag.type == 'on-sale'}
                            <li class="product-flag {$flag.type}">
                                -{$product.discount_percentage_absolute}%
                            </li>
                        {/if}
                        
                        {if $flag.type == 'pack'}
                            <li class="product-flag {$flag.type}">
                                <i class='C'>&#xe3c2;</i>
                            </li>
                        {/if}
                        
                        {/foreach}
                    </ul>
                    {/block}
                    {if !empty($product.specific_prices.from) && !empty($product.specific_prices.to) && $product.specific_prices.from != '0000-00-00 00:00:00' && $product.specific_prices.to != '0000-00-00 00:00:00'}
                    {include file='catalog/_partials/miniatures/product-timer.tpl' timer=$product.specific_prices.to}
                    {/if}
                    <div class='tvproduct-hover-btn'>
                        <div class="{* highlighted-informations{if !$product.main_variants} no-variants{/if} *} tvproduct-quick-btn">
                            {block name='quick_view'}
                            <a class="quick-view" href="#" data-link-action="quickview" data-toggle="tvtooltip" data-placement="top" data-html="true" title="{l s='Quick View' d='Shop.Theme.Actions'}" data-original-title="{l s='Quick View' d='Shop.Theme.Actions'}">
                                <div class="tvproduct-quick-icon">
                                    <i class="material-icons search">&#xE8B6;</i>
                                </div>
                                <div class="tvproduct-quick-lable">
                                    {l s='Quick View' d='Shop.Theme.Actions'}
                                </div>
                            </a>
                            {/block}
                        </div>
                        <div class="tvproduct-cart-btn">
                            <form action="{$cart_page_url}" method="post">
                                <input type="hidden" name="id_product" value="{$product.id_product}">
                                <input type="hidden" name="qty" value="1">
                                {if !empty($product.is_customizable) && count($product.customizations.fields)}
                                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
                                {/if}
                                <input type="hidden" name="token" value="{$static_token}">
                                <button data-button-action="add-to-cart" type="submit" class="btn add-to-cart tvproduct-add-to-cart {if !$product.add_to_cart_url}tvproduct-out-of-stock disable{/if}" title="{if !$product.add_to_cart_url}{l s='Out Of Stock' d='Shop.Theme.Actions'}{else}{l s='Add To Cart' d='Shop.Theme.Actions'}{/if}" {if !$product.add_to_cart_url}disabled{/if} data-toggle="tvtooltip" data-placement="top" data-html="true" data-original-title="{if !$product.add_to_cart_url}{l s='Out Of Stock' d='Shop.Theme.Actions'}{else}{l s='Add To Cart' d='Shop.Theme.Actions'}{/if}">
                                    <i class='material-icons'>&#xe8cc;</i>
                                    <span class="tvproduct-add-to-cart-label">{if !$product.add_to_cart_url}{l s='Out Of Stock' d='Shop.Theme.Actions'}{else}{l s='Add To Cart' d='Shop.Theme.Actions'}{/if} </span>
                                </button>
                            </form>
                        </div>
                        {hook h='displayProductCompareProductList' product=$product}
                        {hook h='displayWishlistBtnProductList' product=$product}
                    </div>
                </div>
                {/block}
                <div class="tvproduct-info-box-wrapper">
                    <div class="product-description">
                        {* Start Product Comment *}
                        {hook h='displayReviewProductList' product=$product}
                        {* End Product Comment *}
                        {block name='product_name'}
                        <div class="tvproduct-name">
                            <div class="product-title">
                                <a href="{$product.url}">
                                    <h6>{$product.name}</h6>
                                </a>
                            </div>
                            <div class="tvproduct-cat-name">{$product.category_name}</div>
                        </div>
                        {/block}
                        <div class="tv-product-price">
                            <div class="tvproduct-name-price-wrapper">
                                {block name='product_price_and_shipping'}
                                {if $product.show_price}
                                <div class="product-price-and-shipping">
                                    <span class="price">{$product.price}</span>
                                    {if $product.has_discount}
                                    <span class="regular-price">{$product.regular_price}</span>
                                    {/if}
                                    {if $product.has_discount}
                                    {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                    <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                                    {if $product.discount_type === 'percentage'}
                                    <span class="discount-percentage discount-product tvproduct-discount-price">{$product.discount_percentage}{l s=' off' d='Shop.Theme.Catalog'}</span>
                                    {elseif $product.discount_type === 'amount'}
                                    <span class="discount-amount discount-product tvproduct-discount-price">{$product.discount_amount_to_display} {l s=' off' d='Shop.Theme.Catalog'}</span>
                                    {/if}
                                    {/if}
                                    {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                    <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
                                    {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                                    {hook h='displayProductPriceBlock' product=$product type='weight'}
                                </div>
                                {/if}
                                {/block}
                            </div>
                        </div>
                    </div>
                    <div class="tv-product-price-info-box">{*
                        Start Product Stock Indicator
                        *}<div class='tvcmsstock-indicator-wraper'>
                            {hook h='displayProductListStockIndicator' product=$product}
                        </div>{*
                        End Product Stock Indicator
                        *}{if Configuration::get('TVCMSCUSTOMSETTING_PRODUCT_COLOR') == '1'}
                        {block name='product_variants'}
                        {if $product.main_variants}
                        <div class="tvproduct-color">
                            {foreach from=$product.main_variants item=color_info}
                            <div class='tvproduct-color-wrapper'>
                                <a href="{$color_info.url}">
                                    <div class="tvproduct-color-box-border">
                                        <div class='tvporoduct-color-box' style='{if $color_info.html_color_code != ""}background-color: {$color_info.html_color_code};{else}background-image: url({$color_info.texture});{/if}'></div>
                                    </div>
                                </a>
                            </div>
                            {/foreach}
                        </div>
                        {/if}
                        {/block}
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </article>
    {/block}
    {/strip}