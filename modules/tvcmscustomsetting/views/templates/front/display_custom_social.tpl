{**

* 2007-2020 PrestaShop

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

* @copyright 2007-2020 PrestaShop SA

* @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)

* International Registered Trademark & Property of PrestaShop SA

*}

{strip}

{if $LeftStickyStatus}

{block name='block_social'}

	<div class="block-social tv-footer-social-icon wow slideInLeft">

	    <div class="tv-footer-social-icon-wrapper">

	      <div class="tv-footer-social-icon-inner">

	    	{if !empty(Configuration::get('BLOCKSOCIAL_FACEBOOK'))}

	              <div class="tvblock-social-content tvfacebook-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_FACEBOOK')}" target="_blank">

	                <div class="tvblock-social-icon tvfacebook"></div>

	                <span>{l s='Facebook' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	        {if !empty(Configuration::get('BLOCKSOCIAL_TWITTER'))}

	              <div class="tvblock-social-content tvtwitter-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_TWITTER')}" target="_blank">

	                <div class="tvblock-social-icon tvtwitter"></div>

	                <span>{l s='Twitter' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	          {/if}

	    	{if !empty(Configuration::get('BLOCKSOCIAL_RSS'))}

	              <div class="tvblock-social-content tvrss-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_RSS')}" target="_blank">

	                <div class="tvblock-social-icon tvrss"></div>

	                <span>{l s='RSS' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	    	{if !empty(Configuration::get('BLOCKSOCIAL_YOUTUBE'))}

	              <div class="tvblock-social-content tvyoutube-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_YOUTUBE')}" target="_blank">

	                <div class="tvblock-social-icon tvyoutube"></div>

	                <span>{l s='Youtube' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	    	{if !empty(Configuration::get('BLOCKSOCIAL_GOOGLE_PLUS'))}

	              <div class="tvblock-social-content tvgoogleplus-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_GOOGLE_PLUS')}" target="_blank">

	                <div class="tvblock-social-icon tvgoogleplus"></div>

	                <span>{l s='Google +' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	   	 	{if !empty(Configuration::get('BLOCKSOCIAL_PINTEREST'))}

	              <div class="tvblock-social-content tvpinterest-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_PINTEREST')}" target="_blank">

	                <div class="tvblock-social-icon tvpinterest"></div>

	                <span>{l s='Pintrest' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	    	{if !empty(Configuration::get('BLOCKSOCIAL_VIMEO'))}

	              <div class="tvblock-social-content tvvimeo-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_VIMEO')}" target="_blank">

	                <div class="tvblock-social-icon tvvimeo"></div>

	                <span>{l s='Vimeo' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	    	{if !empty(Configuration::get('BLOCKSOCIAL_INSTAGRAM'))}

	              <div class="tvblock-social-content tvinstagram-wrapper">

	            <a href="{Configuration::get('BLOCKSOCIAL_INSTAGRAM')}" target="_blank">

	                <div class="tvblock-social-icon tvinstagram"></div>

	                <span>{l s='Instagram' mod='tvcmscustomsetting'}</span>

	            </a>

	        </div>

	        {/if}

	        </div> 

	    </div>  

	</div>

{/block}

{/if}



{if $RightStickyStatus}

<div class="tvcmsright-sticky wow slideInRight">

    <div class="tvright-sticky">

      <div class="tvright-sticky-wrapper">

      	

        <div class="cart-preview">

          <div class="tvright-sticky-add-to-cart">

              <a href="{$urls.pages.cart}?action=show">

                <i class="material-icons">&#xE8CC;</i>

                <span>{l s='Add to Cart' mod='tvcmscustomsetting'}</span>

              </a>

          </div>

        </div>

        

        <div class="tvright-sticky-account">

          <a class="logout" href="{$urls.pages.my_account}" rel="nofollow">

            <i class="material-icons">&#xe7fd;</i>

            <span>{l s='My Account'  mod='tvcmscustomsetting'}</span>

          </a>

        </div>

        

        {if $WishListEnabledStatus}

        {hook h='displayNavWishlistBlocksticky'}

        {/if}



        {if $CompareEnabledStatus}

        {hook h='displayProductComparesticky'}

        {/if}

        <div class="tvsticky-up-arrow">

          <a href="javascript:" class="tvcmsup-arrow"><i class='material-icons'>&#xe316;</i><span>{l s='Scroll Top' mod='tvcmscustomsetting'}</span></a>

        </div>

      </div>

    </div>

</div>

{/if}

{/strip}