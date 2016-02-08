//
//
// Gulpfile
//
//

//
// Requires
//
var gulp = require('gulp');
var babel = require("gulp-babel");
var cp = require('child_process');
var minifyCss = require('gulp-minify-css');
var notify = require('gulp-notify');
var sass = require('gulp-ruby-sass');
var bower = require('gulp-bower');
var svgstore = require('gulp-svgstore');
var browserSync = require('browser-sync');
var webpack = require('webpack-stream');

//
// Config
//
var config = {
  sassPath: './_sass',
  fontsPath: './_fonts',
  imagesPath: './_images',
  scriptsPath: './_scripts',
  includesDir: './_includes',
  bowerDir: './bower_components',
  assetsDir: './assets',
  outputDir: './_site',
  prodDir: './_production'
};

var messages = {
  jekyllBuild: '<span style="color: grey">Running:</span> $ jekyll build'
};

//
// Subtasks
//
gulp.task('bower', function() {
  return bower().pipe(gulp.dest(config.bowerDir));
});

gulp.task('jekyll-build', ['fonts', 'svg', 'css', 'js', 'bower'], function(done) {
  browserSync.notify(messages.jekyllBuild);
  return cp.spawn('jekyll', ['build'], {
    stdio: 'inherit'
  }).on('close', done);
});

gulp.task('jekyll-rebuild', ['jekyll-build'], function() {
  browserSync.reload();
});

gulp.task('fonts', function() {
  return gulp.src(config.fontsPath + '/**.*').pipe(gulp.dest(config.assetsDir + '/fonts'));
});

gulp.task('robots', function() {
  return gulp.src('./robots.txt').pipe(gulp.dest(config.outputDir));
});

gulp.task('svg', function() {
  gulp.src(config.imagesPath + '/svg/**/*.svg').pipe(svgstore()).pipe(gulp.dest(config.assetsDir + '/images/svg')).pipe(gulp.dest(config.includesDir));
  return gulp.src(config.imagesPath + '/svg/**/*.svg').pipe(gulp.dest(config.assetsDir + '/images/svg'));
});

gulp.task('css', function() {
  return sass(config.sassPath + '/app.sass', {
    style: 'compressed',
    loadPath: [config.sassPath],
    compass: true
  }).pipe(minifyCss()).pipe(gulp.dest(config.assetsDir + '/css')).pipe(gulp.dest(config.outputDir + '/assets/css')).pipe(browserSync.stream());
});

gulp.task("babel-test", function () {
  return gulp.src(config.scriptsPath + '/testes2015.js')
    .pipe(babel())
    .pipe(gulp.dest(config.outputDir + '/assets/scripts'));
});

gulp.task('js', function() {
  return gulp.src(config.scriptsPath + '/entry.coffee').pipe(webpack({
    output: {
      filename: "bundle.js"
    },
    watch: false,
    resolve: {
      extensions: ['', '.js', '.coffee']
    },
    module: {
      loaders: [
        {
          test: /\.coffee$/,
          loader: "coffee-loader"
        }
      ]
    }
  })).pipe(gulp.dest(config.assetsDir + '/scripts')).pipe(gulp.dest(config.outputDir + '/assets/scripts')).pipe(browserSync.stream());
});

//
// Main tasks
//
gulp.task('build', ['bower', 'fonts', 'svg', 'css', 'js', 'robots', 'jekyll-build']);

gulp.task('jekyll-prod', ['build'], function(done) {
  return cp.spawn('bundle', ['exec', 'jekyll', 'build', '--destination=' + config.prodDir], {
    stdio: 'inherit'
  }).on('close', done);
});

gulp.task('serve', ['build'], function() {
  browserSync.init({
    server: {
      baseDir: './_site'
    }
  });
  gulp.watch(['_sass/**/*.scss', '_sass/**/*.sass'], ['css']);
  gulp.watch(['_scripts/**/*.js', '_scripts/**/*.coffee'], ['js']);
  gulp.watch(['_images/svg/**/*.svg'], ['jekyll-rebuild']);
  gulp.watch(['index.slim', '_layouts/*', '_includes/*', '_posts/**/*'], ['jekyll-rebuild']);
});

gulp.task('default', ['serve']);
