{include file="_top.tpl"}

<h1>Downloads</h1>

{if $error != ''}
 <div class="normaltext" align="center"><b>{$error}</b></div><br />
{/if}

<div class="downloads-wrapper col-sm-8 col-sm-push-4 col-md-9 col-md-push-3 mar_btm">

<div class="row lead hidden-xs">
  <div class="col-sm-2">Order #</div>
  <div class="col-sm-3">Date Ordered</div>
  <div class="col-sm-3">Description</div>
  <div class="col-sm-2">Expires</div>
  <div class="col-sm-2">Download</div>
</div>

{if $list|@count < 1}
  <div class="messages"><p><em>There are no available electronic products.</em></p></div>
{/if}

{foreach from=$list key=key item=download}
  {cycle values="#ffffff,#f0ecd1" assign=bgcol}
<div class="row" style="background: {$bgcol};">
  <div class="col-sm-2"><strong class="visible-xs">Order #: </strong>{$download.order_id}</div>
  <div class="col-sm-3"><strong class="visible-xs">Date Ordered: </strong>{$download.date_ordered|date_format:"%B %e, %Y"}</div>
  <div class="col-sm-3"><strong class="visible-xs">Description: </strong>{$download.description}</div>
  <div class="col-sm-2"><strong class="visible-xs">Expires: </strong>{$download.expiration_note}</div>
  <div class="col-sm-2">
      {if $download.expired == 'n'}
        [<a href="/electronic_download/{$download.id}/{$type}">Download</a>]
      {else}
        Not Available
      {/if} 
  </div>
</div>
{/foreach}

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
{if $type == 'm'}
 {include file="member_links.tpl"}
{/if}
</div>
{include file="_bottom.tpl"}