//** THIS IS AN UNCOMPRESSED VERSION OF THE ALL.JS FILE FOR PRODUCTION USE **//
//---------------------------------------------------------------------------//

// Used for search by rating and search by price menus.
function go(form) {
   window.location = form.range.options[form.range.selectedIndex].value;
}

// Used for redirects by ID
function goID(id) {
   window.location = document.getElementById(id).value;
}

// Standard preload function
function preload_images () {
  var d = document;
  if (!d.imgs) { d.imgs = new Array(); }
  var j = d.imgs.length, args = preload_images.arguments, i;
  for (i = 0; i < args.length; i++) {
    d.imgs[j] = new Image;
    d.imgs[j].src = args[i];
    j++;
  }
}

// Standard bookmark function
function bookmark(title) {
  var urlAddress = location.href;
  var pageName = title;
  var browser = navigator.appName;
  if (browser == 'Microsoft Internet Explorer') {
    window.external.AddFavorite(urlAddress,pageName)
  } else if (browser == 'Netscape') { 
    alert("Your browser does not support this feature.  Use CTRL-D to bookmark this page");
  } else { 
   alert("Your browser does not support this feature.");
  }
}

/* The functions below are cookie functions which can be used for anything site-wide but
   are intended (at the moment) to be used for the dynamic cart quantities */

function getCookie(Name) {
  var search = Name + "=";
  var returnvalue = "";
  if(document.cookie.length > 0) {
    offset = document.cookie.indexOf(search)
    // if cookie exists
    if(offset != -1) { 
      offset += search.length
    }
    // set index of beginning of value
    end = document.cookie.indexOf(";", offset);
    // set index of end of cookie value
    if(end == -1) {
      end = document.cookie.length;
    }
    returnvalue=unescape(document.cookie.substring(offset, end))
  }
  return returnvalue;
}

function setCookie(name,num) {
 //set document cookie
 document.cookie=name+"="+num;
}

function isCookied(name,num) {
 if (getCookie(name)!=num) {
  return true;
 } else {
  return false;
 }
}

// check to make sure minimum qty has been met
function checkMinQty(id,min_qty,type) {
  qty = document.getElementById(id);
  curr_qty = qty.value;

  if (curr_qty != 0 && min_qty != '0' && min_qty != '1') {
    if (type == 'interactive') {
      curr_qty--;
    }

    if (Number(curr_qty) < Number(min_qty)) {
      alert('You must add at least ' + min_qty + ' of that item before continuing.');
      qty.value = min_qty;
      return false;
    }
  }
  return true;
}

// check to make sure minimum qty has been met for all sub prods
function checkMinQtySubs(name,qty,price) {
  var names = name.split(",");
  var qtys = qty.split(",");
  var prices = price.split(",");
  for (var n in names) {
    if (names[n] != '' && !checkMinQty('qty_'+names[n],qtys[n],'')) {
      priceChange(names[n],'dynamic',prices[n]);
      return false; 
    }
  }
  return true;
}

/* End Cookie Functions */

/* Dynamic Quantities JavaScript Below */

function priceChange(id,oper,num,curr_type) {
 // Price Change v2:
 // id = the id of the product (so we know what qty box and price to update).
 // oper = what operation to use: dynamic:add:sub:dropdown
 // num = the original price of the product
 //
 // --[ Revisions ]--
 // 20101005 - Rewrote the priceChange function.
 /////////////////////////////////////////////////////////////////////////////////////////////
  if (num == '') {
    num = document.getElementById('hidden_price_' + id).value.replace(curr_type,'');
  }
 
  // initialize num2 in case it's used
  var num2 = 0;

  // grab our price box and qty box:
  var price = (typeof document.getElementById == 'undefined') ? document.all('price_'+id) : document.getElementById('price_'+id);
  var qty = (typeof document.getElementById == 'undefined') ? document.all('qty_'+id) : document.getElementById('qty_'+id);

  // adjust the qty box if they're using the + or - buttons:
  if (oper == 'add') {
    ++qty.value;
  } else if (oper == 'sub' && qty.value >= '1') {
    --qty.value;
  } else if (qty.value < 1 || isNaN(qty.value)) {
    qty.value = '';
  }

  // reset the price if the qty goes below 1, is blank, or isNaN:
  if (qty.value < 1 || qty.value == '' || isNaN(qty.value)) {
    num = parseFloat(num);
    price.value = curr_type + num.toFixed(2);
  } else {
    // everything is OK, get the new price:
    price.value = curr_type + ((num.replace(',','') * qty.value)).toFixed(2);
  }
}

