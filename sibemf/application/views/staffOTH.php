<html>
<head>
    <style>
    body{
  background: #303030;
}

#pricing-table {
    margin: 100px auto;
    text-align: center;
    width: 669px; /* total computed width = 222 x 3 + 226 */
}

#pricing-table .plan {
    font: 12px 'Lucida Sans', 'trebuchet MS', Arial, Helvetica;
    text-shadow: 0 1px rgba(255,255,255,.8);        
    background: #fff;      
    border: 1px solid #ddd;
    color: #333;
    padding: 20px;
    width: 180px; /* plan width = 180 + 20 + 20 + 1 + 1 = 222px */      
    float: left;
    position: relative;
}

#pricing-table #most-popular {
    z-index: 2;
    top: -13px;
    border-width: 3px;
    padding: 30px 20px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);
    -webkit-box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);
    box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);    
}

#pricing-table h3 {
    background-color: #ddd;
    background-image: -moz-linear-gradient(#eee,#ddd);
    background-image: -webkit-gradient(linear, left top, left bottom, from(#eee), to(#ddd));    
    background-image: -webkit-linear-gradient(#eee, #ddd);
    background-image: -o-linear-gradient(#eee, #ddd);
    background-image: -ms-linear-gradient(#eee, #ddd);
    background-image: linear-gradient(#eee, #ddd);
    margin-top: -30px;
    padding-top: 30px;
    -moz-border-radius: 5px 5px 0 0;
    -webkit-border-radius: 5px 5px 0 0;
    border-radius: 5px 5px 0 0;
    height:160px;
}

#pricing-table #.plan h3 {
    -moz-border-radius: 5px 0 0 0;
    -webkit-border-radius: 5px 0 0 0;
    border-radius: 5px 0 0 0; 
    
}

#pricing-table h3 span {  /*bundaran */
    display: block;
    font: bold 25px/100px Georgia, Serif;
    color: #777;
    background: #fff;
    border: 5px solid #fff;
    height: 100px;
    width: 100px;
    margin: 10px auto -65px;
    -moz-border-radius: 100px;
    -webkit-border-radius: 100px;
    border-radius: 100px;
    -moz-box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
    -webkit-box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
    box-shadow: 0 5px 20px #ddd inset, 0 3px 0 #999 inset;
}

/* --------------- */

#pricing-table ul {
    margin: 10px 0 0 0;
    padding: 0px;
    list-style: none;
}

#pricing-table li {
    border-top: 1px solid #ddd;
    padding: 10px 0;
}
/*=====================================================================*/

.clear:before, .clear:after {
  content:"";
  display:table
}

.clear:after {
  clear:both
}

.clear {
  zoom:1
}


.title{
    max-width: 100%;
    padding: 5px;
    text-align: center;
    overflow: auto;
  
    margin-top:70px;
    margin-bottom:-50px;
    font: 400 30px 'Muli', sans-serif !important;
    font-weight: 300;
    text-transform: uppercase;
    color:white;
}

    </style>
    <link rel="stylesheet" href="<?php echo asset_url();?> style_table.css" >
</head>
<body>
    <div class="title">Staff Of The Month</div>
    <div id="pricing-table" class="clear">
        <div class="plan">
            <h3>SRD<span></span></h3>                  
            <ul>

                <li> <?php echo $dpt1->Nama; ?></li>
                <li> <?php echo $dpt1->ID_Staff; ?></li>
            </ul> 
        </div>
        <div class="plan">
            <h3>IA<span></span></h3>       
            <ul>
                <li> <?php echo $dpt2->Nama; ?></li>
                <li> <?php echo $dpt2->ID_Staff; ?></li>			
            </ul>    
        </div>
        <div class="plan">
            <h3>EA<span></span></h3>
            <ul>
                <li> <?php echo $dpt5->Nama; ?></li>
                <li> <?php echo $dpt5->ID_Staff; ?></li>			
            </ul>
        </div>	
    </div>
    
    <div id="pricing-table" class="clear">
        <div class="plan">
            <h3>RTD<span></span></h3>                  
            <ul>
                <li> <?php echo $dpt3->Nama; ?></li>
                <li> <?php echo $dpt3->ID_Staff; ?></li>    			
            </ul> 
        </div>
        <div class="plan">
            <h3>OSR<span></span></h3>       
            <ul>
                <li> <?php echo $dpt4->Nama; ?></li>
                <li> <?php echo $dpt4->ID_Staff; ?></li>    			
            </ul>    
        </div>
        <div class="plan">
            <h3>IM<span></span></h3>
            <ul>
                <li> <?php echo $dpt6->Nama; ?></li>
                <li> <?php echo $dpt6->ID_Staff; ?></li>    			
            </ul>
        </div>	
    </div>
    
    
</body>
</html>