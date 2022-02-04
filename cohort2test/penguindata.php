<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Display Penguin Data</title>
    <?php 
        $db = "newpenguin";
        $server = "localhost";
        $user = "root";
        $pword= "";
        $success = true;
        $conn = mysqli_connect($server,$user,$pword,$db);
        if(mysqli_connect_errno()){
            echo "Connection Failed: " . mysqli_connect_error;
            $success=false;
            exit();
        }
        $escapedName = mysqli_real_escape_string($conn,$_POST['penguinName']);
        $sql = "select * from penguin where commonName like '" .$escapedName. "';";
        
    ?>
</head>
<body>
    <h3>This is a Form to allow you to find data on Our Penguin Database</h3>
    
    <table border="1">
        
        <tr>
            <td colspan="2">
                <form method="post" action="GetPenguins.html">
                    <label>Database connection open </label> <?php echo $success ."<br/>"; ?>
                    <label>Escaped Penguin name </label> <?php echo $escapedName ."<br/>"; ?>
                    <input type="submit" value="Back To Request Page">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <?php
                  if (($result = mysqli_query($conn,$sql))) {
            
            while($row = mysqli_fetch_assoc($result))
            {
                
                echo "Row ". $row['penguinID']." with common name ". $row['commonName']." is: " . $row['scientificName'] ."<br/>";
            }
        }
        else{
            echo "Here is " .mysqli_affected_rows($conn). "<br/>" ;
        }
         //echo $sql. "<br/>";
        mysqli_close($conn);
                ?>
            </td>
        </tr>
    </table>
    
</body>
</html>