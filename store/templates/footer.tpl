<div class="footerbg">
    <footer id="footer">
    <section class="footer-top hidden-xs">
        <div class="container">
            <div class="row footer-header">
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <h4>Products</h4>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <h4>Connect</h4>
                </div>

            </div>
        </div>
    </section>

    <section class="footer-mid">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-8 col-xs-12" id="productlink">
                 <h4 class="visible-xs">Products</h4> 
                    <div class="footcat">
                        {counter start=0 assign=catcount}
                        {foreach from=$categories key=key item=category}
                            {if $category.parent == '' && $category.inactive != 'y'}
                                {if $catcount == 5 || $catcount == 10}</div><div class="footcat">{/if}
                                <a href="/category/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}">{$category.name|replace:"& ":"&amp; "}</a><br />
                                {counter assign=catcount}
                            {/if}
                        {/foreach}
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <h4 class="visible-xs">Connect</h4> 
                    <div class="footer-social">
                        <a href="http://www.youtube.com/valworx" target="new" id="youtube"><img src="{$img_prefix}/images/icon_youtube.png" alt="YouTube" /> &nbsp; </a>
                <a href="http://www.facebook.com/valworxvalves" target="new" id="facebook"><img src="{$img_prefix}/images/icon_facebook.png" alt="FaceBook" /> &nbsp;</a>
                <a href="http://www.linkedin.com/company/valworx-inc-" target="new" id="linkedin"><img src="{$img_prefix}/images/icon_linkedin.png" alt="LinkedIn" />  &nbsp;</a>
                <a href="https://twitter.com/valworxvalves" target="new" id="twitter"> <img src="{$img_prefix}/images/icon_twitter.png" alt="Twitter" /> &nbsp; </a>
              <!--  <a href="https://plus.google.com/116206402407524412848" target="new" id="googleplus"><img src="{$img_prefix}/images/icon_googleplus.png" alt="Google Plus" />  </a> -->
                    </div>
                    <div class="footer-link">
                         <br>
                         <a href="/category/customer-service" title="Customer Service" > Customer Service</a><br>
                         <a href="/category/technical-support" title="Technical Support"> Technical Support</a><br><br>
                    </div>
                    <div class="footer-nwsl">
                        {include file="newsletter.tpl"}
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12" id="copyright">
                    <div class="footersiteseal col-xs-12 col-sm-2 mar_top10">
                        {*<span id="siteseal"><script type="text/javascript" src="https://seal.starfieldtech.com/getSeal?sealID=ctOQcw0SmHYf9L07QvRdXRIufwzbW2qH042ZXKP6QxoLbXmIAybTmto25"></script></span>*}
<script language="JavaScript" type="text/javascript">
TrustLogo("{$img_prefix}/images/comodo_ssl.png", "CL1", "none");
</script>
<a  href="https://ssl.comodo.com" id="comodoTL">Comodo SSL</a>
                    <img src="{$img_prefix}/images/spacer.gif" height="1" width="60">
                    </div>
                    <div class="footer-links col-xs-12 col-sm-10 mar_top10">
                        <p>
                        © {$smarty.now|date_format:"%Y"} Valworx Inc., All Rights Reserved.</a>{if !$smarty.session.mobile}&nbsp; | &nbsp;{else}<br>{/if}
                       <a href="/terms-and-conditions">Terms and Conditions</a>&nbsp; | &nbsp;
                       <a href="/privacy">Privacy</a>&nbsp; | &nbsp;
                       <a href="/safety">Safety</a>&nbsp; | &nbsp;
                       <a href="http://www.bbb.org/charlotte/business-reviews/valves/valworx-in-cornelius-nc-283557" target="_new">BBB Accredited Business</a>
                   </p>
                </div>
            </div>
        </div>
    </section>
        {*<!-- <div class="meta_post_body">{$gateway_links}</div>
        <div class="meta_post_body">{$meta.post_body}</div> -->*}
    </footer>
</div>