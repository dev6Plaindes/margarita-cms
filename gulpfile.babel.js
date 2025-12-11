//HTML
import htmlmin from 'gulp-htmlmin'

//CSS
//import sass from 'gulp-sass'
const sass = require('gulp-sass')(require('sass'));
const cleanCSS = require('gulp-clean-css');
import autoprefixer from 'gulp-autoprefixer'

//JS
import gulp from 'gulp'
import babel from 'gulp-babel'
import terser from 'gulp-terser'
import uglify  from 'gulp-uglify'

//Common
import concat from 'gulp-concat'

//variables/constantes


//ADMIN MARGARITA

gulp.task('style-admin', () => {
    return gulp
        .src('./public/assets-gulp/scss/admin/**/*.scss')
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/admin/css'))
})


gulp.task('babel-admin',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './public/assets-gulp/es6/utilitarian/help.js',
            './public/assets-gulp/es6/admin/**/*.js'
        ])
        .pipe(concat('admin.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/admin/js'))
})

gulp.task('babel-login-admin',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './public/assets-gulp/es6/login/**/*.js'
        ])
        .pipe(concat('login.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/admin/js'))
})

//END MARGARITA

// TEMPLATE
//TEMPLATE LEGAL

gulp.task('style-legal', () => {
    return gulp
        .src('./public/assets-gulp/scss/template/legal/*.scss')
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/legal/css'))
})

gulp.task('babel-legal',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/legal/*.js',
            
        ])
        .pipe(babel())
        .pipe(uglify())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/legal/js'))
})

gulp.task('babel-legal-plugins',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/legal/plugins/jquery.min.js',
            './public/assets-gulp/es6/template/legal/plugins/bootstrap/bootstrap.min.js',
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './public/assets-gulp/es6/utilitarian/events.js',
            './public/assets-gulp/es6/template/legal/plugins/owl.carousel.min.js'
        ])
        .pipe(concat('plugins.min.js'))
        .pipe(gulp.dest('./public/assets/template/legal/js'))
})

gulp.task('legal-css',() => {
    gulp.watch('./public/assets-gulp/scss/template/legal/**/*.scss',gulp.parallel('style-legal'))
    gulp.watch('./public/assets-gulp/es6/template/legal/*.js',gulp.parallel('babel-legal'))
})

// TEMPLATE STETIC

gulp.task('style-stetic', () => {
    return gulp
        .src('./public/assets-gulp/scss/template/stetic/*.scss')
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/stetic/css'))
})

gulp.task('babel-stetic',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './public/assets-gulp/es6/template/stetic/web/**/*.js',
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './public/assets-gulp/es6/utilitarian/events.js'
        ])
        .pipe(concat('main.min.js'))
        .pipe(babel())
        .pipe(uglify())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/stetic/js'))
})

gulp.task('babel-stetic-plugins',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/stetic/plugins/jquery.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/bootstrap.bundle.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/owl.carousel.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/waypoints.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/jquery.counterup.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/TweenMax.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/wow.js',
            './public/assets-gulp/es6/template/stetic/plugins/jquery.magnific-popup.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/countdown.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/vegas.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/jquery.validate.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/jquery.ajaxchimp.min.js',
            './public/assets-gulp/es6/template/stetic/plugins/theme.js',
        ])
        .pipe(concat('plugins.min.js'))
        .pipe(gulp.dest('./public/assets/template/stetic/js'))
})
// END TEMPLATE STETIC

// TEMPLATE APZO
gulp.task('babel-apzo-plugins',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/apzo/js/jquery/jquery.js',
            './public/assets-gulp/es6/template/apzo/js/jquery/jquery-migrate.min.js',
            './public/assets-gulp/es6/template/apzo/plugins/revslider/public/assets/js/revolution.tools.min.js',
            './public/assets-gulp/es6/template/apzo/plugins/revslider/public/assets/js/rs6.min.js',
            './public/assets-gulp/es6/template/apzo/plugins/snazzy-maps/snazzymaps.js',
            './public/assets-gulp/es6/template/apzo/plugins/goodlayers-core/plugins/script.js',
            './public/assets-gulp/es6/template/apzo/plugins/goodlayers-core/include/js/page-builder.js',
            './public/assets-gulp/es6/template/apzo/js/jquery/ui/effect.min.js',
            './public/assets-gulp/es6/template/apzo/js/jquery.mmenu.js',
            './public/assets-gulp/es6/template/apzo/js/jquery.superfish.js',
            './public/assets-gulp/es6/template/apzo/js/script-core.js',
        ])
        .pipe(concat('plugins.min.js'))
        .pipe(gulp.dest('./public/assets/template/apzo/js'))
})
// END TEMPLATE APZO

