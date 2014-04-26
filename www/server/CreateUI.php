<?php

function test($p0)
{
	echo (__FUNCTION__ . $p0) . "\n";
	echo xdebug_get_function_stack() . "\n";
}

class Temp {
public $m_V0;
public $m_V1;	

function __construct(){
$this->m_V0 = 4321;
$this->m_V1 = "Word";
}	

}

$t = new Temp();

$t->m_V0 = "Hello";
$t->m_V1 = 1234;
$t->m_V2 = new Temp();

var_dump($t);


