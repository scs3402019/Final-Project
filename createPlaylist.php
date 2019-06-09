<?php
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$Playlist_name = "";
$Playlist_name_err = "";

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
	
	//Validate Playlist
	$Playlist_name = trim($_POST["Playlist_name"]);
	if(empty($Playlist_name)){
		$Playlist_name_err = "Please enter a Playlist name.";
	}

    // Check input errors before inserting in database
    if(empty($Playlist_name_err)){
        // Prepare an insert statement
        $sql = "INSERT INTO Playlist (Playlist_name) VALUES (?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_Playlist_name);
            
            // Set parameters
			$param_Playlist_name = $Playlist_name;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Records created successfully. Redirect to landing page
                header("location: index.php");
                exit();
            } else{
				$Title_err = "Enter a unique Playlist name.";
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
	<script src="style.css"></script>
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
                    <p>Please fill this form and submit to add a Playlist.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
						<div class="form-group <?php echo (!empty($Playlist_name_err)) ? 'has-error' : ''; ?>">
                            <label>Playlist Name</label>
                            <input type="text" name="Playlist_name" class="form-control" value="<?php echo $Playlist_name; ?>">
                            <span class="help-block"><?php echo $Playlist_name_err;?></span>
                        </div>

                        <input type="submit" class="btn btn-primary" value="Add Playlist">
                        <a href="index.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>