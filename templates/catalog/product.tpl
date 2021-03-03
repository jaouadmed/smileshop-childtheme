{extends file='parent:catalog/product.tpl'}

{block name='page_header_container'}
    {foreach from=$product.flags item=flag}
    {if $flag.type == 'online-only'}
        <div style="margin-bottom: 10px;">
            <a class="expdeltr" style="padding: .3em; background-color: #e40046; color: #fff; font-size: 1.2em; vertical-align: middle; margin-bottom: 20px;">
                {$flag.label}
            </a>
        </div>
    {/if}
    {/foreach}

    {block name='page_header'}
    <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
    {/block}
{/block}

{block name='product_tabs'}
<div class="tabs tvproduct-description-tab">
    <ul class="nav nav-tabs" role="tablist">
        {if $product.description}
        <li class="nav-item">
            <a class="nav-link{if $product.description} active{/if}" data-toggle="tab" href="#description" role="tab" aria-controls="description" {if $product.description} aria-selected="true" {/if}> {l s='Description' d='Shop.Theme.Catalog' } </a> 
        </li> 
        {/if}
        
        {foreach from=$product.extraContent item=extra key=extraKey}
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}" role="tab" aria-controls="extra-{$extraKey}">
                {$extra.title}
            </a>
        </li>
        {/foreach}
        
    </ul>
    <div class="tab-content" id="tab-content">
        <div class="tab-pane fade in {if $product.description} active {/if}" id="description" role="tabpanel">
            {block name='product_description'}
            <div class="product-description">{$product.description nofilter}</div>
            {/block}
        </div>
        {*{block name='product_details'}
        {include file='catalog/_partials/product-details.tpl'}
        {/block}*}
        {block name='product_attachments'}
        {if $product.attachments}
        <div class="tab-pane fade in" id="attachments" role="tabpanel">
            <div class="product-attachments">
                <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                {foreach from=$product.attachments item=attachment}
                <div class="attachment">
                    <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                    <p>{$attachment.description}</p>
                    <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                        {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                    </a>
                </div>
                {/foreach}
            </div>
        </div>
        {/if}
        {/block}
        {foreach from=$product.extraContent item=extra key=extraKey}
        <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key=> $val} {$key}="{$val}"{/foreach}>
            {$extra.content nofilter}
        </div>
        {/foreach}
        
    </div>
</div>
<div class="tabs tvproduct-description-tab">
    <ul class="nav nav-tabs" role="tablist">
        {* start product comment tab hook *}
        {hook h='displayProductListReviewsTab'}
        {* End product comment tab hook *}
    </ul>
    <div class="tab-content" id="tab-content">
        {* start product comment tab content hook *}
        {hook h='displayProductListReviewsTabContent' product=$product}
        {* End product comment tab content hook *}
    </div>
</div>
{/block}

{block name='product_accessories'}
{if $accessories}
<div class="tvcmslike-product container-fluid">
    <div class='tvlike-product-wrapper-box container'>
        <div class='tvcmsmain-title-wrapper'>
            <div class="tvcms-main-title">
                <div class='tvmain-title'>
                    <h2>{l s='You might also like' d='Shop.Theme.Catalog'}</h2>
                </div>
            </div>
            <div class='tvlike-pagination-wrapper tv-pagination-wrapper'>
                <div class="tvcmslike-next-pre-btn tvcms-next-pre-btn">
                    <div class="tvcmslike-prev tvcmsprev-btn" data-parent="tvcmslike-product"><i class='material-icons'>&#xe314;</i></div>
                    <div class="tvcmslike-next tvcmsnext-btn" data-parent="tvcmslike-product"><i class='material-icons'>&#xe315;</i></div>
                </div>
            </div>

        </div>
        <div class="tvlike-product">
            <div class="products owl-theme owl-carousel tvlike-product-wrapper tvproduct-wrapper-content-box">
                {foreach $accessories as $product}
                {include file="catalog/_partials/miniatures/product.tpl" product=$product tv_product_type="like_product"}
                {/foreach}
            </div>
        </div>
    </div>
    <script>
        window.addEventListener("load", function(event) {
            $('.tvlike-pagination-wrapper.tv-pagination-wrapper').detach().prependTo('.tvlike-product-wrapper-box.container .tvcmsmain-title-wrapper');
        });
    </script>
     
