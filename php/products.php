<?php
declare(strict_types=1);

// Using namespaces aliasing
use Util\Util as Util;
use Database\Database as Database;

// Set environment
require_once('../../common/php/environment.php');

// Connect to database
$db = new Database();

// Set query for product types
$query ="SELECT `type`, 
								`name` AS `typeName` 
					 FROM `products_type`
			 ORDER BY `order_by`;";

// Execute query
$result["types"] = $db->execute($query);

// Set query for products
$query ="SELECT `products`.`id`, 
								`products`.`name`, 
								`products`.`product_type` AS `type`,
								`products`.`img`, 
								`products`.`price` 
					 FROM `products`
		 INNER JOIN `products_type`
						 ON `products_type`.`type` = `products`.`product_type`
			 ORDER BY `products`.`product_type`, `products`.`id`;";

// Execute query
$result["data"] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);