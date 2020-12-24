{include file="_top.tpl"}
{array_debug}
<section id='cart'>
  <header><h1>{#cartheader_txt#}</h1></header>

  {if $depend_msg}
  <div class="messages alert alert-info">
   <strong>Notice:</strong>
   <ul>
    {foreach from=$depend_msg item=msg}
    <li>{$msg|replace:"<br>":""}</li>
    {/foreach}
  </ul>
</div>
{/if}

<div class="cart-items mar_btm">
  {if $totals.qty > 0}
    {if $settings.product_mapping != 'add_cart'}
    	{include file="cartitems.tpl" qty_id=""}
    {else}
    	{include file="product_mapping_cart.tpl"}
    {/if}
  {else}Your Cart is currently empty.
  {/if}
</div>

<div class='buttons row mar_btm'>
  <div class="btn-checkout col-xs-12 col-sm-6 col-sm-push-6 text-right">
   <div>
{if $memberinfo}
      <input type="button" name="checkout" class="btn btn-primary mar_btm style1 btnbold" value="Checkout" onclick="javascript: {if $settings.interactive_pricing == 'y'}if (hasUpdated()) parent.location='/checkout_shipping';{else}parent.location='/checkout_shipping';{/if}" />
{else}
      <input type="button" name="checkout" class="btn btn-primary mar_btm" value="Checkout" onclick="javascript: {if $settings.interactive_pricing == 'y'}if (hasUpdated()) parent.location='/checkout';{else}parent.location='/checkout';{/if}" />
{/if}

    </div>
    <div class="mar_btm">{include file="amazon_checkout.tpl"}</div>
    <div class="mar_btm">{include file="paypal_express_checkout.tpl"}</div>
    <div class="mar_btm">{include file="google_checkout.tpl"}</div>
    {if $split_cart.recipients|@count == 1}
        <div class="mar_btm">{include file="visa_checkout.tpl"}</div>
    {/if}

    {if $bongo_button != ''}
    <div>{$bongo_button}</div>
    {/if}
  </div>
  <div class="col-xs-12 col-sm-6 col-sm-pull-6">
    <div class="btn-continue mar_btm">
      <input type="button" name="continue_shopping" value="Continue Shopping" class="btn btn-default" onclick="javascript: parent.location='{$continue_shopping}';{if $settings.interactive_pricing == 'y'} javascript: return hasUpdated();{/if}" />
    </div>
    {if $memberinfo.id && $cart|@count > 0}
      <div class="btn-addtowishlist mar_btm">
        <form method="post" action="index.php" style="display: inline;">
          <input type="hidden" name="action" value="MigrateWishlist" />
          <input type="submit" name="wishlist_add" value="Add Cart to Wishlist" class="btn btn-default" />
        </form>
      </div>
      <div class="btn-savecart">
        <form method="post" action="index.php" style="display: inline;">
          <input type="hidden" name="action" value="SaveCart" />
          <input type="submit" name="save_cart" value="Save Cart" class="btn btn-default" />
        </form>
      </div>
    {/if}
  </div>
</div>
{*

<section class="panel panel-default" id='promo-box'>
  <div class="panel-body">
    <form method="post" action="index.php" role="form"> 
      <div class="form-group">
        <input type="hidden" name="action" value="AddPromo" />
        <div class="row">
          <div class="col-sm-6">
            <label for="promo_code">Promo Code:</label>
            <input class="form-control" type="text" name="promo_code" id="promo_code" value="" />
          </div>
        </div>
      </div>
      <input type="submit" name="promo_submit" value="Apply Promo" class="btn btn-default mar_btm" />
    </form>
    {if $promo_error}<div class="alert alert-danger">{$promo_error}</div>{/if}
    {if $promo.set == 'y'}<div class="alert alert-success">Your promo code is: {$promo.code} {if $promo.description}({$promo.description}){/if}</div>{/if}
    {include file="viewcart_freeprod.tpl"}
  </div>
</section>
*}
{if $totals.qty > 0}
  {include file="display_product_group.tpl" label="Related Products" products=$rel_prods max=4}
{/if}

{*{include file="display_product_group.tpl" label="You May Also Like" products=$upsells max=6*}

</section>

{include file="_bottom.tpl"}
