import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/constants/env.dart';
import 'package:fruity/stores/user_address/form_update_user_address_store.dart';
import 'package:fruity/stores/user_address/user_address_store.dart';
import 'package:fruity/ui/user_address/widgets/remove_user_address_button.dart';
import 'package:fruity/ui/user_address/widgets/update_user_address_buttons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:provider/provider.dart';

class UpdateUserAddressAgruments {
  final bool isDefault;
  final String userAddressId;

  UpdateUserAddressAgruments(
      {required this.isDefault, required this.userAddressId});
}

class UpdateUserAddressScreen extends StatelessWidget {
  const UpdateUserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpdateUserAddressAgruments args = ModalRoute.of(context)!
        .settings
        .arguments as UpdateUserAddressAgruments;
    final FormUpdateUserAddressStore _formUpdateUserAddress =
        FormUpdateUserAddressStore(args.userAddressId);
    _formUpdateUserAddress.getUserAddress();
    if (args.isDefault) {
      _formUpdateUserAddress.setIsDefault();
    }

    _formUpdateUserAddress.setupListener();

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
          create: (_) => _formUpdateUserAddress,
          child: BottomAppBar(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonRemoveUserAddresss(userAddressId: args.userAddressId),
              const ButtonUpdateUserAddresss(),
            ],
          )),
        ),
        body: Provider(
            create: (_) => _formUpdateUserAddress,
            child: Observer(builder: (_) {
              return SizedBox(
                child: _formUpdateUserAddress.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: _DefaultCheckBox(),
                                ),
                            ],
                          ),
                        ),
                      ),
              );
            })));
  }
}

class _FormContactInfo extends StatelessWidget {
  _FormContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormUpdateUserAddressStore _formUpdateUserAddress =
        context.read<FormUpdateUserAddressStore>();

    final TextEditingController _nameController =
        TextEditingController(text: _formUpdateUserAddress.fullName);
    final TextEditingController _phoneController =
        TextEditingController(text: _formUpdateUserAddress.phoneNumber);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Observer(builder: (_) {
              return TextFormField(
                onChanged: (String value) {
                  _formUpdateUserAddress.setFullName(value);
                },
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  errorText: _formUpdateUserAddress.validation.fullNameError,
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
                  _formUpdateUserAddress.setPhoneNumber(value);
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
                  errorText: _formUpdateUserAddress.validation.phoneNumberError,
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

  @override
  Widget build(BuildContext context) {
    final FormUpdateUserAddressStore _formUpdateUserAddress =
        context.read<FormUpdateUserAddressStore>();

    final TextEditingController _noteController =
        TextEditingController(text: _formUpdateUserAddress.note);

    final TextEditingController _addressController =
        TextEditingController(text: _formUpdateUserAddress.address.address);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Observer(builder: (_) {
              return TextFormField(
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

                          _formUpdateUserAddress.setAddress(_address);
                          _addressController.text = _address.address;
                          Navigator.of(context).pop();
                        },
                        initialPosition: LatLng(
                            _formUpdateUserAddress.address.latitude,
                            _formUpdateUserAddress.address.longitude),
                        selectInitialPosition: true,
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
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return TextFormField(
                onChanged: (String value) {
                  _formUpdateUserAddress.setNote(value);
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
              );
            }),
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
    final FormUpdateUserAddressStore _formUpdateUserAddress =
        context.read<FormUpdateUserAddressStore>();
    return Row(
      children: [
        Observer(builder: (_) {
          return Checkbox(
            value: _formUpdateUserAddress.isDefault,
            onChanged: (bool? value) {
              _formUpdateUserAddress.setIsDefault();
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
