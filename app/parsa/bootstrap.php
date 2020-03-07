<?php
//protects for unauthorized entry
require_once 'json/common.php';
require_once 'json/protect_json.php';
require_once 'json/protect.php';
require_once 'json/token.php';

/**
 * @param string $url The URL for this request.
 * @param array $fields Associative array of HTTP form parameters.
 * @param boolen $post If true, send HTTP POST.  Else send HTTP GET.  Default to false; i.e. HTTP GET
 * @param boolean $multipart Send a HTTP POST multipart-form request?  Default to false.
 * @return array Associative array
 *  For key 'response', string value is response obtained from this request.
 *  For key 'error', if set, string value is error message.
 */


function httpRequest($url, $fields = null, $post = false, $multipart = false)
{
    /**
     * inputs: [string] $url, (optional) $fields, [boolean] $post, [boolean] $multipart
     * outputs: $httpResult
     */

    // Send HTTP POST
    $ch = curl_init();
    #var_dump($url);
    #var_dump($url);
    if ($post) {
        // HTTP POST
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        /*
        Passing an array to CURLOPT_POSTFIELDS will encode the data as multipart/form-data,
        while passing a URL-encoded string will encode the data as application/x-www-form-urlencoded.
        When testing with Tomcat, Java requires to use class MultipartFormDataRequest to handle multipart-form.
        */
        if ($multipart) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
        } else {
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($fields));
        }

    } else {
        // HTTP GET
        $query_data = http_build_query($fields);
        curl_setopt($ch, CURLOPT_URL, "$url?$query_data");
        curl_setopt($ch, CURLOPT_POST, false);

    }

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // Get URL content
    do {
        $redirect = false;

        $response = curl_exec($ch);
        $httpResult = ['response' => $response];
        if ($response === false) {
            // typically, wrong host
            $errno = curl_errno($ch);
            $error = curl_error($ch);
            $httpResult['error'] = "Unable to connect $url.  Error #$errno: '$error'";

        } else {

            $redirect_url = curl_getinfo($ch, CURLINFO_REDIRECT_URL);
            if (!empty($redirect_url)) {
                // Typically, HTTP Code 302 - URL redirection
                curl_setopt($ch, CURLOPT_URL, $redirect_url);
                $redirect = true;

            } else {
                // Check HTTP code
                $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

                if ($httpCode >= 400) {
                    // HTTP 4xx are client errors
                    // HTTP 5xx are server errors
                    // Typically,  HTTP CODE 404 Not found; path not found.

                    $httpResult['error'] = "Cannot connect to $url.  HTTP CODE $httpCode";
                }
            }
        }
    } while ($redirect === true);

    // close handle to release resources
    curl_close($ch);

    return $httpResult;
}

