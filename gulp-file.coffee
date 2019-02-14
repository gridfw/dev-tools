gulp			= require 'gulp'
gutil			= require 'gulp-util'
# minify		= require 'gulp-minify'
include			= require "gulp-include"
uglify			= require('gulp-uglify-es').default
# rename			= require "gulp-rename"
coffeescript	= require 'gulp-coffeescript'
GfwCompiler		= require 'gridfw-compiler'

isProd= gutil.env.hasOwnProperty('prod')
settings = 
	mode: if isProd then 'prod' else 'dev'
	isProd: isProd
	pretty: not isProd
	debug: not isProd

# compile final values (consts to be remplaced at compile time)
# handlers
compileCoffee = ->
	glp = gulp.src "assets/**/*.coffee"
		# include related files
		.pipe include hardFail: true
		.pipe GfwCompiler.template(settings).on 'error', GfwCompiler.logError
		# convert to js
		.pipe coffeescript(bare: true).on 'error', GfwCompiler.logError
	# uglify when prod mode
	if settings.isProd
		glp = glp.pipe uglify()
	# save 
	glp.pipe gulp.dest 'build'
		.on 'error', GfwCompiler.logError
# views
compileViews= ->
	gulp.src 'assets/views/**/[!_]*.pug'
		.pipe GfwCompiler.views(settings)
		.pipe gulp.dest 'build/views/'
		.on 'error', GfwCompiler.logError
# watch files
watch = (cb)->
	unless settings.isProd
		gulp.watch ['assets/**/*.coffee'], compileCoffee
		gulp.watch ['assets/views/**/*.pug'], compileViews
	do cb
	return

# default task
gulp.task 'default', gulp.series (gulp.parallel compileCoffee, compileViews), watch