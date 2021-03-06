const colors = require('tailwindcss/colors')

module.exports = {
  darkMode: 'class',
  theme: {
    colors: {
      black: colors.black,
      white: colors.white,
      gray: colors.coolGray,
      indigo: colors.indigo,
      red: colors.red,
      blue: colors.blue,
      yellow: colors.amber,
      green: colors.emerald,
      pink: colors.pink,
    },
    extend: {
      colors: {
        warmgray: {
          700: '#2f3335',
          800: '#1e2022',
          900: '#181a1b',
        },
        'nulltrace':'#323232',
      },
      backgroundImage: {
        'mobile': "url('/img/mobile_bg.jpg')",
        'desktop': "url('/img/bg.jpg')",
       }
    },
  },
  variants: {},
  plugins: [
    require('@tailwindcss/typography'),
  ]
}
