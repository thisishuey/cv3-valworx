{include file="_top.tpl"}

<div class="page-header">
  <h1>{$product.prod_name}</h1>
</div>

{if $product.prod_description}
  <p>{if $product.new == 'y'}<span class="red">NEW!</span> {/if}{$product.prod_description}</p>
{/if}

<div class="row">
  <div id="product_builder_steps" class="col-md-8">
    <div class="row">
      {counter assign=step_num start=1}
      {foreach from=$product.build_steps item=step key=step_id}
        <div class="step{$step_num} col-md-3 col-xs-6 text-center mar_btm">
          <div class="step-label">Step {$step_num}:</div>
          <a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}/step|c_{$cid}|s_{$step_id}">{$step.name}</a>
          {if $step.img != ''}
            <div class="step-image"><img src="{$step.img|img_prefix}" class="img-thumbnail"></div>
          {/if}
          {if $step.prod_name != ''}
            <div class="step-product-name">{$step.prod_name}</div>
          {/if}
        </div>
        {counter assign=step_num}
      {/foreach}
    </div>
  </div>
  <div id="product_builder_cost" class="col-md-4">
    {assign var=total value=0}
    <div class="panel panel-default">
      <div class="panel-heading">
        Product Cost
      </div>
      <div class="panel-body">
        {foreach from=$product.build_steps item=step}
          <div class="row">
            {math equation=a*b a=$step.price b=$step.add_values.qty assign=qtyprice}
            <div class="stepname col-md-8 col-xs-8">
            {$step.name} {if $step.add_values.qty > '1'} x{$step.add_values.qty}{/if}
            </div>
            <div class="stepcost col-md-4 col-xs-4">
            {$currency_type}{if $step.price == ''}0.00{else}{$qtyprice|string_format:"%.2f"}
            {math equation=x+y x=$total y=$qtyprice assign=total}{/if}
            </div>
            {assign var=qtyprice value=0}
          </div>
        {/foreach}
        {if $product.build_prod_disc != '' && $product.build_prod_disc > 0}
          <div class="row">
            {math equation=x*y/100 x=$total y=$product.build_prod_disc assign=discount}
            {math equation=x-y x=$total y=$discount|string_format:"%.2f" assign=total}
            <div class="stepname col-md-8 col-xs-8">
              <b>{$product.build_prod_disc}% Discount</b>
            </div>
            <div class="stepcost col-md-4 col-xs-4">
              <b>{$currency_type}{$discount|string_format:"%.2f"}</b>
            </div>
          </div>
        {/if}
        <div class="row">
          <div class="stepname col-md-8 col-xs-8">
            <b>Total</b>
          </div>
          <div class="stepcost col-md-4 col-xs-4">
            <b>{$currency_type}{$total|string_format:"%.2f"}</b>
          </div>
        </div>
      </div>
    </div>      
    {if $product.build_complete == 'y'}
      <form method="post" name="product_form" action="index.php">
        {* Recipient Selection *}
        {include file="product_mapping.tpl"}
        <input type="hidden" name="action" value="AddCart" />
        <input type="hidden" name="qty" value="1" />
        <input type="hidden" name="bp_par_id" value="{$prod_id}" />
        <input type="hidden" name="prod_id" value="{$prod_id}" />
        <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
        <div class="btn-add text-uppercase mar_btm">
          <input type="submit" name="addtocart_submit" class="btn btn-primary" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');"/>
        </div>
        {if $memberinfo.id}
          <div class="btn-wishlist text-uppercase mar_btm"><input type="submit" name="wishlist_add" class="btn btn-default" value="Add to Wishlist" /></div>
        {/if}
        {if $memberinfo.id}
          <div class="btn-reorder text-uppercase"><input type="submit" name="reorder_add" class="btn btn-default" value="Easy Reorder" /></div>
        {/if}
      </form>
    {/if}
  </div>
</div>

