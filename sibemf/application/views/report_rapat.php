<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Report BPH</title>
<style type="text/css">

html {
   height: 100%;
   /*Image only BG fallback*/
   background: url('http://thecodeplayer.com/uploads/media/gs.png');
   /*background = gradient + image pattern combo*/
   background: 
      linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), 
      url('http://thecodeplayer.com/uploads/media/gs.png');
}
  .flat-table {
    margin-left: 15%;
        width: 70%;
    
    border-collapse:collapse;
    font-family: 'Lato', Calibri, Arial, sans-serif;
    border: none;
                border-radius: 3px;
               -webkit-border-radius: 3px;
               -moz-border-radius: 3px;
  }
  .flat-table th, .flat-table td {
    box-shadow: inset 0 -1px rgba(0,0,0,0.25), 
      inset 0 1px rgba(0,0,0,0.25);
  }
  .flat-table th {
    font-weight: normal;
    -webkit-font-smoothing: antialiased;
    padding: 1em;
    color: rgba(0,0,0,0.45);
    text-shadow: 0 0 1px rgba(0,0,0,0.1);
    font-size: 1em;
  }
  .flat-table td {
    color: #f7f7f7;
    padding: 0.7em 1em 0.7em 1.15em;
    text-shadow: 0 0 1px rgba(255,255,255,0.1);
    font-size: 0.7em;
  }
  .flat-table tr {
    -webkit-transition: background 0.3s, box-shadow 0.3s;
    -moz-transition: background 0.3s, box-shadow 0.3s;
    transition: background 0.3s, box-shadow 0.3s;
  }
  .flat-table-1 {
    background: #336ca6;
  }
  .flat-table-1 tr:hover {
    background: rgba(0,0,0,0.19);
  }
  .flat-table-2 tr:hover {
    background: rgba(0,0,0,0.1);
  }
  .flat-table-2 {
    background: #f06060;
  }
  .flat-table-3 {
    background: #52be7f;
  }
  .flat-table-3 tr:hover {
    background: rgba(0,0,0,0.1);
  }


.nav{
   margin-left: auto;
   margin-right: auto;
   width: 30%;
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

  h1{
    color: white;
  }



</style>
<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
</head>

<body >
     <header>
    <div class="nav">
      <ul>
        <li class="menuutama"><a href="<?php echo site_url('isi_absen/home') ?>">Menu Utama</a></li>
        <li class="logout"><a href="<?php echo site_url('home/logout') ?>">Log Out</a></li>
      </ul>
    </div>
  </header>

  <h1 align="center">Report Rapat BPH Departemen <?php echo $_SESSION['departement'];?></h1>


<table class="flat-table flat-table-1">
  <thead>
    <th width="93" data-th="Driver details"><span>Nama Rapat</span></th>
      <th width="104">Tanggal Rapat</th>
      <th width="99">Tempat Rapat</th>
      <th width="131">Jumlah Yang Hadir</th>
      <th width="131">Jumlah Yang Izin</th>
      <th width="131">Jumlah Yang Absen</th>
  </thead>
  <tbody>
    <?php
               $i=0;
               foreach($Rapat as $data)
               {

                 // echo "<tr><td td style='text-align:center'> ".$i." </td></td>";
                   echo "<tr><td td style='text-align:center'>".$data->NAMA_RAPAT."</td></td>";
                   echo "<td td style='text-align:center'>" .date ("d-m-Y",strtotime($data->TANGGAL_RAPAT))."</td></td>";
                   echo "<td td style='text-align:center'>".$data->TEMPAT_RAPAT."</td></td>";
                   echo "<td td style='text-align:center'>" . $data->JUMLAH_HADIR . "</td></td>";
                   echo "<td td style='text-align:center'>".$data->JUMLAH_IZIN."</td></td>";
                   echo "<td td style='text-align:center'>".$data->JUMLAH_ABSEN."</td></td>";
                  //$i++;

                }
             ?>
  </tbody>
</table>
</body>
</html>