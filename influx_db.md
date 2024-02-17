# influxDB
 
## queries
getting started
```sh
SHOW DATABASES
...
use <db_name>
```

simple query:
```sh
select <value> from <measurement> where "<field>"=~/<value>/ 
```

data operations and filters:
```sh
select first(*) from <measurement> where "<field>"='1'
select last(*)  from <measurement> where "<field>"='1'
select count(*) from <measurement> where "<field>"='1' and time > <unix_time>s
```

filtering for tags:
```sh
select * from <measurement> where "<tag_key>"='<tag_value>'
select * from <measurement> where "<tag_key>"='[\'string\ ']'
```

grouping:
```sh
select * from <measurement> where time > <time1>s and time < <time2>s group by <field>
```

### arithmetical operation on column value
```sh
select * from <measurement> where <field> > <value>
select <field> from <measurement> where (<field> - 10) > <value>  (arbitrary arithmetical operation)
```

### filter measurement for time
```sh
select \* from <measurement> where time> <time1> and time< <time2>
select \* from <measurement> where time> <time1> and time< <time2> group by time(1m)
```
> <time> in nanoseconds or like "1621245286s" if in seconds


### casting of variables
```sh
select <field>::<data_type> from <measurement>
```

### get latest entry in measurement
```sh
select \* from <measurement> order by time desc limit 1
```

## export to CSV
```sh
influx -database '<db_name>' -execute "SELECT * FROM <measurement> WHERE time>"$start"s and time<"$stop"s and \"<tag_key>\"='<tag_value>'" -format csv  > export.csv
```
