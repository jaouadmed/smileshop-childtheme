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

*  @author    PrestaShop SA <contact@prestashop.com>

*  @copyright 2007-2020 PrestaShop SA

*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)

*  International Registered Trademark & Property of PrestaShop SA

*}



{strip}

{if $dis_arr_result['status']}

	<div class='tvcmscategory-chain-slider container-fluid bottom-to-top hb-animate-element'>

		<div class='tvcategory-chain-slider container'>

            <div class='tvcategory-chain-slider-main-title-wrapper'>

				{include file='_partials/tvcms-main-title.tpl' main_heading=$main_heading path=$dis_arr_result['path']}

            </div>

			<div class="">

					{foreach $dis_arr_result['data'] as $data}

						<div class="item col-xl-4 col-lg-4 col-md-4 col-sm-6 col-xs-12" style="padding: 0 .25em .5em .25em">

							<div class="tvcategory-chain-slider-wrapper clearfix">

								<div class="tvcategory-chain-slider-info-wrapper">

									<div class="tvcategory-chin-img-block col-xl-12 col-lg-12 col-md-12 col-xs-12"  style="text-align: center;">

										<img class="lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="{$dis_arr_result['path']}{$data['image']}" alt="{$data['title']}" />

										<div class='tvcategory-chain-title'>

											<a href="{$link->getCategoryLink($data['id_category'])}" title="{$data['title']}">

												{$data['title']}

											</a>

										</div>

									</div>



									

								</div>

									

							</div>

						</div>

					{/foreach}

				</div>

			</div>

		</div>

	</div>

{/if}

{/strip}

