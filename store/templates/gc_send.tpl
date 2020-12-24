{if $product.gift_certificate == 'y' && $product.gift_certificate_send == 'y'}
    <div class="form-group">
        <input type="hidden" name="custom_form" value="{$custom_form_num}" />
        <label for="gift_certificate_send">Email Address for Gift Certificate Recipient:</label>
        <input type="text" name="gift_certificate_send" value="" class="form-control" /> 
    </div>
{/if}