
const searchFilters = () => {
  console.log("the searchfilters.js file was loaded successfully")
// here we get the user selection
  let searchContainer = document.getElementById("mySelect");

// this function reveals the searchbar with the corresponding user selection
function showSearchbar() {
  let x = document.getElementById("mySelect").value;
  let y = document.getElementById("search-bar").classList.item(0);
  document.getElementById("search-bar").style.display = "block";
  document.getElementById("search-bar").classList.remove(y);
  document.getElementById("search-bar").classList.add(x);
  document.getElementById("search-bar-field").placeholder = x;
}

// this is part of the autocomplete
let letters = []

const input = document.getElementById("search-bar-field");

searchContainer.addEventListener("change", showSearchbar);

input.addEventListener("keyup", (event) => {
  if (event.key === "Backspace") {
    letters.pop();
    console.log(letters.join(""));
  } else if (event.key === "Meta") {
    letters.push("a");
    letters.pop();
  } else {
    letters.push(event.key);
    console.log(letters.join(""));
  }
});

input.addEventListener("input", (event) => {
  if (input.value === "") {
    letters = [];
  }
});

// this is a listener for the add button
const addButton = document.getElementById("add-button");
addButton.addEventListener("click", (event) => {
  let currentSelection = document.getElementById("search-bar").classList.item(0);
  let currentTextInput = document.getElementById("search-bar-field").value;
  let hiddenFormInput = document.querySelector(`.${currentSelection}s_positive`).value
  if (hiddenFormInput === "") {
    console.log(hiddenFormInput);
    console.log(currentTextInput);
    document.querySelector(`.${currentSelection}s_positive`).value = currentTextInput;
    } else {
    console.log('hello');
    document.querySelector(`.${currentSelection}s_positive`).value = hiddenFormInput + "," + currentTextInput;
  }
})

// now for the remove button
const removeButton = document.getElementById("remove-button");
removeButton.addEventListener("click", (event) => {
  let currentSelection = document.getElementById("search-bar").classList.item(0);
  let currentTextInput = document.getElementById("search-bar-field").value;
  let hiddenFormInput = document.querySelector(`.${currentSelection}s_negative`).value
  if (hiddenFormInput === "") {
    console.log(hiddenFormInput);
    console.log(currentTextInput);
    document.querySelector(`.${currentSelection}s_negative`).value = currentTextInput;
    } else {
    console.log('hello');
    document.querySelector(`.${currentSelection}s_negative`).value = hiddenFormInput + "," + currentTextInput;
  }
})


}
export { searchFilters }
