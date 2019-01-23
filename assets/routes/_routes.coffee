### Show all routes ###
app.get '/routes', (ctx)->
	ctx.send 'mounted... routes'
	# Path.join _dirname, 'views/routes.pug'
	# 
	# 
	# 
	# ctx.contentType = 'json'
		# ctx.send JSON.stringify app['/'], ((k, v) ->
		# 	if typeof v is 'function'
		# 		if k in ['GET', 'HEAD', 'POST']
		# 			v = v.toString()
		# 		else
		# 			v= 'Function'
		# 	else if typeof v is 'symbol'
		# 		v= '[Symbol]'
		# 	else if k.startsWith '~'
		# 		v= '[-]'
		# 	v
		# 	), "\t"