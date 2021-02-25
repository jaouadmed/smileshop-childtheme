
{extends file='parent:_partials/breadcrumb.tpl'}

{block name='breadcrumb'}
{foreach from=$breadcrumb.links item=path name=breadcrumb}
{block name='breadcrumb_item'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    {if $page.page_name == 'module-tvcmsblog-archive'}
        <a itemprop="item" href="{$path.url}">
            <span itemprop="name">{l s='Meta Title' mod='tvcmsblog'}</span>
            <span itemprop="joe"></span>
        </a>
        <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
        <meta itemprop="position" content="{$page.page_name}">
    {else}
        <a itemprop="item" href="{$path.url}">
            <span itemprop="name" class="{$page.page_name}">{$path.title}</span>
        </a>
        <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
        <meta itemprop="position" content="{$page.page_name}">
    {/if}
    
</li>
{/block}
{/foreach}
{if $page.page_name == 'module-tvcmsattrsearch-productsearch'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='Product Search' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'module-tvcmswishlist-mywishlist'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='My Wishlist' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'module-tvcmsproductcompare-productcomparelist'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='Product Compare' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'cart'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='Cart' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'my-account'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='My Account' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'identity'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='identity' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'addresses'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='address' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'history'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s= 'order history' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'order-slip'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='order slip' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'authentication'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='Sign in' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'order-confirmation'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='Your Order Is Conform' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'stores'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='STORES' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>
{else if $page.page_name == 'new-products'}
<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
    <a itemprop="item" href="{$path.url}">
        <span itemprop="name">{l s='New Products' d='Shop.Theme.Action'}</span>
    </a>
    <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
</li>       
{/if}
{/block}