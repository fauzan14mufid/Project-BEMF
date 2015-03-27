<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Report BPH</title>
<style>
$table-breakpoint: 480px;
$table-background-color: #FFF;
$table-text-color: #024457;
$table-outer-border: 1px solid #167F92;
$table-cell-border: 1px solid #D9E4E6;

/*// Extra options for table style (parse these arguments when including your mixin)*/
$table-border-radius: 10px;
$table-highlight-color: #EAF3F3;
$table-header-background-color: #167F92;
$table-header-text-color: #FFF;
$table-header-border: 1px solid #FFF;



@mixin responstable(
  $breakpoint: $table-breakpoint,
  $background-color: $table-background-color,
  $text-color: $table-text-color,
  $outer-border: $table-outer-border,
  $cell-border: $table-cell-border,
  $border-radius: none,
  $highlight-color: none,
  $header-background-color: $table-background-color,
  $header-text-color: $table-text-color,
  $header-border: $table-cell-border) {
  
  .responstable {
    margin: 1em 0;
    width: 100%;
    overflow: hidden;  
    background: $background-color;
    color: $text-color;
    border-radius: $border-radius;
    border: $outer-border;
  
    tr {
      border: $cell-border; 
      &:nth-child(odd) { 
        background-color: $highlight-color;
      }  
    }
  
    th {
      display: none; 
      border: $header-border;
      background-color: $header-background-color;
      color: $header-text-color;
      padding: 1em;  
      &:first-child { 
        display: table-cell;
        text-align: center;
      }
      &:nth-child(2) { 
        display: table-cell;
        span {display:none;}
        &:after {content:attr(data-th);}
      }
      @media (min-width: $breakpoint) {
        &:nth-child(2) { 
          span {display: block;}
          &:after {display: none;}
        }
      }
    }
  
    td {
      display: block;
      word-wrap: break-word;
      max-width: 7em;
      &:first-child { 
        display: table-cell; 
        text-align: center;
        border-right: $cell-border;
      }
      @media (min-width: $breakpoint) {
        border: $cell-border;
      }
    }
  
    th, td {
      text-align: left;
      margin: .5em 1em;  
      @media (min-width: $breakpoint) {
        display: table-cell; 
        padding: 1em;
      }
    }  
  }    
}



@include responstable(
  $border-radius: $table-border-radius,
  $highlight-color: $table-highlight-color,
  $header-background-color: $table-header-background-color,
  $header-text-color: $table-header-text-color,
  $header-border: $table-header-border);

// General styles

body {
  padding: 0 2em;
  font-family: Arial, sans-serif;
  color: #024457;
  background: #f2f2f2;
}

h1 {
  font-family: Verdana;
  font-weight: normal;
  color: #024457;
  span {color: #167F92;}
}

</style>
</head>

<body >

<h1 align="center">Report Rapat BPH Departemen <?php echo $_SESSION['departemen'];?></h1>

<table class="responstable" align="center">
  
  <tr>
    <th width="93" data-th="Driver details"><span>Nama Rapat</span></th>
    <th width="104">Tanggal Rapat</th>
    <th width="99">Tempat Rapat</th>
    <th width="131">Jumlah Yang Hadir</th>
    <th width="131">Jumlah Yang Izin</th>
    <th width="131">Jumlah Yang Absen</th>
  </tr>
  
            <?php
               $i=0;
               foreach($Rapat as $data)
               {

                 // echo "<tr><td td style='text-align:center'> ".$i." </td></td>";
                   echo "<tr><td td style='text-align:center'>".$data->NAMA_RAPAT."</td></td>";
                   echo "<td td style='text-align:center'>".$data->TANGGAL_RAPAT."</td></td>";
                   echo "<td td style='text-align:center'>".$data->TEMPAT_RAPAT."</td></td>";
                   echo "<td td style='text-align:center'>" . $data->JUMLAH_HADIR . "</td></td>";
                   echo "<td td style='text-align:center'>".$data->JUMLAH_IZIN."</td></td>";
                   echo "<td td style='text-align:center'>".$data->JUMLAH_ABSEN."</td></td>";
                  //$i++;

                }
             ?>

  
</table>
</body>
</html>