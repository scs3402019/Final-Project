<?php
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$Name = $Length = $Performer = "";
$Title_err = $Length_err = $Performer_err= "" ;

 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
	
    // Validate Title
    $Title = trim($_POST["Title"]);
	if(empty($Title)){
		$Title_err = "Please enter a Song Title.";
	}
	
    // Validate Length
    $Length = trim($_POST["Length"]);
    if(empty($Length)){
        $Length_err = "Please enter song length.";     
    }
	
	// Validate Performer
	$Performer = trim($_POST["Performer"]);
	if(empty($Performer)){
		$Performer_err = "Please enter a performer name.";
	}
	
    // Check input errors before inserting in database
    if(empty($Title_err) && empty($Length_err) && empty($Performer_err)){
        // Prepare an insert statement
        $sql = "INSERT INTO Song (Name, Length, Performer) VALUES (?, ?, ?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sss", $param_Title, $param_Length, $param_Performer);
            
            // Set parameters
			$param_Title = $Title;
            $param_Length = $Length;
            $param_Performer = $Performer;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Records created successfully. Redirect to landing page
                header("location: viewSongs.php");
                exit();
            } else{
				$Title_err = "Enter a unique Song.";
            }
        }
        mysqli_free_result($result);
        // Close statement
        mysqli_stmt_close($stmt);
    }
    
    // Close connection
    mysqli_close($link);
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="./style.css">
	<!--<link rel="stylesheet" href="./style-primary.css">-->
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header clearfix">
						<a href="index.php" class="btn btn-success pull-right">Home</a>
                        <h2 class="pull-left"><img src="songbird.jfif" height=25px> Songbird</h2>
                    </div>
                    <p>Please fill this form and submit to add a song to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
						<div class="form-group <?php echo (!empty($Title_err)) ? 'has-error' : ''; ?>">
                            <label>Song Title</label>
                            <input type="text" name="Title" class="form-control" value="<?php echo $Title; ?>">
                            <span class="help-block"><?php echo $Title_err;?></span>
                            <label>Song Length</label>
                            <input type="text" name="Length" class="form-control" value="<?php echo $Length; ?>">
                            <span class="help-block"><?php echo $Length_err;?></span>
                            <label>Performer</label>
                            <input type="text" name="Performer" class="form-control" value="<?php echo $Performer; ?>">
                            <span class="help-block"><?php echo $Performer_err;?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Add Song">
                        <a href="viewSongs.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>
