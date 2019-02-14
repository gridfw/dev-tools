###*
 * Config
###
<%
var plugins={
	render: isProd? 'gridfw-render': '../../../render'
};
%>

Path = require 'path'
module.exports=
	name: 'dev-tools'
	plugins:
		render:
			require: '<%=plugins.render %>'
			views: Path.join __dirname, 'views'