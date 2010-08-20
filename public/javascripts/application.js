function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

function validateForm(submitBtn) {
	var chapter = document.getElementById("exercise_chapter");
	if (chapter.value) {
		return true;
	};
	
	alert("Chapter cannot be blank!");
	return false;
}