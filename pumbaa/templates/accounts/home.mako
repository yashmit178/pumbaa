<%inherit file="/base/base_home.mako"/>
<%block name="addition_header">
${parent.addition_header()}
<script type="text/javascript">
if (window.location.hash && window.location.hash === "#_=_") {
    window.location.hash = "";
}
</script>
</%block>

<h1>Hello, ${request.user.username}</h1>
% if request.user.get_profile_picture() is not None:
	${request.user.get_profile_picture() | n}
% endif
% if request.user.status == 'wait for approval':
<b>Your account wait for approval.</b>
% endif
<br/>
<div class="well">
<ul class="list-unstyled" style="max-width: 300px; margin: 0 auto 10px;">
	<li><b>Default Profile</b>: ${request.user.default_profile}</li>
	<li><b>Roles</b>: ${", ".join([role.name for role in request.user.roles])}</li>
	% if len(request.user.online_profiles) > 0:
	<li><b>Online Profile</b>
	% for profile in request.user.online_profiles:
		<ul>
			<li><b>Profile</b>: ${profile.domain}</li>
			<li><b>Display Name:</b> ${profile.display_name}</li>
		</ul>
	% endfor
	</li>
</ul>
% endif
<ul class="list-unstyled" style="max-width: 300px; margin: 0 auto 10px;">
	<li><button class="btn btn-primary btn-lg btn-block" style="margin:5px;text-align:left;padding-left:52px;" onclick="location.href='${request.route_path("accounts.change_display_name")}'"><i class="glyphicon glyphicon-pencil"></i> Edit User Profile</button></li>
	<li><button class="btn btn-warning btn-lg btn-block" style="margin:5px;text-align:left;padding-left:52px;" onclick="location.href='${request.route_path("accounts.change_password")}'"><i class="glyphicon glyphicon-lock"></i> Change Password</button></li>
	<li><button class="btn btn-success btn-lg btn-block" style="margin:5px;" onclick="location.href='${request.route_path("accounts.add_online_account")}'"><i class="glyphicon glyphicon-globe"></i> Link to Online Profile</button></li>
	<li><button class="btn btn-primary btn-lg btn-block" style="margin:5px;text-align:left;padding-left:52px;" onclick="location.href='${request.route_path('accounts.change_feed_url')}'"><i class="glyphicon glyphicon-paperclip"></i> Add your blog</button></li>
</ul>
</div>
