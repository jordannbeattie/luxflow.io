/*
Review options here:
https://github.com/tailwindlabs/tailwindcss/blob/master/stubs/defaultConfig.stub.js

Colors generator:
https://javisperez.github.io/tailwindcolorshades/
*/
const colors = require('tailwindcss/colors')

module.exports = {
    important: true,

    content: [
        './templates/**/*.twig',
        './templates/**/*.html',
        './templates/**/*.pug',
    ],

    darkMode: 'class',

    theme: {

        container: {
            center: true,
            padding: "1.5rem",
        },

        // Fonts
        fontFamily: {
            // Headings
            heading: ['Inter', 'serif'],
            serif: ['Inter', 'serif'],
            display: ['Inter', 'serif'],
            // Copy
            sans: ['Inter', 'system-ui'],
            body: ['Inter', 'system-ui'],
        },

        extend: {

            colors: {

                // Neutral - B&W
                neutral: colors.gray,

                // Primary - Sky Blue
                primary: colors.sky,

                // Secondary - Indigo Blue
                secondary: colors.indigo, 

                // Accent Colours - Purple / Magenta
                accent: {
                    DEFAULT:  'rgb(var(--color-accent-400) / <alpha-value>)',
                    50:  'rgb(var(--color-accent-50) / <alpha-value>)',
                    100:  'rgb(var(--color-accent-100) / <alpha-value>)',
                    200:  'rgb(var(--color-accent-200) / <alpha-value>)',
                    300:  'rgb(var(--color-accent-300) / <alpha-value>)',
                    400:  'rgb(var(--color-accent-400) / <alpha-value>)',
                    500:  'rgb(var(--color-accent-500) / <alpha-value>)',
                    600:  'rgb(var(--color-accent-600) / <alpha-value>)',
                    700:  'rgb(var(--color-accent-700) / <alpha-value>)',
                    800:  'rgb(var(--color-accent-800) / <alpha-value>)',
                    900:  'rgb(var(--color-accent-900) / <alpha-value>)',
                },
                                

                // White, Black and Text
                white: '#FFFFFF',
                black: '#000000',
                text: '#333333',
            },

            screens: {
                '2xl': '1440px',
            },
        }
    },
    plugins: [
        require('@tailwindcss/typography'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/forms'),
        require('@tailwindcss/line-clamp'),
    ],
};
