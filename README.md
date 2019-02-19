# fivem-battlegrounds
FIVEM BATTLEGROUNDS - CONTRIBUTE

SQL Setup:
This gamemode uses only one SQL table.

```sql
CREATE TABLE `br_players` (
  `hex` varchar(45) NOT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `kills` int(11) NOT NULL DEFAULT '0',
  `victory` int(11) DEFAULT '0',
  PRIMARY KEY (`hex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
```

It currently supports https://github.com/GHMatti/ghmattimysql.
If you want to use another mysql resource you just have to modify 3 functions at the top of sv_init.lua
