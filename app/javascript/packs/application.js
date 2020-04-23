require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { autocompleteSearch } from '../plugins/autocomplete';






let selection = document.getElementById("mySelect");

let x = 'pollo'



selection.addEventListener("change", (event) => {
  x = selection.value;
  console.log(x)
});


autocompleteSearch(x);
