{***** swap out with above for live site
<link rel="stylesheet" href="/jquery_mmenu_all.css" type="text/css" />
<script type="text/javascript" src="/jquery_mmenu_min_all.js"></script>
<script type="text/javascript" src="/downloads/js-libs/bootstrapmin.js"></script>
*****}
<link rel="stylesheet" href="{$cdn_path.prefix}/jquery_mmenu_all{$cdn_path.css_postfix}" type="text/css" />
<script type="text/javascript" src="{$cdn_path.prefix}/jquery_mmenu_min_all{$cdn_path.js_postfix}"></script>
<script type="text/javascript" src="{$cdn_path.prefix}/downloads/js-libs/bootstrapmin.js"></script>

 {if $rejoiner_enable == 'y'}
   {include file="rejoiner.tpl"}
 {/if}

{* JS for dropdown *}
{* CODE UPDATED WITH .MOUSEENTER/.MOUSELEAVE AND TIMEOUT TO FIX STUCK HOVER ON MENU WITH PAGELOAD *}
{if !$smarty.session.mobile}
	{literal}
    	<script type='text/javascript'>
    		$(function(){
        		$(".dropdown").mouseenter(
               		 function() {
                    	var el = this;
                    	var timeoutId = setTimeout(function() {
                    		$('.dropdown-menu', el).stop(true, true).fadeIn("fast");
                      	$(el).addClass('open');
                    		$('b', el).toggleClass("caret caret-up");
                    	}, 125);
                    	$(this).data("timeoutId", timeoutId);
        			}).mouseleave(
                		function() {
                    		clearTimeout($(this).data("timeoutId"));
                    			$('.dropdown-menu', this).stop(true, true).fadeOut("fast");
                    			$(this).removeClass('open');
                    			$('b', this).toggleClass("caret caret-up");
        		});
			});
    	</script>
    {/literal}
{/if}

{* NAV TABS TO ACCORDION FOR TABLET/MOBILE *}
{if $view == product}
<script type='text/javascript'>
{literal}
  $('#product_tabs').tabCollapse({
      tabsClass: 'hidden-sm hidden-xs',
      accordionClass: 'visible-sm visible-xs'
  });
{/literal}
</script>
{/if}

{if $view == product}
  {*** CODE FOR LIGHTBOX POPUP ***}
<link rel="stylesheet" href="/jquery_fancybox.css"  type="text/css" />
<script type="text/javascript" src="/fancybox_patched.js"></script>
{***** swap out with above for live site
  <link rel="stylesheet" href="{$cdn_path.prefix}/jquery_fancybox{$cdn_path.css_postfix}" type="text/css" />
  <script type="text/javascript" src="{$cdn_path.prefix}/fancybox_patched{$cdn_path.js_postfix}"></script>
*****}

  <script type="text/javascript">
    $(document).ready(function() {ldelim}
                $(".fancybox").fancybox({ldelim}
                        'width' : 'auto',
                        'height': 'auto',
                        'autoScale': false,
                        'scrolling': 'no',
                        'autoDimensions': true,
                        'showCloseButton': true,
                        'autoScale': true,
                        'fitToView': true,
                         'autoResize': true,
                        //'autoSize': true,
                        //'autoWidth': true,
                        //'autoHeight': true,
                        {rdelim});
    {rdelim});
    </script>

    {* POPUP JS *}
    <script type='text/javascript'>
        function overlayImage(image) {ldelim}
            var altname = '{$name}';
            $('#image_overlay img#popup').attr({ldelim}
                src: image,
                alt: altname
        {rdelim});
            $("#fade, #image_overlay").show();
        {rdelim};
       
            $("#image_overlay, #close").click(function(){ldelim}
                $("#fade, #image_overlay").hide();
        {rdelim});
       
        $(".popup-img").click(function(e){ldelim}
            var popimg = $(this).attr('data-img');
            overlayImage(popimg);
            return false;
        {rdelim});
        $(".popup-link").click(function(e){ldelim}
            var popid = $(this).attr('data-id');
            var popimg = $("#" + popid).attr('data-img');
            overlayImage(popimg);
            return false;
        {rdelim});
    </script>

    {* PRODUCT TABS JS *}
        <script type='text/javascript'>
            $('#tab-row .tab').click(function(){ldelim}
                var pid = this.id.split('_')[2];
                activate_tab(this.id.split('_')[0], pid);
            {rdelim});

            function activate_tab(id, pid) {ldelim}
                $('.product_tabs_' + pid + ' .content').hide();
                $('#' + id + '_' + pid).show();
                $('.product_tabs_' + pid + ' .tab').removeClass('active');
                $('#' + id + '_tab_' + pid).addClass('active');
            {rdelim}

            $(function(){ldelim}
                activate_tab('{$smarty.get.tab|default:"section1"}', '{$prod_id}');
            {rdelim}); 
        </script>

    <script type='text/javascript'>
        $('form[name="product_form"]').submit(function() {ldelim}
            var qty = $('input[name="qty"]').val();
            var pass = false;
            if (typeof qty != 'undefined'){ldelim}
                pass = true;
                if (!$.isNumeric(qty)) {ldelim}
                    alert('Please enter a valid numerical quantity');
                    return false;
        {rdelim} else if (parseInt(qty) <= 0) {ldelim}
                    alert('Please enter a quantity greater than 0');
                    return false;
        {rdelim}
        {rdelim} else{ldelim} //must be a subproduct page
                $("[id^=qty]").each(function() {ldelim}
                    qty = $(this).val();
                    if ($.isNumeric(qty)) {ldelim}
                        pass = true;
        {rdelim}
        {rdelim});
        {rdelim}
            if (!pass){ldelim}
                alert('Please enter a valid numerical quantity');
                return false;
        {rdelim}
        {rdelim});
    </script>
{/if}