function cartChange(id,num,qty,total,name,curr_type) {
 // Cart Change v1.4:
 // id = an id to represent the price and qty (so we know what qty box and price to update).
 // num = the original cost of the item(s) (if there were 3x a 10-dollar item, num would = 30.00).
 // qty = the original quantity that existed in the cart before modification
 // total = the original total of the cart items before modification.
 // 
 // --[ Revisions ]--
 // 20050620 - Original Script Creation ~Michael@ColorMaria
 // 20050629 - Added a line to change the color of the update cart message ~Michael@ColorMaria
 // 20050705 - Added code (accompanied by cookies) to check the quantities of items in the cart
 //          - to see whether they match what the user entered for better checking to see if 
 //          - the update cart button needs to be pressed.
 //          - 
 //          - Please note: This update requires the cookie functions above the priceChange
 //          - function. ~Michael@ColorMaria
 // 20050722 - Added error handling for NaN errors.
 // 20051215 - Fixed a bug with commas
 ///////////////////////////////////////////////////////////////////////////////////////////////
 // Setup our Variables:
  var num2 = 0;
  var qty2 = document.getElementById('qty_' + id).value;
  if(isNaN(qty2)) { // If qty2 isNaN that means someone's made a typo and hit a letter or other non-number key
    document.getElementById('qty_' + id).value = '';
    qty2 = '';
  }
  var num3 = document.getElementById('price_' + id).value.replace(curr_type,'');
  var num3 = num3.replace(',','');
  // Check to see if we're dividing by 0:
  if(qty != '0' || !qty) {
    // If not, get the real price (rPrice):
    var rPrice = num.replace(',','');
  } else {
    // If we are, set the total price for that item to 0:
    document.getElementById('price_' + id).value = curr_type+'0.00';
  }
  // Setup our new prices:
  num2 = (rPrice * qty2);
  document.getElementById('price_' + id).value = curr_type + num2.toFixed(2);
  // We gotta do this differently depending on if the total we're modifying 
  // is the REAL total or if it's one that was previously modified.
  if(total == document.getElementById('total').value) {
    // If we are modifying the current REAL total, do it this way:
    // Figure out what total would be if the item we're modifying didn't exist.
    total = total - num3;
    // Add the new value to the total:
    total = total + num2;
    document.getElementById('total').value = curr_type + total.toFixed(2);
  } else {
    // Setup our fake_total variable so we can essentially do the same 
    // thing we did with the real total
    var fake_total = document.getElementById('total').value.split("$");
    fake_total = fake_total[1].replace(',','');
    // Figure out what the total would be without this product.
    total = fake_total - num3;
    // Readd the new value to the total.
    total = total + num2;
    document.getElementById('total').value = curr_type + total.toFixed(2);
  }
  // Just in case they think this will automagically update the real prices for them,
  // setup a fail safe the function below will read and evaluate:
  var nQty = getCookie(name);
  arQty = nQty.split('|');
  // Note: the last element of the array will be empty, so ignore it.
  cntQty = arQty.length - 1;
  for(i=0;i<cntQty;i++) {
    arID = arQty[i].split(','); // Hoo Hoo (owl)
    if(document.getElementById('qty_'+arID[0]).value == arID[1]) {
      // It equals the default quantity, yay! No need to update cart.
      document.getElementById('hasUpdated').value = '1';
      // Change the color of the update cart message.
      document.getElementById('update_msg').style.color = '#000';
      continue;
    } else {
      // It doesn't, they need to update.  No need to check further since if one hasn't been updated
      // the whole cart needs to be updated.
      document.getElementById('hasUpdated').value = '0';
      // Change the color of the update cart message so it stands out after a change to the qty is made.
      document.getElementById('update_msg').style.color = '#F00';
      // Break the loop.
      break;
    }
  }
}

function hasUpdated() {
 // Small function to verify that the cart has been updated
 // before checking out or using the continue shopping button.
 //
 // 20060403 - Added fix for when 'hasUpdated' doesn't exist. ~Michael
 ///////////////////////////////////////////////////////////////
  if(typeof document.getElementById('hasUpdated') != 'undefined') {
    var hUpdated = document.getElementById('hasUpdated').value;
    if(hUpdated != '1') {
      alert('You have not updated your cart since last changing your quantities.\nPlease press the \'Update Cart\' button before continuing.');
      return false;
    }
  }

  return true;
}

