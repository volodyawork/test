<?php
/**
 * Created by PhpStorm.
 * User: volodya
 * Date: 19.02.15
 * Time: 12:00
 */
require_once 'Animal.php';

class Cat extends Animal
{
    public function meow()
    {
        return "Cat " . $this->getName() . " is saying meow";
    }
}