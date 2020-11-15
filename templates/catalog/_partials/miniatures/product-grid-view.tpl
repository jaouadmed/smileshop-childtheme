
{extends file='parent:catalog/_partials/miniatures/product-grid-view.tpl'}

{block name='product_flags'}

<ul class="tvproduct-flags tvproduct-online-new-wrapper" style="left: 0px;right: auto;opacity: 1;">

    {foreach from=$product.flags item=flag}

    {if $flag.type == 'online-only'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;" id="tvverticalmenu">
                <div style="background: rgb(228 0 70); border-radius: 0 10px 10px 0;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;color: #fff;line-height: 1.3em;padding:0 4px;">
                    {$flag.label}
                </div>
            </i>
        </li>
    {/if}
            
    {if $flag.type == 'new'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;" id="tvverticalmenu">
                <div style="background: rgb(228 0 70); border-radius: 0 10px 10px 0;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;color: #fff;line-height: 1.3em;padding:0 4px;">
                    {$flag.label}✦
                </div>
            </i>
        </li>
    {/if}

    {/foreach}

</ul>

<ul class="tvproduct-flags tvproduct-sale-pack-wrapper" style="right: 0px;left: auto;opacity: 1;">

    {foreach from=$product.flags item=flag}

    {if $flag.type == 'on-sale'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;">
                <div style="background: rgb(84 210 76); border-radius: 10px 0 0 10px; font-size:.5em; font-family: 'Roboto Condensed', sans-serif;color: #fff;line-height: 1.3em;padding:0 4px;">
                    
                    -{$product.price }%
                    -{ $product.regular_price}%

                </div>
            </i>
        </li>
    {/if}
    
    {if $flag.type == 'pack'}
        <li class="product-flag {$flag.type}">
            <i style="font-size: 30px;">
                <div style="background: rgb(84 210 76); border-radius: 10px 0 0 10px;font-size:.5em; font-family: 'Roboto Condensed', sans-serif;color: #fff;line-height: 1.3em;padding:0 4px;">
                    {$flag.label}
                </div>
            </i>
        </li>
    {/if}

    {/foreach}

</ul>

{/block}

