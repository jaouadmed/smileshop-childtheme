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
{$col = ''}


{*{if !empty($offer_banner)}
    {$col = 'col-md-12 col-lg-12'}
{/if}*}
{if !isset($hook_mobile)}
    {$col = 'col-md-10 col-lg-10'}
{/if}

<div class="tvcms-slider-offerbanner-wrapper container-fluid">
    <div class="row">
        <div class="{$col} " data-speed='{$main_slider_js.speed}' data-pause-hover='{$main_slider_js.pause}'>
            <div class='tvcms-main-slider'>
                <div class='tv-main-slider'>
                    <div id='tvmain-slider' class="owl-theme owl-carousel"> 
                    	{$i = 1}
                    	{foreach $data as $slide}
                			{if !empty($slide['url']) }
                				<a href="{$slide['url']}">
                			{/if}
            					<img class="tvmain-slider-img lazy" data-src='{$slide["image_url"]}' src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt='{l s="Main Slider" mod="tvcmsslider"}' {* title='#tvmain-slider-img-{$i}' *} data-caption-id='tvmain-slider-img-{$i}' height="1004" width="428">
                			{if !empty($slide['url']) }
            					</a> 
                			{/if}
            				{$i = $i + 1}
                		{/foreach} 
                	</div> 

                    <div class="tvmain-slider-next-pre-btn">
                        <div class="tvcmsmain-prev tvcmsprev-btn">
                            <i class='material-icons'>&#xe5cb;</i>
                        </div>
                        <div class="tvcmsmain-next tvcmsnext-btn">
                            <i class='material-icons'>&#xe5cc;</i>
                        </div>
                    </div>
                </div>
                {$i = 1}
                <div class="tvmain-slider-content-wrapper">
                    {$index_num = 0}
                    {foreach $data as $slide}
                        {if $slide['image_url'] || (!$slide['class_name'] == 'tvmain-slider-contant-none')}
                            {if $slide['title'] || $slide['description']}
                                <div id='tvmain-slider-img-{$i}' class="{* nivo-html-caption caption *} tvmain-slider-content-inner {if $i == 1}active{/if}" data-index='{$index_num}'>
                                    <div class='tvmain-slider-contant {$slide["class_name"]}'>
                                        <h2 class="tvmain-slider-title animated">{$slide['title']}</h2>
                                        <div class="tvmain-slider-info animated">{$slide['description'] nofilter}</div> 
                                        {if !empty($slide['btn_caption'])}
                                            <div class="tvmain-slider-btn">
                                                <a href='{$slide["url"]}' class="tvmain-slider-button animated">{$slide['btn_caption']}</a>
                                            </div> 
                                        {/if}
                                    </div>
                                </div> 
                            {/if}
                            {$i = $i + 1}
                            {$index_num = $index_num + 1}
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
        
        {*$offer_banner nofilter*}
        {if isset($hook_mobile)}
            {$offer_banner nofilter}
        {/if}

    </div>
</div>
{/strip}