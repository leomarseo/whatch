require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
// require("packs/searchfilters")

import { searchFilters } from './searchfilters.js'
import { autocompleteSearch } from './autocomplete.js'
import "bootstrap";

document.addEventListener('turbolinks:load', () => {
});

  searchFilters();
  autocompleteSearch();

