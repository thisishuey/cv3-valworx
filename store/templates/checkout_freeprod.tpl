{include file="_top.tpl"}

<h1>Select Your Free Product</h1>

<div class="form-container">

{if $cgmsg != ''}
  <div class="messages">
    <b>You have received the following promotion(s):<br />{$cgmsg}</b>
  </div>
{/if}

{if $freeprod_message != ''}
  <div class="errors">
    <p><em>{$freeprod_message}</em></p>
  </div>
{/if}

<form method="post" action="index.php" name="ship_form"> 
<input type="hidden" name="action" value="CheckoutFreeProd" />

  <fieldset><legend>{if $giveprodsprice > 0}Choose product(s) for ${$giveprodsprice} each:{else}Please select your free product(s):{/if}</legend>

  {section name=fp start=0 loop=$numfreeprods}
    {assign var="index" value=$smarty.section.fp.index}
    <div class="form-group">
      <select class="formtext form-control" name="freeprod_{$index}" >
        {if $giveprodsprice > 0}
          <option label="No Thanks" value="">No Thanks</option>
        {/if}
        {html_options options=$giveprods.$index}
      </select>
    </div>
  {/section}

  <div class="buttonrow">
    <input type="submit" name="submit" value="Continue &gt;" class="btn btn-primary" />
  </div>

</fieldset>
</form>
</div>

{include file="_bottom.tpl"}