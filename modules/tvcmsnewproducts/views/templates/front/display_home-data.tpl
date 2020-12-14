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
<div class='tvnew-product-wrapper-box container'>
    <div class='tvnew-main-title-wrapper'>
        {include file='_partials/tvcms-main-title.tpl' main_heading=$main_heading path=$dis_arr_result['path']}
    </div>
    <div class='tvall-product-offer-banner'>
        <div class="tvnew-product-content {$col} container">
            <div class="tvall-block-box-shadows">
                <div class="tvnew-product">
                    {foreach $dis_arr_result.data.product_list as $product}
                        <div class="col-sm-6 col-xs-6 col-md-3 col-lg-3 js-product-miniature" style="padding:2px" data-id-product="{$product.id_product}">
                        {include file='catalog/_partials/miniatures/product-grid-view.tpl' class_name='grid'  product=$product image_size='home_default'}
                        </div>
                    {/foreach} 
                </div>
            </div>
        </div>
    </div>
</div>
{/if}
{/strip}