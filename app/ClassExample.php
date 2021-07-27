<?php
declare(strict_types=1);

namespace App;
required 'Greeter.php';

$greeter = new Greeter();
echo $greeter->greet('World');
