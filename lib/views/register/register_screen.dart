library register;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/helpers/colors.dart';
import 'package:mono/helpers/phone_number_formatter.dart';
import 'package:mono/helpers/size_config.dart';
import 'package:mono/viewmodels/register_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isFullNumber = false;
  bool _termsAccepted1 = false;
  bool _termsAccepted2 = false;

  @override
  void initState() {
    super.initState();
    _phoneController.text = '0'; // Başlangıçta '0' yazılması
    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(
          offset: _phoneController
              .text.length), // İmleç '0' karakterinin sağına yerleştirilir
    );

    _phoneController.addListener(_updateIsFullNumber);
  }

  @override
  void dispose() {
    _phoneController.removeListener(_updateIsFullNumber);
    super.dispose();
  }

  void _updateIsFullNumber() {
    final digits = _phoneController.text.replaceAll(RegExp(r'\D'), '');
    setState(() {
      _isFullNumber =
          digits.length >= 19; // 10 rakamlı telefon numarası tamamlandı mı?
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Kayıt Ol'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/fifth.jpg',
                  fit: BoxFit.cover,
                  height: SizeConfig.getProportionalHeight(20),
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getProportionalHeight(3)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.only(
                    bottom: 4.0), // Çizgi ile metin arasına boşluk
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _isFullNumber ? Colors.grey : AppColors.greenLine,
                      width: SizeConfig.getProportionalWidth(0.5),
                    ),
                  ),
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        17), // Maksimum 17 karakter
                    FilteringTextInputFormatter.digitsOnly, // Sadece rakam
                    PhoneNumberFormatter(), // Özel formatlama
                  ],
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    border: InputBorder.none, // Kenarlık yok
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 0), // Kenar boşlukları yok

                    label: Text(
                      "Cep Telefonu Numaran",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.getProportionalHeight(2.5),
                        color: AppColors.onboardBackground,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getProportionalHeight(35)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _termsAccepted1,
                        onChanged: (bool? value) {
                          setState(() {
                            _termsAccepted1 = value ?? false;
                          });
                        },
                        activeColor: Colors.black, // Tik rengi
                        checkColor: Colors.white, // Tik işaretinin rengi
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Kişisel verilerimin, ICTECH tarafından ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Kullanım Koşullarında',
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = RegisterViewmodel.openTermsPage,
                              ),
                              TextSpan(
                                text:
                                    ' belirtilen amaçlar için işlenmesine onay veriyorum.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _termsAccepted2,
                        onChanged: (bool? value) {
                          setState(() {
                            _termsAccepted2 = value ?? false;
                          });
                        },
                        activeColor: Colors.black, // Tik rengi
                        checkColor: Colors.white, // Tik işaretinin rengi
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Mononun hizmetlerinden faydalabilmek için ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Kullanıcı Sözleşmesi\'ni',
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      RegisterViewmodel.openUserAgreementPage,
                              ),
                              TextSpan(
                                text: ' onaylıyorum.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Mono için ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Aydınlatma Metni\'ni',
                        style: TextStyle(color: Colors.green),
                        recognizer: TapGestureRecognizer()
                          ..onTap = RegisterViewmodel.clarificationPage,
                      ),
                      TextSpan(
                        text: ' okuyabilirsin.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.getProportionalHeight(3)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionalWidth(0)),
              child: Center(
                  child: Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Kayıt Ol"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.onboardBackground,
                      foregroundColor: AppColors.backgroundwhite),
                ),
                width: SizeConfig.getProportionalWidth(85),
              )),
            )
          ],
        ),
      ),
    );
  }
}
