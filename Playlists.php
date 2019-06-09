<?php
	// Include config file
	require_once "config.php";

	//Define Variables
	$Playlist = $Album = $Title = $Artist = $result = "";
	$Playlist_err = $Album_err = $Title_err = $Artist_err = "";

	$sName =  trim($_GET["Name"]);
	$sAlbum = trim($_GET["Album"]);
	
	
	if($_SERVER["REQUEST_METHOD"] == "POST"){
		//Validate Playlist
		$Playlist = trim($_POST["playlistAdd"]);
		if (empty($Playlist)){
			$Playlist_err = "Please enter a Playlist name";
		}
		// Check input errors before inserting in database
		if(empty($Playlist_name_err)){
			// Prepare an insert statement
			$sqlInsert = "INSERT INTO Playlist (Playlist_name, Artist, Album, Title) VALUES (?, ?, ?, ?)";
			
			if($stmt = mysqli_prepare($link, $sqlInsert)){
				mysqli_stmt_bind_param($stmt, "ssss", $param_Playlist, $param_Artist, $param_Album, $param_Title);
				
				$sqlSong = "SELECT * FROM Song WHERE Name LIKE '" . $sName . "%'";
				$resultSong = mysqli_query($link,$sqlSong);
				$rowSong = mysqli_fetch_array($resultSong);
				$param_Artist = $rowSong['Performer'];
				$param_Title = $rowSong['Name'];
				
				
				$param_Album = $sAlbum;
				
				if(mysqli_stmt_execute($stmt)){
					// Records created successfully. Redirect to landing page
					header("location: index.php");
					exit();
				} else{
					$Title_err = "Already in that playlist, please select a different one.";
				}
				mysqli_free_result($resultAlbum);
				mysqli_free_result($resultSong);
				mysqli_stmt_close($stmt);
			}
		}
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
                            <?php
								$sql = "SELECT * FROM Playlist";
								if($result = mysqli_query($link, $sql)){
									if(mysqli_num_rows($result) > 0){
										echo "<select name='playlistAdd'>";
										while ($row = mysqli_fetch_array($result)) {
											echo "<option value='" . $row['Playlist_name'] . "'>" . $row['Playlist_name'] . "</option>";
										}
										echo "</select>";
									}
								}
								mysqli_free_result($result);
								mysqli_close($link);
							?>
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
