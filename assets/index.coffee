'use strict'
devApp =require './app'

MOUNT_PATH = '/?:dev/*'

class DevTools
	constructor: (@app)->
		@enabled = on # the plugin is enabled
		@_mountPath = MOUNT_PATH
		return
	###*
	 * Reload the app
	 * @optional @param {String} mountPath - mount path, @default MOUNT_PATH
	###
	reload: (options)->
		@_mountPath = options.mountPath || MOUNT_PATH
		return
	###*
	 * destroy
	###
	destroy: ->
		@disable()
		return
	###*
	 * Disable, enable
	###
	disable: ->
		@app.off @_mountPath, devApp
		return

	enable: ->
		@app.all @_mountPath, devApp
		return

module.exports= DevTools