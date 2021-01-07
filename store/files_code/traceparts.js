var TracePartsApiClient = {
  apiKey: "3qLUCxEHdnmVag",
  baseUrl: "https://ws.tracepartsonline.net/tpowebservices/",
  get: async function (endPoint, params, cb) {
    var url =
      this.baseUrl + endPoint + "?" + "ApiKey=" + this.apiKey + "&Format=json";

    for (var k in params) {
      url += "&" + k + "=" + encodeURIComponent(params[k]);
    }

    try {
      const response = await fetch(url);
      const data = await response.json();

      console.log(data);

      if (typeof cb !== "undefined") {
        cb(data);
      }

      return data;
    } catch (error) {
      console.error(error);
    }
  },
};

//////////////////////////////////////////////////////////////////////////////////////////////

var TracePartsCadFormatsFieldDropDown = function (options) {
  this.field = options.element;
  if (typeof options.onChange != "undefined") {
    this.field.addEventListener("change", options.onChange);
  }
};

TracePartsCadFormatsFieldDropDown.prottype.addFormats = function (
  cadFormatList
) {
  var options = document.createDocumentFragment();
  for (var i = 0; i < cadFormatList.length; ++i) {
    var option = document.createElement("option");
    option.value = cadFormatList[i].cadFormatId;
    option.innerHTML = cadFormatList[i].cadFormatName;
    options.appendChild(option);
  }

  this.field.innerHHTML = "";
  this.field.appendChild(options);
};

//////////////////////////////////////////////////////////////////////////////////////////////

var tracePartsDownloadCADPath = function (params, callBack) {
  TracePartsApiClient.get("DownloadCADPath", params, function (data) {
    if (typeof callBack != "undefined") {
      if (data.globalInfo.error == "False") {
        callBack(data);
      } else {
        throw "Download error";
      }
    }
  });
};

/////////////////////////////////////////////////////////////////////////////////////////////

var TracePartsDownloadOptions = function (params, selectField) {
  TracePartsApiClient.get("CADdataAvailability", params, function (data) {
    var select = new TracePartsCadFormatsFieldDropDown({
      element: selectField,
    });
    var array = $.map(data.cadFormatList, function (value, index) {
      value.key = index;
      return value;
    });
    array.sort(function (a, b) {
      return a.cadFormatName
        .toLowerCase()
        .localeCompare(b.cadFormatName.toLowerCase());
    });
    select.addFormats(array);
  });
};
