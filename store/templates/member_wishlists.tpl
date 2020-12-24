{include file="_top.tpl"}

<h1>Your Wishlists</h1>

<div class="wishlist col-md-8 col-md-push-4 col-lg-9 col-lg-push-3">
  <div class="row lead hidden-xs">
     <div class="col-sm-3">Wishlist Name</div>
     <div class="col-sm-3">Description</div>
     <div class="col-sm-2">Expires</div>
     <div class="col-sm-2"># of Items</div>
     <div class="col-sm-2">Remove</div>
  </div>

{assign var="del" value="0"}
{foreach from=$valid item=wishlist}
 <div class="row mar_btm">
  <div class="col-sm-3"><a href="/member_wishlist/{$wishlist.id}">{$wishlist.name}</a></div>
  <div class="col-sm-3">{$wishlist.description}</div>
  <div class="col-sm-2"><strong class="visible-xs">Expires: </strong>{$wishlist.expiration_date|date_format:"%B %e, %Y"}</div>
  <div class="col-sm-2"><strong class="visible-xs"># of Items: </strong>{$wishlist.count}</div>
  <div class="col-sm-2">{if $del}[<a href="/member_wishlist_del/{$wishlist.id}">Delete</a>]{else}&nbsp;{/if}{assign var="del" value="1"}</div>
 </div>
{/foreach}
   <div class="row mar_btm">
      <div class="col-xs-12">
         <input type="submit" name="submit" value="+ Add a wishlist" class="btn btn-default" onClick="window.location='/member_wishlist'">
      </div>
   </div>
</div>
<div class="col-md-4 col-md-pull-8 col-lg-3 col-lg-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}