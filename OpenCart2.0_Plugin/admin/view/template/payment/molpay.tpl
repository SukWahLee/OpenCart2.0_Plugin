<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-molpay" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-molpay" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-mid"><?php echo $entry_mid; ?></label>
						<div class="col-sm-10">
							<input type="text" name="molpay_mid" value="<?php echo $molpay_mid; ?>" placeholder="<?php echo $entry_mid; ?>" id="input-mid" class="form-control" />
							<?php if ($error_mid) { ?>
								<div class="text-danger"><?php echo $error_mid; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-vkey"><span data-toggle="tooltip" title="<?php echo $help_vkey; ?>"><?php echo $entry_vkey; ?></span></label>
						<div class="col-sm-10">
							<input type="text" name="molpay_vkey" value="<?php echo $molpay_vkey; ?>" placeholder="<?php echo $entry_vkey; ?>" id="input-vkey" class="form-control" />
							<?php if ($error_vkey) { ?>
								<div class="text-danger"><?php echo $error_vkey; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-skey"><span data-toggle="tooltip" title="<?php echo $help_skey; ?>"><?php echo $entry_skey; ?></span></label>
						<div class="col-sm-10">
							<input type="text" name="molpay_skey" value="<?php echo $molpay_skey; ?>" placeholder="<?php echo $entry_skey; ?>" id="input-skey" class="form-control" />
							<?php if ($error_skey) { ?>
								<div class="text-danger"><?php echo $error_skey; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-type"><span data-toggle="tooltip" title="<?php echo $help_type; ?>"><?php echo $entry_type; ?></span></label>
						<div class="col-sm-10">
							<select name="molpay_type" id="input-type" class="form-control">
								<?
								$type = array("https://www.onlinepayment.com.my/"=> "Production", "https://sandbox.molpay.com/"=>"Sandbox");
								foreach($type as $m=>$n){?>
									<option value="<?=$m?>" <?=($molpay_type == $m)? 'selected': ''?>> <?=$n?></option>
								<?}?>
							</select>
							<?php if ($error_type) { ?>
								<div class="text-danger"><?php echo $error_type; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_completed_status; ?></label>
						<div class="col-sm-10">
							<select name="molpay_completed_status_id" class="form-control">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $molpay_completed_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_pending_status; ?></label>
						<div class="col-sm-10">
							<select name="molpay_pending_status_id" class="form-control">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $molpay_pending_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><?php echo $entry_failed_status; ?></label>
						<div class="col-sm-10">
							<select name="molpay_failed_status_id" class="form-control">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $molpay_failed_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
						<div class="col-sm-10">
							<select name="molpay_geo_zone_id" id="input-geo-zone" class="form-control">
								<option value="0"><?php echo $text_all_zones; ?></option>
								<?php foreach ($geo_zones as $geo_zone) { ?>
									<?php if ($geo_zone['geo_zone_id'] == $molpay_geo_zone_id) { ?>
										<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="molpay_status" id="input-status" class="form-control">
								<?php if ($molpay_status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
						<div class="col-sm-10">
							<input type="text" name="molpay_sort_order" value="<?php echo $molpay_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
						</div>
					</div>
				</form>
				<div>
					<b style="color:red;">Next step:</b>
					<ol>
						<li style="padding:5px"> Login to <b><a href="https://www.onlinepayment.com.my/MOLPay/" target="_blank" >MOLPay merchant Admin</a></b> and go to <b style="color:red;">merchant profile</b>. </li>
						<?php $molpay_url = parse_url(HTTP_SERVER);  ?>
						<li style="padding:5px"> Put below url for <b style="color:red;">Return URL</b> value and tick <b style="color:red;">"Enable Return URL with IPN"</b>.
							<br /><i> <?php echo $molpay_url['scheme']; ?>://<?php echo $molpay_url['host']; ?>/index.php?route=payment/molpay/return_ipn</i>
						</li>
						<li style="padding:5px"> Put below url for <b style="color:red;">Callback URL</b> and tick <b style="color:red;">"Yes"</b> to <b style="color:red;">"Enable Callback URL with IPN"</b>.
							<br /><i> <?php echo $molpay_url['scheme']; ?>://<?php echo $molpay_url['host']; ?>/index.php?route=payment/molpay/callback_ipn </i>
						</li>
						<li style="padding:5px"> Put below url for <b style="color:red;">Return URL</b> value and tick <b style="color:red;">"Enable Notification URL with IPN"</b>.
							<br /><i> <?php echo $molpay_url['scheme']; ?>://<?php echo $molpay_url['host']; ?>/index.php?route=payment/molpay/notification_ipn</i>
						</li>						
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>