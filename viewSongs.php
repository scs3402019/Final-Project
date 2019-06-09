<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>
	<script src="style.css"></script>
    <style type="text/css">
        .wrapper{
            width: 650px;
            margin: 0 auto;
        }
        .page-header h2{
            margin-top: 0;
        }
        table tr td:last-child a{
            margin-right: 15px;
        }
		th {
			text-align: center;
		}
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
    </script>
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
					<a href="createSong.php" class="btn btn-success pull-right">Add Song</a><br><br>
                    <?php
                    // Include config file
                    require_once "config.php";
                    
                    // Attempt select query execution
                    $sql = "SELECT * FROM Song";
                    if($result = mysqli_query($link, $sql)){
                        if(mysqli_num_rows($result) > 0){
                            echo "<table class='table table-bordered table-striped'>";
                                echo "<thead>";
                                    echo "<tr>";
                                        echo "<th>Title</th>";
                                        echo "<th>Length</th>";
                                        echo "<th>Artist</th>";
										echo "<th>Album</th>";
										echo "<th>Add to Playlist</th>";
                                    echo "</tr>";
                                echo "</thead>";
                                echo "<tbody>";
                                while($row = mysqli_fetch_array($result)){
                                    echo "<tr>";
                                        echo "<td align=center>" . $row['Name'] . "</td>";
                                        echo "<td align=center>" . $row['Length'] . "</td>";
                                        echo "<td align=center>" . $row['Performer'] . "</td>";
										$sqlAlbum = "SELECT * FROM Album WHERE Writer LIKE '" . $row['Performer']. "%'";
										$resultAlbum = mysqli_query($link, $sqlAlbum);
										$rowAlbum = mysqli_fetch_array($resultAlbum);
										if(mysqli_num_rows($resultAlbum) > 0) {
											echo "<td align=center>" . $rowAlbum['Name'] . "</td>";
										} else {
											echo "<td align=center>" . $row['Name'] . " Solo</td>";
										}
										mysqli_free_result($rowAlbum);
										echo "<td align=center>";
											echo "<a href='Playlists.php?Name=" . $row['Name'] . "' title='Add to Playlist' data-toggle='tooltip'><span class='glyphicon glyphicon-plus-sign'></span></a>";
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
 
                    // Close connection
                    mysqli_close($link);
                    ?>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>