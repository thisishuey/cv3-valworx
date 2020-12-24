</div><!-- END #content -->
<!-- SIDE NAV COLUMN -->	
{include file="left_column.tpl"}

<div class="clearfix"></div>
{*
<section id="newsletter-block" class="col-xs-12">
    <div class="row">
        <div class="column1 iefix col-sm-8 col-xs-12">
            <h3>Sign up for our Email Newsletter</h3>
            {include file="newsletter.tpl"}
        </div> 
        <div class="column2 iefix col-sm-4 col-xs-12">
            <h3>Connect</h3>
            <div id="shrlnk">
                <a href="/" target="_blank" title="{#store_name#} on facebook"><img src="{$img_prefix}/images/facebook.png"></a>
                <a href="/" target="_blank" title="{#store_name#} on twitter"><img src="{$img_prefix}/images/twitter.png"></a>
                <a href="/" target="_blank" title="{#store_name#} on youtube"><img src="{$img_prefix}/images/youtube.png"></a>
                <a href="/" target="_blank" title="{#store_name#} on pinterest"><img src="{$img_prefix}/images/pinterest.png"></a>
            </div>
        </div>
    </div>
</section>*}

</div><!-- END #main -->



</div><!-- END #container -->
<!-- FOOTER CONTENT -->
{*<!-- {if $view!='checkout' && $view!='checkout_shippingaddress' && $view!='checkout_freeprod' && $view!='checkout_addressconfirm' && $view!='checkout_display' && $view!='checkout_billing' && $view!='checkout_confirmation' && $view!='checkout_thanks'}{ -->*}

    {include file="footer.tpl"}
    {include file="mailchimp_signup.tpl"}
    {include file="bing_ads_tracking.tpl"}

{*<!-- {/if} -->*}
<!-- EXTRA JS -->
{include file="extra-js.tpl"}

<!-- Email sign up popup  -->
 {*{if $view == 'index' }{include file="newsletter-popup.tpl"} {/if}*}

</body>
<!--{$meta.post_comment}-->
</html>
