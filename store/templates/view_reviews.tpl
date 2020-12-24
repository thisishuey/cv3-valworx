{include file="_top.tpl"}

<div class="page-header">
  <h1>View Product Reviews</h1>
</div>

<div class="row">
  <div class="col-md-6 col-sm-6 col-xs-12">
    <h2>{$product.sku} - {$product.prod_name}</h2>
    <p>{$product.description}</p>
    <a href="/product/{$prod_id}{$url_split_char}{$cid}" class="btn btn-default">&laquo; Return to product</a>
  </div>
  <div class="col-md-6 col-sm-6 col-xs-12 text-center">
    <img src="{$product.web_image|img_prefix}" class="img-thumbnail">
  </div>
</div>

<div class="row">
  <div class="col-md-12">
    {foreach from=$reviews item=rev}
      <h3>{$rev.title} {include file="product_review.tpl" rating=$rev.rating}</h3>
      <p class="text-muted"><em>{$rev.date_created|date_format}&nbsp;&nbsp;|&nbsp;&nbsp;Posted By {$rev.creator_name} from {if $rev.city != ''}{$rev.city},{/if} {$rev.state} {$rev.country}</em></p>
      <div class="well">
        <p>{$rev.comments}</p>
        {if $rev.owner_comments != ''}
            <div class="alert alert-info" role="alert">
              {$rev.owner_comments}
            </div>
        {/if}
        {if $settings.customer_review_rating == 'y'}
          <p>Was this review helpful?</p>
          <form method="post" action="index.php" name="review_vote{$rev.id}" class="inline">
            <input type="hidden" name="action" value="ReviewVote" />
            <input type="hidden" name="review_id" value="{$rev.id}" />
            <input type="hidden" name="vote_type" value="" />
              <a href="javascript:void(0);" onclick="javascript: document.review_vote{$rev.id}.vote_type.value='yes'; document.review_vote{$rev.id}.submit();">
                <span class="glyphicon glyphicon-thumbs-up"></span>{$rev.yes_vote}
              </a> &nbsp;
              <a href="javascript:void(0);" onclick="javascript: document.review_vote{$rev.id}.vote_type.value='no'; document.review_vote{$rev.id}.submit();">
                <span class="glyphicon glyphicon-thumbs-down"></span>{$rev.no_vote}
              </a>
          </form>
        {/if}
      </div>
    {/foreach}
  </div>
</div>

{include file="_bottom.tpl"}