</div>
{/if}
{/block}


{block name='page_footer_container'}
<div class="tvfooter-product-sticky-bottom">
    <div class="container">
        <div class="tvflex-items">
            <div class="tvproduct-image-title-price">
                {if $product.cover}
                <div class="product-image">
                    <img src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
                </div>
                <div class="tvtitle-price">
                    {block name='page_header'}
                    <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                    {/block}
                    {block name='product_prices'}
                        {if $product.show_price}
                        <div class="product-prices">
                            {block name='product_price'}
                            <div class="product-price h5 {if $product.has_discount}has-discount{/if}" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                                <link itemprop="availability" href="{$product.seo_availability}" />
                                <meta itemprop="priceCurrency" content="{$currency.iso_code}">
                                <div class="current-price">
                                    <span class="price" itemprop="price" content="{$product.price_amount}">{$product.price}</span>
                                    
                                </div>
                                {block name='product_discount'}
                                    {if $product.has_discount}
                                    <div class="product-discount">
                                        {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                        <span class="regular-price">{$product.regular_price}</span>
                                    </div>
                                    {/if}
                                {/block}
                                
                                {block name='product_unit_price'}
                                {if $displayUnitPrice}
                                <p class="product-unit-price sub">{l s='(%unit_price%)' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price_full]}</p>
                                {/if}
                                {/block}
                            </div>
                            {/block}
                            {block name='product_without_taxes'}
                            {if $priceDisplay == 2}
                            <p class="product-without-taxes">{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
                            {/if}
                            {/block}
                            {block name='product_pack_price'}
                            {if $displayPackPrice}
                            <p class="product-pack-price"><span>{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</span></p>
                            {/if}
                            {/block}
                            {block name='product_ecotax'}
                            {if $product.ecotax.amount > 0}
                            <p class="price-ecotax">{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
                                {if $product.has_discount}
                                {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
                                {/if}
                            </p>
                            {/if}
                            {/block}
                            {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}
                            <div class="tax-shipping-delivery-label">
                                {if $configuration.display_taxes_label}
                                {$product.labels.tax_long}
                                {/if}
                                {hook h='displayProductPriceBlock' product=$product type="price"}
                                {hook h='displayProductPriceBlock' product=$product type="after_price"}
                                {if $product.additional_delivery_times == 1}
                                {if $product.delivery_information}
                                <span class="delivery-information">{$product.delivery_information}</span>
                                {/if}
                                {elseif $product.additional_delivery_times == 2}
                                {if $product.quantity > 0}
                                <span class="delivery-information">{$product.delivery_in_stock}</span>
                                {* Out of stock message should not be displayed if customer can't order the product. *}
                                {elseif $product.quantity == 0 && $product.add_to_cart_url}
                                <span class="delivery-information">{$product.delivery_out_stock}</span>
                                {/if}
                                {/if}
                            </div>
                            {if $product.has_discount}
                                {if $product.discount_type === 'percentage'}
                                <span class="discount discount-percentage" style="padding: 5px 6px;margin: 0 0 0 10px;background-color: #000;color: #fff;">
                                    {l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]}
                                </span>
                                {else}
                                <span class="discount discount-amount" style="padding: 5px 6px;margin: 0 0 0 10px;background-color: #000;color: #fff;">
                                    {l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]}
                                </span>
                                {/if}
                            {/if}
                        </div>
                        {/if}
                    {/block}
                </div>
                {/if}
            </div>
            <div>
                <div class="product-actions" id="bottom_sticky_data"></div>
            </div>  
        </div>
    </div>
</div>

<footer class="page-footer">
    {block name='page_footer'}
    <!-- Footer content -->
    {/block}
</footer>
{/block}


