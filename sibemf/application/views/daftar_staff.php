<html>
<head>
    <!-- kyaa :3 -->
    <meta charset="utf-8">
    <title>Absensi BEM</title>

    <link rel="stylesheet" href="<?php echo asset_url();?>bootstrap.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>style.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>octicons.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>font-awesome.css">

    <link rel="icon"href="<?php echo asset_url();?>img/favicon3.ico" />
    <script type="text/javascript" src="<?php echo asset_url();?>jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<?php echo asset_url();?>animatescroll.js"></script>

<style type="text/css">
.nav{
   margin-left: auto;
   margin-right: auto;
   margin-top: 0px;
   padding-top: 0px;
   width: 32%;
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
</head>

<body>

    <div id = "sospol" class = "halaman">
    <div class="nav">
      <ul>
        <li class="menuutama"><a href="<?php echo site_url('isi_absen/home') ?>">Menu Utama</a></li>
        <li class="logout"><a href="<?php echo site_url('home/logout') ?>">Log Out</a></li>
      </ul>
    </div>
        <h1><?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 1) echo $row->Nama;
                    }
                    ?></h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>SRD.png"/>
                <table>
                    <tr>
                        <th>Nama</th>
                        <th><span></span></th>
                    </tr>
                    <?php
                        foreach($Staff as $row){
                            if($row->ID_Departemen == 1){
                                echo "<tr><td><a href='staff/".$row->ID_Staff."'>".$row->Nama."</a></td><td><a href='staff/".$row->ID_Staff."'>".$row->Hadir."</a></td></tr>";
                            }
                        }
                    ?>
                </table>
            </div>
        <div class ="col-md-4"></div>
    </div>
    <div id = "internal" class="halaman1">
        <h1> <?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 2) echo $row->Nama;
                    }
                    ?></h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>IA.png"/>
                <table>
                    <tr>
                        <th>Nama</th>
                        <th><span></span></th>
                    </tr>

                    <?php
                    foreach($Staff as $row){
                        if($row->ID_Departemen == 2){
                            echo "<tr><td><a href='staff/".$row->ID_Staff."'>".$row->Nama."</a></td><td><a href='staff/".$row->ID_Staff."'>".$row->Hadir."</a></td></tr>";
                        }
                    }
                    ?>
                </table>
            </div>
        <div class ="col-md-4"></div>
    </div>
    <div id = "minatbakat" class = "halaman1">
        <h1> <?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 3) echo $row->Nama;
                    }
                    ?> </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>RTD.png"/>
                <table>
                    <tr>
                        <th>Nama</th>
                        <th><span></span></th>
                    </tr>

                    <?php
                    foreach($Staff as $row){
                        if($row->ID_Departemen == 3){
                            echo "<tr><td><a href='staff/".$row->ID_Staff."'>".$row->Nama."</a></td><td><a href='staff/".$row->ID_Staff."'>".$row->Hadir."</a></td></tr>";
                        }
                    }
                    ?>
                </table>
            </div>
        <div class ="col-md-4"></div>
    </div>
    <div id = "relasi" class = "halaman1">
        <h1> <?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 4) echo $row->Nama;
                    }
                    ?> </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>OSR.png"/>
                <table>
                    <tr>
                        <th>Nama</th>
                        <th><span></span></th>
                    </tr>

                    <?php
                    foreach($Staff as $row){
                        if($row->ID_Departemen == 4){
                            echo "<tr><td><a href='staff/".$row->ID_Staff."'>".$row->Nama."</a></td><td><a href='staff/".$row->ID_Staff."'>".$row->Hadir."</a></td></tr>";
                        }
                    }
                    ?>
                </table>
            </div>
        <div class ="col-md-4"></div>
    </div>
    <div id = "bismit" class = "halaman1">
        <h1> <?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 5) echo $row->Nama;
                    }
                    ?> </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>EA.png"/>
                <table>
                    <tr>
                        <th>Nama</th>
                        <th><span></span></th>
                    </tr>

                    <?php
                    foreach($Staff as $row){
                        if($row->ID_Departemen == 5){
                            echo "<tr><td><a href='staff/".$row->ID_Staff."'>".$row->Nama."</a></td><td><a href='staff/".$row->ID_Staff."'>".$row->Hadir."</a></td></tr>";
                        }
                    }
                    ?>
                </table>
            </div>
        <div class ="col-md-4"></div>
    </div>
    <div id = "kipi" class = "halaman1">
        <h1> <?php
                foreach($Departemen as $row){
                    if($row->ID_Departemen == 6) echo $row->Nama;
                }
                ?> </h1>
        <div class ="col-md-4"></div>
        <div id = "pi" class="col-md-4 section">
            <img src = "<?php echo asset_url();?>IM.png"/>
            <table>
                <tr>
                    <th>Nama</th>
                    <th><span></span></th>
                </tr>

                <?php
                foreach($Staff as $row){
                    if($row->ID_Departemen == 6){
                        echo "<tr><td><a href='staff/".$row->ID_Staff."'>".$row->Nama."</a></td><td><a href='staff/".$row->ID_Staff."'>".$row->Hadir."</a></td></tr>";
                    }
                }
                ?>
            </table>
        </div>
        <div class ="col-md-4"></div>
    </div>
    <footer>
    <div class="footer">
     
        <div class="footer-right">
            by TIM DEV MPPL 2015
        </div>
    
    </div>
    </footer>
</body>
</html>