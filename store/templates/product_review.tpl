{if $rating != '' || $rating == '0'}
    {if $ratingcount == ''}
        {assign var="ratingcount" value="1"}
    {else}
        {math equation="y+x" y=$ratingcount x="1" assign="ratingcount"}
    {/if}
    {if $rating < .33}
        <img src="{$img_prefix}/images/rating000.png" alt="Review star icon" />
    {elseif $rating < .75}
        <img src="{$img_prefix}/images/rating050.png" alt="Review star icon" />
    {else}
        <img src="{$img_prefix}/images/rating100.png" alt="Review star icon" />
    {/if}
    {if !$rating_max}
        {assign var=rating_max value=5}
    {/if}
    {if $ratingcount < $rating_max}
        {math equation="y-x" y=$rating x="1" assign="rating"}
        {include file="product_review.tpl" rating=$rating ratingcount=$ratingcount}
    {/if}
{else}
    {if $product.reviews.num > 0}
        <div class="prod-rating">
            <a href="#reviews" onclick='activate_tab("section3");return true;'>{include file="product_review.tpl" rating=$product.reviews.rating} <span>({$product.reviews.num} reviews)</span></a>
        </div>
        {if $view != 'category'}
            <div class="review_links pull-left">
                <div>
                    {*<a href="#reviews" onclick='activate_tab("section3");return true;'>Read Reviews</a>
                    <span>&nbsp;|&nbsp;</span>*}
                    <a class="text-uppercase" href="/create_review/{$prod_id}/{if $var2 != ''}{$var2}{else}{$var1}{/if}">Write a Review</a>
                </div>
            </div>
        {/if}
    {else}
        {if $view != 'category'}
            <div class="review_links">
                <div><a class="text-uppercase" href="/create_review/{$prod_id}/{if $var2 != ''}{$var2}{else}{$var1}{/if}">Write a Review</a></div>
            </div>
        {/if}
    {/if}
{/if}