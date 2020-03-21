<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #container{
            width: 100%;
            max-width:500px;
            display: table;
            margin: 150px auto 0;

        }
        .productBlock{
            width: 100%;
            max-width:200px;
            display: table;
            margin: 0 auto;
            border: 3px solid #666;
            padding: 10px;


        }


    </style>
</head>
<body>
    <div id = "container">
        <div class = "productBlock">
            <p>Size: 10 MP</p>
            <p>Date: 12/12/2020</p>
            <p>Author: Victor</p>
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
            <input type="hidden" name="cmd" value="_s-xclick">
            <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----">
            <input type="image" src="https://www.paypalobjects.com/en_GB/SG/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!">
            <img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
            </form>


        </div>

                
    </div>


    
</body>
</html>