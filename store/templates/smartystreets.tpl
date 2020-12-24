{if $settings.ship_address_confirm_real == 'ss'}
  {if $view == 'checkout_shipping'}
  <script src="//d79i1fxsrar4t.cloudfront.net/jquery.liveaddress/2.8/jquery.liveaddress.min.js"></script>
  <script>var liveaddress = $.LiveAddress({ldelim}
    key: "{if $live == 1}{$settings.ship_address_confirm_real_key_live}{else}{$settings.ship_address_confirm_real_key}{/if}",
    debug: false,
    waitForStreet: true,
    addresses: [{ldelim}
      id: '1',
      street: '#s_address11',
      city: '#s_city1',
      state: '#s_state1',
      zipcode: '#zip'
    {rdelim}]
  {rdelim});
  $(document).ready(function(){ldelim}
    // Only use verification for United States Addresses
    $('#s_country1').change(function() {ldelim}
      if ($(this).val() == 'United States') {ldelim}
        liveaddress.activate('1');
      {rdelim} else {ldelim}
        liveaddress.deactivate('1');
      {rdelim}
    {rdelim});

    $("#choose_alias1").change(function(){ldelim}
      liveaddress.getMappedAddressByID('1').unaccept();
      $("#s_address11").trigger("change");
      $("#s_city1").trigger("change");
      $("#s_state1").trigger("change");
      $("#s_country1").trigger("change");
      $("#zip").trigger("change");
      liveaddress.getMappedAddressByID('1').verify();
    {rdelim});
  {rdelim});
  </script>
  {elseif $view == 'checkout_shippingaddress'}
  {assign var="sn" value=0}

  <script src="//d79i1fxsrar4t.cloudfront.net/jquery.liveaddress/2.8/jquery.liveaddress.min.js"></script>
  <script>var liveaddress = $.LiveAddress({ldelim}
    key: "{if $live == 1}{$settings.ship_address_confirm_real_key_live}{else}{$settings.ship_address_confirm_real_key}{/if}",
    debug: false,
    addresses: [{section name=addy loop=$ship_num}{ldelim}
      {assign var="sn" value=$smarty.section.addy.index+1}
      street: '#shipping_address1{$sn}',
      city: '#shipping_city{$sn}',
      state: '#s_state{$sn}',
      zipcode: '#s_zip{$sn}'
    {rdelim}{if $sn < $ship_num},{/if}{/section}]
  });
  $(document).ready(function(){ldelim}
    {section name=addy2 loop=$ship_num}
    {assign var="sn" value=$smarty.section.addy2.index+1}
    // Only use verification for United States Addresses
    $('#s_country{$sn}').change(function() {ldelim}
      if ($(this).val() == 'United States') {ldelim}
        liveaddress.activate('{$sn}');
      {rdelim} else {ldelim}
        liveaddress.deactivate('{$sn}');
      {rdelim}
    {rdelim}).change();

    $("#choose_alias{$sn}").change(function(){ldelim}
      liveaddress.getMappedAddressByID('{$sn}').unaccept();
      $("#shipping_address{$sn}").trigger("change");
      $("#shipping_city{$sn}").trigger("change");
      $("#s_state{$sn}").trigger("change");
      $("#s_country{$sn}").trigger("change");
      $("#s_zip{$sn}").trigger("change");
      liveaddress.getMappedAddressByID('{$sn}').verify();
    {rdelim});
    {/section}
  {rdelim});
  </script>
  {/if}
{/if}
