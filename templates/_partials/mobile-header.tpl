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

{extends file='parent:_partials/mobile-header.tpl'}


{strip}
<div id='tvcms-mobile-view-header' class="hidden-lg-up">

	{* <div id='tvcmsmobile-language-selector'></div>

	<div id='tvcmsmobile-currency-selector'></div>

	<div id='tvcmsmobile-user-info'></div>

	<div id='tvcmsmobile-main-menu'></div>

	<div id='tvcmsmobile-vertical-menu'></div> *}



	<div class="tvcmsmobile-top-wrapper">

		<div class='tvmobileheader-offer-wrapper col-sm-12'>

			{hook h='displayTopOfferText'}

		</div>

		{*<div class='tvmobileheader-language-currency-wrapper col-xl-6 col-lg-6 col-md-6 col-sm-12'>

			<div class="tvheader-language">{hook h='displayNavLanguageBlockXX'}</div>

			<div class="tvheader-currency">{hook h='displayNavCurrencyBlockXX'}</div>

		</div>*}

	</div>



	



	<div class='tvcmsmobile-header-search-logo-wrapper'>

		<div class="tvcmsmobile-header-logo-right-wrapper col-md-3 col-sm-12 col-xs-3">

			<div id='tvcmsmobile-header-logo'></div>

		</div>

		<div class="tvcmsmobile-header-search col-md-9 col-sm-12 col-xs-9">

			<div id="tvcmsmobile-search">{* {hook h='displayMobileSearchBlockXX'} *}</div>

		</div>

	</div>



	<div class='tvcmsmobile-header-menu-offer-text col-sm-12'>

		<div class="tvcmsmobile-header-menu col-sm-6 col-xs-2">

			<div id='tvmobile-megamenu'></div>

		</div>



		<div class="col-sm-6 col-xs-10 tvcmsmobile-cart-acount-text">

			<div id="tvcmsmobile-account-button"></div>

			<div id="tvmobile-cart"></div>

		</div>

	</div>

	{* <!-- <div class="tvcmsmobile-header-right">

		<div id='tvcmsmobile-horizontal-menu-left'></div>

	</div> --> *}



</div>

{/strip}