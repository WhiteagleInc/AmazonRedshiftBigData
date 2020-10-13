copy users from 's3://mybucketredshift1986/tickit/allusers_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
delimiter '|' region 'us-west-1';

copy venue from 's3://mybucketredshift1986/tickit/venue_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
delimiter '|' region 'us-west-1';

copy category from 's3://mybucketredshift1986/tickit/category_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
delimiter '|' region 'us-west-1';

copy date from 's3://mybucketredshift1986/tickit/date2008_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
delimiter '|' region 'us-west-1';

copy event from 's3://mybucketredshift1986/tickit/allevents_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
delimiter '|' timeformat 'YYYY-MM-DD HH:MI:SS' region 'us-west-1';

copy listing from 's3://mybucketredshift1986/tickit/listings_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
delimiter '|' region 'us-west-1';

copy sales from 's3://mybucketredshift1986/tickit/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region 'us-west-1';

select * from event;