<html>
<head>
    <!-- kyaa :3 -->
    <meta charset="utf-8">
    <title>Absensi BEM</title>

    <link rel="stylesheet" href="<?php echo asset_url();?>bootstrap.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>style.css">
    <link rel="stylesheet" href="<?php echo asset_url();?>octicons.css">

    <!--<link rel="icon"href="<?php echo asset_url();?>img/favicon3.ico" />-->
    <script type="text/javascript" src="<?php echo asset_url();?>jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<?php echo asset_url();?>animatescroll.js"></script>

</head>

<body>
    <div id = "kipi" class = "halaman">
        <h1> PENGURUS INTI </h1>
        <div class ="col-md-4"></div>
            <div id = "pi" class="col-md-4 section">
                <img src = "bem.png"/>
                <h3>Pengurus Inti</h3>
                <table>
                    <tr>
                        <th>Nama</th>
                        <th><span></span></th>
                    </tr>

                    <?php
                        foreach($Staff as $row){
                            echo "<tr><a href='all_staff/staff?id=".$row->ID_Staff."'></a><td></td><td><a href='all_staff/staff?id=".$row->ID_Staff."'>".$row->Hadir."</td></tr>";
                        }
                    ?>

                </table>
            </div>
        <div class ="col-md-4"></div>
    </div>
    <footer>
    <div class="footer">
     
        <div class="footer-right">
            <span class="octicon octicon-code" ></span> with <span class="glyphicon glyphicon-heart"></span> by TIM DEV MPPL 2015
        </div>
    
    </div>
    </footer>
</body>
</html>