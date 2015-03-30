<!doctype html>
<head>
    <!-- kyaa :3 -->
    <meta charset="utf-8">
    <title> <?php echo $Staff->Nama; ?> | BEM FTIF ITS 2014</title>
    <link rel="stylesheet" href="<?php echo asset_url();?>bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>staff.css">
    <script type="text/javascript" src="<?php echo asset_url();?>jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<?php echo asset_url();?>bootstrap.min.js"></script>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Open+Sans);
@import url(http://fonts.googleapis.com/css?family=Roboto);

img{
  max-width: 95%;
  height: auto;
  margin: 0 auto;
}

body{
	font-family: 'Open Sans',sans-serif;
	background-color: #f1f1f2;
	padding: 10px;
}

.tab-content{
	text-align: left;
	margin-top: 15px;
	padding-left: 15px;
}

#back{
	font-size: 8pt;
	color: #4f5c5d;
	width: 90px;
}

#back a{
	font-size : 15px;
}

a:hover{
   text-decoration: none !important;
}

a:link {
    color: #4f5c5d;
}

a:visited {
    color: #4f5c5d;
}

#header{
	font-family: 'Roboto',sans-serif;
	text-align: center;

}
#header img{
	max-width: 128px;
}
hr {
  border-color: black;
  width: 80%;
}

li .glyphicon{
	padding: 4px;
	padding-right: 12px;
}

.panel-heading {
    cursor: pointer;
}

.img-circle {
  border-radius: 50%;
}
}
</style>
</head>
<body>
	<div id = "back">
		<a href="<?php echo site_url('all_staff/daftar') ?>"><span class="glyphicon glyphicon-arrow-left"></span> 
		KEMBALI</a>
	</div>
	<img class="img-circle" alt="140x140" style = "width:10%; margin: 0 auto; display: block; " src = "<?php echo asset_url();?>2.png"/><div id = "header"><h3> <?php echo $Staff->Nama; ?> </h3><h4>  </h4></div>
	<HR>
<div id="info">
	<div class = "col-md-1" ></div>
	<div class = "col-md-3">
		<img style = "padding:15px;"src = "<?php echo asset_url();?>contoh.png" alt="<?php echo $Staff->Nama; ?>" title="<?php echo $Staff->Nama; ?>"/>
		<ul class = "list-group" style = "padding-right: 12px;">
		</li>
		<li class="list-group-item"><span class="glyphicon glyphicon-envelope"></span><?php echo $Staff->Email; ?></li></li><li class="list-group-item"><span class="glyphicon glyphicon-gift"></span><?php echo $Staff->Tanggal_Lahir; ?></li>		</ul>
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
				   	if($row->KETERANGAN == 1)
					   echo '<li>'.$row->NAMA_RAPAT.'</li>';
				   } ?>
		    	      </ul>
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
		       	<?php foreach($Kehadiran as $row){
				   	if($row->KETERANGAN == 2)
					   echo '<li>'.$row->NAMA_RAPAT.'</li>';
				   } ?>
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
		       	<?php foreach($Kehadiran as $row){
				   	if($row->KETERANGAN == 0)
					   echo '<li>'.$row->NAMA_RAPAT.'</li>';
				   } ?>		       
				 </ul>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
<body>