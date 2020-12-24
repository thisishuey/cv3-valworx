{********************************************************
 * purpose: to let affiliates know if they've been 
 * approved or disapproved
 * available fields:
 * {$type} = 'approve', 'delete', 'referafriend', 'referafriend_sample', 'eparty', 'eparty_sample', 'eparty_plan'
 * {$domain} = your domain name
 * {$delete_reason} = reason for not approving them
 * {$affiliate.name} = name of affiliate
 * {$affiliate.code} = code assigned to affiliate
 * {$affiliate.commission} = amount of commission
 * {$affiliate.type} = type of commission ('order' or 'visit')
 * {$affiliate.email} = email of affiliate
 * {$affiliate.payable} = payable to
 * {$affiliate.address1} = address 
 * {$affiliate.address2} = address
 * {$affiliate.city} = city
 * {$affiliate.state} = state
 * {$affiliate.zip} = zip
 * {$affiliate.country} = country
 * {$affiliate.phone} = phone number
 * {$affiliate.eparty_date} = date of e-party
 *
 ********************************************************}
 {if $type == 'approve'}
{$affiliate.name} - <br />You have been accepted into our affiliate program.  Your code is {$affiliate.code} and your commission rate is {if $affiliate.type=='visit'}${$affiliate.commission} per visit{else}{$affiliate.commission}% per order{/if}. Please use https://{$domain}?a={$affiliate.code} to link to our store.
 {elseif $type == 'delete'}
I'm sorry, {$affiliate.name}.  You have not been accepted into our affiliate program.  Please see the reason below:<br />
{$delete_reason}
 {elseif $type == 'referafriend'}
{$affiliate.name} - <br />Congratulations, you have joined our Refer-A-Friend program.  Your code is {$affiliate.code} and your commission rate is {if $affiliate.type=='visit'}${$affiliate.commission} per visit{else}{$affiliate.commission}% per order{/if}. Please direct your friends to use https://{$domain}?a={$affiliate.code} to link to our store.
 {elseif $type == 'referafriend_sample'}
Hello, You are invited to visit My Store.  <a href="https://{$domain}?a={$affiliate.code}">Click here</a> to start your shopping experience!
 {elseif $type == 'eparty'}
{$affiliate.name} - <br />Congratulations, you have joined our E-Party program.  Your commission rate is {if $affiliate.type=='visit'}${$affiliate.commission} per visit{else}{$affiliate.commission}% per order{/if}.  Just log into your account to plan your E-Party!
 {elseif $type == 'eparty_plan'}
{$affiliate.name} - <br />You have scheduled an E-Party for {$affiliate.eparty_date}.  Your code is {$affiliate.code} and your commission rate is {if $affiliate.type=='visit'}${$affiliate.commission} per visit{else}{$affiliate.commission}% per order{/if}. Please direct your friends to use https://{$domain}?a={$affiliate.code} to link to our store.
 {elseif $type == 'eparty_sample'}
Hello, You are invited to join my E-Party on {$affiliate.eparty_date}.  <a href="https://{$domain}?a={$affiliate.code}">Click here</a> to start your shopping experience!
 {/if}
