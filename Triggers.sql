CREATE TRIGGER clean_playlists
AFTER
DELETE
ON Users u
FOR EACH ROW
DELETE ON Playlists p
WHERE p.Created_by = u.Username;

CREATE TRIGGER clean_friends
AFTER
DELETE
ON Users u
FOR EACH ROW
DELETE ON User_friend f
WHERE f.Username = u.Username AND WHERE f.Friendname = u.Username;
