<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <title>Pay Page</title>

  <!-- Latest compiled and minified JavaScript -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
    crossorigin="anonymous"></script>

</head>
<body>
  <div class="container">
    <h2 id = "CourseName" class="my-4 text-center"> <h2 class="my-4 text-center" id = "Price"></h2>  </h2>
    
    
    <script>
            $(async () => {
              // Change serviceURL to your own
              var serviceURL = "http://127.0.0.1:5000/course";
              try {
                const response =
                  await fetch(
                    serviceURL, { method: 'GET' }
                  );
                const data = await response.json();
                const urlParams = new URLSearchParams(window.location.search);
                const courseID = urlParams.get('id');

                var courses = data.courses; //the arr is in data.books of the JSON data

                $('#webpage').click(function () {
                  window.location = 'paypage\\index.php?id=' + courseID;
                });

                for (const course of courses) {
                  if (courseID == course.CourseID) {
                    console.log(courseID)
                    document.getElementById('CourseName').innerHTML = course.CourseName;
                    document.getElementById('Price').innerHTML = "$" + course.Price;
          
                  }

                }

              } catch (error) {
                // Errors when calling the service; such as network error, 
                // service offline, etc
                showError('There is a problem retrieving course data, please try again later.<br />' + error);
              } // error
            });

          </script>

    <form action="./charge.php" method="post" id="payment-form">
      <div class="form-row">
       <input type="text" name="first_name" class="form-control mb-3 StripeElement StripeElement--empty" placeholder="First Name">
       <input type="text" name="last_name" class="form-control mb-3 StripeElement StripeElement--empty" placeholder="Last Name">
       <input type="email" name="email" class="form-control mb-3 StripeElement StripeElement--empty" placeholder="Email Address">
        <div id="card-element" class="form-control">
          <!-- a Stripe Element will be inserted here. -->
        </div>
        <!-- Used to display form errors -->
        <div id="card-errors" role="alert"></div>
      </div>
      <button>Submit Payment</button>
    </form>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://js.stripe.com/v3/"></script>
  <script src="./js/charge.js"></script>
</body>
</html>