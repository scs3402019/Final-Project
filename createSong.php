<?php
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$Name = $Length = $Release_date = $Performer = "";
$Title_err = $Length_err = $Release_date_err = $Performer_err= "" ;

 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
	
    // Validate Title
    $Name = trim($_POST["Name"]);
	if(empty($Name)){
		$Title_err = "Please enter a Song Title.";
	}
	
    // Validate Length
    $Length = trim($_POST["Length"]);
    if(empty($Length)){
        $Length_err = "Please enter song length.";     
    }
	
	// Validate Release_Date
    $Release_date = trim($_POST["Release_date"]);
    if(empty($Release_date)){
        $Release_date_err = "Please enter a release date in format MM/DD/YYYY.";     		
	} 
	
	// Validate Performer
	$Performer = trim($_POST["Performer"]);
	if(empty($Performer)){
		$Performer_err = "Please enter a performer name.";
	}
	
    // Check input errors before inserting in database
    if(empty($Title_err) && empty($Length_err) && empty($Release_Date_err) && empty($Performer_err)){
        // Prepare an insert statement
        $sql = "INSERT INTO Song (Name, Length, Performer, Release_date) VALUES (?, ?, ?, ?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssss", $param_Name, $param_Length, $param_Performer, $param_Release_Date);
            
            // Set parameters
			$param_Title = $Title;
            $param_Length = $Length;
            $param_Release_Date = $Release_date;
            $param_Performer = $Performer;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Records created successfully. Redirect to landing page
                header("location: index.php");
                exit();
            } else{
				$Title_err = "Enter a unique Song.";
            }
        }
         
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
                    <div class="page-header">
                        <h2>Create Record</h2>
                    </div>
                    <p>Please fill this form and submit to add a Student record to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
						<div class="form-group <?php echo (!empty($Title_err)) ? 'has-error' : ''; ?>">
                            <label>Song Title</label>
                            <input type="text" name="Name" class="form-control" value="<?php echo $Name; ?>">
                            <span class="help-block"><?php echo $Title_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($Length_err)) ? 'has-error' : ''; ?>">
                            <label>Song Length</label>
                            <input type="text" name="Length" class="form-control" value="<?php echo $Length; ?>">
                            <span class="help-block"><?php echo $Length_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($Release_Date_err)) ? 'has-error' : ''; ?>">
                            <label>Release Date</label>
                            <input type="text" name="Release_Date" class="form-control" value="<?php echo $Release_Date; ?>">
                            <span class="help-block"><?php echo $Release_Date_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($Performer_err)) ? 'has-error' : ''; ?>">
                            <label>Performer</label>
                            <input type="text" name="Performer" class="form-control" value="<?php echo $Performer; ?>">
                            <span class="help-block"><?php echo $Performer_err;?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Add Song">
                        <a href="index.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>