/* ** END Dynamic Quantities JS ** */


/* ***************************************
   * verifyRecipients() function.        *
   * Checks the checkout_shippingdetail  *
   * page to ensure that a shipping      *
   * recipient was chosen for each       *
   * product and that there weren't any  *
   * missed recipients.  If gives the    *
   * customer the option of ignoring     *
   * missed ship-tos since that doesn't  *
   * break the checkout it just causes   *
   * blank spaces in some spots.         *
   *                                     *
   * ~Michael - 20060111                 *
   *************************************** */

function verifyRecipients(theForm) {
  var intLength = theForm.length;            // Grab the total length of the form.
  var firstStep = 1, shipTos = new Array();  // Initialize a couple vars to be used later.
  for(var i=0;i<intLength;i++) {             // Loop through the form elements.
    if(firstStep && theForm.elements[i].name.substr(0,4) == 'recp') {
      // If it's the first dropdown setup the number of ship-tos it contains to compare later
      var numShipTos = +theForm.elements[i].options.length - 1;
      // Turn this off so it doesn't repeat this step (it won't hurt anything but would waste processing power).
      firstStep = 0;
    }
    if(theForm.elements[i].name.substr(0,4) == 'recp' && theForm.elements[i].value == '') {
      // If we encounter a dropdown that hasn't had a ship-to selected..
      alert('You must choose a recipient for each of the products you are purchasing.');
      return false;
    } else if (theForm.elements[i].name.substr(0,4) == 'recp') {
      // Otherwise add the item to an array to compare later.
      var shipTo = theForm.elements[i].selectedIndex;
      if(!in_array(shipTo, shipTos)) {
        // If the ship-to isn't in the array already, add it.
        var stLen = shipTos.length;
        shipTos.push(shipTo);
      }
    }
  }
  if(shipTos.length != numShipTos) {
    // If the # of ship-tos in the array don't match the number of ship-tos that exist, prompt the user
    var verifyShipTos = confirm("Some of your shipping address do not have products assigned to them.\n\nDo you wish to continue anyway?");
    if(verifyShipTos) {
      // User says it's OK
      return true;
    } else {
      // User says it's not OK
      return false;
    }
  }
  // If we've gotten this far, everything on the form has checked out OK.
  return true;
}

/* ***************************************
   * in_array() function for JS.         *
   * Works the same as the PHP function. *
   *                                     *
   * ~Michael - 20060111                 *
   * ~Michael - Fixed undefined vars     *
   *            20060111                 *
   *************************************** */

function in_array(needle, haystack) {
  if(typeof needle == undefined) {
    // If needle is undefined:
    alert("Needle is undefined.\nError: in_array");
    return false;
  } else if(typeof haystack == undefined) {
    alert("Needle is undefined.\nError: in_array");
    return false;
  }
  for(i=0,n=haystack.length;i<n;i++) {
    // Loop through the array.
    if(haystack[i] == needle) {
      // If the needle was found:
      return true;
    }
  }
  // If the code reaches this point, needle wasn't found:
  return false;
}

/* ************************
   * noHammer() function  *
   * Prevents form submit *
   * button hammering.    *
   *                      *
   * ~Michael - 20060403  *
   ************************ */

function noHammer(theForm) {
  if(typeof theForm.submit != 'undefined') {
    theForm.submit.disabled = true;
    theForm.submit.value = 'Wait...';
    return true;
  }
}

/* ************************
   * validateForgotForm() *
   * Checks for a valid   *
   * email before submit  *
   *                      *
   * ~Michael - 20060905  *
   ************************ */
function validateForgotForm(theForm) {
  var theEmail=theForm.email;
  var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
  if((theEmail.value==null)||(theEmail.value=="")) {
    document.getElementById('errorMsg').innerHTML="<br />Please enter a valid e-mail address before continuing.";
    theEmail.focus();
    return false;
  } else {
    if(!filter.test(theEmail.value)) {
      document.getElementById('errorMsg').innerHTML="<br />Please enter a valid e-mail address before continuing.";
      theEmail.value="";
      theEmail.focus();
      return false;
    }
  }
  return true;
}

function hideShowCalc(recip) {
 recip = (recip != '') ? '_'+recip : '';
 if (document.getElementById('cart_ship_estimator'+recip) != null && typeof document.getElementById('cart_ship_estimator'+recip) != 'undefined') {
   var div = document.getElementById('cart_ship_estimator'+recip);
   var link = document.getElementById('hideShowCalc'+recip);
 } else {
   return false;
 }
 div.style.display = (div.style.display == 'block') ? 'none' : 'block';
 link.innerHTML = (div.style.display == 'block') ? 'Hide Details' : 'Show Details';
} 

