<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSTI2020</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        table {
            border-collapse: collapse;
            border: 1px solid black;
            width:100%;
            word-wrap: break-word;
            table-layout: fixed;
            font-size: 16px;
        }
        td { /*表*/
            border: 1px solid #000;
            padding: 3px;
        }
        th { /*表頭*/
            border-collapse: collapse;
            border: 1px solid #000;
            /* padding-top: 12px;
            padding-bottom: 12px; */
            padding: 3px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;  
        }
        tr:nth-child(even){background-color: #ddd;}
        tr:hover {background-color: #e8eb59;}
        .center {
            margin-left: auto;
            margin-right: auto;
        }
        .button {
            padding: 6px 16px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 12px;
        }
        .btn-group .button:hover {
            background-color: #3e8e41;
        }
        h2 {
            background-color: black;
            color: white;
            text-align: center
        }
        body {
            font-family: Microsoft JhengHei;
            margin: 8px;
        }
        .form-control {
            background-image: url("images/search.png");
            background-position: 10px 8px;
            background-repeat: no-repeat;
            background-size: 20px 20px;
            width: 100%;
            font-size: 16px;
            padding: 14px 20px 14px 40px;
            border: 1px solid #ddd;
            margin-bottom: 12px;
        }
    </style>
</head>

<body>
    <!-- Task標題 -->
    <?php 
        if($_GET['task']=="1"){
            $url_json="./com_rollic_tanglemaster3D.json";
            echo "<h1>Task 1</h1>";
        }else if($_GET['task']=="2"){
            $url_json="./tw_com_quickscanner_invoice.json";
            echo "<h1>Task 2</h1>";
        }else if($_GET['task']=="3"){
            $url_json="./com_tapped_drawrider.json";
            echo "<h1>Task 3</h1>";
        }else if($_GET['task']=="4"){
            $url_json="./net_moftech_app.json";
            echo "<h1>Task 4</h1>";
        }else if($_GET['task']=="5"){
            $url_json="./homeworkout_homeworkouts_noequipment.json";
            echo "<h1>Task 5</h1>";
        }else if($_GET['task']=="6"){
            $url_json="./mbinc12_mb32.json";
            echo "<h1>Task 6</h1>";
        }else if($_GET['task']=="7"){
            $url_json="./com_cleanteam_oneboost.json";
            echo "<h1>Task 7</h1>";
        }else if($_GET['task']=="8"){
            $url_json="./com_lightningstrikegames_fruitsurgeon.json";
            echo "<h1>Task 8</h1>";
        }else if($_GET['task']=="9"){
            $url_json="./com_tvbs_news_food_topnews_bestfood_restaurant_news_supertaste_news_ratings_news.json";
            echo "<h1>Task 9</h1>";
        }else if($_GET['task']=="10"){
            $url_json="./com_yj_xskd.json";
            echo "<h1>Task 10</h1>";
        }
    ?>

    <div class="btn-group">
        <button class="button" id="buttom3" onclick="location.href='page1.php'">回目錄</button>
        <!-- <button class="button" id="buttom1" onclick="showButtonEvent1()">廣告權限</button>
        <button class="button" id="buttom2" onclick="showButtonEvent2()">IP 來源</button> -->
    </div><br>

    <h2 id='overlay'>廣告權限</h2>
    <input class="form-control" id="myInput1" type="text" placeholder="Search.."> 
    <!-- Table1表頭 -->
    <table id="table_id1" class="center" style="width:100%">
        <thead>
            <tr>
                <th onclick="sortTable1(0)">id</th>
                <th onclick="sortTable1(1)">company_id</th>
                <th onclick="sortTable1(2)">package_id</th>
                <th onclick="sortTable1(3)">permission_id</th>
                <th onclick="sortTable1(4)">result</th>
                <th onclick="sortTable1(5)">company_name</th>
                <th onclick="sortTable1(6)">company_isad</th>
                <th onclick="sortTable1(7)">package_name</th>
                <th onclick="sortTable1(8)">constantvalue</th>
                <th onclick="sortTable1(9)">level</th>
            </tr>
        </thead>
        <tbody id="tbody_id1">
        </tbody>
    </table>

    <!-- Table1 postgresql來源 -->
    <?php
        $host        = "127.0.0.1";
        $port        = "5432";
        $dbname      = "dbname=test";
        $credentials = "user=postgres password=test";
        
        $json = '';
        $data = array();
        $query='';
        $i=0;

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
        
        if($_GET['task']=="1"){
            $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 1";
            }else if($_GET['task']=="2"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 2";
            }else if($_GET['task']=="3"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 3";          
            }else if($_GET['task']=="4"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 4";
            }else if($_GET['task']=="5"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 5";
            }else if($_GET['task']=="6"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 6";
            }else if($_GET['task']=="7"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 7";
            }else if($_GET['task']=="8"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 8";
            }else if($_GET['task']=="9"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 9";
            }else if($_GET['task']=="10"){
                $query = "SELECT L.id,L.company_id,L.package_id,L.permission_id,L.result,C.name,C.isad,P.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 10";
        }
        $result_set = pg_query($db, $query) 
        or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
        
        while ($row = pg_fetch_row($result_set))
        {
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
                $i+=1;
        }
        // 將sql資料轉成json格式
        $json = json_encode($data,true);
        //echo "$json";

        //Free result_set
        pg_free_result($result_set);

        //Closing connection
        pg_close($db);
    ?>

    <h2 id='overlay'>IP 來源</h2>
    <input class="form-control" id="myInput2" type="text" placeholder="Search.."> 
    <!-- Table2表頭 -->
    <table id="table_id2" class="center" style="width:100%">
        <thead>
            <tr>
                <th onclick="sortTable2(0)">IP</th>
                <th onclick="sortTable2(1)">HTTPS</th>
                <th onclick="sortTable2(2)">domain_name</th>
                <th onclick="sortTable2(3)">connection_times</th>
                <th onclick="sortTable2(4)">malicious</th>
                <th onclick="sortTable2(5)">country</th>
                <th onclick="sortTable2(6)">country_code</th>
                <th onclick="sortTable2(7)">city</th>
                <th onclick="sortTable2(8)">latitude</th>
                <th onclick="sortTable2(9)">longitude</th>
            </tr>
        </thead>
        <tbody id="tbody_id2">
        </tbody>
    </table>

    <!-- Table2 json來源 -->
    <script type="text/javascript">
        window.onload = function () {
            var url_json="<?php echo $url_json ?>";/*json文件url，本地的就写本地的位置，如果是服务器的就写服务器的路径*/
            console.log(url_json);

            var request = new XMLHttpRequest();
            var information1=[];
            var i = 0;

            request.open("get", url_json);/*设置请求方法与路径*/
            request.send(null);/*不发送数据到服务器*/
            request.onload = function () {/*XHR对象获取到返回信息后执行*/
                if (request.status == 200) {/*返回状态为200，即为数据获取成功*/
                    var json = JSON.parse(request.responseText);//解析json字串為json物件形式
                    var trStr2 = '';//動態拼接table
                    for(key in json){
                        information1[i]={"ip":key,"HTTPS":json[key].HTTPS,"domain_name":json[key].domain_name,"connection_times":json[key].connection_times,
                                            "malicious":json[key].malicious,"country":json[key].country,"country_code":json[key].country_code,
                                            "city":json[key].city,"latitude":json[key].latitude,"longitude":json[key].longitude};
                        i=i+1;
                    }
                    for (var l = 0; l < i; l ++) {//迴圈遍歷出json物件中的每一個資料並顯示在對應的td中
                        trStr2 += '<tr>';//拼接處規範的表格形式
                        trStr2 += '<td>' + information1[l].ip + '</td>';//資料表的主鍵值
                        trStr2 += '<td>' + information1[l].HTTPS + '</td>';//對應陣列表的欄位值
                        trStr2 += '<td>' + information1[l].domain_name + '</td>';
                        trStr2 += '<td>' + information1[l].connection_times + '</td>';
                        trStr2 += '<td>' + information1[l].malicious + '</td>';
                        trStr2 += '<td>' + information1[l].country + '</td>';
                        trStr2 += '<td>' + information1[l].country_code + '</td>';
                        trStr2 += '<td>' + information1[l].city + '</td>';
                        trStr2 += '<td>' + information1[l].latitude + '</td>';
                        trStr2 += '<td>' + information1[l].longitude + '</td>';
                        /*經典之處，要將主鍵對應的值以json的形式進行傳遞，才能在後臺使用*/
                        //trStr2 = "<td><a href='#'style='text-decoration:none' onclick='Delete(\""   obj[i].NVFID   "\")'>刪除</a><td>";
                        trStr2 += '</tr>';  
                    } 
                    document.getElementById("tbody_id2").innerHTML = trStr2;
                }
            }
        }
    </script>

    <!-- Table1 json來源 -->
    <script>
        function function2 ()
        {
            var trStr1 = '';//動態拼接table
            for (var k = 0; k < <?php echo $i ?>; k ++) {//迴圈遍歷出json物件中的每一個資料並顯示在對應的td中
                        trStr1 += '<tr>';//拼接處規範的表格形式
                        trStr1 += '<td>' + <?php echo $json ?>[k].id + '</td>';//資料表的主鍵值
                        trStr1 += '<td>' + <?php echo $json ?>[k].company_id + '</td>';//對應陣列表的欄位值
                        trStr1 += '<td>' + <?php echo $json ?>[k].package_id + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].permission_id + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].result + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].company_name + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].company_isad + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].package_name + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].constantvalue + '</td>';
                        trStr1 += '<td>' + <?php echo $json ?>[k].level + '</td>';
                        /*經典之處，要將主鍵對應的值以json的形式進行傳遞，才能在後臺使用*/
                        //trStr1 = "<td><a href='#'style='text-decoration:none' onclick='Delete(\""   obj[i].NVFID   "\")'>刪除</a><td>";
                        trStr1 += '</tr>';  
                    } 
                    document.getElementById("tbody_id1").innerHTML = trStr1;
        }

        function addLoadEvent(function2) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = function2;
                } else {
                window.onload = function() {
                    if (oldonload) {
                    oldonload();
                    }
                function2();
                }
            }
        }
        addLoadEvent(function2); 
    </script>
        
</body>
    <script>
        // 廣告權限
        function showButtonEvent1() {
            console.log("被按了1");
        }

        // IP來源
        function showButtonEvent2() {
            console.log("被按了2");
        }

        // Sort Table1
        function sortTable1(n) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("table_id1");
            switching = true;
            dir = "asc";
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount ++;
                    } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
            // var $sortable = $('th');
            // $sortable.on('click', function(){
            //     console.log("aaa")
            //     var $this = $(this);
            //     var asc = $this.hasClass('asc');
            //     var desc = $this.hasClass('desc');
            //     $sortable.removeClass('asc').removeClass('desc');
            //     if (desc || (!asc && !desc)) {
            //         $this.addClass('asc');
            //     } else {
            //         $this.addClass('desc');
            //     }
            
            // });
        }

        // Sort Table2
        function sortTable2(n) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("table_id2");
            switching = true;
            dir = "asc";
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount ++;
                    } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }

        // Search Table1
        $(document).ready(function(){
            $("#myInput1").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tbody_id1 tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

        // Search Table2
        $(document).ready(function(){
            $("#myInput2").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tbody_id2 tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</html>