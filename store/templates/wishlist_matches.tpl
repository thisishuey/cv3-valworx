{include file="_top.tpl"}

<h1>Wishlist Search</h1>

<form method="post" action="index.php" style="margin:0px;padding:0px;" role="form"> 
<input type="hidden" name="action" value="WishlistSearch">

 <div class="wishlist clearfix">

  <div class="row lead">
   <div class="col-xs-3 col-sm-3">Name</div>
   <div class="col-xs-4 col-sm-3">Location</div>
   <div class="col-xs-5 col-sm-6">Description</div>
  </div>

 {foreach from=$matches item=match}
  <div class="row mar_btm">
   <div class="col-xs-3 col-sm-3"><a href="/wishlist/{$match.id}">{$match.first_name} {$match.last_name}</a></div>
   <div class="col-xs-4 col-sm-3">{$match.city}, {$match.state}</div>
   <div class="col-xs-5 col-sm-6">{$match.description}</div>
  </div>
  {/foreach}

 </div>

</form>

{include file="_bottom.tpl"}