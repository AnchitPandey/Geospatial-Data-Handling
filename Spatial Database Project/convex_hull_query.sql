
/* Convex Hull */

SELECT ST_AsText(ST_ConvexHull(
	ST_Collect(
			ST_GeomFromText('MULTIPOINT(-118.282949 34.021869, -118.284002 34.021268, -118.288802 34.019629,
						   -118.28622 34.023981, -118.283726 34.02021, -118.282453 34.018725, -118.283861 34.019125,
						   -118.283316 34.020134, -118.282172 34.021682, -118.287094 34.022898,
						   -118.285538 34.020909, -118.284634 34.020433, -118.283158 34.020940, 
						   -118.286012 34.021128, -118.284989 34.021487)')
			)) );

/* Table creation */
create table points (gid int, location_name varchar, geom geometry);
insert into points values (1, 'Leavey', 'POINT(-118.282949 34.021869)'),
						  (2, 'VKC', 'POINT(-118.284002 34.021268)'),
						  (3, 'Science and Eng', 'POINT(-118.288802 34.019629)'),
						  (4, 'Wilson Dental', 'POINT(-118.28622 34.023981)'),
						  (5, 'Gerontology', 'POINT(-118.283726 34.02021)'),
						  (6, 'Fertitta', 'POINT(-118.282453 34.018725)'),
						  (7, 'Cammereli', 'POINT(-118.283861 34.019125)'),
						  (8, 'Literati', 'POINT(-118.283316 34.020134)'),
						  (9, 'Starbucks', 'POINT(-118.282172 34.021682)'),
						  (10, 'Little Galen', 'POINT(-118.287094 34.022898)'),
						  (11, 'EF Hutton', 'POINT(-118.285538 34.020909)'),
						  (12, 'Alumni Park', 'POINT(-118.284634 34.020433)'),
						  (13, 'McCarthy Quad', 'POINT(-118.283158 34.020940)'),
						  (14, 'Associates Pk', 'POINT(-118.286012 34.021128)'),
						  (15, 'Founders Park', 'POINT(-118.284989 34.021487)');

/* KNN */
SELECT g2.gid, g2.location_name, g2.geom FROM points as g1, points as g2   
WHERE g1.gid <> g2.gid and g1.gid = 10
ORDER BY ST_Distance(g1.geom,g2.geom)
LIMIT 4;