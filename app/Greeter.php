<?php
declare(strict_types=1);

namespace App;

class Greeter {
	public function greet(string $name = null):string {
		if($name) {
			return "Hello, $name!";
		}

		return "Hello!";
	}
}
