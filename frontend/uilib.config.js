const pkg = require('./package.json')

module.exports = {
    appName: pkg.name.replace('@vladblindu/', ''),
    appDescription: pkg.description,
    collectorDir: 'src/collector'
}