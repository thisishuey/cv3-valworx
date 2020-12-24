{include file="_top.tpl"}

<h1>Store Locator</h1>

<div class="form-container">
 <form method="get" action="/store_locator/" role="form">

   <fieldset>
    <legend>Search for a Store</legend>
    <div class="row">
      <div class="col-xs-6  col-sm-4">
        <div class="form-group">
         <label for="city">City:</label>
         <input class="form-control" type="text" name="city" value="{$smarty.get.city}">
       </div>
     </div>
     <div class="col-xs-6 col-sm-4">
      <div class="form-group">
       <label for="st">State/Province:</label>
       <select class="formtext_store form-control" name="st" id="state">
        <option value="">-- Select a State --</option>
        <option value="all"{if $smarty.get.st == 'all'} selected{/if}>All Stores</option>
        {html_options options=$options.state selected=$smarty.get.st}
      </select>
    </div>
  </div>
  <div class="col-xs-6 col-sm-4">
    <div class="form-group">
     <label for="zip">Zip Code:</label>
     <input class="form-control" type="text" name="zip" value="{$smarty.get.zip}">
   </div>
 </div>
</div>
</fieldset>

<div class="buttonrow">
  <input type="submit" name="store_locator_submit" value="Search" class="btn btn-primary">
</div>

</form>
</div>

{* Include this only after the submit button has been pressed *}
{if isset($smarty.get.store_locator_submit)}
{include file="store_locator_search.tpl"}
{/if}

<script type="text/javascript">
// If "All Stores" is chosen from the state dropdown, clear the city and zip fields
{literal}
$('input[name="store_locator_submit"]').click(function() {
  if ($('select[name="st"]').val() == 'all') {
    $('input[name="city"]').val('');
    $('input[name="zip"]').val('');
  }
});
{/literal}
</script>

{include file="_bottom.tpl"}