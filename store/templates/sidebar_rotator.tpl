<div id="sidebar-ad"></div>

  <script>
    (function() {ldelim}
      var ads = [

{if $SCRIPT_NAME != '/category/stainless-flanged-ball-valves'}
        {ldelim}
          alttext: "New Manual Limit Switches",
          img:  "/images/sidebar-ads/New_MLS.png",
          link:  "/category/valve-limit-switches-valve-monitors",
        {rdelim},

{/if}
{if $view != 'shipping'}
        {ldelim}
          alttext: "UPS FREE Shipping on Actuated Valves and Controls",
          img:  "/images/sidebar-ads/ups-free-shipping.jpg",
          link:  "/shipping",
        {rdelim},

{/if}
{if $SCRIPT_NAME != '/product/cad-drawings'}
        {ldelim}
          alttext: "Valve 3D CAD Drawings",
          img:  "/images/sidebar-ads/valworx-3d-cad-models.png",
          link:  "/cad_drawings",
        {rdelim}
{/if}
      ];
      var ad = ads[Math.floor(Math.random() * ads.length)];
      document.getElementById("sidebar-ad").innerHTML =
        '<a href="' + ad.link + '" title=""' + ad.alttext + '"><img src="' + ad.img + '" alt="' + ad.alttext + '" width="195"></a>';
    {rdelim})();
  </script>



