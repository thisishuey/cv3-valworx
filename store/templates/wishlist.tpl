{include file="_top.tpl"}

<h1>Wishlist</h1>

<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
  {if ! $wishlist}
     This wishlist has expired.
  {else}  
  <div class="wishlist clearfix nopad">
    <b>Registrant:&nbsp;</b>{$wishlist.first_name|ucfirst} {$wishlist.last_name|ucfirst}<br />
    <b>Location:&nbsp;</b>{$wishlist.city|ucfirst}, {$wishlist.state}<br />
    <b>Description:&nbsp;</b>{$wishlist.description}<br />
 </div>

  {if $valid.return == '1'}
    <div class="errors">
      <p><em>There was an error.</em></p>
      <p>Please double-check any highlighted fields.</p>
      <p><em>{$error}</em></p>
    </div>
  {/if}

  <form method="post" action="index.php" role="form"> 
    <input type="hidden" name="action" value="WishlistAddCart" />

    <div class="wishlist clearfix">

    <div class="row lead hidden-xs hidden-sm">
      <div class="col-md-2">Item</div>
      <div class="col-md-2">Sku</div>
      <div class="col-md-2">Unit Price</div>
      <div class="col-md-2">Requested</div>
      <div class="col-md-2">Needs</div>
      <div class="col-md-2">Buy</div>
   </div>

    {foreach from=$wishlist.prods item=prod key=key}
    {if $prod.inactive != 'y'}
    {counter assign=num}
    <div class="well">
      <div class="row">
        <div class="col-md-2">
          <div class="">
            {if $prod.web_image != ''}
            <img class="img img-responsive" src="{$prod.web_image|img_prefix}" alt="{$prod.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" />
            {elseif $prod.parent != ''}
            {assign var=par value=$prod.parent}
            <img class="img img-responsive" src="{$parent_names.$par.web_image|img_prefix}" alt="{$parent_names.$par.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" />
            {/if}
          </div>
          <div class="">
            {if $prod.parent != '' && $prod.parent != 0}
            {assign var=par value=$prod.parent}{$parent_names.$par.prod_name}&nbsp;-&nbsp;
            {/if}
            {$prod.prod_name}<br />
            <a href="/wishlist_full/{$wishlist.id}/{$prod.rank}">More info &raquo;</a><br />
            {if $prod.attribute1 != ''}{$prod.attribute1} {$prod.attribute2} {$prod.attribute3} {$prod.attribute4}{elseif $prod.child_attribute != ''}{$prod.child_attribute}{/if}
          </div>
        </div>
        <div class="col-md-2"><strong class="visible-xs visible-sm">Sku: </strong>{if $prod.att_sku != ''}{$prod.att_sku}{else}{$prod.sku}{/if}</div>
        <div class="col-md-2"><strong class="visible-xs visible-sm">Unit Price: </strong>
          {if $smarty.now > $prod.special_start && $smarty.now < $prod.special_stop}
          <del>{$currency_type}{$prod.standard_price|commify}</del>&nbsp;{$currency_type}{$prod.special_price|commify}
          {else}
          {$currency_type}{$prod.standard_price|commify}
          {/if}
        </div>
        <div class="col-md-2">
          <strong class="visible-xs visible-sm">Qty Requested: </strong>{$prod.qty_needed|number_format}
        </div>
        <div class="col-md-2">
          <strong class="visible-xs visible-sm">Qty Needed: </strong>{$prod.qty_need|number_format}
        </div>
        <div class="col-md-2">
          {if $prod.outseason == 'y'}Out of Season
          {elseif $settings.inventory_control == 'y' && $prod.inv_control_exempt != y && $prod.inventory_control < 1 && $prod.on_order < 1 && ($prod.stock_status != 'Backordered' || $prod.backordered_date == '')}Out of Stock
          {elseif $prod.stock_status == 'In Stock' || ($settings.inventory_control == 'y' && $prod.stock_status == 'Backordered')}
          <input type="hidden" name="id_{$num}" value="{$prod.id}" />
          <strong class="visible-xs visible-sm">Buy: </strong>
          <div class="row">
            <div class="col-xs-4 col-sm-3 col-md-12">
              <input class="form-control" type="text" name="qty_{$num}" value="0"/>
            </div>
          </div>
          {else}
          {$prod.stock_status}
          {/if}
        </div>
      </div>
      
    </div>
    {/if}
    {/foreach}

    </div>
    <div class="row mar_btm">
      <div class="col-xs-12">
        <input type="submit" name="submit" value="Buy Now" class="btn btn-default" />
      </div>
    </div>
  </form>
    {/if}  
</div>
  
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
  {if $memberinfo.email != ''}
  {include file="member_links.tpl"}
  {/if}
</div>
{include file="_bottom.tpl"}