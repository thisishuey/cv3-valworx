{if $product.gift_wrap == 'y'}
    <div class="checkbox">
        <label>
            <input type="checkbox" name="gift_wrap" value="y"> Gift Wrap ({$currency_type}{$product.gift_wrap_amount})
        </label>
    </div>
{/if}