function suggestedSearchField(value,typ) {
  if (typ == 'out') {
    value.className = 'suggestion';
  } else if (typ == 'over') {
    value.className = 'suggestion_hover';
  } else if (typ == 'click') {
    document.getElementById('search_keyword').value=value.innerHTML;
    document.getElementById('suggestions').innerHTML = '';
    document.getElementById('suggestions').className = '';
  }
}

var suggested_val = null;
function suggestedSearchSniff(e,typ,theclass,func,params) {
  if (e.keyCode == 40) {
    // nothing is selected yet, so let's get it started
    if (suggested_val == null) {
      suggested_val = 0;
    // clear out the current selection and move to next
    } else {
      document.getElementById('suggestion_' + suggested_val).className = 'suggestion';
      suggested_val++;
    }
    // highlight next selection if it exists 
    if (document.getElementById('suggestion_' + suggested_val) != undefined) {
      fld = document.getElementById('suggestion_' + suggested_val);
      document.getElementById('search_keyword').value=fld.innerHTML;
      fld.className = 'suggestion_hover';
    // if it doesn't exist, highlight none
    } else {
      suggested_val = null;
    }
  } else if (e.keyCode == 38) {
    // don't allow up arrow to be used until in list
    if (suggested_val != null && suggested_val != 0) {
      // undo current selection
      document.getElementById('suggestion_' + suggested_val).className = 'suggestion';
      suggested_val--;
      if (document.getElementById('suggestion_' + suggested_val) != undefined) {
        fld = document.getElementById('suggestion_' + suggested_val);
        document.getElementById('search_keyword').value=fld.innerHTML;
        fld.className = 'suggestion_hover';
      } else if (document.getElementById('suggestion_0') != undefined) {
        fld = document.getElementById('suggestion_0');
        document.getElementById('search_keyword').value=fld.innerHTML;
        fld.className = 'suggestion_hover';
        suggested_val = 0;
      } else {
        suggested_val = null;
      }
    // clear all highlighting if at the top of list
    } else if (suggested_val == 0) {
      document.getElementById('suggestion_0').className = 'suggestion';
      suggested_val = null;
    }
  } else {
    suggested_val = null;
    getInfo(typ,theclass,func,params);
  }
}

/**************************************************************
 * Generic toggle button
 * usage: test_id = id for testing (ex: select box)
 *        change_id = id for displaying (ex: div)
 *        change_val = toggle the display of the change_id depending on what value to set the test_id has when the test_id = change_val
 *        display_val = 'none' or 'block' depending on which should be used when test_id = change_val
 **************************************************************/
function toggleBlock(test_id,change_id,change_val,display_val) {
  if (document.getElementById(test_id).value == change_val) {
    var set_display = display_val;
  } else {
    var set_display = (display_val == 'block') ? 'none' : 'block';
  }
  document.getElementById(change_id).style.display=set_display;

  return false;
}

//////////////////////////////////////////////////////////////////////////////////////////
// DreamWeaver's functions.

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

// End DreamWeaver's functions.
//////////////////////////////////////////////////////////////////////////////////////////

/***********************************************
* Bookmark site script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

/* Modified to support Opera */
function bookmarksite(title,url){
if (window.sidebar) // firefox
	window.sidebar.addPanel(title, url, "");
else if(window.opera && window.print){ // opera
	var elem = document.createElement('a');
	elem.setAttribute('href',url);
	elem.setAttribute('title',title);
	elem.setAttribute('rel','sidebar');
	elem.click();
} 
else if(document.all)// ie
	window.external.AddFavorite(url, title);
}

/******************************************************************************
 * removeCompareProducts - removes any flagged items from the comparison list *
 ******************************************************************************/
function removeCompareProducts() {
  // verify the form exists
  if (typeof document.compare != 'undefined' && document.compare != null) {
    var to_remove = '';
    for (var i=0,n=document.compare.elements.length;i<n;i++) {
      if (document.compare.elements[i].name.substr(0,14) == 'remove_compare' && document.compare.elements[i].checked == true) {
        to_remove += '|'+document.compare.elements[i].value;
      }
    }
    if (to_remove != '') {
      window.location = '/compare_products/'+to_remove;
    }
  }
}

/******************************************************************************************
 * addRemoveCompare - adds or removes items from the compare products form for comparison *
 ******************************************************************************************/
