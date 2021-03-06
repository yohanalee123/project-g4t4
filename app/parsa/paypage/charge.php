<?php
  require_once('vendor/autoload.php');
  require_once('../config/db.php');
  require_once('../lib/pdo_db.php');
  require_once('../models/Customer.php');
  require_once('../models/Transaction.php');

  \Stripe\Stripe::setApiKey('sk_test_zAd4TY5sBsgasVFnjkJbFOd300kDJZgq9L');

 // Sanitize POST Array
 $POST = filter_var_array($_POST, FILTER_SANITIZE_STRING);

 $first_name = $POST['first_name'];
 $last_name = $POST['last_name'];
 $email = $POST['email'];
 $token = $POST['stripeToken'];
 $course_name = $POST['CourseName2'];
 $price = ($POST['Price2'])*100;
 $courseID = $POST['courseID'];
 $mentorID = $POST['mentorID'];
 $menteeID = $POST['menteeID'];

var_dump($course_name);
var_dump($courseID);
var_dump($mentorID);
var_dump($menteeID);
//  Customer In Stripe
$customer = \Stripe\Customer::create(array(
  "email" => $email,
  "source" => $token
));

// Charge Customer
$charge = \Stripe\Charge::create(array(
  "amount" => $price,
  "currency" => "SGD",
  "description" => $course_name,
  "customer" => $customer->id
));


// Customer Data
$customerData = [
  'id' => $charge->customer,
  'first_name' => $first_name,
  'last_name' => $last_name,
  'email' => $email
];

// Instantiate Customer
$customer = new Customer();

// Add Customer To DB
$customer->addCustomer($customerData);


// Transaction Data
$transactionData = [
  'id' => $charge->id,
  'customer_id' => $charge->customer,
  'product' => $charge->description,
  'amount' => ($charge->amount)/100,
  'currency' => $charge->currency,
  'status' => $charge->status,
];

// Instantiate Transaction
$transaction = new Transaction();

// Add Transaction To DB
$transaction->addTransaction($transactionData);

// Redirect to success
header('Location: success.php?tid='.$charge->id.'&product='.$charge->description.'&courseID='.$courseID.'&menteeID='.$menteeID.'&mentorID='.$mentorID);