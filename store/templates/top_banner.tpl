{*array_debug*}

{**
{literal}
<script type='text/javascript'>

$(function(){
 set_cookie('supress_banner', 2, 1);
});

function set_cookie(c_name,value,exdays) {
 var exdate=new Date();
 exdate.setDate(exdate.getDate() + exdays);
 var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
 document.cookie=c_name + "=" + c_value;
}
</script>
{/literal}
**}

{**if $view != 'checkout' && $view != 'checkout_shippingaddress' && $view != 'checkout_shipping' && $view != 'checkout_display' && $view != 'checkout_billing' && $view != 'checkout_confirmation' && $view != 'checkout_thanks' && $view != 'checkout_addressconfirm' && !$smarty.cookies.supress_banner**}

{if $view != 'checkout' && $view != 'checkout_shippingaddress' && $view != 'checkout_shipping' && $view != 'checkout_display' && $view != 'checkout_billing' && $view != 'checkout_confirmation' && $view != 'checkout_thanks' && $view != 'checkout_addressconfirm'}

  {if $smarty.now|date_format:"%Y%m%d%H%M" > '202006220000' && $smarty.now|date_format:"%Y%m%d%H%M" < '202007060000'}
    <div id="top_banner">
        {* SET TOP BANNER LINK & TEXT BELOW *}
  <a href="/category/high-performance-butterfly-valves-wafer" target="new" title="New! High Performance Butterfly Valves. Click for details"><b>New! High Performance Butterfly Valves. Click for details</b></a>


    </div>
  {/if}

{/if}