{* SLIDESHOW PLUGIN *}
{if $view == index}
    <script type="text/javascript">
        $(function() {ldelim}
        {*bootstrap carousel*}
            $('.carousel').carousel();
        {rdelim});
        function changeCaption(){ldelim}
            alert('hi');
        {rdelim}
    </script>

    {* newsletter popup script *}
    <script>
        $(function(){ldelim}
            var hasShown = getCookie("emailpopup");
            if (hasShown != 'shown') {ldelim}
                $('#npfade').show();
                $('#popcontainer').fadeIn(1000);
                //set_cookie('supress_ad', 1, 183);
                setCookie('emailpopup', 'shown', 7 * 24 * 60 * 60 * 1000);
        {rdelim} else{ldelim}
                /*$('#npfade').show();
                 $('#popcontainer').fadeIn(1000);*/
        {rdelim}
            $('#close, #npfade, #go').click(closeOverlay);
        {rdelim});
        function closeOverlay() {ldelim}
            $('#popcontainer').fadeOut(1000, function(){ldelim}
                $('#npfade').hide();
        {rdelim});
        {rdelim}
    </script>
{/if}

{* ADD 'ACTIVE' CLASS TO FIRST ITEM ONLY ON PAGE LOAD *}
{if $view == 'index'}
<script type="text/javascript">
$(document).ready(function () {ldelim}
	$(".carousel-fade .carousel-inner div").removeClass("active");
	$("#index .carousel-indicators li").removeClass("active");
	$('#Carousel').find('.item').first().addClass('active');
	$("#index .carousel-indicators li").first().addClass("active");
{rdelim});

</script>
{/if}

{* MOBILE - PULL OUT MENU AND SEARCH DROP DOWN *}
    {literal} 
        <script type='text/javascript'>
            function slideSearch() {
                if ($('#mobile-search').css('display') == 'none') {
                    $('#mobile-search').slideDown(600);
                }
                else {
                    $('#mobile-search').slideUp(600);
                }
            }
            $('nav#menu').mmenu();
        </script>
    {/literal}

{if $view == category || $view == 'prod_detail_list'}
<!-- GRID/LIST TOGGLE SCRIPT -->
<script type="text/javascript">
var delete_cookie = function(name) {ldelim}
document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
{rdelim};  

