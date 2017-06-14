{% extends '../theme.swig' %}
{% set title = 'Member Sign In' %}
{% block body %}
	<section class="container" style="margin-top: 140px">
		<div class="row">
			<div class="auth-panel">
				<h2 class="text-center">SIGN IN</h2><br>
				<form action="" method="post" class="form-vertical" id="signin">
					<div class="form-group">
						<label>EMAIL</label>
						<input type="email" name="email" class="form-control input-lg" required />
					</div>
					<div class="form-group">
						<label>PASSWORD</label>
						<input type="password" name="password" class="form-control input-lg" required />
					</div>
          <input type="hidden" id="page" value="{{ page }}" />
					<div class="alert alert-danger hidden"></div>
					<button type="submit" class="btn btn-primary input-lg btn-block"><i class="fa fa-sign-in fa-lg"></i>&nbsp; SIGN IN </button>
				</form>
			</div>
		</div>
	</section>
{% endblock %}

{% block script %}
	{#<script>#}
	$('body').css('background-color', '#2f4050');

	$("#signin").submit(function(e) {
		e.preventDefault();
		var $this = $(this);

		$(this).find('button').html("<i class='fa fa-cog fa-spin'></i> Processing").prop('disabled', true);

		$.post('/user/signin', $(this).serialize(), function(d) {
			if (d.status.trim() == 'Ok') {
        var page = $('#page').val();
        if (page.length > 0) {
          location.replace(page);
        } else if (d.user_type == 'user') {
					location.replace('/user/dashboard');
				} else if (d.user_type == 'admin') {
					location.replace('/admin/dashboard');
				}
			} else {
				$(".alert-danger").html("<strong>Error:</strong> " + d.msg).removeClass('hidden');
			}
			$this.find('button').html("<i class='fa fa-sign-in fa-lg'></i>&nbsp; SIGN IN").prop('disabled', false);
		}, 'JSON');
	});
	{#</script>#}
{% endblock %}