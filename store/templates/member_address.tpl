{include file="_top.tpl"}

<h1>Shipping Addresses</h1>
<div class="row"> 
  {assign var="del" value="0"}
  <div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
    {foreach from=$valid item=alias}
      <div class="row"
        <section class="address">
          <div class="col-xs-4">
            <strong>{$alias.alias}</strong>
          </div>
          <div class="col-xs-4">
            <p>{$alias.ship_name} {$alias.ship_lastname}</p>
          </div>
          <div class="col-xs-4">
            <a href="/member_address_edit/{$alias.uship_id}">Edit</a>
            {if $del}&nbsp;|&nbsp;<a href="/member_address_del/{$alias.uship_id}">Delete</a>{/if}
          </div>
        </section>
      </div>
      {assign var="del" value="1"}
    {/foreach}
    <div class="mar_top10 mar_btm">
      <input type="button" name="add_address" value="+ Add a new address" class="button medium style2 btn btn-default" onclick="javascript: parent.location='/member_address_edit';" />
    </div>
  </div>
  <div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
    {include file="member_links.tpl"}
  </div>
</div>
{include file="_bottom.tpl"}