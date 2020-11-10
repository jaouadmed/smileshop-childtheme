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
<style>
  @media screen and (max-width: 600px) {.cacher {display: none;}}
</style>
<div class="tvcmssliderofferbanners-one col-md-2 col-lg-2 cacher" >

        	<div class="col-xl-12 col-lg-12 col-md-6 col-sm-6 tvbanner1 tvcmssliderofferbanners">

                <a class="tvbanner-hover-wrapper" href="{$data['TVCMSSLIDEROFFERBANNER_LINK']}" title="{$data['TVCMSSLIDEROFFERBANNER_CAPTION'][$language_id]}">

                        <img src="{$path}{$data['TVCMSSLIDEROFFERBANNER_IMAGE_NAME']}" class="tvimage-lazy img-responsive" alt="{if !empty($data['TVCMSSLIDEROFFERBANNER_CAPTION'][$language_id])}{$data['TVCMSSLIDEROFFERBANNER_CAPTION'][$language_id]}{else}{l s='Slider Offer Banner' mod='tvcmssliderofferbanner'}{/if}" height="229" width="230"/>

                </a>

                {if !empty($data['TVCMSSLIDEROFFERBANNER_CAPTION'][$language_id]) && Configuration::get('TVCMSSLIDEROFFERBANNER_CAPTION_SIDE') != 'none'}

                <div class="tvofferbanner-text {Configuration::get('TVCMSSLIDEROFFERBANNER_CAPTION_SIDE')}">

                    {$data['TVCMSSLIDEROFFERBANNER_CAPTION'][$language_id]}

                </div>

                {/if}

            </div>

            <div class="col-xl-12 col-lg-12 col-md-6 col-sm-6 tvbanner2 tvcmssliderofferbanners">

                <a href="{$data['TVCMSSLIDEROFFERBANNER_LINK_2']}" class="tvbanner-hover-wrapper" title="{$data['TVCMSSLIDEROFFERBANNER_CAPTION_2'][$language_id]}">

                        <img src="{$path}{$data['TVCMSSLIDEROFFERBANNER_IMAGE_NAME_2']}" class="tvimage-lazy img-responsive" alt="{if !empty($data['TVCMSSLIDEROFFERBANNER_CAPTION_2'][$language_id])}{$data['TVCMSSLIDEROFFERBANNER_CAPTION_2'][$language_id]}{else}{l s='Slider Offer Banner 2' mod='tvcmssliderofferbanner'}{/if}" height="229" width="230"/>

                </a>

                {if !empty($data['TVCMSSLIDEROFFERBANNER_CAPTION_2'][$language_id]) && !empty(Configuration::get('TVCMSSLIDEROFFERBANNER_CAPTION_SIDE_2'))}

                <div class="tvofferbanner-text {Configuration::get('TVCMSSLIDEROFFERBANNER_CAPTION_SIDE_2')}">

                    {$data['TVCMSSLIDEROFFERBANNER_CAPTION_2'][$language_id]}

                </div>

                {/if}

            </div>

</div>	

{/strip}