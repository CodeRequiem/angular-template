var path = require('path');
var CopyWebpackPlugin = require('copy-webpack-plugin');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

let extractLESS = new ExtractTextPlugin('bundle.css');

module.exports = {
    entry: './app/components/app.module.js',
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'app.bundle.js',
    },
    plugins: [
        new CopyWebpackPlugin([
            {
                from: 'app/img',
                to: 'img/',
            },
        ]),
        extractLESS,
    ],
    module: {
        loaders: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
            },
            {
                test: /\.(html|jpg|png)$/,
                loader: 'file-loader?name=[name].[ext]',
            },
            {
                test: /\.less$/i,
                use: extractLESS.extract({
                    fallback: 'style-loader',
                    use: ['css-loader', 'less-loader'],
                }),
            },
        ],
    },
    devServer: {
        contentBase: path.join(__dirname, 'dist'),
        compress: true,
        port: 9001,
    },
    devtool: '#inline-source-map',
    watch: true,
};
