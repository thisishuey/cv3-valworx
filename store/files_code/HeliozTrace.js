var HeliozTraceApiClient = {
    apiKey: '3qLUCxEHdnmVag',
    baseUrl: 'https://ws.tracepartsonline.net/tpowebservices/',
    get: function (endPoint, params, cb) {
        var url = this.baseUrl + endPoint + '?' + 'ApiKey=' + this.apiKey + '&Format=json';

        for (var k in params) {
            url += '&' + k + '=' + encodeURIComponent(params[k]);
        }

        var request = new XMLHttpRequest();
        request.open('GET', url, true);

        request.onload = function () {
            if (request.status >= 200 && request.status < 400) {
                var data = JSON.parse(request.responseText);
                cb(data);
            }  else  {
                console.error(request);
            }
        };

        request.onerror = function () {
            console.error(request);
        };

        request.send();

    }
};

//////////////////////////////////////////////////////////////////////////////////////////////

var HeliozTraceCadFormatsFieldDropDown = function (options) {
    this.field = options.element;
    if (typeof options.onChange != 'undefined') {
        this.field.addEventListener('change', options.onChange);
    }
}

HeliozTraceCadFormatsFieldDropDown.prototype.addFormats = function (cadFormatList) {
    var options = document.createDocumentFragment();
    for (var i=0; i < cadFormatList.length;++i) {
        var option = document.createElement('option');
        option.value = cadFormatList[i].cadFormatId;
        option.innerHTML = cadFormatList[i].cadFormatName;
        options.appendChild(option);
    }

    this.field.innerHHTML = '';
    this.field.appendChild(options);

}

//////////////////////////////////////////////////////////////////////////////////////////////

var heliozTraceDownloadCADPath = function (params, callBack) {
    HeliozTraceApiClient.get('DownloadCADPath', params, function (data) {
        if (typeof callBack != 'undefined') {
            if (data.globalInfo.error == 'False') {
                callBack(data);
            } else {
                throw "Download error";
            }
        }
    });
}

/////////////////////////////////////////////////////////////////////////////////////////////

var heliozTraceDownloadOptions = function (params, selectField) {
    HeliozTraceApiClient.get('CADdataAvailability', params, function (data) {
        var select = new HeliozTraceCadFormatsFieldDropDown({
            element:selectField
        })
        var array = $.map(data.cadFormatList, function (value, index) {
            value.key = index;
            return value;
        });
        array.sort(function (a, b) {
            return a.cadFormatName.toLowerCase().localeCompare(b.cadFormatName.toLowerCase());
        });
        select.addFormats(array);
    });
}