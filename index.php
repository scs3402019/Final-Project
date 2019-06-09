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
                        <h2 class="pull-left"><img src="songbird.jfif" height=25px> Songbird</h2>
                    </div>
					Welcome to the simplest music streaming service this side of the Willamette! Pick a button below to get started!
					<br><br>
					<a href="createSong.php" class="btn btn-success">Add New Song</a>
					<a href="createPlaylist.php" class="btn btn-success">Create Playlist</a>
					<a href="viewPlaylist.php" class="btn btn-success">View Playlists</a>
					<a href="viewSongs.php" class="btn btn-success">View all Songs</a>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>