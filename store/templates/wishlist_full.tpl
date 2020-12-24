{include file="_top.tpl"}

<h1>Wishlist</h1>
<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
  <div class="mar_btm">
     <b>Registrant:&nbsp;</b>{$wishlist.first_name|ucfirst} {$wishlist.last_name|ucfirst} <br />
     <b>Location:&nbsp;</b>{$wishlist.city|ucfirst}, {$wishlist.state}<br />
     <b>Description:&nbsp;</b>{$wishlist.description}<br />
  </div>

  <section class="product clearfix row">
    <div class="image iefix col-sm-5">
    {if $product.large_image}
      <img src="{$product.large_image|img_prefix}" alt="{$name}" title="{$name}" id='product_image-{$pid}' class='product_image popup-img img-responsive img-thumbnail' data-img="{$full_image}" />
      {if $full_image || $product.images|@count > 1}
        {if $full_image}
          <div class='enlarge'>
            <a href="#" data-id="product_image-{$pid}" class="popup-link"> + </a>
            <a href="#" data-id="product_image-{$pid}" class="popup-link">ENLARGE IMAGE</a>
          </div>
        {/if}
        <div class="clearfix">
        {include file="product_images.tpl"}
        </div>
      {/if}
    {/if}
    </div>
    <div class="info iefix col-sm-7 clearfix">
      <div class="content">
        <h1>{$product.prod_name}</h1>
        <div class="sku">SKU: {$product.sku}</div>
        <div class="prod-desc">{$product.prod_description}</div>
      </div>
    </div>
  </section>

<form method="post" action="index.php" role="form">

 <div class="wishlist clearfix">

  <div class="row lead hidden-xs">
   <div class="col-sm-2">Sku</div>
   <div class="col-sm-3"><span class="visible-sm">Descr.</span><span class="hidden-sm">Description</span></div>
   <div class="col-sm-2">Price</div>
   <div class="col-sm-2">Qty</div>
   <div class="col-sm-3">&nbsp;</div>
  </div>

  <div class="row mar_btm">
   <div class="col-sm-2 wish-sku3 mar_top10"><strong class="visible-xs">Sku: </strong>{if $product.prod_id == $pr_id}{$product.sku}{else}{$product.children.$pr_id.sku}{/if}</div>
   <div class="col-sm-3 wish-desc3  mar_top10">
    {if $product.parent != '' && $product.parent != 0}
      {assign var=par value=$product.parent}
      {$parent_names.$par.prod_name}&nbsp;-&nbsp;
    {/if}
    {$product.prod_name} 
    {if $product.attribute1 != ''}
      &nbsp;-&nbsp;{$product.attribute1} {$product.attribute2} {$product.attribute3} {$product.attribute4}
    {/if} 
    {if $product.child_attribute != ''}
    &nbsp;-&nbsp;{$product.child_attribute}
    {/if}
    {if $prod.custom_form_data}
      <br><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info_wl/{$var1}/{$product.rank}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details &raquo;</a>
    {/if}
   </div>
   <div class="col-sm-2 wish-price2  mar_top10">
    <strong class="visible-xs">Unit Price: </strong>
    {if $product.prod_id == $pr_id}
     <span class="productprice">
     {if $product.special == 'y'}<del>{$currency_type}{$product.standard_price|commify}</del></span><span class="saleprice">{/if}
     {$currency_type}{$product.price|commify}</span>
    {else}
     <span class="productprice">
     {if $product.children.$pr_id.special == 'y'}<del>{$currency_type}{$product.children.$pr_id.standard_price|commify}</del></span><span class="saleprice">{/if}
     {$currency_type}{$product.children.$pr_id.price|commify}</span>
    {/if}
    </div>
 {if $product.outseason != 'y'}
  {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > 0 || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
    <div class="col-sm-2 wish-qty  mar_top10"><strong class="visible-xs">Qty: </strong>
      <div class="row">
        <div class="col-xs-3 col-sm-12">
          <input class="form-control" type="text" name="qty" value="1" />
        </div>
      </div>
    </div>
   <div class="col-sm-3 wish-add clearfix mar_top10">
    <input type="hidden" name="action" value="WishlistAddCart" />
    <input type="hidden" name="id" value="{$product.id}" />
    <input type="submit" name="submit" value="Add to Cart" class="btn btn-default mar_btm" />
   </div>
  {else}
   <div class="col-sm-2 wish-qty mar_top10">&nbsp;</div>
   <div class="col-sm-3 wish-add mar_top10">Out of Stock</div>
  {/if}
 {else}
   <div class="col-sm-2 wish-qty mar_top10">&nbsp;</div>
   <div class="col-sm-3 wish-add mar_top10">Out of Season</div>
 {/if}
  </div>

 </div>

</form>

<div class="prev_next mar_btm">
 <a href="/wishlist/{$wishlist.id}">&laquo; Back to List</a>&nbsp;|&nbsp;{if $product.prev != ''}<a href="/wishlist_full/{$wishlist.id}/{$product.prev}">&laquo; Prev</a> &nbsp;|&nbsp;{/if} <a href="/wishlist_full/{$wishlist.id}/{$product.next}">Next &raquo;</a>
</div> 
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
  {if $memberinfo.email != ''}
    {include file="member_links.tpl"}
  {/if}
</div>
{include file="_bottom.tpl"}