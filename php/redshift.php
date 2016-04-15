<?php

// Connect to the database
    $dbh = new PDO('pgsql:dbname=analytics;user=sa;password=Valaskala1000;host=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com;port=5439');

    // Preg query
    $query=$dbh->prepare("select id from intake.logical_issues where publicationid = 157 and logicalissuename like '%Mar%2016%'");

    // Run query
    $query->execute();

    // Return results
    $results = $query->fetchAll(PDO::FETCH_ASSOC);

//$issueids = explode(",",$issueids);

?>
