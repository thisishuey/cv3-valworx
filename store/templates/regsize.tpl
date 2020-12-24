{config_load file="store.conf" scope="global"}
<html>
{include file="_meta.tpl"}
<body id="{$view}" class="popup">

<div class="popupimage">
 <img src="{$prod_image|img_prefix}"> 
</div>

<div class="popupbuttons">
 <button onClick="window.close();" class="button medium style1">Close Window</button>
</div>

</body>
</html>