<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
  	-moz-box-sizing: border-box;
		-o-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}

	body {
		width: 100%;
		height: 100%;
		font-family: "helvetica neue", helvetica, arial, sans-serif;
		font-size: 13px;
		text-align: center;
		background: #333 url('http://subtlepatterns.subtlepatterns.netdna-cdn.com/patterns/low_contrast_linen.png');
	}

	ul {
		text-align: center;
        margin: 250px auto;
        margin-bottom: 0px;
	}

	li {
		list-style: none;
		position: relative;
		display: inline-block;
		width: 100px;
		height: 100px;
	}

	@-moz-keyframes rotate {
		0% {transform: rotate(0deg);}
		100% {transform: rotate(-360deg);}
	}

	@-webkit-keyframes rotate {
		0% {transform: rotate(0deg);}
		100% {transform: rotate(-360deg);}
	}

	@-o-keyframes rotate {
		0% {transform: rotate(0deg);}
		100% {transform: rotate(-360deg);}
	}

	@keyframes rotate {
		0% {transform: rotate(0deg);}
		100% {transform: rotate(-360deg);}
	}


    .judul {
        margin-top: 50px;
        color: azure;
    
    
    }

	.round {
		display: block;
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		padding-top: 30px;		
		text-decoration: none;		
		text-align: center;
		font-size: 25px;		
		text-shadow: 0 1px 0 rgba(255,255,255,.7);
		letter-spacing: -.065em;
		font-family: "Hammersmith One", sans-serif;		
		-webkit-transition: all .25s ease-in-out;
		-o-transition: all .25s ease-in-out;
		-moz-transition: all .25s ease-in-out;
		transition: all .25s ease-in-out;
		box-shadow: 2px 2px 7px rgba(0,0,0,.2);
		border-radius: 300px;
		z-index: 1;
		border-width: 4px;
		border-style: solid;
	}

	.round:hover {
		width: 130%;
		height: 130%;
		left: -15%;
		top: -15%;
		font-size: 33px;
		padding-top: 38px;
		-webkit-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
		-o-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
		-moz-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
		box-shadow: 5px 5px 10px rgba(0,0,0,.3);
		z-index: 2;
		border-size: 10px;
		-webkit-transform: rotate(-360deg);
		-moz-transform: rotate(-360deg);
		-o-transform: rotate(-360deg);
		transform: rotate(-360deg);
	}

	a.red {
		background-color: rgba(239,57,50,1);
		color: rgba(133,32,28,1);
		border-color: rgba(133,32,28,.2);
	}

	a.red:hover {
		color: rgba(239,57,50,1);
	}

	a.green {
		background-color: rgba(1,151,171,1);
		color: rgba(0,63,71,1);
		border-color: rgba(0,63,71,.2);
	}

	a.green:hover {
		color: rgba(1,151,171,1);
	}

	a.yellow {
		background-color: rgba(252,227,1,1);
		color: rgba(153,38,0,1);
		border-color: rgba(153,38,0,.2);
	}

	a.yellow:hover {
		color: rgba(252,227,1,1);
	}

	.round span.round {
		display: block;
		opacity: 0;
		-webkit-transition: all .5s ease-in-out;
		-moz-transition: all .5s ease-in-out;
		-o-transition: all .5s ease-in-out;
		transition: all .5s ease-in-out;
		font-size: 1px;
		border: none;
		padding: 40% 20% 0 20%;
		color: #fff;
	}

	.round span:hover {
		opacity: .85;
		font-size: 16px;
		-webkit-text-shadow: 0 1px 1px rgba(0,0,0,.5);
		-moz-text-shadow: 0 1px 1px rgba(0,0,0,.5);
		-o-text-shadow: 0 1px 1px rgba(0,0,0,.5);
		text-shadow: 0 1px 1px rgba(0,0,0,.5);	
	}

	.green span {
		background: rgba(0,63,71,.7);		
	}

	.red span {
		background: rgba(133,32,28,.7);		
	}

	.yellow span {
		background: rgba(161,145,0,.7);	

	}

.menu {
	margin-top: 40px;
}

.menu li{
	margin-top: 0px;
	margin-left: 40px;
	margin-right: 40px;
	padding: 30px;
}

.judul{
	margin-top: 100px;
	margin-bottom: 0px;
	padding-bottom: 0px;
}

.nav{
   margin-left: auto;
   margin-right: auto;
   width: 16%;
   position: relative;
}

.nav ul {
  list-style: none;
  background-color: #444;
  text-align: center;
  padding: 0;
  margin: 0;
}
.nav li {
  font-family: 'Oswald', sans-serif;
  font-size: 1.2em;
  line-height: 40px;
  height: 40px;
  border-bottom: 1px solid #888;
}
 
.nav a {
  text-decoration: none;
  color: #fff;
  display: block;
  transition: .3s background-color;
}
 
.nav a:hover {
  background-color: #005f5f;
}
 
.nav a.active {
  background-color: #fff;
  color: #444;
  cursor: default;
}
 
@media screen and (min-width: 200px) {
  .nav li {
    width: 200px;
    border-bottom: none;
    height: 50px;
    line-height: 50px;
    font-size: 1.4em;
  }
 
  /* Option 1 - Display Inline */
  .nav li {
    display: inline-block;
    margin-right: -4px;
  }


 
  /* Options 2 - Float
  .nav li {
    float: left;
  }
  .nav ul {
    overflow: auto;
    width: 600px;
    margin: 0 auto;
  }
  .nav {
    background-color: #444;
  }
  */
}
</style>

    

<!--	<script src="JS.js"> </script>-->
	<link href="style.css" rel="stylesheet" type="text/css">

    <title>Menu BPH</title>
</head>
<body>
	<header>
    <div class="nav">
      <ul> 
        <li class="logout"><a href="<?php echo site_url('home/logout') ?>">Log Out</a></li>
      </ul>
    </div>
  </header>
    <h1 class="judul">Menu Badan Pengurus harian Departemen <?php echo $_SESSION['departement']; ?></h1>
    
<ul class="menu">
  <li><a href="<?php echo base_url();?>isi_absen/isi" class="round green">Absen<span class="round">Memasukkan Absensi Staff BEM FTIf.</span></a></li>
  <li><a href="<?php echo base_url();?>all_nilai/nilai" class="round red">Penilaian<span class="round">Memasukkan Penilaian Perbulan Staff BEM FTIf. </span></a></li>
</ul> 
</body>
</html>
