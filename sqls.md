# SQLs

## select and join tables
```
SELECT 
	table1.col1, table1.col2,
	table2.col3 AS newInfo,
	alias.col4

FROM (table1
      LEFT JOIN table2 on (table1.col1=table2.col11))
     LEFT JOIN table3 alias on (table1.col2=alias.col12))

ORDER BY table1.col1;
```

## copying and updating
```
SELECT * INTO tmpTable FROM srcTbl DidVariants WHERE col1=1;
UPDATE tmpTable SET col2=15;
INSERT INTO srcTbl SELECT * FROM tmpTable;
DROP TABLE tmpTable;
```