// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(function() {
var myScroll = new iScroll("#wrapper"); 
});

//instaデータ。ここから下はまだ修正前。かくにんしながら進める事（そもそも置き場所はこのファイルでいいのか）
<?php
$accessToken = '5410364579.33fd115.e45fd7bbbe2a4693a3dc394b688e6585';
$userid = 12ffrr; // ユーザーID
$count = 10; // 取得件数
  
$url = 'https://api.instagram.com/v1/users/' . $userid . '/media/recent?access_token=' . $accessToken . '&count=' . $count;
$jsonData = file_get_contents($url);
  
// jsonデータの整形・出力
$json = json_decode($jsonData, true);
echo json_encode($json["data"]);