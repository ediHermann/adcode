const theme = require('./src/assets/theme')

const colors = {
    'ui-primary': '#283344',
    'ui-light': '#f6e05e',
    "ui-hover": '#344a6e'
}

const defaultFill = theme => ({
    'light': colors['ui-light'],
    'none': 'transparent',
})

module.exports = {
    theme: {
        extend: {
            colors: {
                ...theme['colors'],
                ...colors
            },
            'box-shadow': {
                'shadow-lg': '10px 10px 10px #AAAAAA'
            }
        },
        fill: {
            ...defaultFill(),
            current: 'currentColor'
        }
    },
    variants: {},
    plugins: []
}