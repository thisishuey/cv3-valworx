<nav id="menu">
  <ul>
    <li class="Divider"><a href="/">Home</a></li>
    <li><a href="/shop">Shop</a>
      <ul>
      {foreach from=$categories key=key item=category}
        {if $category.parent == '' && $category.inactive != 'y'}
          <li{if $cid == $key} class="category_top_active"{/if}>
          <a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" title="{$category.name|replace:"& ":"&amp; "}">{$category.name|replace:"& ":"&amp; "}</a>
          {if $category.sub_cats.0 != ''}
            {include file="mobile_side_menu_recur.tpl" cat_id=$key prefix="sub"}
          {/if}
          </li>
        {/if}
      {/foreach}
      </ul>
    </li>
    <li><span><a href="/category/customer-service">Customer Service</a></span>
      <ul>
        
        <li>
        <a href="/aboutus" title="About Us">About Us</a></li>
        <li><a href="/contact" title="Contact Us">Contact Us</a></li>
        <li><a href="/why_choose_valworx" title="Why Choose Valworx?">Why Choose Valworx?</a></li>
        <li><a href="/ordering" title="Ordering">24/7  Ordering</a></li>
        <li><a href="/payment" title="Payment">Easy Payment</a></li>
        <li><a href="/shipping" title="Free Shipping">Fast, Free Shipping</a></li>
        <li><a href="/returns" title="Returns">60-Day Returns</a></li>
        <li><a href="/warranty" title="Warranty">Warranty</a></li>
        <li><a href="/privacy" title="Privacy Policy">Privacy Policy</a></li>
        <li><a href="/terms-and-conditions" title="Terms and Conditions">Terms &amp;  Conditions</a></li>
        <li><a href="/careers" title="Career Opportunities">Career Opportunities</a></li>
      </ul>
    </li>
    <li><span><a href="/category/technical-support">Technical Support</a></span>
        <ul>
          <li><a href="/how_does_it_work" title="How Does It Work">How Does it Work?</a></li>
          <li><a href="/faqs" title="Product FAQs">Product FAQs</a></li>
          <li><a href="/technical_resources" title="Technical Resources">Technical Resources</a></li>
          <li><a href="/comparison" title="Product Comparison">Product Comparison</a></li>
          <li><a href="/installation_instructions" title="Installation Instructions">Installation Instructions</a></li>
          <li><a href="/troubleshooting" title="Troubleshooting Guides">Troubleshooting Guides</a></li>
          <li><a href="/cad_drawings" title="CAD Drawings">CAD Drawings</a></li>
          <li><a href="/safety" title="Product Safety">Product Safety</a></li>
          <li><a href="/data_sheets" title="Product Data Sheets">Product Data Sheets</a></li>
          <li><a href="/videos" title="Product Video">Product Video</a></li>
          <li><a href="/approvals_certifications" title="Approvals and Certifications">Approvals and Certifications</a></li>
           <li><a href="/protips" title="ProTips">ProTips</a></li>
      </ul>
    </li>
  </ul>
</nav>