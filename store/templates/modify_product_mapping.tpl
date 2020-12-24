{include file="_top.tpl"}

<h1>Recipient Selection</h1>

<div class="recipients">
  <p class="legend">Please match each item in your cart with the desired recipient.</p>

  <form method="post" action="index.php" name="recipients"> 
    <input type="hidden" name="action" value="ModifyProductMapping" />

    {counter name="rec_cntr" assign=cntr}
    <div class="lead row hidden-xs">
      <div class="col-sm-6">Products{if $recipient_mapping != ''} for {$recipient_mapping}{/if}:</div>
      <div class="col-sm-3">Ship To:</div>
      <div class="col-sm-3">Or, Add a New Recipient:</div>
    </div>
    {foreach from=$items.list key=prod_key item=prod}
    <div class="panel panel-default mar_btm">
      <div class="panel-body">
      <div class="table-item col-sm-6 mar_btm">
        <div class="row">
          <div class="col-xs-6">
            {if $prod.web_image}<img src="{$prod.web_image|img_prefix}" alt="{$prod.name|replace:'& ':'&amp; '}" class="table-image img img-responsive" />{/if}
          </div>
          <div class="col-xs-6">
            {$prod.name}
          </div>
        </div>
      </div>
      <div class="table-product col-sm-3 mar_btm">
        <label class="visible-xs">Ship To:</label>
        <select class="form-control" name="recipient_mapping_{$prod_key}">
          {foreach from=$possible_mappings.recipients item=recipient key=recipient_key}
          <option value="{$recipient_key}" label="{$recipient}" {if $prod.recipient_mapping == $recipient_key}selected{/if}>{$recipient}</option>
          {/foreach}
        </select>
      </div>
      <div class="table-recipient col-sm-3 mar_btm">
        <label class="visible-xs">Or, Add a New Recipient:</label>
        <input class="form-control" type="text" name="new_recipient_mapping_{$prod_key}" />
      </div>
      <!-- <div class="border-btm clearfix"> -->
      </div>
    </div>
   {/foreach}

   <div class="buttonrow mar_btm">
     <input type="submit" name="submit" value="Reassign Products" class="btn btn-primary" />
   </div>

 </form>

</div>

{include file="_bottom.tpl"}