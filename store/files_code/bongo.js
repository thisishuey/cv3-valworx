
/******************************************
 * Bongo International Checkout
 ******************************************/
function bongoFormPopulate(page,i,exclude_countries) {
 var field_list = '{"checkout_shipping":{"CUST_FIRST_NAME":"first_name","CUST_LAST_NAME":"last_name","CUST_COMPANY":"company","CUST_ADDRESS_LINE_1":"billing_address1","CUST_ADDRESS_LINE_2":"billing_address2","CUST_CITY":"billing_city","CUST_STATE":"billing_province","CUST_ZIP":"billing_zip","CUST_COUNTRY":"billing_country","CUST_PHONE":"phone","CUST_EMAIL":"billing_email","SHIP_FIRST_NAME":"s_firstname1","SHIP_LAST_NAME":"s_lastname1","SHIP_COMPANY":"s_company1","SHIP_ADDRESS_LINE_1":"s_address11","SHIP_ADDRESS_LINE_2":"s_address21","SHIP_CITY":"s_city1","SHIP_STATE":"province1","SHIP_ZIP":"zip","SHIP_COUNTRY":"s_country1"},"checkout_shippingaddress":{"SHIP_FIRST_NAME":"shipping_firstname","SHIP_LAST_NAME":"shipping_lastname","SHIP_COMPANY":"shipping_company","SHIP_ADDRESS_LINE_1":"shipping_address","SHIP_ADDRESS_LINE_2":"shipping_address2","SHIP_CITY":"shipping_city","SHIP_STATE":"province","SHIP_ZIP":"s_zip","SHIP_COUNTRY":"s_country","SHIP_PHONE":"shipping_phone","SHIP_EMAIL":"shipping_email"}}';

  var flds = eval ("(" + field_list + ")");

  // is international?
  var exclude = exclude_countries.split("|");
  var co_val = $('#' + flds[page]["SHIP_COUNTRY"] + i).val();
  if (co_val == 'United States' || !co_val || co_val.length == 0 || $.inArray(co_val,exclude) != -1) return

  $.each(flds[page],function (name,fld) {
    var val = $('#' + fld + i).val();
    if (val) {
      if (name == "CUST_COUNTRY" || name == "SHIP_COUNTRY") {
        val = bongoCountryCode(val);
      }
      var input = $("<input>").attr("type", "hidden").attr("name", name).val(val);
      $('#bongo_form').append($(input));
    }
  });
  $('#bongo_form').submit();

  return "true";
}

function bongoCountryCode(country) {
 var country_list = '{"United States":"US","Albania":"L","Algeria":"DZ","American Samoa":"AS","Andorra":"AD","Angola":"AO","Anguilla":"AI","Antigua":"AG","Argentina":"AR","Armenia":"AM","Aruba":"AW","Australia":"AU","Austria":"AT","Azerbaijan":"AZ","Bahamas":"BS","Bahrain":"BH","Bangladesh":"BD","Barbados":"BB","Belarus":"BY","Belgium":"BE","Belize":"BZ","Benin":"BJ","Bermuda":"BM","Bhutan":"BT","Bolivia":"BO","Botswana":"BW","Brazil":"BR","British Virgin Is.":"VG","Brunei":"BN","Bulgaria":"BG","Burkino Faso":"BF","Burma":"MM","Burundi":"BI","Cambodia":"KH","Cameroon":"CM","Canada":"CA","Cape Verde":"CV","Cayman Islands":"KY","Central African":"CF","Chad":"TD","Chile":"CL","China":"CN","Colombia":"CO","Congo":"CG","Congo, The Republic of":"CD","Cook Islands":"CK","Costa Rica":"CR","Cote D\'Ivoire":"CI","Croatia":"HR","Cyprus":"CY","Czech Republic":"CZ","Denmark":"DK","Djibouti":"DJ","Dominica":"DM","Dominican Republic":"DO","Ecuador":"EC","Egypt":"EG","El Salvador":"SV","Equatorial Guinea":"GQ","Eritrea":"ER","Estonia":"EE","Ethiopia":"ET","Faeroe Islands":"FO","Federated States of Micronesia":"FM","Fiji":"FJ","Finland":"FI","France":"FR","French Guiana":"GF","French Polynesia":"PF","Gabon":"GA","Gambia":"GM","Georgia, Republic of":"GE","Germany":"DE","Ghana":"GH","Gibraltar":"GI","Greece":"GR","Greenland":"GL","Grenada":"GD","Guadeloupe":"GP","Guam":"GU","Guatemala":"GT","Guinea":"GN","Guinea-Bissau":"GW","Guyana":"GY","Haiti":"HT","Honduras":"HN","Hong Kong":"HK","Hungary":"HU","Iceland":"IS","India":"IN","Indonesia":"ID","Ireland":"IE","Israel":"IL","Italy":"IT","Ivory Coast":"CI","Jamaica":"JM","Japan":"JP","Jordan":"JO","Kazakhstan":"KZ","Kenya":"KE","Kuwait":"KW","Kyrgyzstan":"KG","Latvia":"LV","Lebanon":"LB","Lesotho":"LS","Liechtenstein":"LI","Lithuania":"LT","Luxembourg":"LU","Macau":"MO","Macedonia":"MK","Madagascar":"MG","Malawi":"MW","Malaysia":"MY","Maldives":"MV","Mali":"ML","Malta":"MT","Marshall Islands":"MH","Martinique":"MQ","Mauritania":"MR","Mauritius":"MU","Mexico":"MX","Micronesia":"FM","Moldova":"MD","Monaco":"MC","Mongolia":"MN","Montserrat":"MS","Morocco":"MA","Mozambique":"MZ","Myanmar":"MM","Namibia":"NA","Nepal":"NP","Netherlands":"NL","Netherlands Antilles":"AN","New Caledonia":"NC","New Zealand":"NZ","Nicaragua":"NI","Niger":"NE","Nigeria":"NG","Norway":"NO","Oman":"OM","Pakistan":"PK","Palau":"PW","Panama":"PA","Papua New Guinea":"PG","Paraguay":"PY","Peru":"PE","Philippines":"PH","Poland":"PL","Portugal":"PT","Qatar":"QA","Reunion Island":"RE","Romania":"RO","Russia":"RU","Rwanda":"RW","Saipan":"MP","San Marino":"SM","Saudi Arabia":"SA","Senegal":"SN","Seychelles":"SC","Scotland":"GB","Sierra Leone":"SL","Singapore":"SG","Slovak Republic":"SK","Slovenia":"SI","South Africa":"ZA","South Korea":"KR","Spain":"ES","Sri Lanka":"LK","St. Kitts & Nevis":"KN","St. Lucia":"LC","St. Vincent":"VC","Suriname":"SR","Swaziland":"SZ","Sweden":"SE","Switzerland":"CH","Syria":"SY","Taiwan":"TW","Tanzania":"TZ","Thailand":"TH","Togo":"TG","Trinidad and Tobago":"TT","Tunisia":"TN","Turkey":"TR","Turkmenistan, Republic of":"TM","Turks & Caicos Is.":"TC","U.A.E.":"AE","U.S. Virgin Islands":"VI","Uganda":"UG","Ukraine":"UA","United Kingdom":"GB","Uruguay":"UY","Uzbekistan":"UZ","Vanuatu":"VU","Vatican City":"VA","Venezuela":"VE","Vietnam":"VN","Wallis & Futuna Islands":"WF","Yemen":"YE","Zambia":"ZM","Zimbabwe":"ZW"}';
  var country_codes = eval ("(" + country_list + ")");
  return country_codes[country];
}

