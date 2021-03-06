function createCORSRequest(method, url) 
{
  var xhr = new XMLHttpRequest();
  if ("withCredentials" in xhr) 
  {
    xhr.open(method, url, true);
  } 
  else if (typeof XDomainRequest != "undefined") 
  {
    xhr = new XDomainRequest();
    xhr.open(method, url);
  } 
  else
  {
    xhr = null;
  }
  return xhr;
}
 
function handleFileSelect(evt) 
{
  var fieldset = $(evt.target).parent().attr('id');
  setProgress(0, '',fieldset);
 
  var files = evt.target.files; 

  var output = [];
  for (var i = 0, f; f = files[i]; i++) 
  {
    uploadFile(f, fieldset);
  }
}
 
/**
 * Execute the given callback with the signed response.
 */
function executeOnSignedUrl(file, fieldset, callback)
{
  var xhr = new XMLHttpRequest();
  xhr.open('GET', '/services/ajax/gets3sig.php?name=' + file.name + '&type=' + file.type, true);
 
  // Hack to pass bytes through unprocessed.
  if (!!xhr.overrideMimeType) xhr.overrideMimeType('text/plain; charset=x-user-defined');

  xhr.onreadystatechange = function(e) 
  {
    if (this.readyState == 4 && this.status == 200) 
    {
      callback(decodeURIComponent(this.responseText));
    }
    else if(this.readyState == 4 && this.status != 200)
    {
      setProgress(0, 'Could not contact signing script. Status = ' + this.status, fieldset);
    }
  };
 
  xhr.send();
}
 
function uploadFile(file, fieldset)
{
  executeOnSignedUrl(file, fieldset, function(signedURL) 
  {
    uploadToS3(file, signedURL, fieldset);
  });
}
 
/**
 * Use a CORS call to upload the given file to S3. Assumes the url
 * parameter has been signed and is accessable for upload.
 */
function uploadToS3(file, url, fieldset)
{
  var xhr = createCORSRequest('PUT', url);
  if (!xhr) 
  {
    setProgress(0, 'CORS not supported', fieldset);
  }
  else
  {
    xhr.onload = function() 
    {
      if(xhr.status == 200)
      {
        setProgress(100, 'Upload completed.', fieldset);
        var spliturl = url.split("?");
        $('#' + fieldset + ' .setfile').val(spliturl[0]);
      }
      else
      {
        setProgress(0, 'Upload error: ' + xhr.status, fieldset);
      }
    };
 
    xhr.onerror = function() 
    {
      setProgress(0, 'XHR error.', fieldset);
    };
 
    xhr.upload.onprogress = function(e) 
    {
      if (e.lengthComputable) 
      {
        var percentLoaded = Math.round((e.loaded / e.total) * 100);
        setProgress(percentLoaded, '', fieldset);
      }
    };
 
    xhr.setRequestHeader('Content-Type', file.type);
    xhr.setRequestHeader('x-amz-acl', 'public-read');
 
    xhr.send(file);
  }
}
 
function setProgress(percent, statusLabel, fieldset)
{
  $('#' + fieldset + ' #filestatus').slideDown();
  var progress = document.querySelector('#' + fieldset + ' .percent');
  progress.style.width = percent + '%';
  progress.textContent = percent + '%';
  document.querySelector('#' + fieldset + ' #progress_bar').className = 'loading';
  if (statusLabel.length) { 
    $('#' + fieldset + ' #progress_bar').hide();
    $('#' + fieldset + ' #status').html(statusLabel).fadeIn();
  } else {
    $('#' + fieldset + ' #status').hide();
    $('#' + fieldset + ' #progress_bar').fadeIn();
  }
}
