require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
// require("packs/searchfilters")

import { searchFilters } from './searchfilters.js'
import "bootstrap";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // myCustomJS();
});

  searchFilters();



