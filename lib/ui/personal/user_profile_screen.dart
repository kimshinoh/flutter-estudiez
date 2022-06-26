import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/stores/user/form_update_profile_store.dart';
import 'package:fruity/ui/personal/widgets/personal_header.dart';
import 'package:fruity/ui/personal/widgets/update_profile_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormUpdateProfileStore _formUploadProfileStore = FormUpdateProfileStore();
    _formUploadProfileStore.setupListener();
    AuthStore _authStore = context.read<AuthStore>();

    _formUploadProfileStore.setAvatar(_authStore.user!.avatar);
    _formUploadProfileStore.setFullName(_authStore.user!.fullName);
    _formUploadProfileStore.setEmail(_authStore.user!.email ?? "");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin tài khoản'),
        ),
        bottomNavigationBar: Provider(
            create: (_) => _formUploadProfileStore,
            child: const BottomAppBar(
              child: ButtonUpdateUserProfile(),
            )),
        body: Provider(
          create: (_) => _formUploadProfileStore,
          child: const _body(),
        ));
  }
}

class _body extends StatelessWidget {
  const _body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        _avatar(),
        _name(),
        _email(),
      ],
    );
  }
}

class _avatar extends StatelessWidget {
  const _avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormUpdateProfileStore _formUploadProfileStore =
        context.read<FormUpdateProfileStore>();

    final ImagePicker _picker = ImagePicker();
    return SizedBox(
      height: 140,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);
            if (image == null) {
              return;
            }

            _formUploadProfileStore.uploadAvatar(image.path);
          },
          child: Stack(children: [
            Observer(builder: (_) {
              return _formUploadProfileStore.isLoadingAvatar
                  ? const CircularProgressIndicator()
                  : Avatar(
                      imageUrl: _formUploadProfileStore.avatar,
                      size: const Size(100, 100),
                    );
            }),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_a_photo,
                    color: AppColors.palette.shade500,
                    size: 20,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _name extends StatelessWidget {
  const _name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormUpdateProfileStore _formUploadProfileStore =
        context.read<FormUpdateProfileStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Observer(builder: (_) {
        return TextFormField(
          key: const Key('name_field'),
          decoration: InputDecoration(
            labelText: 'Họ và tên',
            errorText: _formUploadProfileStore.validation.fullNameError,
          ),
          textInputAction: TextInputAction.next,
          style: TextStyle(
            color: AppColors.palette.shade500,
          ),
          initialValue: _formUploadProfileStore.fullName,
          onChanged: (value) =>
              _formUploadProfileStore.setFullName(value.trim()),
        );
      }),
    );
  }
}

class _email extends StatelessWidget {
  const _email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormUpdateProfileStore _formUploadProfileStore =
        context.read<FormUpdateProfileStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        key: const Key('email_field'),
        decoration: const InputDecoration(
          labelText: 'Email',
        ),
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: AppColors.palette.shade500,
        ),
        initialValue: _formUploadProfileStore.email,
        onChanged: (value) => _formUploadProfileStore.setEmail(value.trim()),
      ),
    );
  }
}
