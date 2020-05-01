const searchFilters = () => {
  console.log('loaded searchFilters');

  // Edit this to change icon class
  const removeIconClass = 'filter-remove';

  const positiveTypeIconClass = 'positive';
  const negativeTypeIconClass = 'negative';

  // used to identify objects within this page
  let counter = 0;

  let selection = {
    positive_actors: [],
    positive_directors: [],
    positive_genres: [],
    negative_actors: [],
    negative_directors: [],
    negative_genres: [],
  }

  // ACTOR BUTTON WITH RELATED LISTENER
  const actorSelectButton = document.getElementById("actor-btn");
  actorSelectButton.addEventListener("click", event => {
    document.getElementById("genre-input").style.display = "none";
    document.getElementById("director-input").style.display = "none";
    document.getElementById("actor-input").style.display = "block";
    actorSelectButton.classList.add('border-selection');
    directorSelectButton.classList.remove('border-selection');
    genreSelectButton.classList.remove('border-selection');
  });

  // DIRECTOR BUTTON WITH RELATED LISTENER
  const directorSelectButton = document.getElementById("director-btn");
  directorSelectButton.addEventListener("click", event => {
    document.getElementById("actor-input").style.display = "none";
    document.getElementById("genre-input").style.display = "none";
    document.getElementById("director-input").style.display = "block";
    directorSelectButton.classList.add('border-selection');
    genreSelectButton.classList.remove('border-selection');
    actorSelectButton.classList.remove('border-selection');
  });

  // GENRE BUTTON WITH RELATED LISTENER
  const genreSelectButton = document.getElementById("genre-btn");
  genreSelectButton.addEventListener("click", event => {
    document.getElementById("actor-input").style.display = "none";
    document.getElementById("director-input").style.display = "none";
    document.getElementById("genre-input").style.display = "block";
    genreSelectButton.classList.add('border-selection');
    directorSelectButton.classList.remove('border-selection');
    actorSelectButton.classList.remove('border-selection');
  });


  // ADD AND REMOVE BUTTONS WITH RELATED LISTENERS

  // ACTOR
  const actorAddButton = document.getElementById("actor-add-button")
  actorAddButton.addEventListener("click", event => {
    selection['positive_actors'].push([ counter, document.getElementById("actor-input-field").value ]);
    updateSelectionContainer();
    resetButtons(event);

  });

  const actorRemoveButton = document.getElementById("actor-remove-button")
  actorRemoveButton.addEventListener("click", event => {
    selection['negative_actors'].push([ counter, document.getElementById("actor-input-field").value ]);
    updateSelectionContainer();
    resetButtons(event);

  });

  // DIRECTOR
  const directorAddButton = document.getElementById("director-add-button")
  directorAddButton.addEventListener("click", event => {
    selection['positive_directors'].push([ counter, document.getElementById("director-input-field").value ]);
    updateSelectionContainer();
    resetButtons(event);
  });

  const directorRemoveButton = document.getElementById("director-remove-button")
  directorRemoveButton.addEventListener("click", event => {
    selection['negative_directors'].push([ counter, document.getElementById("director-input-field").value ]);
    updateSelectionContainer();
    resetButtons(event);
  });


  // GENRE
  const genreAddButton = document.getElementById("genre-add-button")
  genreAddButton.addEventListener("click", event => {
    selection['positive_genres'].push([ counter, document.getElementById("genre-input-field").value ]);
    updateSelectionContainer();
    resetButtons(event);
  });

  const genreRemoveButton = document.getElementById("genre-remove-button")
  genreRemoveButton.addEventListener("click", event => {
    selection['negative_genres'].push([ counter, document.getElementById("genre-input-field").value ]);
    updateSelectionContainer();
    resetButtons(event);
  });


  // UPDATES SELECTION BOX TO BE SHOWN TO USER WITH RELEVANT INPUT
  const updateSelectionContainer = () => {
    counter = counter + 1;
    let container = document.getElementById("all-selections");
    container.textContent = '';
    Object.entries(selection).forEach((array_of_values) => {
      let type = array_of_values.slice(0,1);
      let values = array_of_values.filter(x => !type.includes(x));;
      Object.values(values[0]).forEach((value) => {
        container.appendChild(createChildSelection(value, type));
      });
    });
  }

  const resetButtons = (event) => {
    event.target.parentNode.parentNode.children[0].value = "";
    event.target.parentNode.style.display = "none";
  };

  // CREATES CHILD TO BE APPENDED TO THE SELECTION BOX CONTAINER
  const createChildSelection = (value, type) => {
    let child = document.createElement('div');
    child.setAttribute('class', 'selection');
    child.setAttribute('data-value', value[1]);
    child.setAttribute('data-id', value[0]);
    child.style.display = "flex";

    let childValue = document.createElement('p');
    childValue.textContent = value[1];

    let removeIcon = document.createElement('button');
    removeIcon.setAttribute('class', removeIconClass);
    addRemoveEventListener(removeIcon);

    let typeIcon = document.createElement('div');

    if (type[0].slice(0,8) === 'positive') {
      typeIcon.setAttribute('class', positiveTypeIconClass);
    } else {
      typeIcon.setAttribute('class', negativeTypeIconClass);
    }

    child.appendChild(typeIcon);
    child.appendChild(childValue);
    child.appendChild(removeIcon);
    return child;
  }

  // LISTENS TO REMOVE BUTTONS (IN SELECTION BOX), TO UPDATE SELECTION VARIABLE AND SELECTION BOX
  const addRemoveEventListener = (button) => {
    button.addEventListener("click", event => {
      let id = event.target.parentNode.dataset.id;

      Object.values(selection).forEach(current_array => {
        current_array.forEach((array, index) => {
          if (array[0] === Number.parseInt(id, 10)) {
            current_array.splice(index, 1);
          }
        });
      });
      updateSelectionContainer();
    });
  }

  // LISTENS TO WHATCH BUTTON TO CREATE THE PROPER GET REQUEST TO TMDB_SUGGESTIONS_CONTROLLER
  const watchButton = document.getElementById("watch-btn");
  watchButton.addEventListener("click", event => {
    document.location.href = `/tmdb_suggestions/${JSON.stringify(refineSelection())}`;
  });

  const refineSelection = () => {
    Object.values(selection).forEach(current_array => {
      current_array.forEach((array) => {
        array.splice(0, 1);
      });
    });
    return selection;
  }

}

export { searchFilters }
