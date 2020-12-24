<div id="left_column" class="hidden-xs hidden-sm col-md-3 pull-left">
    {if $view == checkout || $view == checkout_billing || $view == checkout_payment || $view == checkout_shippingdetailk || $view == checkout_thanks || $view == checkout_confirmation || $view == checkout_shipping || $view == express_order || $view == express_info || $view == checkout_fpinfo || $view == checkout_freeprod || $view == checkout_shippingdetail || $view == quickbuy_confirm || $view == checkout_shippingaddress || $view == checkout_display || $view == viewcart_freeprod || $view == ship_calculator || $view == checkout_addressconfirm}
        {include file="checkout_minicart.tpl"}
    {else}
        {*include file="category_filter.tpl"*}
        {include file="category_menu.tpl" forpos='left'}
        <a href="https://www.pressureworx.com" target="_blank" title="Pressureworx- Pressure Gauges and Regulators"><img src="{$img_prefix}/images/Pressureworxsidebar.png" alt="Pressureworx Sidebar" width="100%">
        </a>
        <br>
        <div class="nwsl-social-wrapper">
            <div class="lnav-nwsl">
                <p>Sign up to receive <a href="https://us1.campaign-archive.com/home/?u=c303bbf8f80d9b0078e73abdf&id=7a4a488edc" target="new">newsletters:</a></p>
                {include file="newsletter.tpl"}
            </div>
            <div class="lnav-social">
                <a href="http://www.youtube.com/valworx" target="new" id="youtube"><img src="{$img_prefix}/images/icon_youtube.png" alt="YouTube" /></a>
                <a href="http://www.facebook.com/valworxvalves" target="new" id="facebook"><img src="{$img_prefix}/images/icon_facebook.png" alt="FaceBook"></a>
                <a href="http://www.linkedin.com/company/valworx-inc-" target="new" id="linkedin"><img src="{$img_prefix}/images/icon_linkedin.png" alt="LinkedIn" /></a>
                <a href="https://twitter.com/valworxvalves" target="new" id="twitter"><img src="{$img_prefix}/images/icon_twitter.png" alt="Twitter" /></a>
            
            </div>
        </div>
        <div class="lnav-custserv ">
            <div id="custserv">
                <a href="/category/customer-service" title="Customer Service" ><img src="{$img_prefix}/images/customer_service_100.png" alt="Customer Service">Customer<br>Service</a>
            </div>
            <div id="techsupport">
                <a href="/category/technical-support" title="Technical Support"><img src="{$img_prefix}/images/technical_support_100.png" alt="Technical Support">Technical<br>Support</a>
            </div>
        </div>
        {*include file="global_filter.tpl"*}
        <div id="lnav_promoimage" >
            {include file="sidebar_rotator.tpl"}
{*<!--             <a href="/shipping" title="Free Shipping" ><img src="{$img_prefix}/images/sidebar-ads/ups-free-shipping.jpg" alt="Free Shipping"></a>         -->*} 
        </div>
        {if $view == product && $product.cust_11}
            <section id="quicklinks">
                <header><h2>Quick Links</h2></header>
                {$product.cust_11}
            </section>
        {/if}
        {if $view == category && $categories.$cid.cust_1 != ''}
            <section id="quicklinks">
                <header><h2>Quick Links</h2></header>
                {$categories.$cid.cust_1}
                </section>
        {/if}
        {if $view != category && $view != product}
            <section id="quicklinks">
                <header><h2>Quick Links</h2></header>
                <a href="/category/actuated-ball-valve">Actuated Ball Valve</a><br />
                <a href="/category/automated-valve">Automated Valve</a><br />
                <a href="/category/electric-ball-valve">Electric Ball Valve</a><br />
                <a href="/category/motorized-ball-valve">Motorized Ball Valve</a><br />
                <a href="/category/pneumatic-actuator-valves">Pneumatic Actuator Valve</a><br />
                <a href="/category/actuated-valve">Actuated Valve</a><br />
                <a href="/category/motor-operated-valve">Motor Operated Valve</a><br />
                <a href="/category/valvestore">Valve Store</a><br />
                <a href="/category/3-way-valve">3-Way Valve</a><br />
                <a href="/category/butterflyvalve">Butterfly Valve</a><br />
                

            </section>
        {/if}
        {*include file="shopbyprice_menu.tpl"*}
        {*include file="display_product_group.tpl" products=$recently_viewed label="Recently Viewed"*}
    {/if}
</div>