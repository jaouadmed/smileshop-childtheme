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

*  @author PrestaShop SA <contact@prestashop.com>

*  @copyright  2007-2020 PrestaShop SA

*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)

*  International Registered Trademark & Property of PrestaShop SA

*}

{strip}

{extends file='page.tpl'}

{block name='page_content'}

<div class="col-sm-12 col-xs-12 tvcmswishlist">

    <div id="mywishlist">

    	{if $id_customer|intval neq 0}

    		<div id="block-order-detail">&nbsp;</div>

    	{/if}

    	<div class="footer_links wishlist_footer clearfix tvwishlist-back-btn">

			<a class="tvall-inner-btn btn-back-to-account" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">

                <i class='material-icons'>&#xe314;</i>

				<span>

					{l s='Back to Your Account' mod='tvcmswishlist'}

				</span>

			</a>

			<a class="tvall-inner-btn pull-right btn-home" href="{$urls.pages.index|escape:'html':'UTF-8'}">

               <i class='material-icons'>&#xe88a;</i>

                <span>

                    {l s='Home' mod='tvcmswishlist'}

                </span>

			</a>

    	</div>

    </div>

</div>


{section name=i loop=$wishlists}
	{if isset($wishlists[i].default) && $wishlists[i].default == 1}
		<script >
	
			$(document).ready(function() {
				WishlistManage('block-order-detail', '{$wishlists[i].id_wishlist|intval}');
			});
		
		</script>
	{/if}
{/section}

{/block}

{/strip}