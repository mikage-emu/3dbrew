'use strict';

{{ $searchDataFile := printf "%s.search-data.json" .Language.Lang }}
{{ $searchData := resources.Get "search-data.json" | resources.ExecuteAsTemplate $searchDataFile . | resources.Minify | resources.Fingerprint }}

(function () {
  const searchDataURL = '{{ $searchData.RelPermalink }}';

  const input = document.querySelector('#book-search-input');
  const results = document.querySelector('#book-search-results');

  if (!input) {
    return
  }

  const worker = new Worker('/searchWorker.js');

  input.addEventListener('focus', init);
  input.addEventListener('input', search);

  document.addEventListener('keypress', focusSearchFieldOnKeyPress);

  /**
   * @param {Event} event
   */
  function focusSearchFieldOnKeyPress(event) {
    if (event.target.value !== undefined) {
      return;
    }

    if (input === document.activeElement) {
      return;
    }

    const characterPressed = String.fromCharCode(event.charCode);
    if (!isHotkey(characterPressed)) {
      return;
    }

    input.focus();
    event.preventDefault();
  }

  /**
   * @param {String} character
   * @returns {Boolean} 
   */
  function isHotkey(character) {
    const dataHotkeys = input.getAttribute('data-hotkeys') || '';
    return dataHotkeys.indexOf(character) >= 0;
  }

  function init() {
    input.removeEventListener('focus', init); // init once
    input.required = true;

    fetch(searchDataURL)
      .then(pages => pages.json())
      .then(pages => worker.postMessage(pages))
      .then(() => input.required = false)
      .then(search);
  }

  let timeoutId;
  function search() {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(runSearch, 350);
  }

  function runSearch() {
    if (!input.value) {
      return;
    }

    worker.onmessage = (ev) => {
      while (results.firstChild) {
        results.removeChild(results.firstChild);
      }

      const searchHits = ev.data;
      searchHits.forEach(function (page) {
        const li = element('<li><a href></a><small></small></li>');
        const a = li.querySelector('a'), small = li.querySelector('small');

        a.href = page.item.href;
        a.textContent = page.item.title;
        small.textContent = page.item.section;

        results.appendChild(li);
      });
    };
    worker.postMessage(input.value);
  }

  /**
   * @param {String} content
   * @returns {Node}
   */
  function element(content) {
    const div = document.createElement('div');
    div.innerHTML = content;
    return div.firstChild;
  }
})();
