import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //テーマをグーグルフォントに設定
          textTheme: GoogleFonts.trainOneTextTheme(
              //ここで設定することによって全ての文字のフォントを統一できる(delagothiconeを設定)
              Theme.of(context).textTheme)),
      home: lifesnap_login(), //lifesnap_loginを最初のページに指定
    );
  }
}

class lifesnap_login extends StatefulWidget {
  //とりあえずstatefulWidgetでUIを作成
  const lifesnap_login({super.key});

  @override
  State<lifesnap_login> createState() => _lifesnap_loginState();
}

class _lifesnap_loginState extends State<lifesnap_login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //端末ごとの画面サイズを取得
    final width = size.width; //スマホの横幅の長さを定数に格納
    final height = size.height; //スマホの縦幅の長さを定数に格納
    return Scaffold(
      body: GestureDetector(
        //GestureDetectorを使い、キーボードを表示した際に画面外タップで閉じれるようにする。
        behavior: HitTestBehavior.opaque, //タッチ動作を検知する。
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          //Columnをセンターに置く
          child: SingleChildScrollView(
            //SingleChildScrollViewをしないとキーボードを表示した際にレイアウトが崩れてエラーが起きる。キーボードを表示した際でも画面を下にスクロールできるようにする。
            child: Column(
              //各パーツをColumnに配置
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //パーツのスペースを均等にする
              children: [
                loginContainer(), //下で作ったlogin画面のContainerを（ここでは画面サイズの高さは端末の4分の２、６分の４で可変にする。）
                TextButton(
                    //会員登録画面への切り替え用Text Buttonを配置。
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white)), //文字を白色にする。
                    onPressed: () {
                      changeContainer =
                          !changeContainer; //ボタンを押すことにより,bool型　changeContainer変数を逆にする。
                      setState(() {});
                    },
                    child: changeContainer
                        ? Text('会員登録はこちら')
                        : Text(
                            '戻る')) //changeContainerがtrueなら会員登録はこちら、falseなら戻るにする。三項演算子を使用
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey, //scaffoldの背景色を変更
    );
  }
}
//********************************************************************************

bool _isObscure = true; //グローバル変数で真偽値を定義。後でpasswordを隠すのに使う
bool changeContainer = true; //グローバル変数で真偽値を定義。containerのログイン用、会員登録用に変更するのに使う。

//********************************************************************************
class loginContainer extends StatefulWidget {
  //ログイン用のcontainerを作成。中身は別に作り、ここでは枠だけ。
  const loginContainer({super.key});

  @override
  State<loginContainer> createState() => _loginContainerState();
}

class _loginContainerState extends State<loginContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //上記を再度定義(効率が悪い。グローバルにしたいけどcontextの意味がいまいちわからない、、)
    final width = size.width; //上述
    final height = size.height; //上述
    return Padding(
        padding: const EdgeInsets.only(
            left: 30,
            right:
                30), //logincontainerの左と右に40の余白を開ける(端末によってここの余白はそこまで変化に富まなくていいので40で固定。widthは使わない)
        child: AnimatedContainer(
            //containerにアニメーションを付加するため、animatedContainerを使用
            height: changeContainer
                ? height / 4 * 2
                : height /
                    6 *
                    4, //changeContainerの高さをchangeContainerのbool値により可変にする。
            decoration: BoxDecoration(
                //Containerの外枠をデコレーション
                border: Border.all(color: Colors.black), //containerの外枠を黒色にする
                borderRadius: BorderRadius.circular(20), //containerの角を丸くする
                color: Colors.white, //containerの背景色を白色にする
                boxShadow: [
                  //影を作る
                  BoxShadow(
                    color: Colors.black, //影の色を黒色にする
                    spreadRadius: 5, //影の広がり具合を設定
                    blurRadius: 6, //影のかすみ具合を設定
                    offset: Offset(10, 1), //影を左から光を当てたようにする
                  )
                ]),
            curve: Curves.bounceOut, //アニメーションの種類を指定。ここでは跳ねるようなアニメーション
            duration: Duration(milliseconds: 1000), //どれくらいの速度でアニメーションが起こるのかを設定
            child: changeContainer
                ? lifeSnap_login_Text()
                : member_registration_Text() //changeContainerのbool値でContainerの中身のWidgetを指定。
            ));
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
//ログイン用のWidget群の作成
class lifeSnap_login_Text extends StatefulWidget {
  const lifeSnap_login_Text({super.key});

  @override
  State<lifeSnap_login_Text> createState() => _lifeSnap_login_TextState();
}

