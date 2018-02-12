<?php
$my_db = new mysqli("localhost",jspid,jsppass,user_excercise_plan); 
$res =mysqli_query($my_db,"SELECT * FROM user_excercise_plan");
 
$out = array();
while($data = mysqli_fetch_array($res)) {
    $out[] = array(
        'excercise_name' => $data['excercise_name'],
       
 
);
}
echo json_encode(array('success' => 1, 'result' => $out));
exit;
?>



