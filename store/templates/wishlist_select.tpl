{include file="_top.tpl"}

<h1>Select Wishlist</h1>

<div class="form-container">

 {if $valid.return == '1'}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
 {/if}

 <form method="post" action="index.php" name="checkout" role="form">
 <input type="hidden" name="action" value="WishlistSelect">

 <fieldset>
  <legend>Wishlist Selection</legend>

  <div>Please select which wishlist you would like to add your items to:</div>
  <div class="row">
    <div class="col-sm-8 col-md-6">
      <div class="form-group">
       <label for="name">&nbsp;</label>
       <select class="form-control" name="wishlist">
        <option value="">-- Select Wishlist --</option>
        {foreach from=$wishlists item="list" key="key"}
         <option value="{$list.id}">{$list.name}</option>
        {/foreach}
       </select>
      </div>
    </div>
  </div>
 </fieldset>

 <div class="buttonrow"><input type="submit" name="submit" value="Continue" class="btn btn-default" /></div>

 </form>

</div>

{include file="_bottom.tpl"}