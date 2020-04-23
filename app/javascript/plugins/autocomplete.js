import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const renderItem = function (item, search){
  search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
  var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
  return '<div class="autocomplete-suggestion" data-val="' + item + '">' + item.replace(re, "<b>$1</b>") + '</div>';
}


const autocompleteSearch = function(selection) {
  let skills
  console.log(selection)
  if (selection === 'actor')
    console.log('ciao')
   { skills = JSON.parse(document.getElementById('search-data').dataset.actors); };

  const searchInput = document.getElementById('q');

  if (skills && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 3,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = skills;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
