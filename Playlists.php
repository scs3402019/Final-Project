<?php
	// Include config file
	require_once "config.php";

	//Define Variables
	$Playlist = "";
	$Playlist_err = "";

	$sName =  trim($_GET["Name"]);

	//Validate Playlist
	$Playlist = trim($_POST["Playlist"]);
	if (empty($Playlist)){
		$Playlist_err = "Please enter a Playlist name";
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add to Playlist</title>
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
                        <h2>Add to Playlist</h2>
                    </div>
                    <p>Please select the playlist to add <b><?php echo $sName; ?></b> to.</p>
                    <form action="<?php echo htmlspecialchars(basename($_SERVER['REQUEST_URI'])); ?>" method="post">
                        <div class="form-group <?php echo (!empty($Playlist_err)) ? 'has-error' : ''; ?>">
                            <label>Playlist</label>
                            <input type="text" name="Playlist" class="form-control" value="<?php echo $Playlist; ?>">
                            <span class="help-block"><?php echo $Playlist_err;?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="index.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>