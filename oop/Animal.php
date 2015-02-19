<?php

/**
 * Created by PhpStorm.
 * User: volodya
 * Date: 19.02.15
 * Time: 11:52
 */
class Animal
{
    /**
     * @var string
     */
    private $name;

    /**
     * @param $name
     */
    public function __construct($name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }
}