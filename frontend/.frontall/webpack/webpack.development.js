const path = require('path')
const  HtmlWebPackPlugin = require('html-webpack-plugin')
const merge = require('webpack-merge')
const common = require('./webpack.common.js')

module.exports = merge(common, {
    mode: 'development',
    entry: path.resolve(__dirname, '../../','index.js'),
    devtool: 'inline-source-map',
    optimization: {
        runtimeChunk: true
    },
    devServer:{
        open: 'http://localhost:8000',
        port: 8000
    },
    plugins: [
        new HtmlWebPackPlugin(
            {
                inject: true,
                template: './.frontall/public/index.html'
            }
        )
    ]
})