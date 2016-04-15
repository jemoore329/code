#!/bin/bash

export PGHOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
export PGPORT=5439
export PGUSER=sa
export PGPASSWORD=Valaskala1000


#HOST=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com
#PORT=5439


#psql -t -A -F "," -h $HOST -p $PORT analytics sa  < daily_issueid.sql > daily_out.txt

#psql analytics < daily_issueid.sql  > daily_out.txt

rm -rf Output/ Queries/
mkdir Output/ Queries/

dir=AU1-Total-Total
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select sum(scan+neo+voyager+client) from insight.au1_total where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select sum(scan+neo+voyager+client) from insight.au1_total where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select sum(scan+neo+voyager+client) from insight.au1_total where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Total-Scan
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select scan from insight.au1_total where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select scan from insight.au1_total where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select scan from insight.au1_total where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Total-Neo
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select neo from insight.au1_total where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select neo from insight.au1_total where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select neo from insight.au1_total where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Total-Client
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select client from insight.au1_total where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select client from insight.au1_total where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select client from insight.au1_total where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Total-Voyager
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select voyager from insight.au1_total where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select voyager from insight.au1_total where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select voyager from insight.au1_total where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Client-Total
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(distinct userid) from event_log.clientinfoevent where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(distinct userid) from event_log.clientinfoevent where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(distinct userid) from event_log.clientinfoevent where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Client-iOS
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'iOS' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'iOS' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'iOS' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Client-Android
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'Android' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'Android' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'Android' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=AU1-Client-DesktopWeb
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'DesktopWeb' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'DesktopWeb' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(distinct userid) from event_log.clientinfoevent where clienttype = 'DesktopWeb' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=NewUsers-Total
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select sum(a.new_users+b.new_users+c.new_users) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 1 and b.created = current_date - 1 and c.created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select sum(a.new_users+b.new_users+c.new_users) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 2 and b.created = current_date - 2 and c.created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select sum(a.new_users+b.new_users+c.new_users) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 8 and b.created = current_date - 8 and c.created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=NewUsers-Scan
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select new_users from insight.new_ret_scan where created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select new_users from insight.new_ret_scan where created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select new_users from insight.new_ret_scan where created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=NewUsers-Neo
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select new_users from insight.new_ret_neo where created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select new_users from insight.new_ret_neo where created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select new_users from insight.new_ret_neo where created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=NewUsers-Voyager
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select new_users from insight.new_ret_pubs where created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select new_users from insight.new_ret_pubs where created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select new_users from insight.new_ret_pubs where created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=ReturningUsers-Total
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select sum(a.ret+b.ret+c.ret) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 1 and b.created = current_date - 1 and c.created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select sum(a.ret+b.ret+c.ret) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 2 and b.created = current_date - 2 and c.created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select sum(a.ret+b.ret+c.ret) from insight.new_ret_scan a, insight.new_ret_neo b, insight.new_ret_pubs c where a.created = current_date - 8 and b.created = current_date - 8 and c.created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=ReturningUsers-Scan
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select ret from insight.new_ret_scan where created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select ret from insight.new_ret_scan where created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select ret from insight.new_ret_scan where created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=ReturningUsers-Neo
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select ret from insight.new_ret_neo where created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select ret from insight.new_ret_neo where created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select ret from insight.new_ret_neo where created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=ReturningUsers-Voyager
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select ret from insight.new_ret_pubs where created = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select ret from insight.new_ret_pubs where created = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select ret from insight.new_ret_pubs where created = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=Total-Downloads
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "SELECT total FROM sa.manual_download_metrics where channel in ('iOS', 'Android') and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "SELECT total FROM sa.manual_download_metrics where channel in ('iOS', 'Android') and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "SELECT total FROM sa.manual_download_metrics where channel in ('iOS', 'Android') and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=iOS-Downloads
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "SELECT total FROM sa.manual_download_metrics where channel = 'iOS' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "SELECT total FROM sa.manual_download_metrics where channel = 'iOS' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "SELECT total FROM sa.manual_download_metrics where channel = 'iOS' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=Android-Downloads
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "SELECT total FROM sa.manual_download_metrics where channel = 'Android' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "SELECT total FROM sa.manual_download_metrics where channel = 'Android' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "SELECT total FROM sa.manual_download_metrics where channel = 'Android' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=SearchEvents
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(*) from event_log.searchevent where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(*) from event_log.searchevent where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(*) from event_log.searchevent where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=LoveItEvents
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(*) from event_log.loveitleaveitevent where itemstatus = 'loveit' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(*) from event_log.loveitleaveitevent where itemstatus = 'loveit' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(*) from event_log.loveitleaveitevent where itemstatus = 'loveit' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=LeaveItEvents
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(*) from event_log.loveitleaveitevent where itemstatus = 'leaveit' and date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(*) from event_log.loveitleaveitevent where itemstatus = 'leaveit' and date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(*) from event_log.loveitleaveitevent where itemstatus = 'leaveit' and date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=CollectionEvents
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(*) from event_log.collectionevent where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(*) from event_log.collectionevent where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(*) from event_log.collectionevent where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=PushNotificationEvents
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select count(*) from event_log.pushnotificationevent where date(created) = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select count(*) from event_log.pushnotificationevent where date(created) = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select count(*) from event_log.pushnotificationevent where date(created) = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt

dir=ActiveProfiledInterests
mkdir Queries/$dir Output/$dir
echo "$dir Today Query"
echo "select active from insight.profile_counts where date = current_date - 1" > Queries/$dir/Today.sql
psql analytics < Queries/$dir/Today.sql > Output/$dir/Today.txt

echo "$dir Yesterday Query"
echo "select active from insight.profile_counts where date = current_date - 2" > Queries/$dir/Yesterday.sql
psql analytics < Queries/$dir/Yesterday.sql > Output/$dir/Yesterday.txt

echo "$dir Week Query"
echo "select active from insight.profile_counts where date = current_date - 8" > Queries/$dir/Week.sql
psql analytics < Queries/$dir/Week.sql > Output/$dir/Week.txt




echo "Making Table"
python maketable.py
echo "Sending Email"
./send_email.sh
