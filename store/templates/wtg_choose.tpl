{include file="_top.tpl"}

<h1>Select Items</h1>

  {if $error|@count > 0 && $error != ''}
  <div class="errors">
    <em>There was an error.</em>
    <div class="alert alert-danger"><em>{$error}</em></div>
  </div>
  {/if}


<div class="form-container">
  
  <p class="legend"><strong>Note:</strong> Please select a product to which you will apply your certificate.</p>

  {foreach from=$product key=key item=prod}

    <form method="post" name="product_form" action="index.php" role="form">
      {include file="display_product.tpl" product=$prod}
      <input type="hidden" name="action" value="WTGAddCart" />
      <input type="hidden" name="process_type" value="1" />
      <input type="hidden" name="add_process_type" value="2" />
      <input type="hidden" name="sku" id="sku" value="{$prod.sku}" />
      <input type="hidden" name="prod_id" id="prod_id" value="{$prod.prod_id}" />
      <input type="hidden" name="cat_id" value="" />
      <input type="hidden" name="qty" id="qty" value="1" />
      <input type="submit" name="submit" value="Add to Cart" class="btn btn-primary addtocart_button" />
    </form>

  {/foreach}

</div>

{include file="_bottom.tpl"}