?>
<html>
<head>
    <!-- UI styling -->
    <style>
        .bootstraptable {
            text-align: center;
            border-radius: 10px;
            font-family: "Roboto", sans-serif;
            overflow: hidden;
            box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -webkit-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -o-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -ms-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            color: #666;
            margin: auto;
            margin-top: 20px;
            width: 400px;
        }

        .bootstraptable th {
            background: #563d7c;
            color: #fff;
            padding: 20px;
        }

        .bootstraptable tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        .bootstraptable td {
            padding: 20px;
            border: 0;
        }

        .bootstraptable2 {
            background-color: #f4f4f4;
            text-align: center;
            border-radius: 10px;
            font-family: "Roboto", sans-serif;
            overflow: hidden;
            box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -webkit-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -o-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -ms-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            color: #666;
            margin: auto;
            margin-top: 20px;
            width: 400px;
        }

        .bootstraptable2 th {
            background: #563d7c;
            color: #fff;
            padding: 20px;
        }

        .bootstraptable2 tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        .bootstraptable2 td {
            padding: 20px;
            border: 0;
        }

        .bootstraptable3 {
            text-align: center;
            border-radius: 10px;
            font-family: "Roboto", sans-serif;
            overflow: hidden;
            box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -webkit-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -o-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            -ms-box-shadow: 0 0px 20px 0px rgba(0, 0, 0, 0.15);
            color: #666;
            margin: auto;
            margin-top: 20px;
            width: 400px;
        }

        .bootstraptable3 th {
            background: #563d7c;
            color: #fff;
            padding: 20px;
        }

        .bootstraptable3 tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        .bootstraptable3 td {
            padding: 20px;
            border: 0;
        }

        .button {
            background-color: #563d7c;
            border: none;
            border-radius: 5px;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 4px 4px 0 rgba(86, 61, 124, 0.6), 0 6px 20px 0 rgba(0, 0, 0, 0.6)
        }

        .button:hover {
            box-shadow: 0 12px 16px 0 rgba(86, 61, 124, 0.24), 0 10px 10px 0 rgba(86, 61, 124, 0.19);
        }

        /* Create two equal columns that floats next to each other */
        .column {
            float: left;
            width: 30%;
        }

        .column2 {
            float: left;
            width: 70%;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .custom-file-upload {
            background-color: #563d7c;
            border: none;
            border-radius: 5px;
            color: white;
            padding: 12px 14px;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
            box-shadow: 0 4px 4px 0 rgba(86, 61, 124, 0.6), 0 6px 20px 0 rgba(0, 0, 0, 0.6)
        }

        .custom-file-upload:hover {
            box-shadow: 0 12px 16px 0 rgba(86, 61, 124, 0.24), 0 10px 10px 0 rgba(86, 61, 124, 0.19);
        }

        input[type="file"] {
            display: none;
        }
    </style>
    <title>Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script>
    document.querySelector("#bootstrap-file").onchange = function(){
        document.querySelector("#file-name").textContent = this.files[0].name;
    }
</script>
<body>
<div class="row">
    <div class="column">
        <!-- form for bootstrap file input -->
        <form id='bootstrap-form' method="post" enctype="multipart/form-data" style="font-family: Roboto, sans-serif">
            <!-- reference bootstraptable3 for UI styling -->
            <table class="bootstraptable3" style="border-collapse: collapse;">
                <tr>
                    <td>Bootstrap File:
                        <!-- UI labelling for bootstrap file input -->
                        <label for="bootstrap-file" class="custom-file-upload">
                            Choose File
                        </label>
                        <!-- input for bootstrap file -->
                            <input id='bootstrap-file' type="file" name="bootstrap-file">
                        <!-- pass token with bootstrap file -->
                        <input type='hidden' name='token' value='<?php echo($_GET['token']); ?>'/></td>
                </tr>
                <tr>
                    <!-- import button-->
                    <td style="text-align: center"><input class="button" type="submit" name="submit" value="Import">
                    </td>
                </tr>
            </table>
        </form>
        <!-- form to return user to adminmain.php -->
        <form id='bootstrap-form' method="post" action="adminmain.php">
            <!-- reference bootstraptable2 for UI styling -->
            <table class="bootstraptable2" style="border-collapse: collapse;">
                <tr>
                    <td>
                        <!-- button for returning back to adminmain.php-->
                        <input class="button" style="padding: 10px 30px" type="submit" name="submit" value="Back">
                    </td>
                </tr>
            </table>
        </form>
        <br>

        <?php
        //var_dump($_FILES);
        //if import button clicked and a file is attached
        if (isset($_POST['submit']) and isset($_FILES['bootstrap-file'])) {

            ini_set('xdebug.var_display_max_depth', '10');
            ini_set('xdebug.var_display_max_children', '4096');
            ini_set('xdebug.var_display_max_data', '4096');

            $tmp_name = 'temp_name';
            $zipfile_path = $_FILES['bootstrap-file']['tmp_name'];
            $file_name = $_FILES['bootstrap-file']['name'];
            $fields['token'] = $token;
            $fields['bootstrap-file'] = new CURLFile($zipfile_path, 'application/zip', $file_name);
            $json_api_url = get_relative_url('bootstrap');
            $httpResult = httpRequest($json_api_url, $fields, true, true);
            $response = $httpResult['response'];
            $response = (array)json_decode($response, true);

//            var_dump($tmp_name);
//            var_dump($zipfile_path);
//            var_dump($file_name);
//            var_dump($fields);
//            var_dump($json_api_url);
//            var_dump($httpResult);
//           var_dump($response);
        }
        //        if (!isEmpty($errors)) {
        //            $result = [
        //                "status" => "error",
        //                "num-record-loaded" => $record,
        //                "error" => $errors,
        //            ];
        //        } else {
        //            $result = [
        //                "status" => "success",
        //                "num-record-loaded" => $record,
        //            ];
        //        }
        //        var_dump($response = $httpResult['response']);
        //        var_dump((array)json_decode($response, true));
        //        var_dump(isset($response));

        if (isset($response) && !empty($response)) { //if httpRequest returns true with value, proceed
            $status = $response['status'];
            echo "
    <table class=\"bootstraptable\" style=\"border-collapse: collapse; width:80%\">
    <tr>
        <th>Status</th>
        <td style=\"text-transform:uppercase\"><b>$status</b></td>
    </tr>
    </table>";
            echo "</div>";

            echo "<div class=\"column2\">";
            //var_dump($result["num-record-loaded"]);
            //create display table with the number of records loaded
            echo "<table class=\"bootstraptable\" style=\"border-collapse: collapse; width:80%; font-family: Roboto, sans-serif\">
    <tr>
        <th>File</th>
        <th>No. of Records Loaded</th>
    </tr>";
            foreach ($response["num-record-loaded"] as $csv_name_num_loaded_array) {
                //var_dump($csv_name_num_loaded_array);
                $csv_name = array_keys($csv_name_num_loaded_array)[0];
                $num_loaded = $csv_name_num_loaded_array[$csv_name];
                echo "
        <tr>
            <td>$csv_name</td>
            <td>$num_loaded</td>
        </tr>";
            }
            echo "</table>";
            echo "</div>";
            echo "<div class='column'>";
            //if there is an error when loading files
            if (isset($response["error"])) {
                echo "<table class=\"bootstraptable\" border=\"1\" style=\"border-collapse: collapse\">
    <tr>
        <th>File</th>
        <th>Line</th>
        <th>Error Message</th>
    </tr>
    <br/>";
                $error_output = [];
                foreach ($response["error"] as $error) {
                    //var_dump($error);
                    $file_name = $error['file'];
                    $error_output[$file_name][] = [$error['line'], $error['message'][0]];
                }
                //sort array by key
                ksort($error_output);
                //var_dump($error_output);
                //
                foreach ($error_output as $file => $lineNum_errorDesc_array) {
                    foreach ($lineNum_errorDesc_array as $index => $line_message) {
                        $line = $line_message[0];
                        $message = $line_message[1];
                        echo "
                        <tr>
                            <td>$file</td>
                            <td>$line</td>
                            <td>$message</td>
                        </tr>";
                    }
                }
            }
            echo "</table>";

            //code below is to handle if user does not select a file before clicking import
        } elseif (isset($_POST['submit'])) {
            ?>

            <table class="bootstraptable3" style="border-collapse: collapse;">
                <tr>
                    <th rowspan="2" colspan="2">Status</th>
                    <td style=\"text-transform:uppercase\"><b>ERROR</b></td>
                </tr>
                <tr>
                    <td style="text-transform:uppercase"><b>Input files not found</b></td>
                </tr>
            </table>
            <?php
        }
        ?>
    </div>
</div>
</body>
</html>