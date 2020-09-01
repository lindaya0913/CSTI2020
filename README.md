# CSTI2020
* 視覺化呈現 APP 網路行為，包含廣告權限和IP來源
* 使用 PHP + HTML 製作
* 使用 XAMPP 來開啟 php 即時測試
* 連接 Postgre tables
* 使用 jQuery 插件 DataTables
* 詳情參閱 HackMD: https://hackmd.io/2nPTZKILQvm-V7LFL-Qt8Q

## Page1
* 顯示 Task1-10 按鈕，跳轉到不同的 package_name
* 點選 Task 跳轉到 Page2

## Page2
* 根據 JSON 內容顯示 attributes
* 將每一點視覺化呈現於地圖上
* 根據 longitude & latitude 使用 css 顯示在地圖上
* 根據 suspicious 的 true or false 使顏色顯示為綠或紅
* 根據 connection_times 的多寡做 dot 大小的區隔
* 點選詳細資訊跳轉到 Page3

## Page3
### Table1(上)
* 連接 Postgre 將五個 tables select 
* 轉成 JSON 格式以動態拼接 table
* 根據 package.id 當 key value
* 顯示 logs.result, company.name, permissionlevel.constantvalue, permissionlevel.level
* 以 Access request 當 order
* 權限風險的 -1 & 0 改成叉叉與打勾
* Access request 的 dangerous, normal & others 字色為 red, green & yellow 

### Table2(下)
* 根據 Task 的 package_name 連接不同的 JSON
* 動態拼接 table
* 以 suspicious 當 order
* suspicious 的 false & true 改成骷髏頭與打勾