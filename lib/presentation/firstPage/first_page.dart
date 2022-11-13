import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.delaGothicOneTextTheme(Theme.of(context).textTheme)),
      home: const LifesnapLogin(),
    );
  }
}

class LifesnapLogin extends StatefulWidget {
  //とりあえずstatefulWidgetでUIを作成
  const LifesnapLogin({super.key});

  @override
  State<LifesnapLogin> createState() => LifesnapLoginState();
}

class LifesnapLoginState extends State<LifesnapLogin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //端末ごとの画面サイズを取得
    final height = size.height; //スマホの縦幅の長さを定数に格納
    return Scaffold(
      body: GestureDetector(
        //GestureDetectorを使い、キーボードを表示した際に画面タップで閉じれるようにする。
        behavior: HitTestBehavior.opaque, //タッチ動作を検知する。
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          //Columnをセンターに置く
          child: SingleChildScrollView(
            //SingleChildScrollViewをしないとキーボードを表示した際にレイアウトが崩れてエラーが起きる。キーボードを表示した際でも画面を下にスクロールできるようにする。
            child: Column(
              children: [
                SizedBox(height: height / 4), //スマホごとの高さ÷4の空白を開ける
                const LoginContainer(), //下で作ったlogin画面のContainerを表示（ここでは画面サイズの高さ4分の２を指定）
                SizedBox(height: height / 4) //スマホごとの高さ÷４の空白を開ける
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey, //scaffoldの背景色を変更
    );
  }
}

bool isObscure = true; //グローバル変数で真偽値を定義。後でpasswordを隠すのに使う

//*****************************************************************
//ログインのcontainerの作成
String loginEMail = '';
String loginPassWord = '';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //上記を再度定義(contextの意味がいまいちわからない、、)
    final height = size.height;

    return Padding(
      padding: const EdgeInsets.only(
          left: 30,
          right:
              30), //logincontainerの左と右に40の余白を開ける(端末によってここの余白はそこまで変化に富まなくていいので40で固定。widthは使わない)
      child: Container(
        alignment: Alignment.center, //全体の子widgetをセンターに置く
        height: height / 4 * 2, //containerの高さは端末の高さの4分の２に設定
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), //containerの外枠を黒色にする
            borderRadius: BorderRadius.circular(20), //containerの角を丸くする
            color: Colors.white, //containerの背景色を白色にする
            boxShadow: const [
              BoxShadow(
                color: Colors.black, //影の色を黒色にする
                spreadRadius: 5, //影の広がり具合を設定
                blurRadius: 6, //影のかすみ具合を設定
                offset: Offset(10, 1), //影を左から光を当てたようにする
              )
            ]),
        child: //ここからcontainerの中身を作成
            Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly //widgetの間隔を均等にする。(後で追加の項目がある場合があるのでSized Boxは使わない。)
                ,
                children: [
              const Text(
                'LifeSnap',
                style: TextStyle(
                    fontSize: 50), //LifeSnapのテキストを表示(フォントが気に食わない。アイコンがあればいいかも)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0), //TextFormFieldの上下左右に余白を入れる
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    loginEMail = value;
                  },
                  decoration: const InputDecoration(
                    //TextFormFieldの形を変える
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10), //TextFormFieldの高さを設定
                    hintText: 'MAIL ADDRESS', //TextFormFieldのアシストテキストの設定
                    prefixIcon: Icon(
                      Icons.mail, //アイコンの指定
                    ),
                    border: OutlineInputBorder(), //TextFormFieldの外枠を作る
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0), //上述
                child: TextFormField(
                  onChanged: (value) {
                    loginPassWord = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintText: 'PASSWORD',
                    prefixIcon: const Icon(
                      Icons.key,
                    ),
                    suffixIcon: IconButton(
                      //パスワード右端のアイコンをタップで変える。三項演算子を用いる
                      icon: Icon(isObscure
                          ? Icons
                              .visibility_off //真偽値　? trueの時のアイコン　: falseの時のアイコン
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {});
                        isObscure = !isObscure; //タップで真偽値を逆にする。
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: isObscure, //textをtrueとfalseで見える見えないを切り替える。
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final User? user = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: loginEMail, password: loginPassWord))
                          .user;
                      if (user != null) {
                        // ignore: avoid_print
                        print('ログイン完了');
                      }
                    } catch (e) {
                      // ignore: avoid_print
                      print('エラー');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, //ボタンの背景色をamberに設定
                      side: const BorderSide(color: Colors.black, width: 3)),
                  child: const Text(
                    'ログイン', //ボタンの文言を記入
                    style: TextStyle(color: Colors.black), //ボタンのテキストを黒色に変える
                  )), //ボタンの外枠を黒くする
              ElevatedButton(
                //上述
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MemberRegistration()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    side: const BorderSide(color: Colors.black, width: 3)),
                child: const Text(
                  '会員登録',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
      ),
    );
  }
}

