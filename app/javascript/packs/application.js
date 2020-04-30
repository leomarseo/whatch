import 'core-js/stable'
import 'regenerator-runtime/runtime'

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
// require("packs/searchfilters")

import { searchFilters } from './searchfilters.js';
import { autocompleteWrapper } from './autocomplete.js';
import { achievements } from './achievements.js';
import "bootstrap";


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // myCustomJS();
});

searchFilters();
autocompleteWrapper();
achievements();
