
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PPL</title>
<style>

 *{  
  margin:0;
  padding:0;
}

body{
  
  background-color:#f0f0f0;
  font-family:helvetica;
}

a{
  display:block;
  color:#ad5482;  
  text-decoration:none;
  font-weight:bold;
  margin-top:40px;
  text-align:center;
}

#bg{
  position:relative;
  top:20px;
  height:600px;
  width:800px;
  background:url('http://i.imgur.com/3eP9Z4O.png') center no-repeat;
  background-size:cover;
  margin-left:auto;
  margin-right:auto; 
  border:#fff 15px solid;
}

.module{
  position:relative;
  top:15%;    
  height:70%;
  width:450px;
  margin-left:auto;
  margin-right:auto;
  border-radius:5px;
  background:RGBA(255,255,255,1);
    
  -webkit-box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);        
  box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
  
}

.module ul{
  list-style-type:none;
  margin:0;
}

.tab{
  float:left;
  height:60px;
  width:25%;
  padding-top:20px;
  box-sizing:border-box;
  background:#eeeeee;  
  text-align:center;
  cursor:pointer;
  transition:background .4s;
}

.tab:first-child{  
  -webkit-border-radius: 5px 0px 0px 0px;
  border-radius: 5px 0px 0px 0px;
}

.tab:last-child{  
  -webkit-border-radius: 0px 5px 0px 0px;
  border-radius: 0px 5px 0px 0px;
}

.tab:hover{  
  background-color:rgba(0,0,0,.1);
}

.activeTab{
  background:#fff;
}

.activeTab .icon{
  opacity:1;
}

.icon{
  height:24px;
  width:24px;
  opacity:.2;
}

.form{
  float:left;
  height:86%;
  width:100%;
  box-sizing:border-box;
  padding:40px;
}

.textbox{
  height:50px;
  width:100%;
  border-radius:3px;
  border:rgba(0,0,0,.3) 2px solid;
  box-sizing:border-box;
  padding:10px;
  margin-bottom:30px;
}

.textbox:focus{
  outline:none;
   border:rgba(24,149,215,1) 2px solid;
   color:rgba(24,149,215,1);
}

.button{
  height:50px;
  width:100%;
  border-radius:3px;
  border:rgba(0,0,0,.3) 0px solid;
  box-sizing:border-box;
  padding:10px;
  margin-bottom:30px;
  background:#90c843;
  color:#FFF;
  font-weight:bold;
  font-size: 12pt;
  transition:background .4s;
  cursor:pointer;
}

.button:hover{
  background:#80b438;
  
}
</style>
</head>

<body >
<div id="bg">
  <div class="module">
    <ul>
      <li class="tab activeTab"><img src="http://i.imgur.com/Fk1Urva.png" alt="" class="icon"/></li>
      <li class="tab" ><img src="http://i.imgur.com/ZsRgIDD.png" alt="" class="icon"/></li>
      <li class="tab" ><img src="http://i.imgur.com/34Q50wo.png" alt="" class="icon"/></li>
      <li class="tab" ><img src="http://i.imgur.com/LCCJ06E.png" alt="" class="icon"/></li>
    </ul>
    
    <form class="form">
      <input type="text" placeholder="First Name" class="textbox" />
      <input type="text" placeholder="Last Name" class="textbox" />
      <input type="text" placeholder="Email Address" class="textbox" />
      <input type="button" value="Next" class="button" />
    </form>
  </div>
</div>

<a href="http://dribbble.com/shots/1265587-Registration-Template-PSD?list=everyone" target="_blank">Design by: Asif Aleem</a>
</body>
</html>