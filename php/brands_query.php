<?php
require '/Users/jemoore/vendor/autoload.php';

date_default_timezone_set('UTC');

use Aws\DynamoDb\Exception\DynamoDbException;
use Aws\DynamoDb\Marshaler;

$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',
    'region'   => 'us-west-2',
    'version'  => 'latest'
]);

$dynamodb = $sdk->createDynamoDb();
$marshaler = new Marshaler();

$tableName = 'Brand_Score';

$eav = $marshaler->marshalJson('
    {
        ":yyyy": 2014 
    }
');

$params = [
    'TableName' => $tableName,
    'KeyConditionExpression' => '#yr = :yyyy',
    'ExpressionAttributeNames'=> [ '#yr' => 'userid' ],
    'ExpressionAttributeValues'=> $eav
];

echo "Querying for userid 2014.\n";

try {
    $result = $dynamodb->query($params);

    echo "Query succeeded.\n";

    foreach ($result['Items'] as $shopper) {
//        echo $marshaler->unmarshalValue($shopper['userid']) . ': ' .
  //          print_r($marshaler->unmarshalValue($shopper['affinity'])['brand']); // . "\n";
    //        print_r($marshaler->unmarshalValue($shopper['affinity'])['brand']); // . "\n";
              print_r($shopper);
    }

} catch (DynamoDbException $e) {
    echo "Unable to query:\n";
    echo $e->getMessage() . "\n";
}

?>
