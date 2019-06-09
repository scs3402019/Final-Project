<?php
	// Include config file
	require_once "config.php";

	//Define Variables
	//$Playlist = $Album = $Title = $Artist = $result = "";
	$Playlist_err = $Album_err = $Title_err = $Artist_err = "";

	$sName =  trim($_GET["Name"]);
	
	
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
				
				$param_Playlist = trim($_POST['$Playlist']);
				$param_Album = trim($_POST['Album']);
				$param_Artist = trim($_POST['Artist']);
				$param_Title = trim($_POST['Title']);
				
				
				if(mysqli_stmt_execute($stmt)){
					// Records created successfully. Redirect to landing page
					header("location: viewSongs.php");
					exit();
				} else{
					$Title_err = "Already in that playlist, please select a different one.";
				}
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
	<link rel="stylesheet" href="./style.css">
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
                    <p>Please select the playlist to add <b><?php echo $sName; ?></b> to.</p>
                    <form action="<?php echo htmlspecialchars(basename($_SERVER['REQUEST_URI'])); ?>" method="post">
                        <div class="form-group <?php echo (!empty($Playlist_err)) ? 'has-error' : ''; ?>">
                            <label>Playlist</label>
                            <?php
								$sql = "SELECT DISTINCT Playlist_name FROM Playlist";
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
								
								$sqlSong = "SELECT * FROM Song WHERE Name LIKE '" . $sName . "%'";
								if($resultSong = mysqli_query($link, $sqlSong)){
									if(mysqli_num_rows($resultSong) > 0){
										$rowSong = mysqli_fetch_array($resultSong);
										$Title = $rowSong['Name'];
										$Artist = $rowSong['Performer'];
										$sqlAlbum = "SELECT * FROM Album WHERE Writer LIKE '" . $rowSong['Performer'] . "%'";
										if($resultAlbum = mysqli_query($link, $sqlAlbum)){
											if(mysqli_num_rows($resultAlbum) > 0){
												$rowAlbum = mysqli_fetch_array($resultAlbum);
												$Album = $rowAlbum['Name'];
											}else {
												$Album = $Title . " Solo";
											}
										}
									}
								}
								mysqli_free_result($resultAlbum);
								mysqli_free_result($resultSong);
							?>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="viewSongs.php" class="btn btn-default">Cancel</a>
						<input type="hidden" name="Title" value="<?php echo $Title ?>">
						<input type="hidden" name="Album" value="<?php echo $Album ?>">
						<input type="hidden" name="Artist" value="<?php echo $Artist ?>">
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>