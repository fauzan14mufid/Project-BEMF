<!doctype html>

<html>
  
  <head>
    <title>FP PPL</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/assets/css/bootstrap.css">
    <script type="text/javascript" src="/assets/s/bootstrap.min.js"></script>
    <script type="text/javascript" src="/assets/js/npm.js"></script>
    <script type="text/javascript" src="/assets/js/myriad-pro.cufonfonts.js"></script>
  </head>
  
  <body>
    <div class="container">
        <div class="row">
          <div class="col-md-2 col-md-offset-5">
            <form class="form-signin" action="<?php echo base_url(); ?>index.php/controllerkp/insertJurnal">
              <h2 class="form-signin-heading">Selamat Datang di Kerja Praktek</h2>
              <label for="inputEmail" class="sr-only">username</label>
              <input type="email" id="inputEmail" class="form-control" placeholder="username" required autofocus>
              <label for="inputPassword" class="sr-only">Password</label>
              <input type="password" id="inputPassword" class="form-control" placeholder="password" required>
              <button class="btn btn-default" type="submit">Masuk</button>
           </form>
          </div>
        </div>
    </div>
  </body>

</html>