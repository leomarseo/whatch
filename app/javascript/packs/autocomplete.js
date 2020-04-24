import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

let SELECTION;
let searchContainer = document.getElementById("mySelect");
searchContainer.addEventListener("change", {
    handleEvent: function (event) {
      SELECTION = searchContainer.value
      autocompleteSearch()
    }
  });

const autocompleteSearch = function() {
  console.log("the autocomplete.js file was loaded successfully");
  const actors = JSON.parse(document.getElementById('search-data').dataset.actors);
  const directors = JSON.parse(document.getElementById('search-data').dataset.directors);
  const genres = JSON.parse(document.getElementById('search-data').dataset.genres);
  const searchInput = document.getElementById('q');

  let current;

  if (SELECTION == 'actor') { current = actors };
  if (SELECTION == 'director') { current = directors };
  if (SELECTION == 'genre') { current = genres };

  console.log(current);

  if (current && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 3,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = current;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