//会員登録画面へ
////////////////////////////////////////////////////////////////////////

String eMail = '';
String passWord = '';

class MemberRegistration extends StatefulWidget {
  const MemberRegistration({super.key});

  @override
  State<MemberRegistration> createState() => MemberRegistrationState();
}

class MemberRegistrationState extends State<MemberRegistration> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //端末ごとの画面サイズを取得
    final height = size.height; //スマホの縦幅の長さを定数に格納
    return Scaffold(
      body: GestureDetector(
        //GestureDetectorを使い、キーボードを表示した際に画面タップで閉じれるようにする。
        behavior: HitTestBehavior.opaque, //タッチ動作を検知する。
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          //Columnをセンターに置く
          child: SingleChildScrollView(
            //SingleChildScrollViewをしないとキーボードを表示した際にレイアウトが崩れてエラーが起きる。キーボードを表示した際でも画面を下にスクロールできるようにする。
            child: Column(
              children: [
                SizedBox(height: height / 6), //スマホごとの高さ÷6の空白を開ける
                const MemberRegistrationContainer(),
                SizedBox(height: height / 6) //スマホごとの高さ÷6の空白を開ける
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey, //scaffoldの背景色を変更
    );
  }
}

class MemberRegistrationContainer extends StatefulWidget {
  const MemberRegistrationContainer({super.key});

  @override
  State<MemberRegistrationContainer> createState() =>
      _MemberRegistrationContainerState();
}

class _MemberRegistrationContainerState
    extends State<MemberRegistrationContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //上記を再度定義
    final height = size.height;
    return Padding(
      padding: const EdgeInsets.only(
          left: 30,
          right:
              30), //logincontainerの左と右に40の余白を開ける(端末によってここの余白はそこまで変化に富まなくていいので40で固定。widthは使わない)
      child: Container(
        alignment: Alignment.center, //全体の子widgetをセンターに置く
        height: height / 6 * 4, //containerの高さは端末の高さの6分の4に設定
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), //containerの外枠を黒色にする
            borderRadius: BorderRadius.circular(20), //containerの角を丸くする
            color: Colors.white, //containerの背景色を白色にする
            boxShadow: const [
              BoxShadow(
                color: Colors.black, //影の色を黒色にする
                spreadRadius: 5, //影の広がり具合を設定
                blurRadius: 6, //影のかすみ具合を設定
                offset: Offset(10, 1), //影を左から光を当てたようにする
              )
            ]),
        child: //ここからcontainerの中身を作成
            Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly //widgetの間隔を均等にする。(後で追加の項目がある場合があるのでSized Boxは使わない。)
                ,
                children: [
              const Text('会員登録',
                  style: TextStyle(
                      fontSize:
                          20)), //LifeSnapのテキストを表示(フォントが気に食わない。アイコンがあればいいかも
              Padding(
                padding: const EdgeInsets.all(8.0), //TextFormFieldの上下左右に余白を入れる
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    eMail = value;
                  },
                  decoration: const InputDecoration(
                    //TextFormFieldの形を変える
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10), //TextFormFieldの高さを設定
                    hintText: 'MAIL ADDRESS', //TextFormFieldのアシストテキストの設定
                    prefixIcon: Icon(
                      Icons.mail, //アイコンの指定
                    ),
                    border: OutlineInputBorder(), //TextFormFieldの外枠を作る
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0), //上述
                child: TextFormField(
                  onChanged: (String value) {
                    passWord = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintText: 'PASSWORD',
                    prefixIcon: const Icon(
                      Icons.key,
                    ),
                    suffixIcon: IconButton(
                      //パスワード右端のアイコンをタップで変える。三項演算子を用いる
                      icon: Icon(isObscure
                          ? Icons
                              .visibility_off //真偽値　? trueの時のアイコン　: falseの時のアイコン
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {});
                        isObscure = !isObscure; //タップで真偽値を逆にする。
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: isObscure, //textをtrueとfalseで見える見えないを切り替える。
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final User? user = (await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: eMail, password: passWord))
                          .user;
                      if (user != null) {}
                    } catch (e) {
                      // ignore: avoid_print
                      print('エラー');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, //ボタンの背景色をamberに設定
                      side: const BorderSide(
                          color: Colors.black,
                          width: 3)), //ボタンを押した時の処理を書く(UIを作るだけなのでまだ未記入)
                  child: const Text(
                    '登録', //ボタンの文言を記入
                    style: TextStyle(color: Colors.black), //ボタンのテキストを黒色に変える
                  )), //ボタンの外枠を黒くする
              IconButton(
                onPressed: () {
                  Navigator.pop(context); //前の画面に戻る
                },
                icon: const Icon(Icons.home_work_sharp),
                iconSize: 50,
              ),
            ]),
      ),
    );
  }
}
