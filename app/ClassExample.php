<?php
declare(strict_types=1);

namespace App;
require 'Greeter.php';
//use App\Greeter;

$greeter = new Greeter();
echo $greeter->greet('World');
