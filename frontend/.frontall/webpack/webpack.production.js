const path = require('path')
const merge = require('webpack-merge')
const common = require('./webpack.common.js')

module.exports = merge(common, {
    entry: path.resolve(__dirname, '../../', 'index.js'),
    mode: 'production',
    devtool: 'source-map',
    output: {
        path: path.resolve(__dirname, '../../', 'dist'),
        filename: 'index.js',
        globalObject: 'this',
        libraryTarget: 'umd',
        library: 'audiotext',
        umdNamedDefine: true
    },
    externals: {
        react: {
            commonjs: "react",
            commonjs2: "react",
            amd: "React",
            root: "React"
        },
        "react-dom": {
            commonjs: "react-dom",
            commonjs2: "react-dom",
            amd: "ReactDOM",
            root: "ReactDOM"
        }
    }
})