$(document).ready(function() {ldelim}
	$(function() {ldelim}
		var cc = $.cookie('list_grid');
		console.log(cc);
		if (cc == 'g' || cc == null) {ldelim}
			$('.display').removeClass('list');
		$('.display').addClass('grid');
		$('#listImg').attr('src','{$img_prefix}/images/list_off.png');
		$('#gridImg').attr('src','{$img_prefix}/images/grid_on.png');
		{rdelim} else {ldelim}console.log('yu');
		$('.display').removeClass('grid');
		$('.display').addClass('list');
		$('#listImg').attr('src','{$img_prefix}/images/list_on.png');
		$('#gridImg').attr('src','{$img_prefix}/images/grid_off.png');
		{rdelim}
		toggleGrid();
		{rdelim});
	$('#grid').click(function() {ldelim}
		$('.display').fadeOut(300, function() {ldelim}
			$(this).addClass('grid').fadeIn(300).removeClass('list');
			toggleGrid();
			$('#listImg').attr('src','{$img_prefix}/images/list_off.png');
			$('#gridImg').attr('src','{$img_prefix}/images/grid_on.png');
			delete_cookie('list_grid');
			$.cookie('list_grid', 'g');
			{rdelim});
		return false;
		{rdelim});
	$('#list').click(function() {ldelim}
		$('.display').fadeOut(300, function() {ldelim}
			$(this).removeClass('grid').fadeIn(300).addClass('list');
			toggleGrid();
			$('#listImg').attr('src','{$img_prefix}/images/list_on.png');
			$('#gridImg').attr('src','{$img_prefix}/images/grid_off.png');
			delete_cookie('list_grid');
			$.cookie('list_grid', 'l');
			{rdelim});
		return false;
		{rdelim});
	{rdelim});
var toggleGrid = (function() {ldelim}
	$('.display').find('li').each(function(index, value) {ldelim}
		if ($('.display').hasClass('grid')) {ldelim}
			$(value).removeClass('col-xs-12').addClass('col-lg-3 col-md-3 col-sm-6 col-xs-12');
		{rdelim} else {ldelim}
		$(value).removeClass('col-lg-3 col-md-3 col-sm-6 col-xs-12').addClass('col-xs-12');
		{rdelim}
		{rdelim});
	{rdelim});
</script>
<script>
    if( $.cookie('list_grid') === 'g')
        $("#gridImg").attr('src' , "{$img_prefix}/images/grid_on.png");
    else
        $("#listImg").attr('src' , "{$img_prefix}/images/list_on.png");
</script>
{/if}

