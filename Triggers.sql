--After a User is removed from the database, their Friend list is deleted and they are removed from all their former friends friend lists

CREATE TRIGGER clean_friends
AFTER
DELETE
ON Users u
FOR EACH ROW
DELETE ON User_friend f
WHERE f.Username = u.Username AND WHERE f.Friendname = u.Username;

--After a User is removed from the database, their old playlists are deleted

CREATE TRIGGER clean_playlists
AFTER
DELETE
ON Users u
FOR EACH ROW
DELETE ON Playlists p
WHERE p.Created_by = u.Username;

