const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')
const { VueLoaderPlugin } = require('vue-loader')
const vue =  require('./loaders/vue')

environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.append('vue', vue)
environment.loaders.append('erb', erb)
module.exports = environment
