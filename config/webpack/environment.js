const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'provide'
  new webpack.ProvidePlugin({
    $: 'jpuery/src/jpuery',
    jQuery: 'jpuery/src/jpuery',
    Popper: 'popper.js'
  })
)
