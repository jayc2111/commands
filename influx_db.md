# influxDB
 
## queries
```sh
select*from sensing_data where time > 1624952535s and "roomName"=~/gang/
select count(*) from sensing_data where "testerId"='1' group by roomName
select first(*) from sensing_data where "testerId"='1'
select last(*) from sensing_data where "testerId"='1'
```

```sh
use wifi_sensing
select * from sensing_data where time>1624831200s and time<1624874400s and "testerId"='101' and "roomName"='[\'schlafzimmer\']' group by roomName
select * from verification_data where time>1624831200s and time<1624874400s and "testerId"='101' and "roomName"='[\'schlafzimmer\']'
```

### filter measurement for field values
```sh
select \♣ from <measurement> where <field> > <value>
select <field> from <measurement> where (<field>-10) > <value>  (arbitrary arithmetical operation)
```

### filter measurement for time
```sh
select \* from <measurement> where time > <time>
select \* from <measurement> where time> <time1> and time< <time2>
select \* from <measurement> where time> <time1> and time< <time2> group by time(1m)
```
<time> in nanoseconds or like "1621245286s" if in seconds


### filter measurement for tags
```sh
select \* from <measurement> where "<tag_key>"='<tag_value>'
```
### casting of variables
```sh
select <field>::<data_type> from <measurement>
```
### get latest entry in measurement
```sh
select \* from <measurement> order by time desc limit 1
```
### count current number of datapoints
```sh
select count(\*) from <measurement>
```

## export command
```sh
influx -database 'wifi_sensing' -execute "SELECT * FROM sensing_data WHERE time>"$start"s and time<"$stop"s and \"testerId\"='1'" -format csv  > tester1_sensing.csv
influx -database 'wifi_sensing' -execute "SELECT * FROM manual_data" -format csv  > manual_export.csv
influx -database 'wifi_sensing' -execute "SELECT * FROM manual_data where \"provider\"='origin_wireless'" -format csv  > export_origin.csv
influx -database 'wifi_sensing' -execute "select count(*) from sensing_data where "provider"='cognitive' and time>1629410400s and time<1630015200s  group by testerId"  -format csv  > all_cognitive.csv
influx -database 'wifi_sensing' -execute "select count(*) from sensing_data where "provider"='cognitive' and time>1629410400s and time<1630015200s and "roomName"='[\'NO_LOC\']' group by testerId"  -format csv  > no_loc_cognitive.csv
```

## shortcuts
```
select sum(*) from activity_data where ("testerId"='56' or "testerId"='63' or "testerId"='69' or "testerId"='70' or "testerId"='75' or "testerId"='83' or "testerId"='84') and "provider"='withings' group by testerId
select sum(*) from activity_data where "testerId"='70' and "provider"='withings' group by time(1d)
select * from sleep_data where "testerId"='83' and "provider"='withings'
select * from sleep_data where time<1636650000s and ("testerId"='54' or "testerId"='81')
```

```
select * from sleep_data where "testerId"='59' and time>=1635285600s
select * from activity_data where "testerId"='59' and time>=1635285600s

insert sleep_data,provider=origin_wireless,testerId=59 timeInBed=0i,timeSleep=0i,countWake=0i 1635285600000000000
insert activity_data,provider=origin_wireless,testerId=59 steps=0i,activeSec=0i 1635285600000000000

delete from sleep_data where "testerId"='59' and time=1635285600s
delete from activity_data where "testerId"='59' and time=1635285600s
```

 