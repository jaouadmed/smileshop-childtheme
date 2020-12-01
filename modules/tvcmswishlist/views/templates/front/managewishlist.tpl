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

        <ul class="row wlp_bought_list">

            {foreach $products as $product}

                <div class="col-sm-6 col-xs-6 col-md-4" style="padding:2px">
                {include file='catalog/_partials/miniatures/product-grid-view.tpl' class_name='grid'  product=$product image_size='home_default'}
                </div>

            {/foreach}

        </ul>

    </div>

    </div>

    {else}

    <p class="alert alert-warning">

        {l s='No products' mod='tvcmswishlist'}

    </p>

    {/if}
    
    {/strip}