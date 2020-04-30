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
      let image;
      if (item.photo === 'placeholder') {
        image = '<img src="avatar.svg" style="width: 40px;">';
      } else {
        image = `<img src="https://image.tmdb.org/t/p/w200${item.photo}" style="width: 40px; height: 60px;">`;
      };

      if (SELECTEDBUTTON == "genre") { image = "" };

      search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");

      return `<div id="${item.id}" class="autocomplete-suggestion" data-val="` + item.name + '">' + image + " " + item.name.replace(re, "<b>$1</b>") + `</div>`;
  };

  const autocompleteSearch = (selectedButton) => {
    let inputDiv = document.getElementById(`${SELECTEDBUTTON}-input`);
    let names = JSON.parse(inputDiv.dataset.names);
    let photos = JSON.parse(inputDiv.dataset.photos);
    let searchInput = inputDiv.children[0];
    let chars = 3;
    if (SELECTEDBUTTON == "genre") { chars = 1 };

    if (searchInput) {
      new autocomplete({
        selector: searchInput,
        minChars: chars,
        source: function(term, suggest){
            term = term.toLowerCase();
            const matches = [];
            for (let i = 0; i < names.length; i++)
                if (~names[i].toLowerCase().indexOf(term)) matches.push( { name: names[i], photo: photos[i], id: i } );
            suggest(matches);
        },
        renderItem: renderItem,
        onSelect: onSelect,
      });

    }
  };

  const onSelect = () => {
    // write code to generate two buttons at mouse location after you select an actor
    toggleAddRemoveButtons();
  }

  const toggleAddRemoveButtons = () => {
    document.getElementById(`${SELECTEDBUTTON}-input`).children[1].style.display = "block";
    document.getElementById(`${SELECTEDBUTTON}-add-button`).style.display = "block";
    document.getElementById(`${SELECTEDBUTTON}-remove-button`).style.display = "block";
  };



};

export { autocompleteWrapper };