{if $view == 'catalog_request' || $view == 'contact' || $view == 'member_address' || $view == 'member_wishlist'}
    <script type='text/javascript'>
        // Show State/Province when Country changed
        $('select#country').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showDomestic();
            else if ($(this).val() == 'Canada')
                showCanadian();
            else
                showInternational();
        {rdelim}).change();

        function showDomestic() {ldelim}
            $('#state').attr('name', 'state').show();
            $('#province, #ca_province').attr('name', '').hide();
        {rdelim}

        function showCanadian() {ldelim}
            $('#ca_province').attr('name', 'state').show();
            $('#province, #state').attr('name', '').hide();
        {rdelim}

        function showInternational() {ldelim}
            $('#province').attr('name', 'state').show();
            $('#state, #ca_province').attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{if $view == 'checkout_shippingaddress'}
    <script type='text/javascript'>
        // Show State/Province when Country changed

        {counter start=0 assign=num}
            {section name=shipscript loop=$ship_num}
            {counter}
            
        $('select#s_country{$num}').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showDomestic({$num});
            else if ($(this).val() == 'Canada')
                showCanadian({$num});
            else
                showInternational({$num});
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', this.value + '|' + document.getElementById('s_state{$num}').value + '|s_method{$num}');
        {rdelim}).change();

        $('select#s_state{$num}').change(function(){ldelim}
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', document.getElementById('s_country{$num}').value + '|' + this.value + '|s_method{$num}');
        {rdelim}).change();
        {/section}
        function showDomestic(num) {ldelim}
            $('#s_state' + num).attr('name', 's_state' + num).show();
            $('#province' + num + ', #ca_province' + num).attr('name', '').hide();
        {rdelim}

        function showCanadian(num) {ldelim}
            $('#ca_province' + num).attr('name', 's_state' + num).show();
            $('#province' + num + ', #s_state' + num).attr('name', '').hide();
        {rdelim}

        function showInternational(num) {ldelim}
            $('#province' + num).attr('name', 's_state' + num).show();
            $('#s_state' + num + ', #ca_province' + num).attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{if $view == 'checkout_billing' || $view == 'member_info' || $view == 'member_register' || $view == 'wholesale_register' || $view == 'wholesale_info' || $view == 'wholesale_address'}
    <script type='text/javascript'>
        // Show State/Province when Country changed (Billing)
        $('select#billing_country').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showBillingDomestic();
            else if ($(this).val() == 'Canada')
                showBillingCanadian();
            else
                showBillingInternational();
        {rdelim}).change();

        function showBillingDomestic() {ldelim}
            $('#billing_state').attr('name', 'billing_state').show();
            $('#billing_province, #ca_province').attr('name', '').hide();
        {rdelim}

        function showBillingCanadian() {ldelim}
            $('#ca_province').attr('name', 'billing_state').show();
            $('#billing_province, #billing_state').attr('name', '').hide();
        {rdelim}

        function showBillingInternational(num) {ldelim}
            $('#billing_province').attr('name', 'billing_state').show();
            $('#billing_state, #ca_province').attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{if $view == 'checkout_shipping'}
    <script type='text/javascript'>
        // Show State/Province when Country changed
        $('select#s_country1').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showDomestic();
            else if ($(this).val() == 'Canada')
                showCanadian();
            else
                showInternational();
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', this.value + '|' + document.getElementById('s_state1').value + '|s_method1');
        {rdelim}).change();

        $('select#s_state1').change(function(){ldelim}
            getInfo('limit_shipping_method', 'Shipping_Class', 'limitMethods', document.getElementById('s_country1').value + '|' + this.value + '|s_method1');
        {rdelim}).change();

        function showDomestic() {ldelim}
            $('#s_state1').attr('name', 's_state1').show();
            $('#province1, #ca_province1').attr('name', '').hide();
        {rdelim}

        function showCanadian() {ldelim}
            $('#s_state1, #province1').attr('name', '').hide();
            $('#ca_province1').attr('name', 's_state1').show();
        {rdelim}

        function showInternational() {ldelim}
            $('#province1').attr('name', 's_state1').show();
            $('#s_state1, #ca_province1').attr('name', '').hide();
        {rdelim}

        // Show State/Province when Country changed (Billing)
        $('select#billing_country').change(function(){ldelim}
            if ($(this).val() == 'United States')
                showBillingDomestic();
            else if ($(this).val() == 'Canada')
                showBillingCanadian();
            else
                showBillingInternational();
        {rdelim}).change();

        function showBillingDomestic() {ldelim}
            $('#billing_state').attr('name', 'billing_state').show();
            $('#billing_province, #ca_billing_province').attr('name', '').hide();
        {rdelim}

        function showBillingCanadian() {ldelim}
            $('#ca_billing_province').attr('name', 'billing_state').show();
            $('#billing_province, #billing_state').attr('name', '').hide();
        {rdelim}

        function showBillingInternational(num) {ldelim}
            $('#billing_province').attr('name', 'billing_state').show();
            $('#billing_state, #ca_billing_province').attr('name', '').hide();
        {rdelim}
    </script>
{/if}

{*literal}
<!-- Start of Async HubSpot Analytics Code -->
<script type="text/javascript">
(function(d,s,i,r) {
if (d.getElementById(i)){return;}
var n=d.createElement(s),e=d.getElementsByTagName(s)[0];
n.id=i;n.src='//js.hubspot.com/analytics/'+(Math.ceil(new Date()/r)*r)+'/208995.js';
e.parentNode.insertBefore(n, e);
})(document,"script","hs-analytics",300000);
</script>
<!-- End of Async HubSpot Analytics Code -->
{/literal*}

