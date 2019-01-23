### create app to be mounted ###
GridFw = require '../../gridfw'


app = new GridFw()

#=include routes/_*.coffee


module.exports = app