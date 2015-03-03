<!doctype html>
<head>
    <!-- kyaa :3 -->
    <meta charset="utf-8">
    <title> Annisaa Fitri Shabrina | BEM FTIF ITS 2014</title>
    <link rel="stylesheet" href="<?php echo asset_url();?>bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>staff.css">
    <script type="text/javascript" src="<?php echo asset_url();?>jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<?php echo asset_url();?>bootstrap.min.js"></script>

</head>
<body>
	<div id = "back">
		<a href="#"><span class="glyphicon glyphicon-arrow-left"></span> 
		KEMBALI</a>
	</div>
	<img class="img-circle" alt="140x140" style = "width:10%; margin: 0 auto; display: block; " src = "<?php echo asset_url();?>2.png"/><div id = "header"><h3> <?php echo $Staff->Nama; ?> </h3><h4>  </h4></div>
	<HR>
<div id="info">
	<div class = "col-md-1" ></div>
	<div class = "col-md-3">
		<img style = "padding:15px;"src = "<?php echo asset_url();?>contoh.png" alt="<?php echo $Staff->Nama; ?>" title="<?php echo $Staff->Nama; ?>"/>
		<ul class = "list-group" style = "padding-right: 12px;">
		</li><li class="list-group-item"><span class="glyphicon glyphicon-user"></span>@mpitsky</li><li class="list-group-item"><span class="glyphicon glyphicon-envelope"></span><?php echo $Staff->Email; ?></li></li><li class="list-group-item"><span class="glyphicon glyphicon-gift"></span><?php echo $Staff->Tanggal_Lahir; ?></li>		</ul>
	</div>

	<div  class= "col-md-7" >
		<h3> Kehadiran </h3>
		<div class="panel-group" id="accordion">
		  <div class="panel panel-default">
		    <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapseOne">
		      <h4 class="panel-title">
		          Hadir
		      </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse in">
		      <div class="panel-body">
		       <ul>
				   <?php foreach($Kehadiran as $row){
					   echo '<li>$row->nama</li>';
				   } ?>
		       	<!--<li>Rapat Kerja BEM</li><li>Evaluasi Paruh Tahun</li><li>BEM Gathering 1</li><li>Pleno 1</li>-->		       </ul>
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-default">
		    <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapseTwo">
		      <h4 class="panel-title">
		          Izin
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse">
		      <div class="panel-body">
		       	<ul>
		       	</ul>
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-default">
		    <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" data-target="#collapseThree">
		      <h4 class="panel-title">
		          Tidak Hadir (tanpa izin)
		      </h4>
		    </div>
		    <div id="collapseThree" class="panel-collapse collapse">
		      <div class="panel-body">
		        <ul>
		       	<li>BEM Gathering 2</li>		       </ul>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
<body>