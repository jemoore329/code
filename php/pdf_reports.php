<?php
// USAGE example: php generate_pdf_reports.php Mar 2016 2942 157
// USAGE example: php generate_pdf_reports.php month year master_id publicationid



// Connect to the database
    $dbh = new PDO('pgsql:dbname=analytics;user=sa;password=Valaskala1000;host=analytics.cqwyvac0cfcc.us-east-1.redshift.amazonaws.com;port=5439');
    
    // Preg query
    $query=$dbh->prepare("select id from intake.logical_issues where publicationid = $argv[4] and logicalissuename like '%$argv[1]%$argv[2]%'");
    
    // Run query
    $query->execute();
    
    // Return results
    $results = $query->fetchAll(PDO::FETCH_ASSOC);
    // print_r($results);
    
    $issueids = array();
    foreach ($results as $result) {
      $issueids[] = $result['id'];
    }
    
    //print_r($issueids);
    //  print implode(",",$issueids);
    $output = implode(",",$issueids);
    //print $output;
    
    print "php data.php -i=\"$output\" -mi=\"$argv[3]\"";
    //system("php data.php -i=\"$output\" -mi=\"$argv[3]\"");
    //print "\n";
    //print "DONE";
?>
