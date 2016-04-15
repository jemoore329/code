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

$brands = json_decode(file_get_contents('brands.json'), true);

foreach ($brands as $brand) {

    $userid = $brand['userid']; 
    $info = $brand['affinity'];

    $json = json_encode([
        'userid' => $userid,
        'affinity' => $info
    ]);

    $params = [
        'TableName' => $tableName,
        'Item' => $marshaler->marshalJson($json)
    ];

    try {
        $result = $dynamodb->putItem($params);
        echo "Added brand: " . $brand['userid'] .  "\n";
    } catch (DynamoDbException $e) {
        echo "Unable to add brand:\n";
        echo $e->getMessage() . "\n";
        break;
    }

}

?>