function addRemoveCompare(item,current,max) {
  if (typeof document.getElementById('compare_ids') != 'undefined' && document.getElementById('compare_ids') != null) {
    var id_box = document.getElementById('compare_ids');
    var box2 = false;
    if (typeof document.getElementById('compare_ids_2') != 'undefined' && document.getElementById('compare_ids_2') != null) {
      var id_box2 = document.getElementById('compare_ids_2');
      box2 = true;
    }
    if (item.checked == true) {
      if (id_box.value == '' && current != max) {
        id_box.value = item.value;
      } else if (id_box.value != '' && current != max) {
        var tmp = id_box.value.split(',');
        var comp = current + tmp.length + 1;
        if (tmp.length == max || comp > max) {
          alert('You have reached the maximum number of comparable products ('+max+').\nPlease remove some products from your comparison list and try again.');
          item.checked = false;
          return false;
        }
        var addNew = false;
        for (var i=0,n=tmp.length;i<n;i++) {
          if (item.value == tmp[i]) {
            // shouldn't have gotten here, the item is already in the list
            addNew = false;
            break;
          } else {
            addNew = true;
          }
        }
        if (addNew) {
          id_box.value += ','+item.value;
        }
      } else {
        alert('You have reached the maximum number of comparable products ('+max+').\nPlease remove some products from your comparison list and try again.');
        item.checked = false;
        return false;
      }
    } else if (item.checked == false) {
      // we're removing the item from the comparison list
      var tmp = id_box.value.split(',');
      for (var i=0,n=tmp.length;i<n;i++) {
        if (tmp[i] == item.value) {
          delete tmp[i];
        }
      }
      var new_value = tmp.join(',');
      if (new_value.substr(0,1) == ',') {
        new_value = new_value.substr(1,new_value.length-1);
      }
      if (new_value.substr(-1) == ',') {
        new_value = new_value.substr(0,new_value.length-1);
      }
      id_box.value = new_value.replace(',,',','); //replace double commas just in case. but why would they be there?
    }
    if (box2) {
      id_box2.value = id_box.value;
    }
  }
}

/******************************************************************
 * Hides and shows elements for the questions and answers section *
 ******************************************************************/
function showHideQA(type,id) {
  var id = type+'_'+id;
  var answers = (document.getElementById) ? document.getElementById(id) : document.all(id);
  if (typeof answers != 'undefined' && answers != null) {
    answers.style.display = (answers.style.display == 'none') ? 'block' : 'none';
  }
}

/*************************************************************
 * Controls the counter for remaining characters for answers *
 *************************************************************/
function remainingCharacters(box,id) {
  var max = 500; // if you change this, be sure to update the default value in the template
  var id = 'count_'+id;
  var count = (document.getElementById) ? document.getElementById(id) : document.all(id);

  if (count.innerHTML >= 1) {
    count.innerHTML = max - box.value.length;
    return true;
  } else if (count.innerHTML <= 0) {
    box.value = box.value.substr(0,max);
    count.innerHTML = max - box.value.length;
    return false;
  }
}

/***************************************
 * confirm cart clear on member logout *
 ***************************************/
function confirmCartClear() {
  if (confirm('Would you like to keep your cart contents?\n\nClick \'OK\' to keep your cart\'s content.\nClicking \'Cancel\' below will clear your cart.')) {
    window.location = '/member_login/1/1';
  } else {
    window.location = '/member_login/1';
  }
}

/********************************************************
 * send an xml request to the server to verify shipping *
 ********************************************************/
function verifyShipping(form,num) {
  // being our xml output variable
  var strToSend = "<?xml version='1.0' encoding='UTF-8'?>\n";
  strToSend += "<validateAddresses>\n";

  // loop through each form field and, if it's an address field we need, put the required fields into the xml we send the server
  for (var z=1;z<=num;z++) {
    // open the address node
    strToSend += "  <address>\n";
    for (i in form.elements) {
      var objField = form.elements[i];

      // match only what we need
      var strRegEx = eval('/s_(firstname|lastname|address1|address2|city|state|zip|country|noconfirm)'+z+'/i');

      // add the node to the xml
      if (typeof objField != 'undefined' && typeof objField.name != 'undefined' && 
          typeof (objMatches = objField.name.match(strRegEx)) != 'undefined' && objMatches != null) {
        strToSend += "    <"+objMatches[1]+">"+objField.value+"</"+objMatches[1]+">\n";
      }
    }
    // close the address node
    strToSend += "  </address>\n";
  }

  // finalize our xml
  strToSend += "</validateAddresses>\n";

  // if you want to make any visual changes to let the customer know the page is processing, do it here

  // call the server to get our avs result(s)
  return getInfo('avs','Shipping_Class','inlineAVS',strToSend);
}

