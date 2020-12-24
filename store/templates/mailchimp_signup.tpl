{*array_debug*}
{if $view == "newsletter_thanks"}
{mailchimp_add_contact  check_status='y' email=$saved_data.add_email assign='mailchimp_response'}
{/if}

{if $view == "catalog_thanks"}
{mailchimp_add_contact  check_status='y' email=$saved_data.email first_name=$saved_data.first_name last_name=$saved_data.last_name address1=$saved_data.address1 city=$saved_data.city state=$saved_data.state zip=$saved_data.zip assign='mailchimp_response'}
{/if}

{if $view == "contact_thanks"}
{mailchimp_add_contact  check_status='y' email=$saved_data.email first_name=$saved_data.first_name last_name=$saved_data.last_name address1=$saved_data.address1 city=$saved_data.city state=$saved_data.state zip=$saved_data.zip assign='mailchimp_response'}
{/if}

{if $view == "checkout_billing"}
{mailchimp_add_contact  check_status='y' email=$saved_data.email first_name=$saved_data.s_firstname1 last_name=$saved_data.s_lastname1 address1=$saved_data.s_address11  city=$saved_data.city1 state=$saved_data.s_state1 zip=$saved_data.s_zip1 assign='mailchimp_response'}
<!-- cb -->
{/if}

{**
{if $view == "checkout_confirmation"}
{mailchimp_add_contact email=$info.billing.email first_name=$info.billing.first_name last_name=$info.billing.last_name address1=$info.billing.billing_address1  city=$info.billing.billing_city state=$info.billing.billing_state zip=$info.billing.billing_zip assign='mailchimp_response'}
<!-- cc -->
{/if}
**}

{if $view == "member"}
{mailchimp_add_contact  check_status='y' email=$saved_data.email first_name=$saved_data.first_name last_name=$saved_data.last_name address1=$saved_data.billing_address1 city=$saved_data.billing_city state=$saved_data.billing_state zip=$saved_data.billing_zip assign='mailchimp_response'}
{/if}
