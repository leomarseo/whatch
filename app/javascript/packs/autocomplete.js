import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  console.log("the autocomplete.js file was loaded successfully");
  const actors = JSON.parse(document.getElementById('search-data').dataset.actors);
  const searchInput = document.getElementById('q');

  if (actors && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 3,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = actors;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
