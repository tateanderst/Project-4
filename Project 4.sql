use disk_inventory


--3
select DiskName,  Reldate, fname, lname
from Disk join DiskHasArtist on Disk.DiskId = DiskHasArtist.DiskID
join artist on Artist.ArtistId = DiskHasArtist.ArtistID
order by lname, fname, DiskName
go


--4
Create View View_Individual_artists as
	select artistid, fname, lname
	from Artist;
	go

	select * from View_Individual_artists
	go


--5
select diskName, RelDate, groupName
from View_Individual_artists join Artist on Artist.ArtistId = View_Individual_artists.ArtistId
join DiskHasArtist on DiskHasArtist.ArtistID = View_Individual_artists.artistid
join disk on Disk.DiskID = DiskHasArtist.DiskID
order by groupName, DiskName
go


--6
select fname, lname, diskname
from borrower join DiskHasBorrower on Borrower.brrowerID = DiskHasBorrower.brrowerID
join disk on DiskHasBorrower.DiskID = disk.diskid
order by lname
go

--7
select disk.DiskID, diskname, count(disk.DiskID) as TimesBorrowed
from borrower join DiskHasBorrower on Borrower.brrowerID = DiskHasBorrower.brrowerID
join disk on DiskHasBorrower.DiskID = disk.diskid
group by Disk.DiskID, DiskName
order by DiskID
go


--8
select diskname, checkoutdate, returndate, lname
from DiskHasBorrower join disk on DiskHasBorrower.DiskID = disk.DiskID
join Borrower on DiskHasBorrower.brrowerID = Borrower.brrowerID
where returnDate is null
order by DiskName
go
