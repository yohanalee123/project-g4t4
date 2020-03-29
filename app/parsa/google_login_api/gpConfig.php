<?php
session_start();

//Include Google client library 
include_once 'src/Google_Client.php';
include_once 'src/contrib/Google_Oauth2Service.php';

/*
 * Configuration and setup Google API
 */
$clientId = '1064425262989-oissu7nu87so595roadoon4c9qqcpt5j.apps.googleusercontent.com'; //Google client ID
$clientSecret = 'b2eECUG3QW8H_tC5L-5sdJub'; //Google client secret
#$redirectURL = 'http://3.0.139.114/app/parsa/google_login_api'; //Callback URL
$redirectURL = 'http://127.0.0.1/clone/project-g4t4/app/parsa/google_login_api'

//Call Google API
$gClient = new Google_Client();
$gClient->setApplicationName('Login to mentor.com');
$gClient->setClientId($clientId);
$gClient->setClientSecret($clientSecret);
$gClient->setRedirectUri($redirectURL);

$google_oauthV2 = new Google_Oauth2Service($gClient);
?>