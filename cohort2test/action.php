<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Display Data Entered </title>
    <?php
        if($_POST['clientName']!=""){
            $unSanitisedName = $_POST['clientName'];
            $name = addslashes($unSanitisedName);//filter_var(trim($_POST['clientName']), FILTER_FLAG_NO_ENCODE_QUOTES);
            echo "Here I am";
            }
        else {
            $unSanitisedName = $name = "Name not entered";
            }
        if($_POST['pword']!=""){
            $unhashed = $_POST['pword'];
            $pword = hash('sha256', $_POST['pword']);
            }
        else {
            $unhashed = $pword = "not set";
            }
    ?>
</head>
<body>
    <form method="post" action="index.html">
        
        <h1>
            <?php
                echo "The Unsanitised Client Name is: " . $unSanitisedName . "<br/>";
                echo "The Client Name is: " . $name . "<br/>";
                echo "The Client Password unhashed is: " . $unhashed . "<br/>";
                echo "The Client Password is: " . $pword . "<br/>";
            ?>
        </h1>
        <!-- This is how we do comments in HTML
        <p>
            <?php
                $a = 5;
                $b = 6;
                $c = $a . $b;
                echo '$a is ' .$a . "<br/>";
                echo '$b is ' .$b . "<br/>";
                echo "\$c is " .$c . " the length of $c is ". strlen($c) ."<br/>";
                $d = $a + $b;
                echo "d is " .$d . "<br/>";
            ?>
        </p>
        -->
        <input type="submit" value="Return To Index" />
    </form>
</body>
</html>