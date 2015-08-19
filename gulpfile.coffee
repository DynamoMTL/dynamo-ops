gulp = require('gulp')
cp = require('child_process')
minifyCss = require('gulp-minify-css')
notify = require('gulp-notify')
sass = require('gulp-ruby-sass')
bower = require('gulp-bower')
svgstore = require('gulp-svgstore')
browserSync = require('browser-sync')
webpack = require('webpack-stream')
ghPages = require('gulp-gh-pages')

# Paths
config =
  sassPath: './_sass'
  fontsPath: './_fonts'
  imagesPath: './_images'
  scriptsPath: './_scripts'
  includesDir: './_includes'
  bowerDir: './bower_components'
  assetsDir: './assets'
  outputDir: './_site'

messages = jekyllBuild: '<span style="color: grey">Running:</span> $ jekyll build'

# Bower
gulp.task 'bower', ->
  bower().pipe gulp.dest(config.bowerDir)

# Jekyll
gulp.task 'jekyll-build', [
  'fonts'
  'svg'
  'css'
  'js'
  'bower'
], (done) ->
  browserSync.notify messages.jekyllBuild
  cp.spawn('jekyll', [ 'build' ], stdio: 'inherit').on 'close', done

gulp.task 'jekyll-rebuild', [ 'jekyll-build' ], ->
  browserSync.reload()
  return

# Fonts
gulp.task 'fonts', ->
  gulp.src(config.fontsPath + '/**.*').pipe(gulp.dest(config.assetsDir + '/fonts'))

# Images

# SVG
gulp.task 'svg', ->
  gulp
    .src(config.imagesPath + '/svg/**/*.svg')
    .pipe(svgstore())
    .pipe(gulp.dest(config.assetsDir + '/images/svg'))
    .pipe(gulp.dest(config.includesDir))
  gulp
    .src(config.imagesPath + '/svg/**/*.svg')
    .pipe(gulp.dest(config.assetsDir + '/images/svg'))

# CSS
gulp.task 'css', ->
  sass(config.sassPath + '/app.sass',
    style: 'compressed'
    loadPath: [
      config.sassPath
    ]
    compass: true).pipe(minifyCss()).pipe(gulp.dest(config.assetsDir + '/css')).pipe(gulp.dest(config.outputDir + '/assets/css')).pipe browserSync.stream()

# JS
gulp.task 'js', ->
  gulp.src(config.scriptsPath + '/entry.coffee')
    .pipe(webpack({
      output:
        filename: "bundle.js",
      watch: false
      resolve:
        extensions: ['', '.js', '.coffee']
      module:
        loaders: [
          { test: /\.coffee$/, loader: "coffee-loader" }
        ],
    }))
    .pipe(gulp.dest(config.assetsDir + '/scripts'))
    .pipe(gulp.dest(config.outputDir + '/assets/scripts'))
    .pipe browserSync.stream()

# Build
gulp.task 'build', [
  'bower'
  'fonts'
  'svg'
  'css'
  'js'
  'jekyll-build'
]

# Server
gulp.task 'serve', [ 'build' ], ->
  browserSync.init server: baseDir: './_site'
  gulp.watch [ '_sass/**/*.scss', '_sass/**/*.sass' ], [ 'css' ]
  gulp.watch [ '_scripts/**/*.js', '_scripts/**/*.coffee' ], [ 'js' ]
  gulp.watch [ '_images/svg/**/*.svg' ], [ 'jekyll-rebuild' ]
  gulp.watch [
    'index.slim'
    '_layouts/*'
    '_includes/*'
    '_posts/**/*'
  ], [ 'jekyll-rebuild' ]
  return

# Staging
gulp.task 'staging', [ 'build' ], ->
  return gulp.src(config.outputDir + '/**/*')
    .pipe(ghPages())

# Task
gulp.task 'default', [ 'serve' ]
