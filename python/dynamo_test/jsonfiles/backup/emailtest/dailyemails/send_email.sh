(
        echo "From: connor@shopadvisor.com";
        echo "To: connor@shopadvisor.com";
        echo "Subject: Daily Info";
        cat mailheader.txt *.html mailfooter.txt
) | /usr/sbin/sendmail -t
