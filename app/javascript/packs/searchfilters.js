
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
searchContainer.addEventListener("change", showSearchbar);

// this is a listener for the add button
const addButton = document.getElementById("add-button");
addButton.addEventListener("click", (event) => {
  let currentSelection = document.getElementById("search-bar").classList.item(0);
  let currentTextInput = document.getElementById("search-bar-field").value;
  document.querySelector(`.${currentSelection}s_positive`).value= document.querySelector(`.${currentSelection}s_positive`).value + "," + currentTextInput;
})

const removeButton = document.getElementById("remove-button");
// now for the remove button
removeButton.addEventListener("click", (event) => {
  let currentSelection = document.getElementById("search-bar").classList.item(0);
  let currentTextInput = document.getElementById("search-bar-field").value;
  document.querySelector(`.${currentSelection}s_negative`).value= document.querySelector(`.${currentSelection}s_negative`).value + "," + currentTextInput;
})


}
export { searchFilters }
