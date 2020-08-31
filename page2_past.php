<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>CSTI2020</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <style>
        .world_map_container {
            position: relative;
            max-width: 80vw;
        }
        .world_map{
            width: 100%;
            position: relative;
        }
        /* 點點 */
        .taiwan {
            height: 5px;
            width: 5px;
            position: absolute;
            /*緯度:(0.447%/1度),經度:(0.293%/1度)*/
            bottom: 42.5%;
            left: 45%;  
            background-color: red;
            z-index: 30;
            border-radius: 100%;
            transform: translateX(-50%);
            cursor: pointer;
        }
        /* 點點的訊息 */
        .taiwan_info_container{
            position: absolute;
            height: 90px;
            width: 160px;
            border: 1px blue solid;
            border-radius: 20px;
            transform: translate(-50%, -110%);
            opacity: 0;
            transition: ease-in-out;
            transition-duration: 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #1E90FF;
        }
        /* 點點+點點的訊息 */
        .taiwan:hover .taiwan_info_container{
            opacity: 1;
        }
        /* 點點的訊息內容 */
        .taiwan_info{
            /* text-align: center; */
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 14px;
        }
        .button{
            padding: 6px 16px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 12px;
            font-family: Microsoft JhengHei;
        }
        .btn-group .button:hover {
            background-color: #3e8e41;
        }
        body {
            font-family: Microsoft JhengHei;
            margin: 8px;
        }

    </style>

</head>

<body>
    <!-- Task標題 -->
    <?php 
        $url="";
        $url_json="";
        if($_GET['task']=="1"){
                $url="1";
                $url_json="./com_rollic_tanglemaster3D.json";
                echo "<h1>Task 1</h1>";
            }else if($_GET['task']=="2"){
                $url="2";
                $url_json="./tw_com_quickscanner_invoice.json";
                echo "<h1>Task 2</h1>";
            }else if($_GET['task']=="3"){
                $url="3";
                $url_json="./com_tapped_drawrider.json";
                echo "<h1>Task 3</h1>";
            }else if($_GET['task']=="4"){
                $url="4";
                $url_json="./net_moftech_app.json";
                echo "<h1>Task 4</h1>";
            }else if($_GET['task']=="5"){
                $url="5";
                $url_json="./homeworkout_homeworkouts_noequipment.json";
                echo "<h1>Task 5</h1>";
            }else if($_GET['task']=="6"){
                $url="6";
                $url_json="./mbinc12_mb32.json";
                echo "<h1>Task 6</h1>";
            }else if($_GET['task']=="7"){
                $url="7";
                $url_json="./com_cleanteam_oneboost.json";
                echo "<h1>Task 7</h1>";
            }else if($_GET['task']=="8"){
                $url="8";
                $url_json="./com_lightningstrikegames_fruitsurgeon.json";
                echo "<h1>Task 8</h1>";
            }else if($_GET['task']=="9"){
                $url="9";
                $url_json="./com_tvbs_news_food_topnews_bestfood_restaurant_news_supertaste_news_ratings_news.json";
                echo "<h1>Task 9</h1>";
            }else if($_GET['task']=="10"){
                $url="10";
                $url_json="./com_yj_xskd.json";
                echo "<h1>Task 10</h1>";
        }
    ?>

    <div class="btn-group">
        <button class="button" id="buttom1" onclick="location.href='page1.php'">回目錄</button>
        <button class="button" id="buttom2" onclick="location.href='page3.php?task=<?php echo $url ?>'">詳細資訊</button>
    </div>

    <div class="world_map_container">
        <img src="images/world_map4.png"  class="world_map" id="demo1_map">
        <div class="taiwan" id="demo1_loc"><!-- 點點 -->
            <div class="taiwan_info_container" id="demo1_con"><!-- 點點的訊息 -->
                <div class="taiwan_info" id="demo1"><!-- 點點的訊息內容 -->
                </div>
            </div>
        </div>
    </div>
    <p id="demo"></p>
    <script type="text/javascript">
        window.onload = function () {
            var url_json="<?php echo $url_json ?>";/*json文件url，本地的就写本地的位置，如果是服务器的就写服务器的路径*/
            console.log(url_json);

            var request = new XMLHttpRequest();
            var information1=[];
            var i = 0;
            var currentDiv1=null;

            request.open("get", url_json);/*设置请求方法与路径*/
            request.send(null);/*不发送数据到服务器*/
            request.onload = function () {/*XHR对象获取到返回信息后执行*/
                if (request.status == 200) {/*返回状态为200，即为数据获取成功*/
                    var json = JSON.parse(request.responseText);
                    for(key in json){
                        information1[i]={"ip":key,"connection_times":json[key].connection_times,"malicious":json[key].malicious,"country":json[key].country,"latitude":json[key].latitude,"longitude":json[key].longitude};
                        console.log(information1[i]);
                        i=i+1;
                    }

                    //印出所有陣列中的attribute於demo中
                    for (var k = 0; k < i; k ++) {
                        //document.getElementById("demo2").innerHTML = JSON.stringify("ip: "+ information1[k].ip +'<br>connection_times: '+ information1[k].connection_times +'<br>malicious: '+ information1[k].malicious +'<br>country: '+ information1[k].country);
                        document.getElementById("demo").innerHTML += 'ip: '+ information1[k].ip+'<br>connection_times: '+ information1[k].connection_times +'<br>malicious: '+ information1[k].malicious +'<br>country: '+ information1[k].country+'<br><br>';   
                    }

                    //demo1點點資訊
                    document.getElementById("demo1").innerHTML = 'ip: '+ information1[0].ip+'<br>connection_times: '+ information1[0].connection_times +'<br>malicious: '+ information1[0].malicious +'<br>country: '+ information1[0].country;
                    demo1_loc.style.bottom = 42.5 + information1[0].latitude * 0.447 + '%' //緯度
                    console.log("bottom ",demo1_loc.style.bottom);
                    if(information1[0].longitude<0){ //經度
                        demo1_loc.style.left = 45 - Math.abs(information1[0].longitude) * 0.293 + '%'
                    }else{
                        demo1_loc.style.left = 45 + information1[0].longitude * 0.293 + '%'
                    }
                    console.log("left ",demo1_loc.style.left);
                }
            }
        }
    </script>
    
</body>
</html>