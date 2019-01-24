/* create app to be mounted */
var GridFw, Path, app;

GridFw = require('../../gridfw');

Path = require('path');

app = new GridFw(Path.join(__dirname, 'config.js'));

/* main */
app.get('/', function(ctx) {
  return ctx.send('mounted.');
});

/* Show all routes */
app.get('/routes', function(ctx) {
  return ctx.send('mounted... routes');
});

// Path.join _dirname, 'views/routes.pug'

// ctx.contentType = 'json'

// ctx.send JSON.stringify app['/'], ((k, v) ->

// 	if typeof v is 'function'

// 		if k in ['GET', 'HEAD', 'POST']

// 			v = v.toString()

// 		else

// 			v= 'Function'

// 	else if typeof v is 'symbol'

// 		v= '[Symbol]'

// 	else if k.startsWith '~'

// 		v= '[-]'

// 	v

// 	), "\t"
module.exports = app;
