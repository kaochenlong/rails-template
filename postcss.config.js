let environment = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}

if (process.env.RAILS_ENV === "production") {
  environment.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/**/*.html.erb',
        './app/**/*.rb',
        './app/**/*.js',
        './app/**/*.vue',
        './app/**/*.jsx',
        './app/**/*.scss'
      ],
      defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
    })
  )
}

module.exports = environment

