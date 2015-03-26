
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PPL</title>
<style>

/*custom font*/
@import url(http://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {margin: 0; padding: 0;}

html {
   height: 100%;
   /*Image only BG fallback*/
   background: url('http://thecodeplayer.com/uploads/media/gs.png');
   /*background = gradient + image pattern combo*/
   background: 
      linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), 
      url('http://thecodeplayer.com/uploads/media/gs.png');
}

body {
   font-family: montserrat, arial, verdana;
}
/*form styles*/
#msform {
   width: 400px;
   margin: 50px auto;
   text-align: center;
   position: relative;
}
#msform fieldset {
   background: white;
   border: 0 none;
   border-radius: 3px;
   box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
   padding: 20px 30px;
   
   box-sizing: border-box;
   width: 80%;
   margin: 0 10%;
   
   /*stacking fieldsets above each other*/
   position: absolute;
}
/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
   display: none;
}
/*inputs*/
#msform input, #msform textarea {
   padding: 15px;
   border: 1px solid #ccc;
   border-radius: 3px;
   margin-bottom: 10px;
   width: 100%;
   box-sizing: border-box;
   font-family: montserrat;
   color: #2C3E50;
   font-size: 13px;
}
/*buttons*/
#msform .action-button {
   width: 100px;
   background: #27AE60;
   font-weight: bold;
   color: white;
   border: 0 none;
   border-radius: 1px;
   cursor: pointer;
   padding: 10px 5px;
   margin: 10px 5px;
}
#msform .action-button:hover, #msform .action-button:focus {
   box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
/*headings*/
.fs-title {
   font-size: 15px;
   text-transform: uppercase;
   color: #2C3E50;
   margin-bottom: 10px;
}
.fs-subtitle {
   font-weight: normal;
   font-size: 13px;
   color: #666;
   margin-bottom: 20px;
}
/*progressbar*/
#progressbar {
   margin-bottom: 30px;
   overflow: hidden;
   /*CSS counters to number the steps*/
   counter-reset: step;
}
#progressbar li {
   list-style-type: none;
   color: white;
   text-transform: uppercase;
   font-size: 9px;
   width: 33.33%;
   float: left;
   position: relative;
}
#progressbar li:before {
   content: counter(step);
   counter-increment: step;
   width: 20px;
   line-height: 20px;
   display: block;
   font-size: 10px;
   color: #333;
   background: white;
   border-radius: 3px;
   margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
   content: '';
   width: 100%;
   height: 2px;
   background: white;
   position: absolute;
   left: -50%;
   top: 9px;
   z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
   /*connector not needed before the first step*/
   content: none; 
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before,  #progressbar li.active:after{
   background: #27AE60;
   color: white;
}




</style>
</head>

