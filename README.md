# README
ポテパン サブ課題 インスタグラム開発
 
## 簡単な説明
 ポテパン サブ課題です。
 機能について補足があります。
 課題機能のFACEBOOKログインですが、DEVICEを利用でのログイン機能の必要性を課題終盤に
 気がつきましたので、DEVICE＋omniauth-facebookに関しましては別アプリケーションを作成し
 そちらで動作確認しました。
 また時間の関係上、test機能の作成をしておりません
 課題内容と反するコードで提出したことにお詫びします。
 
## ルビーバージョン
ruby-2.6.3


## インストール
 
$ git clone -b feture-branch https://github.com/murohamasho/potepan-sub.git　
$ bundle install --without production
$ rails db:migrate
$ rails db:seed

 


