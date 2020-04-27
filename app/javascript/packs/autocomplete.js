import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const renderItem = function (item, search) {
    let icon;
    let image;
    icon = `<p class="${item.id} smart-add-button" style="z-index: 999;">funzionaaa</p>`;
    if (item.photo === 'placeholder') {
      image = '<img src="avatar.png" style="width: 40px;">';
    } else {
    image = `<img src="https://image.tmdb.org/t/p/w200${item.photo}" style="width: 40px; height: 60px;">`;
    };

    search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
    return `<div id="${item.id}" class="autocomplete-suggestion" data-val="` + item.name + '">' + image + item.name.replace(re, "<b>$1</b>") + '</div>';
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
  const actorsNames = JSON.parse(document.getElementById('search-bar').dataset.actorsnames);
  const actorsPhotos = JSON.parse(document.getElementById('search-bar').dataset.actorsphotos);
  const directorsNames = JSON.parse(document.getElementById('search-bar').dataset.directorsnames);
  const directorsPhotos = JSON.parse(document.getElementById('search-bar').dataset.directorsphotos);
  const genresNames = JSON.parse(document.getElementById('search-bar').dataset.genresnames);
  const genresPhotos = JSON.parse(document.getElementById('search-bar').dataset.genresphotos);
  const searchInput = document.getElementById('search-bar-field');

  if (actorsNames && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 3,
      source: function(term, suggest){
          term = term.toLowerCase();
          let choices = actorsNames;
          let photos = actorsPhotos;
          if (SELECTION === 'actor') {
            choices = actorsNames;
            photos = actorsPhotos;
          }
          if (SELECTION === 'director') {
            choices = directorsNames;
            photos = directorsPhotos;
          }
          if (SELECTION === 'genre') {
            choices = genresNames;
            photos = genresPhotos;
          }
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push( { name: choices[i], photo: photos[i], id: i } );
          suggest(matches);
      },
      renderItem: renderItem,
    });

  }
};

// const button = document.querySelector(".641");
//   button.addEventListener("click", {
//     handleEvent: function (event) {
//       let id = button.classList.item(0);
//       let currentTextInput = document.getElementById(id).innerText;
//       console.log(SELECTION);
//       let hiddenFormInput = document.querySelector(`.${SELECTION}s_positive`).value
//       if (hiddenFormInput === "") {
//         document.querySelector(`.${SELECTION}s_positive`).value = currentTextInput;
//       } else {
//         document.querySelector(`.${SELECTION}s_positive`).value = hiddenFormInput + "," + currentTextInput;
//       }
//   }
//   });


export { autocompleteSearch };
