<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
</head>

<body>
    <!-- table連結postgre的表-->
    <?php
        $host        = "127.0.0.1";
        $port        = "5432";
        $dbname      = "dbname=test";
        $credentials = "user=postgres password=test";
        
        $json = '';
        //$data = array();
        class User
        {
            public $id;
            public $company_id;
            public $package_id;
            public $permission_id;
            public $result;
            public $company_name;
            public $company_isad;
            public $package_name;
            public $constantvalue;
            public $level;
        }

        $db = pg_connect("$dbname $credentials");
        if(!$db){
            echo "Error : Unable to open database";
        } else {
            //echo "Opened database successfully<br/>";
        }

        $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,
                  P.name,PM.constantvalue,PM.level
                  from logs AS L,company AS C,package AS P,permissionlevel AS PM 
                  where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id" ;
        $result_set = pg_query($db, $query) 
        or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
        
        while ($row = pg_fetch_row($result_set))
        {
            
            // echo "<table>
            //         <tr>
            //             <td>$row[0]</td>
            //             <td>$row[1]</td>
            //             <td>$row[2]</td> 
            //             <td>$row[3]</td> 
            //             <td>$row[4]</td> 
            //             <td>$row[5]</td> 
            //             <td>$row[6]</td> 
            //             <td>$row[7]</td> 
            //             <td>$row[8]</td> 
            //             <td>$row[9]</td>
            //         </tr>
            //     </table>";
                $user = new User();
                $user->id = $row[0];
                $user->company_id = $row[1];
                $user->package_id = $row[2];
                $user->permission_id = $row[3];
                $user->result = $row[4];
                $user->company_name = $row[5];
                $user->company_isad = $row[6];
                $user->package_name = $row[7];
                $user->constantvalue = $row[8];
                $user->level = $row[9];
                $data[]=$user;
        }
        // 將sql資料轉成json格式
        $json = json_encode($data,true);
        //echo "{".'"user"'.":".$json."}";
        //echo "$json";

        //Free result_set
        pg_free_result($result_set);

        //Closing connection
        pg_close($db);
    ?>
</body>
</html>
