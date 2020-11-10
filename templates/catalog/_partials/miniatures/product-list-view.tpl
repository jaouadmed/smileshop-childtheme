{extends file='parent:catalog/_partials/miniatures/product-list-view.tpl'}

{block name='product_flags'}

<ul class="tvproduct-flags tvproduct-online-new-wrapper">

    {foreach from=$product.flags item=flag}

    {if $flag.type == 'online-only'}
        <li class="product-flag {$flag.type}">
            <i class='material-icons'>&#xe3c2;</i>
            </li>
    {/if}
            
    {if $flag.type == 'new'}
        <li class="product-flag {$flag.type}">
            <i class='material-icons' style="font-size: 30px; color: red;">fiber_new</i>
        </li>
    {/if}

    {/foreach}

</ul>

<ul class="tvproduct-flags tvproduct-sale-pack-wrapper">

    {foreach from=$product.flags item=flag}

    {if $flag.type == 'on-sale'}
        <li class="product-flag {$flag.type}" >
            <div class="tvmenu-subtitle" style="font-size: 30px; color: yellow;">-{$product.discount_to_display}</div>
        </li>
    {/if}
    
    {if $flag.type == 'pack'}
        <li class="product-flag {$flag.type}">
            <i class='material-icons'>&#xe3c2;</i>
        </li>
    {/if}

    {/foreach}

</ul>

{/block}

