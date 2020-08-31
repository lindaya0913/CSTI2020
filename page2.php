<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSTI2020</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        .world_map_container {
            position: relative;
            max-width: 80vw;
        }
        .world_map {
            width: 100%;
            position: relative;
        }
        .area {
            position: absolute;
        }
        /* 點點 */
        .area_dot {
            height: 5px;
            width: 5px;
            position: absolute;
            background-color: rgb(211, 44, 44);
            z-index: 20;
            border-radius: 100%;
            transform: translateX(-50%);
            cursor: pointer;
        }
        /* 點點的訊息 */
        .area_info_container {
            position: absolute;
            /* border: 1px blue solid; */
            border-radius: 8px;
            transform: translate(-50%, -110%);
            opacity: 0;
            transition: ease-in-out;
            transition-duration: 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #141f2a;
            padding: 10px 20px;
            white-space: nowrap;
            visibility:hidden;
            z-index: 50;
        }
        /* 點點+點點的訊息 */
        .area_dot:hover + .area_info_container {
            opacity: 0.8;
            visibility: visible;
        }
        /* 點點的訊息內容 */
        .area_info {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 14px;
            color: rgb(255, 255, 255);
            line-height: 200%;
        }
        .button {
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
    <!-- Task標題與json檔案選擇 -->
    <?php 
        $url="";
        $url_json="";
        if($_GET['task']=="1"){
                $url="1";
                $url_json="outputs/com_rollic_tanglemaster3D.json";
                echo "<h1>Task 1 com_rollic_tanglemaster3D</h1>";
            }else if($_GET['task']=="2"){
                $url="2";
                $url_json="outputs/tw_com_quickscanner_invoice.json";
                echo "<h1>Task 2 tw_com_quickscanner_invoice</h1>";
            }else if($_GET['task']=="3"){
                $url="3";
                $url_json="outputs/com_tapped_drawrider.json";
                echo "<h1>Task 3 com_tapped_drawrider</h1>";
            }else if($_GET['task']=="4"){
                $url="4";
                $url_json="outputs/net_moftech_app.json";
                echo "<h1>Task 4 net_moftech_app</h1>";
            }else if($_GET['task']=="5"){
                $url="5";
                $url_json="outputs/homeworkout_homeworkouts_noequipment.json";
                echo "<h1>Task 5 homeworkout_homeworkouts_noequipment</h1>";
            }else if($_GET['task']=="6"){
                $url="6";
                $url_json="outputs/mbinc12_mb32.json";
                echo "<h1>Task 6 mbinc12_mb32</h1>";
            }else if($_GET['task']=="7"){
                $url="7";
                $url_json="outputs/com_cleanteam_oneboost.json";
                echo "<h1>Task 7 com_cleanteam_oneboost</h1>";
            }else if($_GET['task']=="8"){
                $url="8";
                $url_json="outputs/com_lightningstrikegames_fruitsurgeon.json";
                echo "<h1>Task 8 com_lightningstrikegames_fruitsurgeon</h1>";
            }else if($_GET['task']=="9"){
                $url="9";
                $url_json="outputs/com_tvbs_news_food_topnews_bestfood_restaurant_news_supertaste_news_ratings_news.json";
                echo "<h1>Task 9 com_tvbs_news_food_topnews_bestfood_restaurant_news_supertaste_news_ratings_news</h1>";
            }else if($_GET['task']=="10"){
                $url="10";
                $url_json="outputs/com_yj_xskd.json";
                echo "<h1>Task 10 com_yj_xskd</h1>";
        }
    ?> 

    <div class="btn-group">
        <button class="button" onclick="location.href='page1.php'">回目錄</button>
        <button class="button" onclick="location.href='page3.php?task=<?php echo $url ?>'">詳細資訊</button>
    </div>
    <div class="world_map_container">
        <img src="images/world_map4.png" class="world_map">
            <div class="area" style="
                        /*緯度:(0.447%/1度),經度:(0.293%/1度)*/
                        bottom: 42.5%;
                        left: 45%;
                        background-color: rgb(255, 0, 0);
                        ">
                    <div class="area_info_container">
                        <div class="area_info">
                        </div>
                    </div>
            </div>
    </div>

    <script>
        window.onload = function () {
            var json="<?php echo $url_json ?>";/*json文件url，本地的就寫本地的位置，如果是服務器的就寫服務器的路徑*/
            var request = new XMLHttpRequest();
            var information1=[];
            var i = 0;

            request.open("get", json);/*設置請求方法與路徑*/
            request.send(null);/*不發送數據到服務器*/
            request.onload = function () {/*XHR對象獲取到返回信息後執行*/
                if (request.status == 200) {/*返回狀態為200，即為數據獲取成功*/
                    var obj = jQuery.parseJSON(request.responseText);
                    
                    Object.entries(obj).forEach(element => {/*印出點點與點點的訊息內容*/
                        var area_template = `<div class="area"style="
                                                bottom: ${42.9 + element[1]['latitude'] * 0.44681}%; 
                                                left: ${element[1]['longitude'] < 0 ? 45.2 - Math.abs(element[1]['longitude']) * 0.29339 : 45.2 + element[1]['longitude'] * 0.29339 }%; 
                                                ">
                                                    <div class="area_dot">
                                                    </div>
                                                    <div class="area_info_container">
                                                        <div class="area_info">
                                                        ip: ${element[0]}<br>
                                                        connection_times: ${element[1]['connection_times']}<br>
                                                        malicious: ${element[1]['malicious']}<br>
                                                        country: ${element[1]['country']}<br>
                                                        </div>
                                                    </div>
                                            </div>`;
                        $('.world_map_container').append(area_template);
                    });
                }
            }
        }
    </script>   
</body>
</html>