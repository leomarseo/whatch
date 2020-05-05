import 'core-js/stable'
import 'regenerator-runtime/runtime'

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import { searchFilters } from './searchfilters.js';
import { autocompleteWrapper } from './autocomplete.js';
import { achievements } from './achievements.js';
import "bootstrap";
import { trailer } from './trailer.js';
import { serviceRedirect } from './serviceredirect.js';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // myCustomJS();
});

if (document.getElementById('selection-wrapper')) {
  searchFilters();
  autocompleteWrapper();
};

if (document.getElementById('all-achievements')) {
  achievements();
};

if (document.getElementById('trailer-button')) {
  trailer();
};

if (document.getElementById('services-container')) {
  serviceRedirect();
};
