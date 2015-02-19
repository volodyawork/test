<?php
/**
 * Created by PhpStorm.
 * User: volodya
 * Date: 19.02.15
 * Time: 11:57
 */
include_once 'Animal.php';
include_once 'Cat.php';
$animal = new Animal('Brave eagle!');
print_r($animal->getName());

$cat = new Cat('garfield');
var_dump($cat->getName() === 'garfield'); // true
var_dump($cat->meow() === 'Cat garfield is saying meow'); // true
