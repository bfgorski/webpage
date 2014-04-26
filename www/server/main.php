<html><title>Response</title>

<?php

require_once('CreateUI.php');

ini_set('display_errors', 'On');
ini_set('xdebug.collect_params', '3');
ini_set('xdebug.dump_globals', 'On');
ini_set('html_errors', 'On');

xdebug_start_error_collection();

define("TEST_DEFINE", "My test define");

echo TEST_DEFINE . "\n";

define("TEST_DEFINE", "My other define");

echo TEST_DEFINE . "\n";

  echo "Hi, I'm a PHP script!";
  $name = $_POST['name'];
  $age = $_POST['age'];
  
$nameAgeHTML = <<<_NAMEAGE

  <bold> Name  $name  </bold>
  Age $age
  
_NAMEAGE;

xdebug_stop_error_collection();

$myArray = array(3,"test");
$myArray['s'] = "hello";

  echo $nameAgeHTML;
  var_dump($nameAgeHTML);
  
 
$errors = xdebug_get_collected_errors();
echo "Errors " . var_dump($errors) . "\n";
  
test($errors);
  
?>


</html>
