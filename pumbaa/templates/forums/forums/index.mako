<%inherit file="/forums/base/base.mako"/>
<%block name="keywords">${", ".join(forum.name for forum in forums)}</%block>
<%block name="description">${", ".join(forum.name for forum in forums)}</%block>

<%block name="title">Forum</%block>

<%block name="panel_title">Forums</%block>

% for forum in forums:
	<div class="panel panel-info">
  		<div class="panel-heading">
    		<h1 class="panel-title">
    			<a href="${request.route_path('forums.view', name=forum.name)}">${forum.name}</a>
    			<a href="${request.route_path('forums.feeds.forums', forum_name=forum.name)}"><img alt="Atom feed" src="/public/images/feed-icon.svg" width=15px/></a>
    		</h1>
  		</div>
        <%include file="/forums/topics/listview-small.mako"
                      args="topics=forum.get_topics(10)"/>
	</div>
% endfor