<body >
<!-- multistep form -->
<form id="msform" action="<?php echo base_url()?>all_nilai/sendpenilaian" method="post">
   <!-- progressbar -->
   
   <!-- fieldsets -->
   <fieldset style="width:1000px; margin-left : -70%">
      <h2 class="fs-title">Leadership</h2>
      <table class="tabel" >
            <tr>
                     <th width="300px">ID Staff</th>
                    <th width="300px">Nama Staff</th>

                    <th width="300px">Sangat Kurang</th>
                    <th width="300px">Kurang</th>
                    <th width="300px">Cukup</th>
                    <th width="300px">Baik</th>
                    <th width="300px">Sangat Baik</th>
            </tr>
   
            <?php
               $i=0;
               foreach($Staff as $data)
               {
                  
                  echo "<tr><td td style='text-align:center'>".$data->ID_Staff."</td></td>";
                  echo "<td td style='text-align:center'>".$data->Nama."</td></td>";
               ?>
            
               <td><input type='radio' name='nilai<?php echo $i?>' value='1' checked="checked"></td>
               <td><input type='radio' name='nilai<?php echo $i?>' value='2'></td>
               <td><input type='radio' name='nilai<?php echo $i?>' value='3'></td>
               <td><input type='radio' name='nilai<?php echo $i?>' value='4'></td>
               <td><input type='radio' name='nilai<?php echo $i; $i=$i+1;?>' value='5'></td>
            
               </tr>
                  <?php
               }
        ?>
            </table>
      
      
      <input type="button" name="next" class="next action-button" value="Next" />
    
   </fieldset>


   <fieldset style="width:1000px; margin-left : -70%">
      <h2 class="fs-title">Teamwork</h2>
      <table class="tabel" style="margin-left 10%">
            <tr>
                     <th width="300px">ID Staff</th>
                    <th width="300px">Nama Staff</th>

                    <th width="300px">Sangat Kurang</th>
                    <th width="300px">Kurang</th>
                    <th width="300px">Cukup</th>
                    <th width="300px">Baik</th>
                    <th width="300px">Sangat Baik</th>
            </tr>
   
            <?php
               $i=0;
               foreach($Staff as $data)
               {
                  
                  echo "<tr><td td style='text-align:center'>".$data->ID_Staff."</td></td>";
                  echo "<td td style='text-align:center'>".$data->Nama."</td></td>";
                  
               ?>
            
               <td><input type='radio' name='nilai1<?php echo $i?>' value='1' checked="checked"></td>
               <td><input type='radio' name='nilai1<?php echo $i?>' value='2'></td>
               <td><input type='radio' name='nilai1<?php echo $i?>' value='3'></td>
               <td><input type='radio' name='nilai1<?php echo $i?>' value='4'></td>
               <td><input type='radio' name='nilai1<?php echo $i; $i=$i+1;?>' value='5'></td>
            
               </tr>
                  <?php
               }
        ?>
            </table>
      
      
      <input type="button" name="previous" class="previous action-button" value="Previous" />
      <input type="button" name="next" class="next action-button" value="Next" />
      
   </fieldset>




   <fieldset style="width:1000px; margin-left : -70%">
      <h2 class="fs-title">Problem Solving</h2>
      <table class="tabel" style="margin-left 10%">
            <tr>
                     <th width="300px">ID Staff</th>
                    <th width="300px">Nama Staff</th>

                    <th width="300px">Sangat Kurang</th>
                    <th width="300px">Kurang</th>
                    <th width="300px">Cukup</th>
                    <th width="300px">Baik</th>
                    <th width="300px">Sangat Baik</th>
            </tr>
   
            <?php
               $i=0;
               foreach($Staff as $data)
               {
                 
                  echo "<tr><td td style='text-align:center'>".$data->ID_Staff."</td></td>";
                  echo "<td td style='text-align:center'>".$data->Nama."</td></td>";
               ?>
            
               <td><input type='radio' name='nilai2<?php echo $i?>' value='1' checked="checked"></td>
               <td><input type='radio' name='nilai2<?php echo $i?>' value='2'></td>
               <td><input type='radio' name='nilai2<?php echo $i?>' value='3'></td>
               <td><input type='radio' name='nilai2<?php echo $i?>' value='4'></td>
               <td><input type='radio' name='nilai2<?php echo $i; $i=$i+1;?>' value='5'></td>
            
               </tr>
                  <?php
               }
        ?>
            </table>
      
      
      <input type="button" name="previous" class="previous action-button" value="Previous" />
      <input type="button" name="next" class="next action-button" value="Next" />
      
   </fieldset>




   <fieldset style="width:1000px; margin-left : -70%">
      <h2 class="fs-title">Loyalitas</h2>
      <table class="tabel" style="margin-left 10%">
            <tr>
                     <th width="300px">ID Staff</th>
                    <th width="300px">Nama Staff</th>

                    <th width="300px">Sangat Kurang</th>
                    <th width="300px">Kurang</th>
                    <th width="300px">Cukup</th>
                    <th width="300px">Baik</th>
                    <th width="300px">Sangat Baik</th>
            </tr>
   
            <?php
               $i=0;
               foreach($Staff as $data)
               {
                  
                  echo "<tr><td td style='text-align:center'>".$data->ID_Staff."</td></td>";
                  echo "<td td style='text-align:center'>".$data->Nama."</td></td>";
               ?>
            
               <td><input type='radio' name='nilai3<?php echo $i?>' value='1' checked="checked"></td>
               <td><input type='radio' name='nilai3<?php echo $i?>' value='2'></td>
               <td><input type='radio' name='nilai3<?php echo $i?>' value='3'></td>
               <td><input type='radio' name='nilai3<?php echo $i?>' value='4'></td>
               <td><input type='radio' name='nilai3<?php echo $i; $i=$i+1;?>' value='5'></td>
               </tr>
                  <?php
               }
        ?>
            </table>
      
      
      <input type="button" name="previous" class="previous action-button" value="Previous" />
      <input type="button" name="next" class="next action-button" value="Next" />
     
   </fieldset>




   <fieldset style="width:1000px; margin-left : -70%">
      <h2 class="fs-title">Kinerja</h2>
      <table class="tabel" style="margin-left 10%">
            <tr>
                     <th width="300px">ID Staff</th>
                    <th width="300px">Nama Staff</th>

                    <th width="300px">Sangat Kurang</th>
                    <th width="300px">Kurang</th>
                    <th width="300px">Cukup</th>
                    <th width="300px">Baik</th>
                    <th width="300px">Sangat Baik</th>
            </tr>
   
            <?php
               $i=0;
               foreach($Staff as $data)
               {
                  
                  echo "<tr><td td style='text-align:center'>".$data->ID_Staff."</td></td>";
                  echo "<td td style='text-align:center'>".$data->Nama."</td></td>";
               ?>
            
               <td><input type='radio' name='nilai4<?php echo $i?>' value='1' checked="checked"></td>
               <td><input type='radio' name='nilai4<?php echo $i?>' value='2'></td>
               <td><input type='radio' name='nilai4<?php echo $i?>' value='3'></td>
               <td><input type='radio' name='nilai4<?php echo $i?>' value='4'></td>
               <td><input type='radio' name='nilai4<?php echo $i; $i=$i+1;?>' value='5'></td>
               </tr>
                  <?php
               }
        ?>
            </table>
      
      
      <input type="button" name="previous" class="previous action-button" value="Previous" />
      <input type="button" name="next" class="next action-button" value="Next" />
      
   </fieldset>




   <fieldset style="width:1000px; margin-left : -70%">
      <h2 class="fs-title">Attitude</h2>
      <table class="tabel" style="margin-left 10%">
            <tr>
                     <th width="300px">ID Staff</th>
                    <th width="300px">Nama Staff</th>

                    <th width="300px">Sangat Kurang</th>
                    <th width="300px">Kurang</th>
                    <th width="300px">Cukup</th>
                    <th width="300px">Baik</th>
                    <th width="300px">Sangat Baik</th>
            </tr>
   
            <?php
               $i=0;
               foreach($Staff as $data)
               {
                  
                  echo "<tr><td td style='text-align:center'>".$data->ID_Staff."</td></td>";
                  echo "<td td style='text-align:center'>".$data->Nama."</td></td>";
               ?>
            
               <td><input type='radio' name='nilai5<?php echo $i?>' value='1' checked="checked"></td>
               <td><input type='radio' name='nilai5<?php echo $i?>' value='2'></td>
               <td><input type='radio' name='nilai5<?php echo $i?>' value='3'></td>
               <td><input type='radio' name='nilai5<?php echo $i?>' value='4'></td>
               <td><input type='radio' name='nilai5<?php echo $i; $i=$i+1;?>' value='5'></td>
            
               </tr>
                  <?php
               }
        ?>
            </table>
      
      
      <input type="button" name="previous" class="previous action-button" value="Previous" />
      <input type="hidden" name="jumlah" value="<?php echo $i ?>" />
      <input type="submit" name="submit" class="submit action-button" value="Submit" />
   </fieldset>




