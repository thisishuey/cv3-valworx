{include file="_top.tpl"}

Geo:
<div id='geo'></div>

<script src="http://code.google.com/apis/gears/gears_init.js" type="text/javascript" charset="utf-8"></script>
<script src="/geo.js?id=1" type="text/javascript" charset="utf-8"></script>

{literal}
<script>
	if(geo_position_js.init()){
		geo_position_js.getCurrentPosition(success_callback,error_callback,{enableHighAccuracy:true});
	}
	else{
		alert("Functionality not available");
	}

  function success_callback(p)
	{
//          console.log(p);
//		alert('lat='+p.coords.latitude.toFixed(2)+';lon='+p.coords.longitude.toFixed(2));
          $('#geo').text('street='+p.address.street+'; streetNumber='+p.address.streetNumber);
	}
		
	function error_callback(p)
	{
		alert('error='+p.code);
	}		
</script>
{/literal}

{include file="_bottom.tpl"}