/***********************************************************************
 * grab the xml response from the verifyShipping function and parse it *
 ***********************************************************************/
function verifyShippingResponse(xml) {
  // load our xml for processing
  if (window.DOMParser) {
    var parser = new DOMParser();
    var objXML = parser.parseFromString(xml,"text/xml");
  } else { // Internet Explorer
    var objXML = new ActiveXObject("Microsoft.XMLDOM");
    objXML.async = "false";
    objXML.loadXML(xml);
  }

  /*/ example response:
    <?xml version="1.0" encoding="UTF-8"?>
    <avsResponse>
      <ResponseCode />
      <Errors>
        <Error>The address entered for Recipient 1 was not found.</Error>
        <!-- Multiple errors are possible. -->
      </Errors>
      <Addresses>
        <Address>
          <AddressSuggestions>
            <Suggestion>
              <FirstName />
              <LastName />
              <Address1 />
              <Address2 />
              <City />
              <State />
              <Zip />
            </Suggestion>
            <!-- Multiple address responses are possible. -->
          </AddressSuggestions>
          <OriginalAddress>
            <!-- Same nodes as AddressSuggestions/Address/* -->
          </OriginalAddress>
        </Address>
      </Addresses>
    </avsResponse>
  /*/

  /*
     Example code below.  The below code grabs the response code and displays any errors
     that may have been returned.
  */

  // Dial-A-Zip's response code is stored in strResponseCode
  var strResponseCode = objXML.getElementsByTagName('ResponseCode')[0].childNodes[0].nodeValue;

  // if there are errors, announce those:
  var strErrors = '';

  // grab the errors node:
  var objErrors = objXML.getElementsByTagName('Error');

  // loop through each error and add it to a string to alert the customer there was an error:
  for (var i=0,n=objErrors.length;i<n;i++) {
    strErrors += objErrors[i].childNodes[0].nodeValue+"\n";
  }

  // if strErrors is not empty, alert the user:
  if (strErrors != '') {
    // show the error(s)
    alert(strErrors);

    // if you made any changes so the customer knew the page was processing something, undo it here

    // halt the form submission
    return false;
  }

  /*
     You can do much more with the information provided in the XML.
  */

  // return true by default, just so it doesn't ever break the form.
  return true;
}

function hideShowCalcStateZip(recip,country) {
 if (country == 'United States') {
   document.getElementById('state'+recip).selectedIndex = 0;
   document.getElementById('zip'+recip).value = '';
   document.getElementById('staterow'+recip).style.display = '';
   document.getElementById('ziprow'+recip).style.display = '';
 } else {
   document.getElementById('staterow'+recip).style.display = 'none';
   document.getElementById('ziprow'+recip).style.display = 'none';
 }
}

// Converts a string to use initial caps; for use as a prototype method with String
function toUCWords() {
  var tmp_words = this.split(' ');
  var out_words = new Array();
  for (var i=0,n=tmp_words.length;i<n;i++) {
    word = tmp_words[i];
    tmp_word = word.substr(0,1).toUpperCase();
    tmp_word += word.substr(1,word.length-1).toLowerCase();
    out_words[out_words.length] = tmp_word;
  }
  return out_words.join(' ');
}

// add toUCWords prototype to String
String.prototype.toUCWords = toUCWords;

function updatePrice(id, qty, price, min_qty, max_qty) {
  /* Will update the innerHTML of ID with the new price */

  if (min_qty > 0 && qty < min_qty) { 
    document.getElementById('qty_'+id).value = min_qty;
    qty = min_qty;
  }
  if (max_qty > min_qty && qty > max_qty) {
    document.getElementById('qty_'+id).value = max_qty;
    qty = max_qty;
  }

//  if (!qty || qty == 0) { qty = 0; disable('buybutton_'+id); }
//  else if (qty > 0) enable('buybutton_'+id);

  var new_price = qty * price;
  var o = document.getElementById('price_'+id);
  o.innerHTML = '$'+new_price.toFixed(2);
}

function openPopup(url, width, height) {
window.open(url,'popup','width='+width+',height='+height+',statusbar=no,toolbars=no,location=no,scrollbars=yes,resizable=yes');
}
