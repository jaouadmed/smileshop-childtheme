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
* @author PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2019 PrestaShop SA
* @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
{strip}
{extends file='catalog/listing/product-list.tpl'}
{block name='product_list_header'}
{* <div class="block-category card card-block clearfix tv-category-block-wrapper">
    {if $category.image.large.url}
    <div class="tv-category-cover">
        <img src="{$category.image.large.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">
    </div>
    {/if}
    {if !empty($category.image.large.url)}
    <div class="tv-all-page-main-title-wrapper">
        <div class="tv-all-page-main-title">{$category.name}</div>
    </div>
    {/if}
    {if $category.description}
    <div id="category-description" class="text-muted">{$category.description nofilter}</div>
    {/if}
</div>
{$tv_child_category = Category::getChildren($category['id'], $language.id)}
{if count($tv_child_category) > 0}
<div class='tv-category-main-div clearfix'>
	<div class="tv-sub-category-title-wrapper">
	    <div class="tv-sub-category-title">{l s='Subcategory' d='Shop.Theme.Catalog'}</div>
	</div>
	<div class="tvcategory-name-image">
	    {foreach $tv_child_category as $category}
		    <div class="tv-sub-category-wrapper">
			    <div class="tv-sub-category-inner">
			        <div class="tv-category-image">
			            <a href="{$link->getCategoryLink($category.id_category, $category.link_rewrite)|escape:'html':'UTF-8'}" title="{$category.name|escape:'html':'UTF-8'}" class="img">
			                {$tmp = {url entity='categoryImage' id=$category.id_category name='category_default'}}
			                {if !file_exists({$tmp})}
			                <img class="replace-2x" src="{$tmp}" alt="{$category.name|escape:'html':'UTF-8'}" />
			                {/if}
			            </a>
			        </div>
			        <div class="tvcategory-name">
			            <a class="category-name" href="{$link->getCategoryLink($category.id_category, $category.link_rewrite)|escape:'html':'UTF-8'}">{$category.name|escape:'html':'UTF-8'}</a>
			        </div>
			    </div>
		    </div>
	    {/foreach}
    </div>
</div>
{/if} *}
{/block}
{/strip}