<div id="product_builder_prods">
    <h2>{$product.next_build_step.name}</h2>
    {if $product.build_group != ''}
      {assign var=build_group value=$product.build_group}
      <b> - {$product.build_groups.$build_group.name}</b>
    {elseif $product.build_groups|@count > 1}
      {foreach from=$product.build_groups item=group}
        <br /><a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}{$url_split_char}step|c_{$cid}|s_{$product.next_build_step.step_id}|sc_{$group.id}">{$group.name}</a>
      {/foreach}
    {/if}
    {if $product.build_prod != ''}
      {assign var=build_prod value=$product.build_prod}
{if $product.build_prod.is_parent != 'y' || $settings.child_display_type == '2' || ($product.build_prod.form_id != '' && $product.build_prod.form_id != 0) || ($product.build_prod.gift_certificate == 'y' && $product.build_prod.gift_certificate_send == 'y') || $product.build_prod.gift_wrap == 'y' || $possible_mappings.display=='y' || $settings.additional_prod_display_type != '2'}
    <form method="post" name="product_form" action="index.php">
    <input type="hidden" name="action" value="AddCart" />
    <input type="hidden" value="{$prod_id}" name="bp_id">
    <input type="hidden" value="{$product.next_build_step.step_id}" name="st_id">
    <input type="hidden" value="1" name="qty">
{/if}
      {include file="display_product.tpl" product=$product.build_prod prod_id=$product.build_prod.prod_id bp_id=$prod_id st_id=$product.next_build_step.step_id}
{if ($product.build_prod.is_parent != 'y' || $settings.child_display_type == '2' || ($product.build_prod.form_id != '' && $product.build_prod.form_id != 0) || $product.build_prod.gift_wrap == 'y' || $possible_mappings.display == 'y') && $settings.additional_prod_display_type != '2'}
    </form>
{/if}
    {elseif $product.build_prods|@count > 0}
      <div class="clearfix">
        <ul class="display grid pad_tp20 pdd_rt0 pdd_lt0 col-lg-12 col-sm-12 col-md-12 col-xs-12">
          {foreach from=$product.build_prods item=prod}
            {cycle values="left,center,right" assign=pos name=pos}
            <li class="{$pos} iefix col-lg-3 col-md-4 col-sm-6 col-xs-6 mar_btm">
              <section class="product">
                <div class="image">
                  <a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}{$url_split_char}step|c_{$cid}|s_{$product.next_build_step.step_id}|sc_{$product.build_group}|pr_{$prod.prod_id}"><img src="{if $prod.web_image != ''}{$prod.web_image|img_prefix}{else}{$img_prefix}/images/nopicture_tn.jpg{/if}" class="img-thumbnail"></a>
                </div>
                <div class="info">
                  <div class="content">
                    <a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}{$url_split_char}step|c_{$cid}|s_{$product.next_build_step.step_id}|sc_{$product.build_group}|pr_{$prod.prod_id}"><h2>{$prod.prod_name}</h2></a>
                  </div>
                  {if $prod.is_parent == '' && $prod.has_attributes == ''}
                  <div class="form">
                    <form method="post" name="product_form" action="index.php">
                      <input type="hidden" name="action" value="AddCart">
                      <input type="hidden" class="dynamic_qty" id="price_{$product.prod_id}" value="{$currency_type}{$prod.price|commify}" readonly="true">
                      <input type="hidden" name="prod_name" value="{$prod.prod_name}">
                      <input type="hidden" name="prod_id" value="{$prod.prod_id}">
                      <input type="hidden" name="cat_id" value="{$cid}">
                      <input type="hidden" name="sku" value="{$prod.sku}">
                      <input type="hidden" name="price" value="{$prod.price}">
                      <input type="hidden" value="{$prod_id}" name="bp_id">
                      <input type="hidden" value="{$product.next_build_step.step_id}" name="st_id">
                      <input type="hidden" name="qty" id="qty_{$product.prod_id}" value="1"{if $settings.interactive_pricing == 'y'} onKeyUp="javascript: priceChange('{$product.prod_id}', 'dynamic', '{$product.price}', '{$currency_type}');"{/if}>
                      <input type="submit" name="submit" value="Add Item" class="btn btn-primary">
                    </form>
                  </div>
                  {else}
                    <a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}{$url_split_char}step|c_{$cid}|s_{$product.next_build_step.step_id}|sc_{$product.build_group}|pr_{$prod.prod_id}" class="btn btn-primary">View Options</a>
                  {/if}
                </div>
              </section>
            </li>
          {/foreach}
        </ul>
    </div>
  {/if}
</div>

{include file="_bottom.tpl"}
{array_debug}