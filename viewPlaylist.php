<?php
	// Include config file
	require_once "config.php";

	//Define Variables
	$Playlist = $Album = $Title = $Artist = $result = "";
	$Playlist_err = $Album_err = $Title_err = $Artist_err = "";

	$sName =  trim($_GET["Name"]);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Playlists</title>
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
		th{
			text-align: center;
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
                    <p>Please select the playlist to view.</p>
                    <form action="<?php echo htmlspecialchars(basename($_SERVER['REQUEST_URI'])); ?>" method="post">
                        <div class="form-group <?php echo (!empty($Playlist_err)) ? 'has-error' : ''; ?>">
                            <?php
								$sql = "SELECT DISTINCT Playlist_name FROM Playlist";
								if($result = mysqli_query($link, $sql)){
									if(mysqli_num_rows($result) > 0){
										echo "<table class='table table-bordered table-striped'>";
											echo "<thead>";
												echo "<tr>";
													echo "<th>Playlist</th>";
													echo "<th>View</th>";
												echo "</tr>";
											echo "</thead>";
											echo "<tbody>";
											while($row = mysqli_fetch_array($result)){
												echo "<tr>";
													echo "<td align=center>" . $row['Playlist_name'] . "</td>";
													echo "<td align=center>";
														echo "<a href='viewPlaylist.php?Name=". $row['Playlist_name'] ."' title='View' data-toggle='tooltip'><span class='glyphicon glyphicon-eye-open'></span></a>";
													echo "</td>";
												echo "</tr>";
											}
											echo "</tbody>";                            
										echo "</table>";
										// Free result set
										mysqli_free_result($result);
									} else{
										echo "<p class='lead'><em>No records were found.</em></p>";
									}
								} else{
									echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
								}
							?>
                        </div>
                    </form>
					<?php
                    if($sName != NULL){
						// Attempt select query execution
						$sql = "SELECT * FROM Playlist WHERE Playlist_name LIKE '" . $sName . "%'";
						if($result = mysqli_query($link, $sql)){
							if(mysqli_num_rows($result) > 1){
								echo "<table class='table table-bordered table-striped'>";
									echo "<thead>";
										echo "<tr>";
											echo "<th>Title</th>";
											echo "<th>Artist</th>";
											echo "<th>Album</th>";
										echo "</tr>";
									echo "</thead>";
									echo "<tbody>";
									while($row = mysqli_fetch_array($result)){
										if($row['Title'] != NULL){
											echo "<tr>";
												echo "<td align=center>" . $row['Title'] . "</td>";
												echo "<td align=center>" . $row['Artist'] . "</td>";
												echo "<td align=center>" . $row['Album'] . "</td>";
											echo "</tr>";
										}
									}
									echo "</tbody>";                            
								echo "</table>";
								// Free result set
								mysqli_free_result($result);
							} else{
								echo "<p class='lead'><em>No records were found.</em></p>";
							}
						} else{
							echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
						}
	 
						// Close connection
						mysqli_close($link);
					}
                    ?>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>
