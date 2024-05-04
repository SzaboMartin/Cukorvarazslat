<?php
declare(strict_types=1);

// Using namespaces aliasing
use Util\Util as Util;
use Database\Database as Database;

// Set environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to database
$db = new Database();

// Set query
$query ="DELETE FROM `shopping_cart`
					WHERE `user_id` = :user_id AND
								`product_id` = :product_id AND
								`quantity` = :quantity AND
								`price` = :price;";

// Execute query
$result = $db->execute($query, $args);

// Check not success
if (!$result['affectedRows']) {

	// Set error
	Util::setError('A kosár tartalmát nem sikerült módosítani!');
}

// Set query
$query ="SELECT `shopping_cart`.`product_id`,
								`products`.`name`,
								`products`.`product_type` AS `type`,
								`products_type`.`name` AS `type_name`,
								`products`.`img`,
								`shopping_cart`.`quantity`, 
								`shopping_cart`.`price`,
								`shopping_cart`.`quantity` * `shopping_cart`.`price` AS `total` 
					 FROM `shopping_cart`
		 INNER JOIN `products`
						 ON `products`.`id` = `shopping_cart`.`product_id`
		 INNER JOIN `products_type`
						 ON `products_type`.`type` = `products`.`product_type`
					WHERE `shopping_cart`.`user_id` = :id
			 ORDER BY `shopping_cart`.`product_id`;";

// Execute query
$result = $db->execute($query, array(
	"id" => $args["user_id"]
));

// Close connection
$db = null;

// Check not found
if (is_null($result)) $result = array();

// Set response
Util::setResponse($result);