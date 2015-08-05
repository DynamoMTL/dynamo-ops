gulp = require('gulp')
cp = require('child_process')
minifyCss = require('gulp-minify-css')
notify = require('gulp-notify')
sass = require('gulp-ruby-sass')
bower = require('gulp-bower')
browserSync = require('browser-sync')
webpack = require('webpack-stream')

config =
  sassPath: './_sass'
  bowerDir: './bower_components'
  assetDir: './assets'
  outputDir: './_site'

messages = jekyllBuild: '<span style="color: grey">Running:</span> $ jekyll build'

gulp.task 'bower', ->
  bower().pipe gulp.dest(config.bowerDir)

gulp.task 'jekyll-build', [
  'css'
  'icons'
  'bower'
], (done) ->
  browserSync.notify messages.jekyllBuild
  cp.spawn('jekyll', [ 'build' ], stdio: 'inherit').on 'close', done

gulp.task 'jekyll-rebuild', [ 'jekyll-build' ], ->
  browserSync.reload()
  return

gulp.task 'icons', ->
  gulp.src(config.bowerDir + '/fontawesome/fonts/**.*').pipe(gulp.dest(config.assetDir + '/fonts')).pipe gulp.dest(config.outputDir + '/assets/fonts')

gulp.task 'css', ->
  sass(config.sassPath + '/main.scss',
    style: 'compressed'
    loadPath: [
      config.sassPath
      config.bowerDir + '/normalize.scss/'
      config.bowerDir + '/fontawesome/scss'
    ]
    compass: true).pipe(minifyCss()).pipe(gulp.dest(config.assetDir + '/css')).pipe(gulp.dest(config.outputDir + '/assets/css')).pipe browserSync.stream()

gulp.task 'js', ->
  gulp.src(config.assetDir + '/scripts/entry.coffee')
    .pipe(webpack({
      output:
        filename: "bundle.js",
      watch: true,
      resolve:
        extensions: ['', '.js', '.coffee']
      module:
        loaders: [
          { test: /\.coffee$/, loader: "coffee-loader" }
        ],
    }))
    .pipe(gulp.dest(config.outputDir + '/assets/scripts/'))

gulp.task 'build', [
  'bower'
  'icons'
  'css'
  'js'
  'jekyll-build'
]

gulp.task 'serve', [ 'build' ], ->
  browserSync.init server: baseDir: './_site'
  # Start a watch for rebuilds
  gulp.watch [ '_sass/*.scss' ], [ 'css' ]
  gulp.watch [
    'index.slim'
    '_layouts/*'
    '_includes/*'
    '_posts/*'
  ], [ 'jekyll-rebuild' ]
  return

gulp.task 'default', [ 'serve' ]