// BEGIN TEMPLATE GENERAL
gulp.task('style-template-general', () => {
    return gulp
        .src('./public/assets-gulp/scss/template/general/**/*.scss')
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/general/css'))
})

gulp.task('babel-template-general',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/general/utilitarian/**/*.js',
            './public/assets-gulp/es6/template/general/home/**/*.js'
        ])
        .pipe(concat('main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/general/js'))
})

// END TEMPLATE GENERAL

// START TEMPLATE COMUNIDAD
gulp.task('style-sass-template-comunidad', () => {
    return gulp
        .src('./public/assets-gulp/scss/template/comunidad/**/*.scss')
        .pipe(concat('main.min.css'))
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/comunidad/css'))
})

gulp.task('style-template-comunidad', () => {
    return gulp.src([
            //'./node_modules/sweetalert2/dist/sweetalert2.min.css',
            './node_modules/owl.carousel/dist/assets/owl.carousel.min.css',
            './node_modules/owl.carousel/dist/assets/owl.theme.default.min.css',
            './public/assets-gulp/css/template/comunidad/**/*.css',
        ])
        .pipe(concat('web.min.css'))
        //.pipe(cleanCSS({compatibility: 'ie8'}))
        .pipe(gulp.dest('./public/assets/template/comunidad/css'));
});

gulp.task('babel-template-comunidad',() => {
    return gulp
        .src([
            //'./node_modules/sweetalert2/dist/sweetalert2.min.js',
            './node_modules/owl.carousel/dist/owl.carousel.min.js',
            './public/assets-gulp/es6/utilitarian/sweet2.js',
            './public/assets-gulp/es6/template/comunidad/**/*.js',
        ])
        .pipe(concat('main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/comunidad/js'))
})
// END TEMPLATE COMUNIDAD

// START TEMPLATE COMUNIDADPRO
gulp.task('style-comunidadpro', () => {
    return gulp
        .src([
            './public/assets-gulp/scss/template/comunidadpro/**/*.scss',
            './node_modules/owl.carousel/dist/assets/owl.carousel.min.css',
            './node_modules/owl.carousel/dist/assets/owl.theme.default.min.css',
        ])
        .pipe(concat('main.min.css'))
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/comunidadpro/css'))
})

gulp.task('babel-comunidadpro',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/comunidadpro/**/*.js',
        ])
        .pipe(concat('main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/comunidadpro/js'))
})

gulp.task('babel-comunidadpro-library',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './node_modules/jquery/dist/jquery.min.js',
            './node_modules/owl.carousel/dist/owl.carousel.min.js',
            './public/assets-gulp/es6/utilitarian/events.js'
        ])
        .pipe(concat('library-main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/comunidadpro/js'))
})

gulp.task('babel-comunidadpro-library-Boostrap',() => {
    return gulp
        .src([
            './node_modules/bootstrap/dist/js/bootstrap.min.js'
        ])
        .pipe(concat('bootstrap-main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/comunidadpro/js'))
})

gulp.task('babel-comunidadpro-library-Bbundle',() => {
    return gulp
        .src([
            './node_modules/bootstrap/dist/js/bootstrap.bundle.min.js'
        ])
        .pipe(concat('bundle-main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/comunidadpro/js'))
})


gulp.task('template-comunidadpro',() => {
    gulp.watch('./public/assets-gulp/es6/template/comunidadpro/**/*.js',gulp.parallel('babel-comunidadpro'))
    gulp.watch('./public/assets-gulp/scss/template/comunidadpro/**/*.scss',gulp.parallel('babel-comunidadpro'))

})
// END TEMPLATE COMUNIDADPRO