class _lifeSnap_login_TextState extends State<lifeSnap_login_Text> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          //Widget群をColumnにする。
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, //widgetの間隔を均等にする。(後で追加の項目がある場合があるのでSized Boxは使わない。)
          children: [
            Text(
              'LifeSnap', //題名をLifeSnapに設定
              style: TextStyle(fontSize: 50), //LifeSnapのテキストを表示(フォントをどうするか？)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), //TextFormFieldの上下左右に余白を入れる
              child: TextFormField(
                decoration: const InputDecoration(
                  //TextFormFieldの形を変える
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10), //TextFormFieldの高さを設定
                  hintText: 'MAIL ADDRESS', //TextFormFieldのアシストテキストの設定
                  prefixIcon: Icon(
                    Icons.mail, //左端アイコンの指定
                  ),
                  border: OutlineInputBorder(), //TextFormFieldの外枠を作る
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), //上述
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintText: 'PASSWORD',
                  prefixIcon: Icon(
                    Icons.key,
                  ),
                  suffixIcon: IconButton(
                    //パスワード右端のアイコンをタップで変える。三項演算子を用いる
                    icon: Icon(_isObscure
                        ? Icons
                            .visibility_off //真偽値　? trueの時のアイコン　: falseの時のアイコン
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {});
                      _isObscure = !_isObscure; //タップで真偽値を逆にする。
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: _isObscure, //textをtrueとfalseで見える見えないを切り替える。
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      //ダイアログを表示させる。本来であればメールアドレスとパスワードが一致すれば画面遷移し、ログイン状態をキープできるようにする。
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              //ダイアログの外枠を丸くする
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          title: const Text(
                              'メールアドレスとパスワードが一致しません。'), //ダイアログのタイトルを設定
                          content: const Text('もう一度ご確認ください。'), //ダイアログの文章の設定
                          actions: <Widget>[
                            GestureDetector(
                              child: Center(child: Text('はい')), //はいを押した時の挙動を設定
                              onTap: () {
                                Navigator.pop(context); //はいを押すと前の画面に戻る
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  'ログイン', //ボタンの文言を記入
                  style: TextStyle(color: Colors.black), //ボタンのテキストを黒色に変える
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber, //ボタンの背景色をamberに設定
                    side: BorderSide(
                        color: Colors.black, width: 3))), //ボタンの外枠を黒くする
          ]),
    );
  }
}

////////////////////////////////////////////////////////////////////////
///会員登録画面のWidget群を指定
class member_registration_Text extends StatefulWidget {
  const member_registration_Text({super.key});

  @override
  State<member_registration_Text> createState() =>
      _member_registration_TextState();
}

class _member_registration_TextState extends State<member_registration_Text> {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //上記を再度定義(効率が悪い。contextの意味がいまいちわからない、、)
    final width = size.width;
    final height = size.height;

    return Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, //widgetの間隔を均等にする。(後で追加の項目がある場合があるのでSized Boxは使わない。)
        children: [
          Text(
            '会員登録', //タイトルを会員登録に指定
            style: TextStyle(fontSize: 50), //LifeSnapのテキストを表示(フォントは要相談)
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), //TextFormFieldの上下左右に余白を入れる
            child: TextFormField(
              decoration: const InputDecoration(
                //TextFormFieldの形を変える
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10), //TextFormFieldの高さを設定
                hintText: 'MAIL ADDRESS', //TextFormFieldのアシストテキストの設定
                prefixIcon: Icon(
                  Icons.mail, //左端アイコンの指定
                ),
                border: OutlineInputBorder(), //TextFormFieldの外枠を作る
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 8,
                left:
                    8), //ここでは別途にcontainerを作る。passwordを打つfieldと確認用fieldがspaceevenlyにより間が空きすぎるのを防ぐ為、二つのTextFormFieldを一つにまとめる。
            child: Container(
              //上述
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: 'PASSWORD',
                      prefixIcon: Icon(
                        Icons.key,
                      ),
                      suffixIcon: IconButton(
                        //パスワード右端のアイコンをタップで変える。三項演算子を用いる
                        icon: Icon(_isObscure
                            ? Icons
                                .visibility_off //真偽値　? trueの時のアイコン　: falseの時のアイコン
                            : Icons.visibility),
                        onPressed: () {
                          setState() {}
                          ;
                          _isObscure = !_isObscure; //タップで真偽値を逆にする。
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: _isObscure, //textをtrueとfalseで見える見えないを切り替える。
                  ),
                  SizedBox(
                    //passwordと確認用のtextFieldの間を10だけ開ける
                    height: 10,
                  ),
                  TextFormField(
                    //ここでは確認用のtextFormFieldを作る
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: '確認',
                      prefixIcon: Icon(
                        Icons.key,
                      ),
                      suffixIcon: IconButton(
                        //パスワード右端のアイコンをタップで変える。三項演算子を用いる
                        icon: Icon(_isObscure
                            ? Icons
                                .visibility_off //真偽値　? trueの時のアイコン　: falseの時のアイコン
                            : Icons.visibility),
                        onPressed: () {
                          setState() {}
                          ;
                          _isObscure = !_isObscure; //タップで真偽値を逆にする。
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: _isObscure, //textをtrueとfalseで見える見えないを切り替える。
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              //登録ボタンを作る。
              onPressed: () {}, //ボタンを押した時の処理を書く(UIを作るだけなのでまだ未記入)
              child: Text(
                '登録', //ボタンの文言を記入
                style: TextStyle(color: Colors.black), //ボタンのテキストを黒色に変える
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber, //ボタンの背景色をamberに設定
                  side:
                      BorderSide(color: Colors.black, width: 3))), //ボタンの外枠を黒くする
        ]);
  }
}