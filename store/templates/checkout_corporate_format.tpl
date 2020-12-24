{include file="_top.tpl"}

<h1>Corporate Order File Format</h1>

<div class="mar_btm"><span class="req">*</span> Indicates a required field</div>

<div class="mar_btm">
  Use this form to import a multiple ship-to order with a simple text file.  This file will describe the shipping information as well as the products to be shipped and should be formatted according to the specification linked below.  You will be able to review your order before it is confirmed.
</div>

<h2>Shipping Addresses</h2>
<div class="mar_btm">
  Use this line type to set up shipping address and information for each ship-to.  The line items associated with this shipping address must be included directly below this line.
</div>

<table class="mar_btm" width="100%" border="0" cellspacing="0" cellpadding="3" id="checkoutPanel">
  <tr>
    <td class="normaltext"><b>Column</b></td>
    <td class="normaltext"><b>Description</b></td>
    <td class="normaltext"><b>Example</b></td>
  </tr>
  <tr>
    <td class="normaltext">1<span class="req">*</span></td>
    <td class="normaltext">"SHIP"</td>
    <td class="normaltext">SHIP</td>
  </tr>
  <tr>
    <td class="normaltext">2<span class="req">*</span></td>
    <td class="normaltext">First Name</td>
    <td class="normaltext">John</td>
  </tr>
  <tr>
    <td class="normaltext">3<span class="req">*</span></td>
    <td class="normaltext">Last Name</td>
    <td class="normaltext">Smith</td>
  </tr>
  <tr>
    <td class="normaltext">4</td>
    <td class="normaltext">Title</td>
    <td class="normaltext">Senior Editor</td>
  </tr>
  <tr>
    <td class="normaltext">5</td>
    <td class="normaltext">Company</td>
    <td class="normaltext">ABC Publishing</td>
  </tr>
  <tr>
    <td class="normaltext">6<span class="req">*</span></td>
    <td class="normaltext">Address 1</td>
    <td class="normaltext">123 Main St</td>
  </tr>
  <tr>
    <td class="normaltext">7</td>
    <td class="normaltext">Address 2</td>
    <td class="normaltext">Suite 123</td>
  </tr>
  <tr>
    <td class="normaltext">8<span class="req">*</span></td>
    <td class="normaltext">City</td>
    <td class="normaltext">Anytown</td>
  </tr>
  <tr>
    <td class="normaltext">9<span class="req">*</span></td>
    <td class="normaltext">State</td>
    <td class="normaltext">AL</td>
  </tr>
  <tr>
    <td class="normaltext">10<span class="req">*</span></td>
    <td class="normaltext">Zip Code</td>
    <td class="normaltext">12345</td>
  </tr>
  <tr>
    <td class="normaltext">11<span class="req">*</span></td>
    <td class="normaltext">Country</td>
    <td class="normaltext">United States</td>
  </tr>
  <tr>
    <td class="normaltext">12<span class="req">*</span></td>
    <td class="normaltext">Phone Number</td>
    <td class="normaltext">123-123-1234 </td>
  </tr>
  <tr>
    <td class="normaltext">13</td>
    <td class="normaltext">Ship Date</td>
    <td class="normaltext"> {$smarty.now|date_format:"%m/%d/%Y"}  </td>
  </tr>
  <tr>
    <td class="normaltext">14<span class="req">*</span></td>
    <td class="normaltext">Shipping Method</td>
    <td class="normaltext">UPS Ground</td>
  </tr>
  <tr>
    <td class="normaltext">15</td>
    <td class="normaltext">Gift Message</td>
    <td class="normaltext">Happy Birthday!</td>
  </tr>
  </table>

  <h3>Line Items</h3>
  <div class="mar_btm">
    Use this line type to assign products to a shipping address.  Each line item will need to be located directly below the shipping address to map the products to the correct shipping address.
  </div>

  <table class="mar_btm" width="100%" border="0" cellspacing="0" cellpadding="3" id="checkoutPanel">
  <tr>
    <td class="normaltext"><b>Column</b></td>
    <td class="normaltext"><b>Description</b></td>
    <td class="normaltext"><b>Example</b></td>
  </tr>
  <tr>
    <td class="normaltext">1<span class="req">*</span></td>
    <td class="normaltext">"LINE"</td>
    <td class="normaltext">LINE</td>
  </tr>
  <tr>
    <td class="normaltext">2<span class="req">*</span></td>
    <td class="normaltext">SKU</td>
    <td class="normaltext">ABC123</td>
  </tr>
  <tr>
    <td class="normaltext">3<span class="req">*</span></td>
    <td class="normaltext">Quantity</td>
    <td class="normaltext">1</td>
  </tr>
  </table>

  <h4>Example File</h4>
  <div class="mar_btm"><a href="/checkout_corporate_example">View Sample File</a></div>

{include file="_bottom.tpl"}
