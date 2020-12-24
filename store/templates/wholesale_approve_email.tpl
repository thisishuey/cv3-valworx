{*************************************************
 * Purpose: send approve wholesale email
 * Available Fields:
 * {$info.email}
 * {$info.company_name}
 * {$info.contact_first_name}
 * {$info.contact_last_name}
 * {$info.phone}
 * {$info.fax}
 * {$info.billing_address1}
 * {$info.billing_address2} 
 * {$info.billing_city}
 * {$info.billing_state}
 * {$info.billing_zip}
 * {$info.billing_country} 
 * {$info.source} 
 * {$info.payment_type}
 * {$info.shipping_address_type}
 * {$info.business_class}
 * {$info.fed_tax_id}
 * {$info.new_owner} 
 * {$info.purchase_date} 
 * {$info.business_length} 
 * {$info.business_year}
 * {$info.business_type}
 * {$info.comments} 
 * {$info.corp_name}
 * {$info.prefix} 
 * {$info.removed} 
 * {$info.ship_id}
 * {$info.shipping_alias}
 * {$info.shipping_attention}
 * {$info.shipping_address1}
 * {$info.shipping_address2} 
 * {$info.shipping_city}
 * {$info.shipping_state}
 * {$info.shipping_zip}
 * {$info.shipping_country} 
 * {$co_name}
 **************************************************}
<html>
<body>
Congratulations, {$info.company_name} and welcome to the {$co_name} Wholesaler program.
<br /><br />
To log on to our website, you will need the following information:<br />
&nbsp;&nbsp;&nbsp;&nbsp;Username: {$info.email}<br />
&nbsp;&nbsp;&nbsp;&nbsp;Password: The password you chose when you signed up <br />
<br />
Thank you for registering as a {$co_name} Wholesaler! We appreciate your business.
</body>
</html>