</form>

<script src="/sibemf/assets/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- jQuery easing plugin -->
<script src="/sibemf/assets/jquery.easing.min.js" type="text/javascript"></script>
<script>
/* 
Orginal Page: http://thecodeplayer.com/walkthrough/jquery-multi-step-form-with-progress-bar 

*/
//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
   if(animating) return false;
   animating = true;
   
   current_fs = $(this).parent();
   next_fs = $(this).parent().next();
   
   //activate next step on progressbar using the index of next_fs
   $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
   
   //show the next fieldset
   next_fs.show(); 
   //hide the current fieldset with style
   current_fs.animate({opacity: 0}, {
      step: function(now, mx) {
         //as the opacity of current_fs reduces to 0 - stored in "now"
         //1. scale current_fs down to 80%
         scale = 1 - (1 - now) * 0.2;
         //2. bring next_fs from the right(50%)
         left = (now * 50)+"%";
         //3. increase opacity of next_fs to 1 as it moves in
         opacity = 1 - now;
         current_fs.css({'transform': 'scale('+scale+')'});
         next_fs.css({'left': left, 'opacity': opacity});
      }, 
      duration: 800, 
      complete: function(){
         current_fs.hide();
         animating = false;
      }, 
      //this comes from the custom easing plugin
      easing: 'easeInOutBack'
   });
});

$(".previous").click(function(){
   if(animating) return false;
   animating = true;
   
   current_fs = $(this).parent();
   previous_fs = $(this).parent().prev();
   
   //de-activate current step on progressbar
   $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
   
   //show the previous fieldset
   previous_fs.show(); 
   //hide the current fieldset with style
   current_fs.animate({opacity: 0}, {
      step: function(now, mx) {
         //as the opacity of current_fs reduces to 0 - stored in "now"
         //1. scale previous_fs from 80% to 100%
         scale = 0.8 + (1 - now) * 0.2;
         //2. take current_fs to the right(50%) - from 0%
         left = ((1-now) * 50)+"%";
         //3. increase opacity of previous_fs to 1 as it moves in
         opacity = 1 - now;
         current_fs.css({'left': left});
         previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
      }, 
      duration: 800, 
      complete: function(){
         current_fs.hide();
         animating = false;
      }, 
      //this comes from the custom easing plugin
      easing: 'easeInOutBack'
   });
});

//$(".submit").click(function(){
//   return false;
//})

</script>


</body>
</html>