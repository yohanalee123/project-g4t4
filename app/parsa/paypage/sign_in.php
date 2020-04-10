<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <title>Sign In First</title>

  <!-- Latest compiled and minified JavaScript -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
    crossorigin="anonymous"></script>

  <style>
    .btn{
      background-color: #fff;
      border: none;
      color: orange;
      padding: 12px 16px;
      font-size: 16px;
      cursor: pointer;
      border-radius: 10px;
    }

    /* Darker background on mouse-over */
    .btn:hover {
      background-color:black;
      color:orange;
    }
  </style>

</head>
<body style="background-color:#ff6f00; font-family: Arial, sans-serif;">
 <h1 style="text-align:center; padding-top:50px; color:whitesmoke; padding-bottom:30px;">Please SIGN IN first<br> before proceeding</h1>

 <center><button id = "home" class="btn">Back to Home for sign in</button></center>
 <script>
    $('#home').click(function () {
        window.location.replace('http://localhost/project-g4t4/app/parsa/');
    });
</script>
</body>
</html>