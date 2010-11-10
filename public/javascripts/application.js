function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
  
  var timeFlag = new Date().getTime();
  $(link).parent().prev().children(".position_field").val(timeFlag);
}

$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");}
});

$(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });
  
  $("#exercise_form").submit(function() {
     var $input = $(this).find("#exercise_chapter");
     if (!$input.val()) {
         if ($input.parent().attr("class") != "error") {
             $input.parent().addClass("error");
             $input.after("\tCan't be blank");
         };    
         
         $input.focus();
         return false;
     };
     return true;
  });
  
});