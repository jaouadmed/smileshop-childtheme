
{extends file='parent:catalog/_partials/miniatures/product-grid-view.tpl'}

{block name='product_flags'}

<ul class="tvproduct-flags tvproduct-online-new-wrapper">

    {foreach from=$product.flags item=flag}

    {if $flag.type == 'online-only'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;" id="tvverticalmenu">
                <div stye="background: rgb(228 0 70); border-radius: 3px;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;line-height: 1.3em;padding:0 4px;">
                    {$flag.label}
                </div>
            </i>
        </li>
    {/if}
            
    {if $flag.type == 'new'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;" id="tvverticalmenu">
                <div stye="background: rgb(228 0 70); border-radius: 3px;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;line-height: 1.3em;padding:0 4px;">
                    {$flag.label}
                </div>
            </i>
        </li>
    {/if}

    {/foreach}

</ul>

<ul class="tvproduct-flags tvproduct-sale-pack-wrapper">

    {foreach from=$product.flags item=flag}

    {if $flag.type == 'on-sale'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;">
                <div stye="background: rgb(84 210 76); border-radius: 3px;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;color: #fff;line-height: 1.3em;padding:0 4px;">
                    -{$product.discount_to_display}
                </div>
            </i>
        </li>
    {/if}
    
    {if $flag.type == 'pack'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;">
                <div stye="background: rgb(84 210 76); border-radius: 3px;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;color: #fff;line-height: 1.3em;padding:0 4px;">
                    {$flag.label}
                </div>
            </i>
        </li>
    {/if}

    {/foreach}

</ul>

{/block}

