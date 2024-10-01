importScripts("fuse.min.js")

{{ $searchConfig := i18n "bookSearchConfig" | default "{}" }}
const indexConfig = Object.assign({{ $searchConfig }}, {
  includeScore: true,
  useExtendedSearch: true,
  fieldNormWeight: 1.5,
  threshold: 0.2,
  ignoreLocation: true,
  keys: [
    {
      name: 'title',
      weight: 0.7
    },
    {
      name: 'content',
      weight: 0.3
    }
  ]
});

let index;
self.onmessage = (ev) => {
  if (!index) {
    let pages = ev.data;
    index = new Fuse(pages, indexConfig);
    return;
  }

  const searchHits = index.search(ev.data).slice(0,10);
  self.postMessage(searchHits);
};
