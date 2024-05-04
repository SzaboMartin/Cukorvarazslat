<?php
declare(strict_types=1);

$_GET['data'] = '{"order":{"user_id":15,"card_number":"1111111111111111","expiration":"2024/05","cvv":"123","total":49984},"items":[{"product_id":2,"quantity":12,"price":2999},{"product_id":7,"quantity":3,"price":3999},{"product_id":24,"quantity":1,"price":1999}]}';

require_once('./set_order.php');