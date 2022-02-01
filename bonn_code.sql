--CREATE EXTENSION postgis;

--ALTER TABLE gbif_datenbank ADD COLUMN bezirk varchar(30);
--ALTER TABLE gbif_datenbank ADD COLUMN ortsteil varchar(40);
--ALTER TABLE gbif_datenbank ADD COLUMN landnutzcorine varchar(80);

/*UPDATE gbif_datenbank SET bezirk = bezirk_bez FROM stadtbezirk 
WHERE ST_Intersects(gbif_datenbank.geom, stadtbezirk.geom);*/

/*UPDATE gbif_datenbank 
SET ortsteil = ( select ortsteile.ortsteil FROM ortsteile WHERE ST_Intersects(gbif_datenbank.geom, ortsteile.geom)), 
    landnutzcorine = (select klassennam FROM landnutzcor WHERE ST_Intersects(gbif_datenbank.geom, landnutzcor.geom));*/

/*SELECT gbif_datenbank.ortsteil AS Ortsteil, COUNT(DISTINCT gbif_datenbank.scientific) as Arten
FROM gbif_datenbank   GROUP BY Ortsteil ORDER BY Arten DESC;*/

/*SELECT gbif_datenbank.ortsteil AS Ortsteil, COUNT(DISTINCT gbif_datenbank.scientific) as Arten
FROM gbif_datenbank WHERE kingdom = 'Plantae'  GROUP BY Ortsteil ORDER BY Arten DESC;*/

/*SELECT gbif_datenbank.ortsteil AS Ortsteil, COUNT(DISTINCT gbif_datenbank.scientific) as Arten
FROM gbif_datenbank WHERE class = 'Aves' GROUP BY Ortsteil ORDER BY Arten DESC;*/

/*SELECT gbif_datenbank.ortsteil AS Ortsteil, COUNT(DISTINCT gbif_datenbank.scientific) as Arten
FROM gbif_datenbank WHERE class = 'Mammalia'  GROUP BY Ortsteil ORDER BY Arten DESC;*/

/*SELECT gbif_datenbank.ortsteil AS Ortsteil, COUNT(DISTINCT gbif_datenbank.scientific) as Arten
FROM gbif_datenbank WHERE class = 'Insecta'  GROUP BY Ortsteil ORDER BY Arten DESC;*/

ALTER TABLE landnutzungbonn 
ADD COLUMN bezirk varchar(30),
ADD COLUMN ortsteil varchar(40),
ADD COLUMN flachehk double precision;

UPDATE landnutzungbonn SET bezirk = bezirk_bez FROM stadtbezirk
WHERE ST_Intersects(landnutzungbonn.wkb_geometry, stadtbezirk.geom);

UPDATE landnutzungbonn SET ortsteil = ortsteile.ortsteil FROM ortsteile
WHERE ST_Intersects(landnutzungbonn.wkb_geometry, ortsteile.geom);

UPDATE landnutzungbonn SET flachehk = ST_Area(wkb_geometry)/10000;
				


	






