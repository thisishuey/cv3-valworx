<header id="header" class="clearfix">
  <div class="mobile-header row hidden-sm hidden-md hidden-lg">
      <div class="visible-xs col-xs-4">
        <a href="#menu" class="menu-icon"><span class="glyphicon glyphicon-menu-hamburger"></span> Menu</a>
        {include file="mobile_side_menu.tpl"}
      </div>
      <div class="visible-xs col-xs-4 text-center">
          <a href="/viewcart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a>
      </div>
      <div class="visible-xs col-xs-4 text-right">
          <a href="javascript:slideSearch();"><span class="glyphicon glyphicon-search"></span> Search</a>
      </div>
      <!-- Logo for mobile -->
      <div class="mobile-logo visible-xs col-xs-12">
          <figure class="figure_align">
              <a href="/" title="{#store_name#}"><img src="{$img_prefix}/images/valworx-red.png" alt="{#store_name#}" title="{#store_name#}" class="img-responsive center-block"></a>
          </figure>
      </div>
    </div>
   {include file="minicart.tpl"}
    <div class="row">
      <!-- Logo for sm md lg -->
      <div class="hidden-xs col-sm-5 col-md-3 col-lg-3">
        <figure class="figure_align">
          <a href="/" title="{#store_name#}"><img src="{$img_prefix}/images/valworx-red.png" alt="{#store_name#}" title="{#store_name#}" class="img-responsive"></a>
        </figure>
      </div>
      <div class="ship-msg col-md-4 col-lg-4 hidden-xs hidden-sm header-mid">
      <div class="row">
        <div class='col-sm-7'>
          <a onclick="javascript:window.open('/sameday_shipping','popup','width=350,height=350,statusbar=no,toolbars=no,location=no,scrollbars=no,resizeable=no');" href="javascript:void(0);"><b>Free Shipping</b></a>  on orders over $99</span>
          <br>
          <span>Actuated Valves &amp; Controls</span> 
    <br>
   Built. Tested. Shipped. <b>Same Day.</b>
    <br><br>
          
          
          
        </div>
        <div class="col-sm-5">
          <a onclick="javascript:window.open('/iso_certification','popup','width=350,height=550,statusbar=no,toolbars=no,location=no,scrollbars=no,resizeable=no');" href="javascript:void(0);"><img src="{$img_prefix}/images/ISO9001B.png" width="100%"></a>
       </div> 
       </div>
      </div>
      <div class="col-sm-7 col-md-5">
        <div class="hidden-xs header-menu checkout_hide">
          <div id="hq" class="dropdown"><span>Have Questions?</span>
            <div id="hqlinks" class="dropdown-menu">
              <a href="/category/customer-service" class="iefix">Customer Service</a>
              <a href="/category/technical-support" class="iefix">Technical Support</a>
            </div>
          </div>
          |
          {if $memberinfo.id}<a href="/member" title="{#store_name#} My Account">My Account</a>{else}<a href="/member_login" title="{#store_name#} Account Login"> Login</a>{/if}
          |
         {include file="cart_count.tpl"}
        </div>      
        <div class="row">
          <div class="hidden-xs phone col-sm-12 text-right">
            1-800-511-0100
          </div>          
        </div>
      </div>
    </div>

  </header>
 <div class="clearfix"></div>

<div class="promo-banner checkout_hide">
  <div class="header-breadcrumb hidden-xs col-sm-7 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">{include file="breadcrumb.tpl"}</div>
  <div id="mobile-search" class="mobile-search col-xs-12 col-sm-5 col-md-3 col-lg-3 pull-right">{include file="sitesearch.tpl"}</div>
</div>