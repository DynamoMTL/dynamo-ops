gulp = require('gulp')
cp = require('child_process')
minifyCss = require('gulp-minify-css')
notify = require('gulp-notify')
sass = require('gulp-ruby-sass')
bower = require('gulp-bower')
browserSync = require('browser-sync')
webpack = require('webpack-stream')

# Paths
config =
  sassPath: './_sass'
  fontsPath: './_fonts'
  imagesPath: './_images'
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
  gulp.src('./_scripts/entry.coffee')
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
    .pipe browserSync.stream()

# Build
gulp.task 'build', [
  'bower'
  'fonts'
  'css'
  'js'
  'jekyll-build'
]

# Server
gulp.task 'serve', [ 'build' ], ->
  browserSync.init server: baseDir: './_site'
  gulp.watch [ '_sass/**/*.scss', '_sass/**/*.sass' ], [ 'css' ]
  gulp.watch [ '_scripts/**/*.js', '_scripts/**/*.coffee' ], [ 'js' ]
  gulp.watch [
    'index.slim'
    '_layouts/*'
    '_includes/*'
    '_posts/*'
  ], [ 'jekyll-rebuild' ]
  return

# Task
gulp.task 'default', [ 'serve' ]
