var tagSelect;
var chosenSelect;

function initChosenTagSelect(element) {
  tagSelect = "#" + element + "_all_tags";
  chosenSelect = "#" + element + "_all_tags_chosen";
  $(tagSelect).chosen({
    allow_single_deselect: true,
    width: '100%',
    no_results_text: "No results found. Press ',' (comma) to add a new tag for"
  });
  $(chosenSelect).keyup(maybeCommaPress);
}

function maybeCommaPress(ev) {
  if (ev.which === 188) {
    var newTag = $(chosenSelect).find(".search-field input").val().replace(/,/g, '');
    return createNewTag(newTag).done(addTagToSelect);
  }
}

function createNewTag(tagName) {
  return $.ajax({
    type: 'POST',
    url: '/tags',
    dataType: 'json',
    data: {
      tag: { name: tagName }
    }
  });
}

function addTagToSelect(tagObj){
  $(tagSelect).append($('<option></option>')
            .val(tagObj.name)
            .attr('selected', 'selected')
            .html(tagObj.name));

  $(tagSelect).trigger('chosen:updated');
}
