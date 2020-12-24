{if $product.prev != $product.prod_id && $product.next != $product.prod_id && $product.prev != '' && $product.next != ''}
<div class="row">
  <div class="col-md-6">
    <div class="pull-left"><a href="/product/{$product.prev}{$url_split_char}{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}" class="btn btn-default">&laquo; previous</a></div>
  </div>
  <div class="col-md-6">
    <div class="pull-right"><a href="/product/{$product.next}{$url_split_char}{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}" class="btn btn-default">next &raquo;</a></div>
  </div>
</div>
{/if}