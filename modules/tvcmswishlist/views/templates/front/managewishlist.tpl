{**

* 2007-2020 PrestaShop

*

* NOTICE OF LICENSE

*

* This source file is subject to the Academic Free License (AFL 3.0)

* that is bundled with this package in the file LICENSE.txt.

* It is also available through the world-wide-web at this URL:

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

* @author PrestaShop SA <contact@prestashop.com>

    * @copyright 2007-2020 PrestaShop SA

    * @license http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)

    * International Registered Trademark & Property of PrestaShop SA

    *}

    {strip}

    {if $products}

    <div class="wishlistLinkTop">

        <div class="wlp_bought">

            {assign var='nbItemsPerLine' value=4}

            {assign var='nbItemsPerLineTablet' value=3}

            {assign var='nbLi' value=$products|@count}

            {math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}

            {math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}

            <ul class="row wlp_bought_list">

                {foreach from=$products item=product name=i}

                {math equation="(total%perLine)" total=$smarty.foreach.i.total perLine=$nbItemsPerLine assign=totModulo}

                {math equation="(total%perLineT)" total=$smarty.foreach.i.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}

                {if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}

                {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}

                <li id="wlp_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}" class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3 {if $smarty.foreach.i.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.i.iteration%$nbItemsPerLine == 1} first-in-line{/if} {if $smarty.foreach.i.iteration > ($smarty.foreach.i.total - $totModulo)}last-line{/if} {if $smarty.foreach.i.iteration%$nbItemsPerLineTablet == 0}last-item-of-tablet-line{elseif $smarty.foreach.i.iteration%$nbItemsPerLineTablet == 1}first-item-of-tablet-line{/if} {if $smarty.foreach.i.iteration > ($smarty.foreach.i.total - $totModuloTablet)}last-tablet-line{/if}">

                    <div class="wlp_bought_item_container">

                        <div class="tvwishlist-inner-product-img-block">

                            <div class="product_image">

                                <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{l s='Product detail' mod='tvcmswishlist'}">

                                    <img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.cover, 'home_default')|escape:'html':'UTF-8'}" alt="{$product.name|escape:'html':'UTF-8'}" />

                                </a>

                            </div>

                            <a class="lnkdel tvwishlist-all-product-delete-icon" href="javascript:;" onclick="WishlistProductManage('wlp_bought', 'delete', '{$id_wishlist|escape:'htmlall':'UTF-8'}', '{$product.id_product|escape:'htmlall':'UTF-8'}', '{$product.id_product_attribute|escape:'htmlall':'UTF-8'}', $('#quantity_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}').val(), $('#priority_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}').val());" title="{l s='Delete' mod='tvcmswishlist'}">

                                <i class='material-icons'>&#xe5cd;</i>

                            </a>

                        </div>

                        <div class="tvwishlist-view-product-all">

                            <div class="product_infos">

                                <p id="s_title" class="product-name">

                                    {$product.name|truncate:30:'...'|escape:'html':'UTF-8'}

                                    {if isset($product.attributes_small)}

                                    <small>

                                        <a href="{$link->getProductlink($product.id_product, $product.link_rewrite, $product.category_rewrite)|escape:'html':'UTF-8'}" title="{l s='Product detail' mod='tvcmswishlist'}">

                                            {$product.attributes_small|escape:'html':'UTF-8'}

                                        </a>

                                    </small>

                                    {/if}

                                </p>

                                <div class="wishlist_product_detail">

                                    <p class="form-group">

                                        <label for="quantity_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}">

                                            {l s='Quantity' mod='tvcmswishlist'}:

                                        </label>

                                        <input type="text" class="form-control grey" id="quantity_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}" value="{$product.quantity|intval|escape:'htmlall':'UTF-8'}" size="3" />

                                    </p>

                                    <p class="form-group">

                                        <label for="priority_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}">

                                            {l s='Priority' mod='tvcmswishlist'}:

                                        </label>

                                        <select id="priority_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}" class="form-control grey">

                                            <option value="0" {if $product.priority eq 0} selected="selected" {/if}> {l s='High' mod='tvcmswishlist' } </option> <option value="1" {if $product.priority eq 1} selected="selected" {/if}> {l s='Medium' mod='tvcmswishlist' } </option> <option value="2" {if $product.priority eq 2} selected="selected" {/if}> {l s='Low' mod='tvcmswishlist' } </option> </select> </p> </div> <div class="btn_action">

                                                <a class="tvall-inner-btn" href="javascript:;" onclick="WishlistProductManage('wlp_bought_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}', 'update', '{$id_wishlist|escape:'htmlall':'UTF-8'}', '{$product.id_product|escape:'htmlall':'UTF-8'}', '{$product.id_product_attribute|escape:'htmlall':'UTF-8'}', $('#quantity_{$product.id_product|escape:" htmlall":"UTF-8"}_{$product.id_product_attribute|escape:"htmlall":"UTF-8"}').val(), $('#priority_{$product.id_product|escape:'htmlall':'UTF-8'}_{$product.id_product_attribute|escape:'htmlall':'UTF-8'}').val());" title="{l s='Save' mod='tvcmswishlist'}">

                                                    <span>{l s='Save' mod='tvcmswishlist'}</span>

                                                </a>

                                                {if $wishlists|count > 1}

                                                {foreach name=wl from=$wishlists item=wishlist}

                                                {if $smarty.foreach.wl.first}

                                                <a class="tvall-inner-btn wishlist_change_button" tabindex="0" data-toggle="popover" data-trigger="focus" title="{l s='Move to a wishlist' mod='tvcmswishlist'}" data-placement="bottom">

                                                    <span>{l s='Move' mod='tvcmswishlist'}</span>

                                                </a>

                                                <div hidden class="popover-content">

                                                    <table class="table" border="1">

                                                        <tbody>

                                                            {/if}

                                                            {if $id_wishlist != {$wishlist.id_wishlist}}

                                                            <tr title="{$wishlist.name|escape:'html':'UTF-8'}" value="{$wishlist.id_wishlist|escape:'htmlall':'UTF-8'}" onclick="wishlistProductChange({$product.id_product|escape:'htmlall':'UTF-8'}, {$product.id_product_attribute|escape:'htmlall':'UTF-8'}, '{$id_wishlist|escape:'htmlall':'UTF-8'}', '{$wishlist.id_wishlist|escape:'htmlall':'UTF-8'}');">

                                                                <td>

                                                                    {l s='Move to %s'|sprintf:$wishlist.name mod='tvcmswishlist'}

                                                                </td>

                                                            </tr>

                                                            {/if}

                                                            {if $smarty.foreach.wl.last}

                                                        </tbody>

                                                    </table>

                                                </div>

                                                {/if}

                                                {/foreach}

                                                {/if}

                                </div>

                            </div>

                        </div>

                    </div>

                </li>

                {/foreach}

            </ul>

        </div>


        {else}

        <p class="alert alert-warning">

            {l s='No products' mod='tvcmswishlist'}

        </p>

        {/if}

        {/strip}