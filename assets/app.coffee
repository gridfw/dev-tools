### create app to be mounted ###
GridFw = require '../../gridfw'
Path= require 'path'


app = new GridFw Path.join __dirname, 'config.js'

#=include routes/_*.coffee


module.exports = app