<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSTI2020</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <style>
        h2 {
            background-color: black;
            color: white;
            text-align: center;
            margin-bottom: 5px;
        }
        body {
            font-family: Microsoft JhengHei;
            margin: 8px;
        }
        .button {
            padding: 6px 16px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 12px;
            margin-bottom: 5px;
            font-family: Microsoft JhengHei;
        }
        .btn-group .button:hover {
            background-color: #3e8e41;
        }
        table {
            border-collapse: collapse;
            border: 1px solid black;
            width:100%;
            word-wrap: break-word;
            table-layout: fixed;
            font-size: 16px;
        }
        table.dataTable td { /*表*/
            border: 1px solid #000;
            padding: 3px;
        }
        table.dataTable th { /*表頭*/
            border-collapse: collapse;
            border: 1px solid #000;
            padding: 3px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;  
        }
        table.dataTable tbody tr:nth-child(even) {background-color: #ddd;}
        .center {
            margin-left: auto;
            margin-right: auto;
        }
        table.dataTable tbody tr:hover {
            background-color: #ffa;
        }
        #table_id1_filter input {
            background-image: url("images/search.png");
            background-position: 10px 10px;
            background-repeat: no-repeat;
            background-size: 25px 25px;
            font-size: 16px;
            padding: 14px 20px 14px 40px;
            border: 1px solid #ddd;
            margin-bottom: 5px;
        }
        #table_id2_filter input {
            background-image: url("images/search.png");
            background-position: 10px 10px;
            background-repeat: no-repeat;
            background-size: 25px 25px;
            font-size: 16px;
            padding: 14px 20px 14px 40px;
            border: 1px solid #ddd;
            margin-bottom: 5px;
        }
        #table_id1_length {
            margin-top: 10px;
            cursor: pointer;
        }
        #table_id1_length select {
            width: 60px;
            height: 30px;
            font-size: 16px;
        }
        #table_id2_length {
            margin-top: 10px;
            cursor: pointer;
        }
        #table_id2_length select {
            width: 60px;
            height: 30px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <!-- Task標題與json檔案選擇 -->
    <?php 
        if($_GET['task']=="1"){
            $url_json="outputs/com_rollic_tanglemaster3D.json";
            echo "<h1>Task 1 com_rollic_tanglemaster3D</h1>";
        }else if($_GET['task']=="2"){
            $url_json="outputs/tw_com_quickscanner_invoice.json";
            echo "<h1>Task 2 tw_com_quickscanner_invoice</h1>";
        }else if($_GET['task']=="3"){
            $url_json="outputs/com_tapped_drawrider.json";
            echo "<h1>Task 3 com_tapped_drawrider</h1>";
        }else if($_GET['task']=="4"){
            $url_json="outputs/net_moftech_app.json";
            echo "<h1>Task 4 net_moftech_app</h1>";
        }else if($_GET['task']=="5"){
            $url_json="outputs/homeworkout_homeworkouts_noequipment.json";
            echo "<h1>Task 5 homeworkout_homeworkouts_noequipment</h1>";
        }else if($_GET['task']=="6"){
            $url_json="outputs/mbinc12_mb32.json";
            echo "<h1>Task 6 mbinc12_mb32</h1>";
        }else if($_GET['task']=="7"){
            $url_json="outputs/com_cleanteam_oneboost.json";
            echo "<h1>Task 7 com_cleanteam_oneboost</h1>";
        }else if($_GET['task']=="8"){
            $url_json="outputs/com_lightningstrikegames_fruitsurgeon.json";
            echo "<h1>Task 8 com_lightningstrikegames_fruitsurgeon</h1>";
        }else if($_GET['task']=="9"){
            $url_json="outputs/com_tvbs_news_food_topnews_bestfood_restaurant_news_supertaste_news_ratings_news.json";
            echo "<h1>Task 9 com_tvbs_news_food_topnews_bestfood_restaurant_news_supertaste_news_ratings_news</h1>";
        }else if($_GET['task']=="10"){
            $url_json="outputs/com_yj_xskd.json";
            echo "<h1>Task 10 com_yj_xskd</h1>";
        }
    ?>

    <div class="btn-group">
        <button class="button" onclick="location.href='page1.php'">回目錄</button>
    </div>

    <h2 id='overlay'>廣告權限</h2>
    <!-- Table1表頭 -->
    <table id="table_id1" class="center" style="width:100%">
        <thead>
            <tr>
                <th>權限風險</th>
                <th>廣告供應商</th>
                <th>權限名稱</th>
                <th>Access request</th>
                <!-- <th>company_isad</th> -->
            </tr>
        </thead>
        <tbody id="tbody_id1">
        </tbody>
    </table>

    <h2 id='overlay'>IP 來源</h2>
    <!-- Table2表頭 -->
    <table id="table_id2" class="center" style="width:100%">
        <thead>
            <tr>
                <th>IP</th>
                <th>port</th>
                <th>domain_name</th>
                <th>connection_times</th>
                <th>suspicious</th>
                <th>country</th>
                <th>city</th>
                <th>latitude</th>
                <th>longitude</th>
            </tr>
        </thead>
        <tbody id="tbody_id2">
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
            public $level;
            public $company_name;
            public $constantvalue;
            public $result;
            //public $company_isad;
        }

        $db = pg_connect("$dbname $credentials");
        if(!$db){
            echo "Error : Unable to open database";
        } else {
            //echo "Opened database successfully<br/>";
        }
        
        if($_GET['task']=="1"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 1";
            }else if($_GET['task']=="2"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 2";
            }else if($_GET['task']=="3"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 3";          
            }else if($_GET['task']=="4"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 4";
            }else if($_GET['task']=="5"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 5";
            }else if($_GET['task']=="6"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 6";
            }else if($_GET['task']=="7"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 7";
            }else if($_GET['task']=="8"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 8";
            }else if($_GET['task']=="9"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 9";
            }else if($_GET['task']=="10"){
                $query = "SELECT L.result,C.name,PM.constantvalue,PM.level from logs AS L,company AS C,package AS P,permissionlevel AS PM where L.company_id = C.id AND L.package_id = P.id AND L.permission_id = PM.id AND P.id = 10";
        }
        $result_set = pg_query($db, $query) 
        or die("Encountered an error when executing given sql statement: ". pg_last_error(). "<br/>");
        
        while ($row = pg_fetch_row($result_set))
        {
                $user = new User();
                $user->level = $row[0];
                $user->company_name = $row[1];
                $user->constantvalue = $row[2];
                $user->result = $row[3];
                //$user->company_isad = $row[4];
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

    <!-- Table2 json來源 & 連接DataTalbes-->
    <script>
        $(document).ready( function () {
            window.onload = function () {
                var json="<?php echo $url_json ?>";/*json文件url，本地的就寫本地的位置，如果是服務器的就寫服務器的路徑*/
                //console.log(json);
                var request = new XMLHttpRequest();
                var information1=[];
                var i = 0;

                request.open("get", json);/*設置請求方法與路徑*/
                request.send(null);/*不發送數據到服務器*/
                request.onload = function () {/*XHR對象獲取到返回信息後執行*/
                    if (request.status == 200) {/*返回狀態為200，即為數據獲取成功*/
                        var json = JSON.parse(request.responseText);//解析json字串為json物件形式
                        var trStr2 = '';//動態拼接table
                        for(key in json){
                            information1[i]={"ip":key,"HTTPS":json[key].HTTPS,"domain_name":json[key].domain_name,
                                            "connection_times":json[key].connection_times,"malicious":json[key].malicious,"country":json[key].country,
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
                            trStr2 += '<td>' + information1[l].city + '</td>';
                            trStr2 += '<td>' + information1[l].latitude + '</td>';
                            trStr2 += '<td>' + information1[l].longitude + '</td>';
                            trStr2 += '</tr>';  
                        } 
                        //document.getElementById("tbody_id2").innerHTML = trStr2;
                        $('#tbody_id2').append(trStr2);
                        $('#table_id2').DataTable({
                            rowCallback: function(row, data, index){
                                //suspicious
                                if(data[4] == 'true'){
                                    $(row).find('td:eq(4)').html('<i class="fas fa-check"></i>').css('color', 'Green');
                                }else if (data[4] == 'false'){
                                    $(row).find('td:eq(4)').html('<i class="fas fa-skull-crossbones"></i>').css({'color':'Red','font-size':'20px'});
                                }
                                //domain_name
                                if(data[2] == 'null'){
                                    $(row).find('td:eq(2)').html('-');
                                }
                                //city
                                if(data[6] == 'null'){
                                    $(row).find('td:eq(6)').html('-');
                                }
                            },
                        });
                    }
                }
            }
        });
    </script>

    <!-- Table1 json來源 & 連接DataTalbes-->
    <script>
        $(document).ready( function () {
            function function2 ()
            {
                var trStr1 = '';//動態拼接table
                for (var k = 0; k < <?php echo $i ?>; k ++) {//迴圈遍歷出json物件中的每一個資料並顯示在對應的td中
                    trStr1 += '<tr>';//拼接處規範的表格形式
                    trStr1 += '<td>' + <?php echo $json ?>[k].level + '</td>';//資料表的主鍵值
                    trStr1 += '<td>' + <?php echo $json ?>[k].company_name + '</td>';//對應陣列表的欄位值
                    trStr1 += '<td>' + <?php echo $json ?>[k].constantvalue + '</td>';
                    trStr1 += '<td>' + <?php echo $json ?>[k].result + '</td>';
                    // trStr1 += '<td>' + <?php echo $json ?>[k].company_isad + '</td>';
                    trStr1 += '</tr>';
                } 
                //document.getElementById("tbody_id1").innerHTML = trStr1;
                $('#tbody_id1').append(trStr1);
                $('#table_id1').DataTable({
                    "order": [ 3, 'asc' ],
                    rowCallback: function(row, data, index){
                        //權限風險
                        if(data[0] == '-1'){
                            $(row).find('td:eq(0)').html('<i class="fas fa-times"></i>').css('color', 'Red');
                        }else if (data[0] == '0'){
                            $(row).find('td:eq(0)').html('<i class="fas fa-check"></i>').css('color', 'Green');
                        }
                        //Access request
                        if(data[3] == 'dangerous'){
                            $(row).find('td:eq(3)').css('color', 'Red');
                        }else if (data[3] == 'normal'){
                            $(row).find('td:eq(3)').css('color', 'Green');
                        }else{
                            $(row).find('td:eq(3)').css('color', '#ffb133');
                        }
                    },
                });
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
        });
    </script>
</body>
</html>