{extends file='parent:catalog/product.tpl'}

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
        {* start product comment tab hook *}
        {hook h='displayProductListReviewsTab'}
        {* End product comment tab hook *}
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
        {* start product comment tab content hook *}
        {hook h='displayProductListReviewsTabContent' product=$product}
        {* End product comment tab content hook *}
    </div>
</div>
{/block}