// START TEMPLATE GENERALWEB
gulp.task('style-generalweb', () => {
    return gulp
        .src([
            './public/assets-gulp/scss/template/generalweb/**/*.scss',
            './node_modules/owl.carousel/dist/assets/owl.carousel.min.css',
            './node_modules/owl.carousel/dist/assets/owl.theme.default.min.css',
        ])
        .pipe(concat('main.min.css'))
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/generalweb/css'))
})

gulp.task('babel-generalweb',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/template/generalweb/**/*.js',
        ])
        .pipe(concat('main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/generalweb/js'))
})

gulp.task('babel-generalweb-library',() => {
    return gulp
        .src([
            './public/assets-gulp/es6/utilitarian/swal2.js',
            './node_modules/jquery/dist/jquery.min.js',
            './node_modules/owl.carousel/dist/owl.carousel.min.js',
            './public/assets-gulp/es6/utilitarian/events.js'
        ])
        .pipe(concat('library-main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/generalweb/js'))
})

gulp.task('babel-generalweb-library-Boostrap',() => {
    return gulp
        .src([
            './node_modules/bootstrap/dist/js/bootstrap.min.js'
        ])
        .pipe(concat('bootstrap-main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/generalweb/js'))
})

gulp.task('babel-generalweb-library-Bbundle',() => {
    return gulp
        .src([
            './node_modules/bootstrap/dist/js/bootstrap.bundle.min.js'
        ])
        .pipe(concat('bundle-main.min.js'))
        .pipe(babel())
        .pipe(terser())
        .pipe(gulp.dest('./public/assets/template/generalweb/js'))
})
// ENDGENERAL WEB
// START TEMPLATE GENERALWEB
gulp.task('style-empresarial', () => {
    return gulp
        .src([
            './public/assets-gulp/scss/template/empresarial/**/*.scss',
        ])
        .pipe(concat('main.min.css'))
        .pipe(sass({
            outputStyle: 'expanded',
            sourceComments: true
        }))
        .pipe(autoprefixer({
            versions: ['last 2 browser']
        }))
        .pipe(gulp.dest('./public/assets/template/empresarial/css'))
})

//END EMPRESARIAL
gulp.task('template-generalweb',() => {
    gulp.watch('./public/assets-gulp/es6/template/generalweb/**/*.js',gulp.parallel('babel-generalweb'))
    gulp.watch('./public/assets-gulp/scss/template/generalweb/**/*.scss',gulp.parallel('style-generalweb'))

})
// END TEMPLATE GENERALWEB
gulp.task('admin',() => {
    gulp.watch('./public/assets-gulp/es6/admin/**/*.js',gulp.parallel('babel-admin'))
    gulp.watch('./public/assets-gulp/es6/login/**/*.js',gulp.parallel('babel-login-admin'))
    gulp.watch('./public/assets-gulp/scss/admin/**/*.scss',gulp.parallel('style-admin'))
})

gulp.task('template-stetic',() => {
    gulp.watch('./public/assets-gulp/es6/**/*.js',gulp.parallel('babel-stetic'))
    gulp.watch('./public/assets-gulp/es6/**/*.js',gulp.parallel('babel-stetic-plugins'))
    gulp.watch('./public/assets-gulp/scss/**/*.scss',gulp.parallel('style-stetic'))
})

gulp.task('template-general',() => {
    gulp.watch('./public/assets-gulp/es6/**/*.js',gulp.parallel('babel-template-general'))
    gulp.watch('./public/assets-gulp/scss/**/*.scss',gulp.parallel('style-template-general'))
})

gulp.task('template-comunidad',() => {
    gulp.watch('./public/assets-gulp/es6/template/comunidad/**/*.js',gulp.parallel('babel-template-comunidad'))
    gulp.watch('./public/assets-gulp/scss/template/comunidad/**/*.scss',gulp.parallel('style-sass-template-comunidad'))
    gulp.watch('./public/assets-gulp/scss/template/comunidad/**/*.css',gulp.parallel('style-template-comunidad'))
})

gulp.task('template-empresarial',() => {
    gulp.watch('./public/assets-gulp/scss/template/empresarial/**/*.scss',gulp.parallel('style-empresarial'))
})