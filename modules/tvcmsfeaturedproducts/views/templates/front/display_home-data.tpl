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
    {if $main_heading['main_image_status']}
    {$col = 'tvimage-true'}
    {$image = true}
    {if $main_heading['main_image_side'] == 'left'}
    {$image_side = 'left'}
    {else}
    {$image_side = 'right'}
    {/if}
    {else}
    {$col = ''}
    {$image = ''}
    {$image_side = ''}
    {/if}
    {if $dis_arr_result.status && $dis_arr_result.home_status && count($dis_arr_result.data.product_list) > 0}
    <div class='tvfeatured-product-wrapper-box container'>      
        <div class="tvfeatured-product-all-box">
            <div class="tvfeatured-main-title-wrapper">
                {include file='_partials/tvcms-main-title.tpl' main_heading=$main_heading path=$dis_arr_result['path']}
            </div>
            
            <div class='tvfeature-product-offer-banner tvall-product-offer-banner'>
                {if Context::getContext()->isMobile() != 1}
                    {if $image == true && $image_side == 'left'}
                    <div class="tvall-product-branner">
                        <div class="tvall-block-box-shadows">
                            <div class="tvbanner-hover-wrapper">
                                <div class="tvbranner-hover-info-box"></div>
                                <div class='tvbanner-hover'></div>
                                <img class="lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="{$dis_arr_result.path}{$main_heading.data.image}" alt="{l s='featured Offer Banner' mod='tvcmsfeaturedproducts'}">
                                <div class='tvbanner-hover1'></div>
                            </div>
                        </div>
                    </div>
                    {/if}
                    <div class="tvfeatured-product-content {$col} container">
                        <div class="tvall-block-box-shadows">
                            <div class="tvfeatured-product">
                                <div class="products owl-theme owl-carousel tvfeatured-product-wrapper tvproduct-wrapper-content-box" data-has-image='{if $image == true}true{else}false{/if}'>
                                    {foreach $dis_arr_result.data.product_list as $product}
                                    {include file="catalog/_partials/miniatures/product.tpl" product=$product tv_product_type="featured_product"}
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                    {if $image == true && $image_side == 'right'}
                    <div class="tvall-product-branner">
                        <div class="tvall-block-box-shadows">
                            <div class="tvbanner-hover-wrapper">
                                <div class="tvbranner-hover-info-box"></div>
                                <div class='tvbanner-hover'></div>
                                <img class="lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="{$dis_arr_result.path}{$main_heading.data.image}" alt="{l s='featured Offer Banner' mod='tvcmsfeaturedproducts'}">
                                <div class='tvbanner-hover1'></div>
                            </div>
                        </div>
                    </div>
                    {/if}
                    <div class='tvfeature-pagination-wrapper tv-pagination-wrapper'>
                        <div class="tvfeature-pagination">
                            <div class="tvcmsfeatured-pagination">
                                <div class="tvcmsfeatured-next-pre-btn tvcms-next-pre-btn">
                                    <div class="tvcmsfeatured-prev tvcmsprev-btn" data-parent="tvcmsfeatured-product">
                                        <i class='material-icons'>&#xe314;</i>
                                    </div>
                                    <div class="tvcmsfeatured-next tvcmsnext-btn" data-parent="tvcmsfeatured-product">
                                        <i class='material-icons'>&#xe315;</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tvallproduct-link">
                        <a class="all-product-link" href="{$dis_arr_result.link}">
                            {l s='All Featured Products' mod='tvcmsfeaturedproducts'} <i class='material-icons'>&#xe315;</i>
                        </a>
                    </div>
                {else}
                    <div class="tvfeatured-product-content {$col} container">
                        <div class="tvall-block-box-shadows">
                            <div class="tvfeatured-product">
                                {foreach $dis_arr_result.data.product_list as $product}
                                    <div class="col-sm-6 col-xs-6 col-md-4" style="padding:0">
                                    {include file='catalog/_partials/miniatures/product-grid-view.tpl' class_name='grid'  product=$product image_size='home_default'}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
            
        </div>
    </div>
    {/if}
    {/strip}