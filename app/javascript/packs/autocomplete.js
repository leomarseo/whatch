import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const renderItem = function (item, search) {
    let icon;
    icon = '<i class="fab fa-github"></i>';


    search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
    return '<div class="autocomplete-suggestion" data-val="' + item + '">' + icon + ' ' + item.replace(re, "<b>$1</b>") + '</div>';

    // return `<div class="autocomplete-suggestion">${icon}<span>${item}</span></div>`
};


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
  const actors = JSON.parse(document.getElementById('search-bar').dataset.actors);
  const directors = JSON.parse(document.getElementById('search-bar').dataset.directors);
  const genres = JSON.parse(document.getElementById('search-bar').dataset.genres);
  const searchInput = document.getElementById('search-bar-field');

  if (actors && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 3,
      source: function(term, suggest){
          term = term.toLowerCase();
          let choices = actors;
          if (SELECTION === 'actor') { choices = actors };
          if (SELECTION === 'director') { choices = directors };
          if (SELECTION === 'genre') { choices = genres };
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
      renderItem: renderItem,
    });

  }
};

export { autocompleteSearch };
