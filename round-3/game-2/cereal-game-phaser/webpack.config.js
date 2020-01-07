const path = require('path');

const HtmlWebpackPlugin = require('html-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const webpackMerge = require('webpack-merge');

module.exports = function (env, argv) {
    const isProductionMode = (argv["mode"] === "production");

    //
    // Configuration common to both production and development (see specific configurations below)
    //
    const commonConfig = {
        entry: "./src/game/game",
        devServer: {
        },
        output: {
            path: path.resolve(__dirname, 'dist'),
            filename: "app.js"
        },
        resolve: {
            extensions: [".ts", ".js"]
        },
        module: {
            rules: [
                { test: /\.ts$/, loader: "ts-loader" }
            ]
        },
        plugins: [
            new HtmlWebpackPlugin({
                template: 'src/index.html',
                chunksSortMode: 'dependency',
                inject: true,
                livereload: true
            }),
            new CopyWebpackPlugin([
                { from: 'src/assets', to: 'assets' }
            ])
        ]
    };

    //
    // Configuration specific to production or development modes
    //
    if (isProductionMode) {
        return webpackMerge(commonConfig, {
            // TODO: production-specific configuration goes here
        });
    }
    else {
        return webpackMerge(commonConfig, {
            // TODO: development-specific configuration goes here
        });
    }
};
