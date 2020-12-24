{include file="_top.tpl"}

<h1>Easy Reorder</h1>

<div class="reorder-wrapper col-md-8 col-md-push-4 col-lg-9 col-lg-push-3">
   <form method="post" action="index.php" role="form"> 
   <input type="hidden" name="action" value="ReorderAddCart" />

  <div class="row hidden-xs lead">
    <div class="col-sm-3">Item</div>
    <div class="col-sm-3">Description</div>
    <div class="col-sm-2">Unit Price</div>
    <div class="col-sm-2">Qty</div>
    <div class="col-sm-1">Remove</div>
  </div>

  {foreach from=$products item=prod key=key}
  {if $prod.inactive != 'y'}
    <div class="row mar_btm">
        
      <div class="col-sm-3">
          	{if $prod.web_image != ''}
              <a href="/product/{$prod.prod_id}{$url_split_char}{$prod.categories.0}">
                  <img src="{$prod.web_image|img_prefix}" alt="{$prod.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="bordered img-responsive" />
              </a>
          	{elseif $prod.parent != ''}
              {assign var=par value=$prod.parent}<a href="/product/{$prod.prod_id}{$url_split_char}{$prod.categories.0}">
              <img src="{$parent_names.$par.web_image|img_prefix}" alt="{$parent_names.$par.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="bordered img-responsive" /></a>
          	{/if}
      </div>
      <div class="col-sm-3">
          <div>{$prod.prod_name}</div>
          <div>Item #: {if $prod.att_sku != ''}{$prod.att_sku}{else}{$prod.sku}{/if}</div>
          <div>
              {if $prod.attribute1 != ''}
                  ({$prod.attribute1} {$prod.attribute2} {$prod.attribute3} {$prod.attribute4})
              {elseif $prod.child_attribute != ''}({$prod.child_attribute})
              {/if}
          </div>
          <div>[<a href="/product/{$prod.prod_id}{$url_split_char}{$prod.categories.0}">more info</a>]</div>
      </div>
      
      <div class="col-sm-2">
      {if $prod.build_product != 'y'}
          {if $smarty.session.mobile}Unit Price: {/if}
          {if $prod.special == 'y'}
              <del>{$currency_type}{$prod.standard_price|commify}</del>&nbsp;{$currency_type}{$prod.special_price|commify}
          {else}
              {$currency_type}{$prod.standard_price|commify}
          {/if}
      {else}
          Price determined after customization.
      {/if}
      </div>
      <div class="col-sm-2">
          {if $prod.outseason == 'y'} 
            Out of Season
          {elseif $settings.inventory_control == 'y' && $prod.inventory_control < 1 && $prod.on_order < 1 && ($prod.stock_status != 'Backordered' || $prod.backordered_date == '') }
            Out of Stock
            <input type="hidden" name="qty_{$prod.reorder_id}" value="0" />
          {elseif $prod.stock_status == 'In Stock' || $prod.stock_status == 'Backordered'}
              {if $prod.stock_status=='Backordered' && $prod.backordered_date != ''}
                  Backordered: {$prod.backordered_date}<br />
              {/if} 
              {if $prod.build_product != 'y'}
                  {if $smarty.session.mobile} Qty: {/if}<input type="number" id="qty_{$prod.reorder_id}" name="qty_{$prod.reorder_id}" value="0" min="0" class="form-control" {if $settings.interactive_pricing == 'y'} onkeyup="javascript: priceChange('{$prod.reorder_id}','dynamic','{$prod.price}','{$currency_type}');"{/if}/>
              {else}
                  <input type="checkbox" value="1" name="qty_{$prod.reorder_id}" />
              {/if}        
              {assign var="quantities" value=$quantities|cat:$key|cat:","|cat:$prod.qty|cat:"|"}
          {else}
            {$prod.stock_status}
            <input type="hidden" name="qty_{$prod.reorder_id}" value="0" />&nbsp;
          {/if}
      	</div>
      
      <div class=" col-sm-1">
             <input type="checkbox" name="rem_{$prod.reorder_id}" value="y"/><label for="rem_{$prod.reorder_id}" class="visible-xs"> Remove</label>
      </div>
      </div>
    {/if}
  {/foreach}

{*<p style="color: red;">Note: If you're adding a build-a-product SKU you will be redirected to its product page to customize it.</p>*}

<div class="row mar_btm">
  <input type="submit" name="submit" value="Submit" class="btn btn-default" />
</div>
</form>

</div>
<div class="col-md-4 col-md-pull-8 col-lg-3 col-lg-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}