import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteWrapper = function() {

  console.log("the autocomplete.js file was loaded successfully");

  let SELECTEDBUTTON


  const actorSelectButton = document.getElementById("actor-btn");
  const directorSelectButton = document.getElementById("director-btn");
  const genreSelectButton = document.getElementById("genre-btn");

  actorSelectButton.addEventListener("click", event => {
      SELECTEDBUTTON = event.target.dataset.value;
      autocompleteSearch(SELECTEDBUTTON);
  });

  directorSelectButton.addEventListener("click", event => {
      SELECTEDBUTTON = event.target.dataset.value;
      autocompleteSearch(SELECTEDBUTTON);
    });

    // GENRE BUTTON WITH RELATED LISTENER
  genreSelectButton.addEventListener("click", event => {
    SELECTEDBUTTON = event.target.dataset.value;
    autocompleteSearch(SELECTEDBUTTON);
  });

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

  const autocompleteSearch = (selectedButton) => {
    let searchInput = document.getElementById(`${SELECTEDBUTTON}-input`);
    console.log(searchInput);
    let names = JSON.parse(searchInput.dataset.names);
    let photos = JSON.parse(searchInput.dataset.photos);

    if (searchInput) {
      new autocomplete({
        selector: searchInput,
        minChars: 3,
        source: function(term, suggest){
            term = term.toLowerCase();
            let choices = names;
            console.log('ciao');
            let pictures = photos;
            const matches = [];
            for (let i = 0; i < choices.length; i++)
                if (~choices[i].toLowerCase().indexOf(term)) matches.push( { name: choices[i], photo: photos[i], id: i } );
            suggest(matches);
        },
        renderItem: renderItem,
      });

    }
  };

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


export { autocompleteWrapper };
