//
//
// Gulpfile
//
//

//
// Requires
//
var gulp = require('gulp'),
    babel = require("gulp-babel"),
    cp = require('child_process'),
    minifyCss = require('gulp-minify-css'),
    notify = require('gulp-notify'),
    sass = require('gulp-ruby-sass'),
    bower = require('gulp-bower'),
    svgstore = require('gulp-svgstore'),
    browserSync = require('browser-sync'),
    webpack = require('webpack-stream'),
    eslint = require('gulp-eslint'),
    uglify = require('gulp-uglify');

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
  return browserSync.reload();
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

gulp.task('es-lint', function () {
  return gulp.src([config.scriptsPath + '/**/*.js','!node_modules/**'])
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError());
});

gulp.task('js', ['es-lint'], function() {
  return gulp.src(config.scriptsPath + '/entry.js').pipe(webpack({
    output: {
      filename: "bundle.js"
    },
    watch: false,
    resolve: {
      extensions: ['', '.js']
    },
    module: {
      loaders: [
        {
          test: /\.js?$/,
          loader: 'babel-loader',
          exclude: /node_modules/,
          query: {
            presets: ['es2015']
          }
        }
      ],
      stats: {
        colors: true
      },
      devtool: 'source-map'
    }
  })).pipe(gulp.dest(config.assetsDir + '/scripts')).pipe(gulp.dest(config.outputDir + '/assets/scripts')).pipe(browserSync.stream());
});

gulp.task('uglify', function() {
  return gulp.src(config.outputDir + '/assets/scripts/**/*.js')
    .pipe(uglify())
    .pipe(gulp.dest(config.outputDir + '/assets/scripts'));
});

//
// Main tasks
//
gulp.task('build', ['bower', 'fonts', 'svg', 'css', 'js', 'uglify', 'robots', 'jekyll-build']);

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
  gulp.watch(['_scripts/**/*.js'], ['js']);
  gulp.watch(['_images/svg/**/*.svg'], ['jekyll-rebuild']);
  gulp.watch(['index.slim', '_layouts/*', '_includes/*', '_posts/**/*'], ['jekyll-rebuild']);
});

gulp.task('default', ['serve']);
