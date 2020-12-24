{include file="_top.tpl"}

<h1>Wishlist Search</h1>

<div class="form-container">

{if $valid.return == '1'}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
{/if}

{if $error == "e"}
 <div class="errors"><p>You do not have access to view that wishlist.</p></div>
{elseif $error == "y"}
 <div class="errors"><p>Your search returned 0 results.</p></div>
{elseif $error == "i"}
 <div class="errors"><p>You must complete both fields.</p></div>
{/if}

 <p class="legend"><strong>Note:</strong>* Indicates a required field</p>

<form method="post" action="index.php" name="checkout" role="form"> 
<input type="hidden" name="action" value="WishlistSearch">

 <fieldset>
  <legend>Wishlist Information</legend>

  <div class="form-group">
   <label for="last_name"><span class="req">*</span> Last Name or E-mail:</label>
   <input type="hidden" value="y" name="last_name">
   <input class="form-control" type="text" name="last_name" value="{$valid.last_name}" id="last_name" />
  </div>
 {if $require_zip == 'y'}
  <div class="form-group">
   <label for="zip"><span class="req">*</span> Zip Code:</label>
   <input type="hidden" value="y" name="zip">
   <input class="form-control" type="text" name="zip" value="{$valid.zip}" id="zip" />
  </div>
 {/if}

 </fieldset>

 <div class="row">
  <div class="col-xs-12">
    <input type="submit" name="submit" value="Submit" class="btn btn-default">
  </div>
</div>

</form>

</div>

{include file="_bottom.tpl"}