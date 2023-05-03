// Include mix
const mix = require('laravel-mix');

// Allow us to read a yaml file
const YamlImporter = require("node-sass-yaml-importer");

// Custom node-sass importer to which allows you to use glob syntax in imports
const globImporter = require('node-sass-glob-importer');

// Require tailwind
const tailwindcss = require("tailwindcss");

mix.disableNotifications();


mix.js('src/main.js', 'web/assets/js')
  .sass('src/main.scss', 'web/assets/css', {
    sassOptions: {
        importer: [
            YamlImporter,
            globImporter()
        ]
    }
}).options({
    processCssUrls: false,
    postCss: [
      tailwindcss('config/tailwind.config.js')
    ],
}).sourceMaps(true, 'source-map');


mix.minify(['web/assets/js/main.js', 'web/assets/css/main.css']);

