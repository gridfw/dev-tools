### Show all routes ###
HTTP_METHODS = require('http').METHODS
app.get '/routes', (ctx)->
	# get root context
	ctx2 = ctx
	while pCtx = ctx2.parentCtx
		ctx2 = pCtx
	# get routes map
	routes= _getRoutes ctx2.app['/']
	# render
	ctx.render 'routes', routes: routes


_getRoutes = (node)->
	result =
		path: null
		routes: []
		methods: []
	for k,v of node
		if k.startsWith '/'
			r = _getRoutes v
			r.path = k
			result.routes.push r
		else if k is 'ALL' or k in HTTP_METHODS
			result.methods.push k
	return result