{if $smarty.session.floating_cart == 'y' && ($view != 'product_builder' || ($view == 'product_builder' && $product.build_complete == 'y'))}
    <script>
        var cptAdded = [];
        $(function(){ldelim}

            {* Track the CPT items that have been added to the cart and don't display them a 2nd time in the floating cart without refreshing the page *}
            {literal}
                $("#float_related_products input[name=addtocart_submit]").click(function(){
                    if ( $(this).parent().parent().find(".qty").val() > 0 ) {
                        cptAdded.push($(this).parent().parent().find(".qty").attr("id"));
                    }
                });
            {/literal}
            $('.addtocart_button, input[name=addtocart_submit]').click(function(e) {ldelim}
                if (optionCheck2($(this).closest('form')[0])) {ldelim}

                    {* THIS IS THE ADD MULTIPLE LOGIC ... Saving for a another day when this can be built in
                    var products = [];
                    var prod_id = $(this).closest('form').find('input[name=prod_id]').val();
                    var sku = $(this).closest('form').find('input[name=sku]').val();
                    var qty = $(this).closest('form').find('input[name=qty]').val();
                    if (qty < 1 || typeof qty === "undefined") {ldelim}
                    qty = $(this).find('input[name=qty]').val();
                    {rdelim}
                    if (qty > 0) {ldelim}
                    var prod = {ldelim}id:prod_id,sku:sku,qty:qty{rdelim};
                    products.push(prod);
                    {rdelim}
                    *}

                    var prod_id = $(this).closest('form').find('input[name=prod_id]').val();
                    $(this).closest('form').append('<input type="hidden" id="action_input_' + prod_id + '" name="action_forward" value="/floating_cart" />');
                    $.post('/', $(this).closest('form').serialize(), function(data) {ldelim}
                        buildFloatingCart(data);

                        {* Remove items from the CPT section that have already been added to the floating cart on this page view *}
                        {* If all items have already been added this page view, hide the CPT section *}
                        {literal}
                            for (i=0; i<cptAdded.length; i++) {
                                $("#float_related_products #"+cptAdded[i]).closest("li").remove();
                            }
                            if ($("#float_related_products li").length <= 0) {
                                $("#float_related_products").remove();
                            }
                        {/literal}

                        {if $settings.rejoiner_enable == 'y'}
                            setTimeout(function(){ldelim}
                                rejoinerSendCartData(data);
                            {rdelim}, 500);
                            setTimeout(function(){ldelim}
                                rejoinerSendCartItems(data);
                            {rdelim}, 250);
                        {/if}

                        $('#action_input_' + prod_id).remove();
                        location.href = "#minicart_a";
                    {rdelim}, 'json');
                {rdelim}
                return false;
            {rdelim});

            $('.minicart_exit').click(function(e){ldelim}
                e.preventDefault();
                $('#minicart_overlay_box').fadeOut('fast');
                return false;
            {rdelim});

        {rdelim});

        function buildFloatingCart(data) {ldelim}
            var minicart_count = 0;
            var show_prods = '';
            $.each(data.cart, function(index, prod){ldelim}
                show_prods += "<div class='minicart_product'>";
                 show_prods += "  <img src='" + prod.web_image + " ' width='60' border='0' align='left' />";
                show_prods += "  <div style='margin-left: 0px; margin-bottom: 5px; padding-left:10px' class='overlay_info'>";
                show_prods += "    <div><strong>" + prod.name + " " + prod.att_list + "</strong></div>";
                show_prods += "    <div>{$currency_type}" + prod.price + "</div>";
                show_prods += "    <div>Qty: " + prod.qty + "</div>";
                show_prods += "    <div>Stock #: " + prod.sku + "</div>";
                show_prods += "  </div>";
                show_prods += "</div>";
            {rdelim});
            $('#minicart_products').html(show_prods);
            $('.minicart_total_price').html(data.totals.total_price);
            $('.minicart_total_qty').html(data.totals.total_qty);
            $('#minicart_overlay_box').slideDown();

            {* Update Commonly Purchased Together Quantity inputs with the quantity from the product that was just added *}
            $.each($("#float_related_products input.qty"), function(){ldelim}
                $(this).val($("#content input[name=qty]").val());
            {rdelim});
        {rdelim}

        function optionCheck2(theForm) {ldelim}
            for (i = 0; i < theForm.elements.length; i++) {ldelim}
                if( ( theForm.elements[i].type == "select-one" ) && ( theForm.elements[i].selectedIndex == 0 ) && (theForm.elements[i].name != 'custom_field1') && (theForm.elements[i].name != 'recipient_mapping') && (theForm.elements[i].name != 'recurring_interval') ) {ldelim}
                    var option_len = theForm.elements[i].options[0].text.length;
                    var option_name = theForm.elements[i].options[0].text.substring(9, option_len);
                    var message = "Please choose an option before adding to cart.";
                    alert(message);
                    return false;
                {rdelim}
            {rdelim}
            return true;
        {rdelim}

    </script>
{/if}

    <script>
        $('document').ready(function(){ldelim}
            $('.addtocart_button').click(function(e) {ldelim}
                if (optionCheck2($(this).closest('form')[0])) {ldelim}
                    return;
        {rdelim}
        {rdelim});
        {rdelim});
    </script>

<script>
    function alignCompareButton() {ldelim}
        if (($(window).width() > 456)) {ldelim}
	    $('li#compare').addClass('pull-right');
        {rdelim} 
        else {ldelim}
	    $('li#compare').removeClass('pull-right');
        {rdelim}
    {rdelim};
    $('document').ready(alignCompareButton());
</script>

{if $view == 'checkout_corporate'}
<script>
    $('document').ready(function(){ldelim}
        hideDivs();
     {rdelim});

     function hideDivs() {ldelim}
          if (!$("#stateField1").has("select").length) {ldelim}
            $("#cond_hide1").addClass("hidden");
            console.log("hide1");
          {rdelim}
          if (!$("#countryField1").has("input").length) {ldelim}
            $("#cond_hide2").addClass("hidden");
            console.log("hide2");
          {rdelim}
     {rdelim}
      
     function showFileName(fileName){ldelim}
        console.log(fileName);
        fName = fileName.replace(/\\/g, '/').replace(/.*\//, '');
        console.log(fName);
        $("#fileDisplay").val(fName);
     {rdelim};
</script>
<script>
    function showMoreCol() {ldelim}
    $('td.more_col').toggleClass('hide_col');
    $('th.more_col').toggleClass('hide_col');
    {rdelim};
 
    $('document').ready(function(){ldelim}
        condHideFormDiv();
        addFormControls();
        hideDivs();
     {rdelim});
     
     function addFormControls() {ldelim}
        $("#sStateField1").addClass("form-control");
        $("#sCountryField1").addClass("form-control");
        $("#sZipField1").addClass("form-control");
        $("#sStateField2").addClass("form-control");
        $("#sZipField2").addClass("form-control");
        $("#sCountryField2").addClass("form-control");
     {rdelim};

     function condHideFormDiv() {ldelim}
          if ($("#s_country1").attr('type') == 'hidden') {ldelim}
          	$("#cond_hide1").addClass("hidden");
          {rdelim}
          else {ldelim}
              $("#cond_hide1").removeClass("hidden");
          {rdelim}
        
          if ($("#billing_country").attr('type') == 'hidden') {ldelim}
          $("#cond_hide2").addClass("hidden");
          {rdelim}
          else {ldelim}
              $("#cond_hide2").removeClass("hidden");
          {rdelim}
     {rdelim};
</script>
{/if}

{if $view == 'product' && $settings.child_display_type == '2'}
{literal}
<script type="text/javascript">
$('#recurring_yes_children').on('click',function() {
  $('.recurring_yes').each(function() {
    $(this).prop('checked',true);
  });
});
$('#recurring_no_children').on('click',function() {
  $('.recurring_no').each(function() {
    $(this).prop('checked',true);
  });
});
$('select[name="recurring_interval_children"]').on('change',function() {
  var interval = $(this).val();
  $('.recurring_interval').each(function() {
    $(this).val(interval);
  });
});
$('#recurring_interval_num_children').on('keyup',function() {
  var num = $(this).val();
  $('.recurring_interval_num').each(function() {
    $(this).val(num);
  });
});
</script>
{/literal}
{/if}

{if $view == 'checkout_shipping' && !$valid.return}
<script type="text/javascript">
$('#choose_alias1 option:contains("Default")').attr('selected', true).trigger('change');
</script>
{/if}

{if $view == 'product'}
<script>
$('input[name="qty"]').on('keyup click',function() {ldelim}
  $('input[name="qty0"]').val($(this).val());
  $('input[name="qty1"]').val($(this).val());
  $('input[name="qty2"]').val($(this).val());
{rdelim});
</script>
{/if}