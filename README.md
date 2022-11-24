# life_snap

## アプリ概要

### 画面設計
・Figmaユーザフロー
<img width="730" alt="スクリーンショット 2022-11-15 17 43 41" src="https://user-images.githubusercontent.com/79580546/201872026-f2a7493e-9bf5-440e-ac53-c590e5f8298f.png">


### 状態管理：hooks_riverpod, state_notifier, freezed
### アーキテクチャ：MVVM + Repository

## 開発の始め方
 - リポジトリをクローンする
 - FVMを導入する
 
## Firebase構成ファイルについて
 - プロジェクトの設定からSDK設定用のファイルをダウンロードして、git cloneしたローカルプロジェクトのファイルの中に配置する

 - 理由としては、当該ファイルはpublicなリポジトリで見れないようにしており、gitigonoreしていて、個別対応が必要なため。

 - 設置しないとビルドエラーが起こる

 - android

 - ファイル名：google-services.json
   - 配置場所：android/app、/android/app/src/development、/android/app/src/production
   - 説明： devとprodからそれぞれfirebaseからDLする。prodは「/android/app/src/production」の方に置く。「android/app」に置くのはどちらでもよい。
iOS

 - ファイル名：GoogleService-Info.plist
   - 配置場所：ios/Runner
   - 説明：「Runner > Runner > Firebase 」にそれぞれ環境に合う様に「GoogleService-Info-Development.plist」と「GoogleService-Info-Production.plist」を配置する。Runner > Runner配下にも「GoogleService-Info.plist」は置く必要がある。Xcodeがちゃんと認識する様にインポートしないとダメです(ただ、フォルダに配置じゃ認識されません）
   
   
## GoogleMapのAPIキーについて
[こちらの記事を参考](https://codelabs.developers.google.com/codelabs/google-maps-in-flutter?hl=ja#3)に、Slackにピン留めしたAPIキーを入力する。

＊前もってpullでdevelopブランチを最新にし、作業ブランチを最新にしておくこと


### 開発環境
```
life_snap % fvm flutter --version
Flutter 3.3.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision eb6d86ee27 (2 weeks ago) • 2022-10-04 22:31:45 -0700
Engine • revision c08d7d5efc
Tools • Dart 2.18.2 • DevTools 2.15.0
```


## プロジェクト進行について

### 全体のタスク管理
- GitHub Projectsを用いて行う。カンバン方式

### Issueの立て方
New Issue をクリックすると 5 つのテンプレートがあります(salon_app の丸パクリ)  
それぞれ使い方や例が書いてあるのでそれにならって記載してください。  
質問なども Issue で立てていただけるとありがたいです

### ブランチ運用
Git Flow に沿って開発を行う(ツールは使わない)  
- 参考
  - [Git-flowって何？ - Qiita](https://qiita.com/KosukeSone/items/514dd24828b485c69a05)
  - [共同開発時のgithubの使い方（ブランチの作り方、マージの仕方、コンフリクトの解消方法）- vimeo(Flutter大学限)](https://vimeo.com/showcase/7431597/video/441969458)
- 基本的な流れ
  - main ブランチと develop ブランチが常に存在し、保護しておく
  - 機能を追加するときは develop ブランチから featureブランチを作成する
    - ブランチの名前は feature/#(issue 番号)\_わかりやすい名前
    - 作業が終わったら feature ブランチから develop ブランチへのPR(プルリクエスト)を作成する
    - PRを誰かがレビューし、LGTMが付けばMergeする
- 各ブランチについて
  - main
    - リリースされたアプリの状態と同期させる。直接の変更不可。PRからのマージのみ。
    - releaseブランチ or hotfixブランチからマージされ、バージョンが変更されるはずなので、mainへマージされた再はバージョンに合わせてタグを付与する
  - develop
    - 開発するためのブランチ。直接の変更不可。PRからのマージのみ。
    - developブランチでは常にビルドが通る状態にしておく。
  - feature
    - 機能追加の際に作成するブランチ。
    - developブランチから`feature/#{issue number}_{task name}`の命名規則でブランチを作成し、作業を行う。
    - PRはdevelopブランチをターゲットとする。
  - release
    - developブランチからmainブランチへ変更を取り込み、リリースを行う際に作成されるブランチ。
    - developブランチから`release/#{issue number}_{task name}`の命名規則でブランチを作成し、作業を行う。
    - PRはmainブランチをターゲットとする。
    - マージ後はリリース作業 & developブランチへもマージする。
  - hotfix
    - mainブランチで見つかったバグに対して修正したい場合に用いる
    - mainブランチから`hotfix/#{issue number}_{task name}`の命名規則でブランチを作成し、作業を行う。
    - PRはmainブランチをターゲットとする。
    - マージ後はリリース作業 & developブランチへもマージする。
- バージョニングについて
  - 一般的なセマンティックバージョニングを採用する
    - [セマンティック バージョニング 2.0.0 | Semantic Versioning](https://semver.org/lang/ja/)
  - 形式：`1.2.3` major.miner.patch
    - major
      - 大きな機能変更、後方互換性がない変更を行った際にインクリメントする
    - miner
      - 機能追加等の際にインクリメントする
    - patch
      - バグ修正などを行った場合にインクリメントする
      
