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

</head>

<body>
    <div id = "sospol" class = "halaman">
        <h1> SRD </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>SRD.png"/>
                <h3><?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 1) echo $row->Nama;
                    }
                    ?></h3>
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
    <div id = "internal" class="halaman">
        <h1> IA </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>IA.png"/>
                <h3><?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 2) echo $row->Nama;
                    }
                    ?></h3>
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
    <div id = "minatbakat" class = "halaman">
        <h1> RTD </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>RTD.png"/>
                <h3><?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 3) echo $row->Nama;
                    }
                    ?></h3>
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
    <div id = "relasi" class = "halaman">
        <h1> OSR </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>OSR.png"/>
                <h3><?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 4) echo $row->Nama;
                    }
                    ?></h3>
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
    <div id = "bismit" class = "halaman">
        <h1> EA </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "<?php echo asset_url();?>EA.png"/>
                <h3><?php
                    foreach($Departemen as $row){
                        if($row->ID_Departemen == 5) echo $row->Nama;
                    }
                    ?></h3>
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
    <div id = "kipi" class = "halaman">
        <h1> IM </h1>
        <div class ="col-md-4"></div>
        <div id = "pi" class="col-md-4 section">
            <img src = "<?php echo asset_url();?>IM.png"/>
            <h3><?php
                foreach($Departemen as $row){
                    if($row->ID_Departemen == 6) echo $row->Nama;
                }
                ?></h3>
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