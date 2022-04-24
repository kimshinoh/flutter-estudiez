import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/env.dart';
import 'package:fruity/stores/location/location.dart';
import 'package:fruity/stores/user_address/form_create_user_address_store.dart';
import 'package:fruity/ui/user_address/widgets/save_user_address_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:provider/provider.dart';

class CreateUserAddressAgruments {
  final bool isDefault;

  CreateUserAddressAgruments({required this.isDefault});
}

class CreateUserAddressScreen extends StatelessWidget {
  const CreateUserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormCreateUserAddressStore _formCreateUserAddressStore =
        FormCreateUserAddressStore();

    final CreateUserAddressAgruments args = ModalRoute.of(context)!
        .settings
        .arguments as CreateUserAddressAgruments;
    if (args.isDefault) {
      _formCreateUserAddressStore.setIsDefault();
    }

    _formCreateUserAddressStore.setupListener();

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Thêm địa chỉ',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Provider(
          create: (_) => _formCreateUserAddressStore,
          child: const BottomAppBar(
            child: ButtonSaveUserAddress(),
          ),
        ),
        body: Provider(
          create: (_) => _formCreateUserAddressStore,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Thông tin liên hệ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _FormContactInfo(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Địa chỉ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _FormAddressInfo(),
                  if (!args.isDefault)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: _DefaultCheckBox(),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _FormContactInfo extends StatelessWidget {
  _FormContactInfo({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FormCreateUserAddressStore _formCreateUserAddressStore =
        context.read<FormCreateUserAddressStore>();
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Observer(builder: (_) {
              return TextFormField(
                onChanged: (String value) {
                  _formCreateUserAddressStore.setFullName(value);
                },
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  errorText:
                      _formCreateUserAddressStore.validation.fullNameError,
                ),
                textInputAction: TextInputAction.next,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return TextFormField(
                onChanged: (String value) {
                  _formCreateUserAddressStore.setPhoneNumber(value);
                },
                maxLength: 10,
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  counterText: "",
                  errorText:
                      _formCreateUserAddressStore.validation.phoneNumberError,
                ),
                textInputAction: TextInputAction.next,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _FormAddressInfo extends StatelessWidget {
  _FormAddressInfo({Key? key}) : super(key: key);

  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FormCreateUserAddressStore _formCreateUserAddressStore =
        context.read<FormCreateUserAddressStore>();
    final LocationStore _locationStore = context.read<LocationStore>();
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _addressController,
              readOnly: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PlacePicker(
                      autoCompleteDebounceInMilliseconds: 500,
                      autocompleteLanguage: 'vi',
                      apiKey: Env.googleMapApiKey,
                      onPlacePicked: (PickResult result) {
                        final _address = Address(
                            address: result.formattedAddress ?? "",
                            latitude: result.geometry != null
                                ? result.geometry!.location.lat
                                : 0,
                            longitude: result.geometry != null
                                ? result.geometry!.location.lng
                                : 0);

                        _formCreateUserAddressStore.setAddress(_address);
                        _addressController.text = _address.address;
                        Navigator.of(context).pop();
                      },
                      initialPosition: LatLng(
                        _locationStore.position.latitude,
                        _locationStore.position.longitude,
                      ),
                      useCurrentLocation: true,
                    ),
                  ),
                );
              },
              decoration: const InputDecoration(
                labelText: 'Chọn địa chỉ',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (String value) {
                _formCreateUserAddressStore.setNote(value);
              },
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Ghi chú địa chỉ',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}

class _DefaultCheckBox extends StatelessWidget {
  _DefaultCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormCreateUserAddressStore _formCreateUserAddressStore =
        context.read<FormCreateUserAddressStore>();
    return Row(
      children: [
        Observer(builder: (_) {
          return Checkbox(
            value: _formCreateUserAddressStore.isDefault,
            onChanged: (bool? value) {
              _formCreateUserAddressStore.setIsDefault();
            },
          );
        }),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Là địa chỉ mặc định',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
