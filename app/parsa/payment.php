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