import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/functions.dart';
// import 'package:life_snap/infrastructure/provider/auth_provider.dart';
import 'package:life_snap/presentation/add_post_page/add_post_page_notifier.dart';

import '../../state/image_state/image_state.dart';
import '../widget/circular_widget.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final _titleController = useTextEditingController(text: '');
    final _contentController = useTextEditingController(text: '');

    final _imageNotifier = ref.watch(imageStateNotifierProvider.notifier);
    final _imageFile =
        ref.watch(imageStateNotifierProvider.select((s) => s.imageFile));
    final _position = useState<Position>(const Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: null,
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0));

    // late String _uid;
    // final _user = ref.read(userProvider);

    // if (_user != null) {
    //   _uid = _user.uid;
    // }

    const String _uid = "user1";
    final _vm = ref.watch(addPostPageNotifierProvider.notifier);
    final _isLoading = useState<bool>(false);

    useEffect(() {
      Future.delayed(const Duration(seconds: 0), () async {
        final image = await _imageNotifier.getImage(isCamera: true);
        if (image != null) {
          _imageNotifier.setImage(image);
        } else {
          Navigator.pop(context);
        }
        final position = await Functions.getLocation();
        if (position != null) {
          _position.value = position;
        } else {
          Navigator.pop(context);
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('投稿内容の確認'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _imageFile == null
                  ? Container()
                  : SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image(
                        image: FileImage(_imageFile),
                        fit: BoxFit.cover,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _titleController,
                      keyboardType: TextInputType.multiline,
                      validator: (value) =>
                          value!.trim().isEmpty || value.trim().length >= 10
                              ? "1文字以上、10文字以下でタイトルを入力してください。"
                              : null,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        labelText: 'タイトルを入力...',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        alignLabelWithHint: true,
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 28.0),
                    TextFormField(
                      controller: _contentController,
                      keyboardType: TextInputType.multiline,
                      minLines: 7,
                      maxLines: 7,
                      validator: (value) =>
                          value!.trim().isEmpty || value.trim().length >= 150
                              ? "1文字以上、150文字以下で投稿内容を入力してください。"
                              : null,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        labelText: '投稿内容を入力...',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        alignLabelWithHint: true,
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Stack(alignment: AlignmentDirectional.center, children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 120,
                              vertical: 10,
                            ),
                            elevation: 1.0,
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _isLoading.value = true;
                              await _vm.addPost(
                                  uid: _uid,
                                  title: _titleController.text,
                                  content: _contentController.text,
                                  image: _imageFile!,
                                  position: _position.value);
                            }
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '投稿する',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          )),
                      if (_isLoading.value) const CircularWidget()
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
