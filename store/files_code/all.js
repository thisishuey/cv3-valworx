function openPopup(a, b, c) {
    window.open(a, "popup", "width=" + b + ",height=" + c + ",statusbar=no,toolbars=no,location=no,scrollbars=yes,resizable=yes")
}
function updatePrice(a, b, c, d, e) {
    if (d > 0 && b < d) {
        document.getElementById("qty_" + a).value = d;
        b = d
    }
    if (e > d && b > e) {
        document.getElementById("qty_" + a).value = e;
        b = e
    }
    var f = b * c;
    var g = document.getElementById("price_" + a);
    g.innerHTML = "$" + f.toFixed(2)
}
function toUCWords() {
    var a = this.split(" ");
    var b = new Array;
    for (var c = 0, d = a.length; c < d; c++) {
        word = a[c];
        tmp_word = word.substr(0, 1).toUpperCase();
        tmp_word += word.substr(1, word.length - 1).toLowerCase();
        b[b.length] = tmp_word
    }
    return b.join(" ")
}
function hideShowCalcStateZip(a, b) {
    if (b == "United States") {
        document.getElementById("state" + a).selectedIndex = 0;
        document.getElementById("zip" + a).value = "";
        document.getElementById("staterow" + a).style.display = "";
        document.getElementById("ziprow" + a).style.display = "";
        document.getElementById('city'+a).value = '';
        document.getElementById('cityrow'+a).style.display = '';

    } else if (b == 'Canada') {
        document.getElementById('zip'+a).value = '';
        document.getElementById('staterow'+a).style.display = 'none';
        document.getElementById('ziprow'+a).style.display = '';		
    } else {
        document.getElementById("staterow" + a).style.display = "none";
        document.getElementById("ziprow" + a).style.display = "none";
        document.getElementById('cityrow'+a).style.display = 'none';
    }
}
function verifyShippingResponse(a) {
    if (window.DOMParser) {
        var b = new DOMParser;
        var c = b.parseFromString(a, "text/xml")
    } else {
        var c = new ActiveXObject("Microsoft.XMLDOM");
        c.async = "false";
        c.loadXML(a)
    }
    var d = c.getElementsByTagName("ResponseCode")[0].childNodes[0].nodeValue;
    var e = "";
    var f = c.getElementsByTagName("Error");
    for (var g = 0, h = f.length; g < h; g++) {
        e += f[g].childNodes[0].nodeValue + "\n"
    }
    if (e != "") {
        alert(e);
        return false
    }
    return true
}
function verifyShipping(form, num) {
    var strToSend = "<?xml version='1.0' encoding='UTF-8'?>\n";
    strToSend += "<validateAddresses>\n";
    for (var z = 1; z <= num; z++) {
        strToSend += "  <address>\n";
        for (i in form.elements) {
            var objField = form.elements[i];
            var strRegEx = eval("/s_(firstname|lastname|address1|address2|city|state|zip|country|noconfirm)" + z + "/i");
            if (typeof objField != "undefined" && typeof objField.name != "undefined" && typeof (objMatches = objField.name.match(strRegEx)) != "undefined" && objMatches != null) {
                strToSend += "    <" + objMatches[1] + ">" + objField.value + "</" + objMatches[1] + ">\n"
            }
        }
        strToSend += "  </address>\n"
    }
    strToSend += "</validateAddresses>\n";
    return getInfo("avs", "Shipping_Class", "inlineAVS", strToSend)
}
function confirmCartClear() {
    if (confirm("Would you like to keep your cart contents?\n\nClick 'OK' to keep your cart's content.\nClicking 'Cancel' below will clear your cart.")) {
        window.location = "/member_login/1/1"
    } else {
        window.location = "/member_login/1"
    }
}
function remainingCharacters(a, b) {
    var c = 500;
    var b = "count_" + b;
    var d = document.getElementById ? document.getElementById(b) : document.all(b);
    if (d.innerHTML >= 1) {
        d.innerHTML = c - a.value.length;
        return true
    } else if (d.innerHTML <= 0) {
        a.value = a.value.substr(0, c);
        d.innerHTML = c - a.value.length;
        return false
    }
}
function showHideQA(a, b) {
    var b = a + "_" + b;
    var c = document.getElementById ? document.getElementById(b) : document.all(b);
    if (typeof c != "undefined" && c != null) {
        c.style.display = c.style.display == "none" ? "block" : "none"
    }
}
function addRemoveCompare(a, b, c) {
    if (typeof document.getElementById("compare_ids") != "undefined" && document.getElementById("compare_ids") != null) {
        var d = document.getElementById("compare_ids");
        var e = false;
        if (typeof document.getElementById("compare_ids_2") != "undefined" && document.getElementById("compare_ids_2") != null) {
            var f = document.getElementById("compare_ids_2");
            e = true
        }
        if (a.checked == true) {
            if (d.value == "" && b != c) {
                d.value = a.value
            } else if (d.value != "" && b != c) {
                var g = d.value.split(",");
                var h = b + g.length + 1;
                if (g.length == c || h > c) {
                    alert("You have reached the maximum number of comparable products (" + c + ").\nPlease remove some products from your comparison list and try again.");
                    a.checked = false;
                    return false
                }
                var i = false;
                for (var j = 0, k = g.length; j < k; j++) {
                    if (a.value == g[j]) {
                        i = false;
                        break
                    } else {
                        i = true
                    }
                }
                if (i) {
                    d.value += "," + a.value
                }
            } else {
                alert("You have reached the maximum number of comparable products (" + c + ").\nPlease remove some products from your comparison list and try again.");
                a.checked = false;
                return false
            }
        } else if (a.checked == false) {
            var g = d.value.split(",");
            for (var j = 0, k = g.length; j < k; j++) {
                if (g[j] == a.value) {
                    delete g[j]
                }
            }
            var l = g.join(",");
            if (l.substr(0, 1) == ",") {
                l = l.substr(1, l.length - 1)
            }
            if (l.substr(-1) == ",") {
                l = l.substr(0, l.length - 1)
            }
            d.value = l.replace(",,", ",")
        }
        if (e) {
            f.value = d.value
        }
    }
}
function removeCompareProducts() {
    if (typeof document.compare != "undefined" && document.compare != null) {
        var a = "";
        for (var b = 0, c = document.compare.elements.length; b < c; b++) {
            if (document.compare.elements[b].name.substr(0, 14) == "remove_compare" && document.compare.elements[b].checked == true) {
                a += "|" + document.compare.elements[b].value
            }
        }
        if (a != "") {
            window.location = "/compare_products/" + a
        }
    }
}
function bookmarksite(a, b) {
    if (window.sidebar) window.sidebar.addPanel(a, b, "");
    else if (window.opera && window.print) {
        var c = document.createElement("a");
        c.setAttribute("href", b);
        c.setAttribute("title", a);
        c.setAttribute("rel", "sidebar");
        c.click()
    } else if (document.all) window.external.AddFavorite(b, a)
}
function MM_swapImage() {
    var a, b = 0,
        c, d = MM_swapImage.arguments;
    document.MM_sr = new Array;
    for (a = 0; a < d.length - 2; a += 3) if ((c = MM_findObj(d[a])) != null) {
        document.MM_sr[b++] = c;
        if (!c.oSrc) c.oSrc = c.src;
        c.src = d[a + 2]
    }
}
function MM_findObj(a, b) {
    var c, d, e;
    if (!b) b = document;
    if ((c = a.indexOf("?")) > 0 && parent.frames.length) {
        b = parent.frames[a.substring(c + 1)].document;
        a = a.substring(0, c)
    }
    if (!(e = b[a]) && b.all) e = b.all[a];
    for (d = 0; !e && d < b.forms.length; d++) e = b.forms[d][a];
    for (d = 0; !e && b.layers && d < b.layers.length; d++) e = MM_findObj(a, b.layers[d].document);
    if (!e && b.getElementById) e = b.getElementById(a);
    return e
}
function MM_swapImgRestore() {
    var a, b, c = document.MM_sr;
    for (a = 0; c && a < c.length && (b = c[a]) && b.oSrc; a++) b.src = b.oSrc
}
function MM_openBrWindow(a, b, c) {
    window.open(a, b, c)
}
function toggleBlock(a, b, c, d) {
    if (document.getElementById(a).value == c) {
        var e = d
    } else {
        var e = d == "block" ? "none" : "block"
    }
    document.getElementById(b).style.display = e;
    return false
}
function suggestedSearchSniff(a, b, c, d, e) {
    if (a.keyCode == 40) {
        if (suggested_val == null) {
            suggested_val = 0
        } else {
            document.getElementById("suggestion_" + suggested_val).className = "suggestion";
            suggested_val++
        }
        if (document.getElementById("suggestion_" + suggested_val) != undefined) {
            fld = document.getElementById("suggestion_" + suggested_val);
            document.getElementById("search_keyword").value = fld.innerHTML;
            fld.className = "suggestion_hover"
        } else {
            suggested_val = null
        }
    } else if (a.keyCode == 38) {
        if (suggested_val != null && suggested_val != 0) {
            document.getElementById("suggestion_" + suggested_val).className = "suggestion";
            suggested_val--;
            if (document.getElementById("suggestion_" + suggested_val) != undefined) {
                fld = document.getElementById("suggestion_" + suggested_val);
                document.getElementById("search_keyword").value = fld.innerHTML;
                fld.className = "suggestion_hover"
            } else if (document.getElementById("suggestion_0") != undefined) {
                fld = document.getElementById("suggestion_0");
                document.getElementById("search_keyword").value = fld.innerHTML;
                fld.className = "suggestion_hover";
                suggested_val = 0
            } else {
                suggested_val = null
            }
        } else if (suggested_val == 0) {
            document.getElementById("suggestion_0").className = "suggestion";
            suggested_val = null
        }
    } else {
        suggested_val = null;
        getInfo(b, c, d, e)
    }
}
function suggestedSearchField(a, b) {
    if (b == "out") {
        a.className = "suggestion"
    } else if (b == "over") {
        a.className = "suggestion_hover"
    } else if (b == "click") {
        document.getElementById("search_keyword").value = a.innerHTML;
        document.getElementById("suggestions").innerHTML = "";
        document.getElementById("suggestions").className = ""
    }
}
function hideShowCalc(a) {
    a = a != "" ? "_" + a : "";
    if (document.getElementById("cart_ship_estimator" + a) != null && typeof document.getElementById("cart_ship_estimator" + a) != "undefined") {
        var b = document.getElementById("cart_ship_estimator" + a);
        var c = document.getElementById("hideShowCalc" + a)
    } else {
        return false
    }
    b.style.display = b.style.display == "block" ? "none" : "block";
    c.innerHTML = b.style.display == "block" ? "Hide Details" : "Show Details"
}
function validateForgotForm(a) {
    var b = a.email;
    var c = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (b.value == null || b.value == "") {
        document.getElementById("errorMsg").innerHTML = "<br />Please enter a valid e-mail address before continuing.";
        b.focus();
        return false
    } else {
        if (!c.test(b.value)) {
            document.getElementById("errorMsg").innerHTML = "<br />Please enter a valid e-mail address before continuing.";
            b.value = "";
            b.focus();
            return false
        }
    }
    return true
}
function noHammer(a) {
    if (typeof a.submit != "undefined") {
        a.submit.disabled = true;
        a.submit.value = "Wait...";
        return true
    }
}
function in_array(a, b) {
    if (typeof a == undefined) {
        alert("Needle is undefined.\nError: in_array");
        return false
    } else if (typeof b == undefined) {
        alert("Needle is undefined.\nError: in_array");
        return false
    }
    for (i = 0, n = b.length; i < n; i++) {
        if (b[i] == a) {
            return true
        }
    }
    return false
}
function verifyRecipients(a) {
    var b = a.length;
    var c = 1,
        d = new Array;
    for (var e = 0; e < b; e++) {
        if (c && a.elements[e].name.substr(0, 4) == "recp") {
            var f = +a.elements[e].options.length - 1;
            c = 0
        }
        if (a.elements[e].name.substr(0, 4) == "recp" && a.elements[e].value == "") {
            alert("You must choose a recipient for each of the products you are purchasing.");
            return false
        } else if (a.elements[e].name.substr(0, 4) == "recp") {
            var g = a.elements[e].selectedIndex;
            if (!in_array(g, d)) {
                var h = d.length;
                d.push(g)
            }
        }
    }
    if (d.length != f) {
        var i = confirm("Some of your shipping address do not have products assigned to them.\n\nDo you wish to continue anyway?");
        if (i) {
            return true
        } else {
            return false
        }
    }
    return true
}
function hasUpdated() {
    if (document.getElementById("hasUpdated") != null) {
        var a = document.getElementById("hasUpdated").value;
        if (a != "1") {
            alert("You have not updated your cart since last changing your quantities.\nPlease press the 'Update Cart' button before continuing.");
            return false
        }
    }
    return true
}
function cartChange(a, b, c, d, e, f) {
    var g = 0;
    var h = document.getElementById("qty_" + a).value;
    if (isNaN(h)) {
        document.getElementById("qty_" + a).value = "";
        h = ""
    }
    var j = document.getElementById("price_" + a).value.replace(f, "");
    var j = j.replace(",", "");
    if (c != "0" || !c) {
        var k = b.replace(",", "")
    } else {
        document.getElementById("price_" + a).value = f + "0.00"
    }
    g = k * h;
    document.getElementById("price_" + a).value = f + g.toFixed(2);
    if (d == document.getElementById("total").value) {
        d = d - j;
        d = d + g;
        document.getElementById("total").value = f + d.toFixed(2)
    } else {
        var l = document.getElementById("total").value.split("$");
        l = l[1].replace(",", "");
        d = l - j;
        d = d + g;
        document.getElementById("total").value = f + d.toFixed(2)
    }
    var m = getCookie(e);
    arQty = m.split("|");
    cntQty = arQty.length - 1;
    for (i = 0; i < cntQty; i++) {
        arID = arQty[i].split(",");
        if (document.getElementById("qty_" + arID[0]).value == arID[1]) {
            document.getElementById("hasUpdated").value = "1";
            document.getElementById("update_msg").style.color = "#000";
            continue
        } else {
            document.getElementById("hasUpdated").value = "0";
            document.getElementById("update_msg").style.color = "#F00";
            break
        }
    }
}
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

  // Can't do this for select boxes that have predefined functions so if the qty field is one of those, skip this
  if (qty.type != 'select-one') {
    // adjust the qty box if they're using the + or - buttons:
    if (oper == 'add') {
      ++qty.value;
    } else if (oper == 'sub' && qty.value >= '1') {
      --qty.value;
    } else if (qty.value < 0 || isNaN(parseFloat('0' + qty.value))) {
      qty.value = '';
    }
  }

  // reset the price if the qty goes below 1, is blank, or isNaN:
  if (qty.value <= 0 || qty.value == '' || isNaN(parseFloat("0" + qty.value))) {
    num = parseFloat(num);
    price.value = curr_type + num.toFixed(2);
  } else {
    // everything is OK, get the new price:
    price.value = curr_type + ((num.replace(',','') * qty.value)).toFixed(2);
  }
}
function checkMinQtySubs(a, b, c) {
    var d = a.split(",");
    var e = b.split(",");
    var f = c.split(",");
    for (var g in d) {
        if (d[g] != "" && !checkMinQty("qty_" + d[g], e[g], "")) {
            priceChange(d[g], "dynamic", f[g]);
            return false
        }
    }
    return true
}
function checkMinQty(a, b, c) {
    qty = document.getElementById(a);
    curr_qty = qty.value;
    if (curr_qty != 0 && b != "0" && b != "1") {
        if (c == "interactive") {
            curr_qty--
        }
        if (Number(curr_qty) < Number(b)) {
            alert("You must add at least " + b + " of that item before continuing.");
            qty.value = b;
            return false
        }
    }
    return true
}
function isCookied(a, b) {
    if (getCookie(a) != b) {
        return true
    } else {
        return false
    }
}
function setCookie(a, b) {
    document.cookie = a + "=" + b
}
function getCookie(a) {
    var b = a + "=";
    var c = "";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(b);
        if (offset != -1) {
            offset += b.length
        }
        end = document.cookie.indexOf(";", offset);
        if (end == -1) {
            end = document.cookie.length
        }
        c = unescape(document.cookie.substring(offset, end))
    }
    return c
}
function bookmark(a) {
    var b = location.href;
    var c = a;
    var d = navigator.appName;
    if (d == "Microsoft Internet Explorer") {
        window.external.AddFavorite(b, c)
    } else if (d == "Netscape") {
        alert("Your browser does not support this feature.  Use CTRL-D to bookmark this page")
    } else {
        alert("Your browser does not support this feature.")
    }
}
function preload_images() {
    var a = document;
    if (!a.imgs) {
        a.imgs = new Array
    }
    var b = a.imgs.length,
        c = preload_images.arguments,
        d;
    for (d = 0; d < c.length; d++) {
        a.imgs[b] = new Image;
        a.imgs[b].src = c[d];
        b++
    }
}
function goID(a) {
    window.location = document.getElementById(a).value
}
function go(a) {
    window.location = a.range.options[a.range.selectedIndex].value
}
var suggested_val = null;
String.prototype.toUCWords = toUCWords
/*
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
*/
/*function to bookmark a URL*/
function bookmarkURL(b_title, b_href, elem) {
            var bookmarkUrl = b_href;
            var bookmarkTitle = b_title;
            if (navigator.userAgent.toLowerCase().indexOf('chrome') > -1) {
                alert("Press Control + D to bookmark");
        }
            else if (window.sidebar) {
                $(elem).attr('href', bookmarkUrl);
                $(elem).attr('title', bookmarkTitle);
                $(elem).attr('rel', 'sidebar');
        }
            else if (window.external) {
                window.external.AddFavorite(bookmarkUrl, bookmarkTitle);
        }
            else {
                alert("Sorry! Your browser doesn't support function.Use the bookmark option in your browser instead.");
        }
}