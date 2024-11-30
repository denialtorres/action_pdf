# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "@rails/actioncable", to: "actioncable.esm.js"
pin "@rails/activestorage", to: "activestorage.esm.js"

pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
