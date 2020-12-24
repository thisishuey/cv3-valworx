{if $freeprod_message != ''}
<div class="errors alert alert-warning">
  <b>{$freeprod_message}</b>
</div>
{/if}
{if $numfreeprods > 0 && $giveprods|@count > 0 && !empty($giveprods.0)}
<div id="freeprod">
  <form method="post" action="index.php" name="ship_form" role="form"> 
    <input type="hidden" name="action" value="CheckoutFreeProd" />
    <div class="mar_btm">
      {if $giveprodsprice > 0}
      Choose product(s) for ${$giveprodsprice} each:&nbsp;
      {else}
      Please select your free product(s):&nbsp;
      {/if}
    </div>
    <div class="mar_btm">
      {section name=fp start=0 loop=$numfreeprods}
      {assign var="index" value=$smarty.section.fp.index}
      <div class="form-group">
        <select class="form-control form-text" name="freeprod_{$index}">
          <option label="No Thanks" value="">No Thanks</option>
          {html_options options=$giveprods.$index}
        </select>
      </div>
      {/section}
    </div>
    <div>
      <input type="submit" name="submit" value="{if $giveprodsprice > 0}Add Product(s){else}Add Free Product(s){/if}" class="btn btn-default" />
    </div>
  </form>
</div>
{/if}