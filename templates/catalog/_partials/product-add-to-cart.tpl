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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{strip}
<div class="product-add-to-cart">
  {if !$configuration.is_catalog}
    
    {block name='product_quantity'}
      <div class="product-quantity">
        <span class="control-label">{l s='Quantity : ' d='Shop.Theme.Catalog'}</span>
        <div class="qty">
          <input type="text" name="qty" id="quantity_wanted" value="{$product.quantity_wanted}" class="input-group" min="{$product.minimal_quantity}" aria-label="{l s='Quantity' d='Shop.Theme.Actions'}" >
        </div>       
      </div>
      {hook h='displayProductPageStockIndicator' product=$product}
      <div class='tvwishlist-compare-wrapper-page'>
        <div class="add tv-product-page-add-to-cart-wrapper">
          <div style="margin-bottom:1em;">
            {if isset($static_token)}
              <a class="tvall-inner-btn tvclick-model button buy_now_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&id_product={$product->id|intval}&token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Buy Now'}" data-id-product="{$product->id|intval}"  onclick="this.href = this.href+ '&qty='+$('.buy_now_button').closest('form').find('#quantity_wanted').val() + '&ipa='+  $('.buy_now_button').closest('form').find('#idCombination').val(); " >
                <i class="tvcustom-btn"></i>
                <span>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</span>
              </a>
            {else}
              <a class="tvall-inner-btn tvclick-model button buy_now_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&id_product={$product->id|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Buy Now'}" data-id-product="{$product->id|intval}" onclick="this.href = this.href+ '&qty='+$('.buy_now_button').closest('form').find('#quantity_wanted').val() + '&ipa='+  $('.buy_now_button').closest('form').find('#idCombination').val(); " >
                <i class="tvcustom-btn"></i>
                <span>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</span>
              </a>
            {/if}
          </div>
          <div class="tvcart-btn-model">
            <button class="tvall-inner-btn add-to-cart {if !$product.add_to_cart_url} disabled {/if}" data-button-action="add-to-cart" type="submit" {if !$product.add_to_cart_url} disabled {/if} >
              {if !$product.add_to_cart_url}
                <i class='material-icons block'>&#xe14b;</i>
                <span>{l s='Out of stock' d='Shop.Theme.Actions'}</span>
              {else}
                <i class="material-icons shopping-cart">&#xE547;</i>
                <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
              {/if}
            </button>
           {* {if $page.page_name == 'product'}
            <button type="button" class="tvall-inner-btn tvclick-model" data-toggle="modal" data-target="#exampleModalCenter">
              <i class="tvcustom-btn"></i>
              <span>Buy in one click</span>
            </button>
            {/if} *}
          </div>
          <div class="tvproduct-wishlist-compare">
            {hook h='displayWishlistProductPage' product=$product}
            {hook h='displayProductCompareProductPage' product=$product}
          </div>
        </div>
      </div>
    {/block}
  {/if}  
</div>
{/strip}