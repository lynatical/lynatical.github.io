import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/providers/stepper_controller.dart';
import 'package:rta_map_services/ui/inputs/custom_inputs.dart';
import '../../../providers/customer_info_controller.dart';
import '../../buttons/custom_filled_button.dart';
import '../../buttons/custom_outlined_button.dart';
import '../../inputs/custom_checkbox.dart';

class LeadFormView extends StatefulWidget {
  const LeadFormView({Key? key}) : super(key: key);

  @override
  State<LeadFormView> createState() => _LeadFormViewState();
}

class _LeadFormViewState extends State<LeadFormView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Controllers
    final stepper = Provider.of<StepperController>(context);
    final customerInfo = Provider.of<CustomerInfoProvider>(context);

    //Regular Expressions
    final validCharacters = RegExp(r'^[a-zA-Z\- ]+$');
    final phoneCharacters = RegExp(r'^[0-9\-() ]+$');

    const Color labelColor = Color.fromARGB(255, 105, 137, 185);
    TextStyle textLabel = GoogleFonts.plusJakartaSans(color: labelColor);

    //Phone Field Formatter
    var phoneFormat = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    bool mobile = MediaQuery.of(context).size.width > 1130 ? false : true;

    final List<Widget> serviceCheckboxes = [
      CustomCheckbox(
        value: customerInfo.internetCheckbox,
        onChanged: customerInfo.setInternetCheckbox,
        text: 'Internet',
      ),
      const SizedBox(width: 10),
      CustomCheckbox(
        value: customerInfo.tvCheckbox,
        onChanged: customerInfo.setTvCheckbox,
        text: 'TV',
      ),
      CustomCheckbox(
        value: customerInfo.voiceCheckbox,
        onChanged: customerInfo.setVoiceCheckbox,
        text: 'Voice',
      ),
    ];

    return Builder(
      builder: (context) {
        return Center(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  !mobile
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextFormField(
                                /// VARIABLE STORAGE
                                controller: customerInfo.parsedFName,
                                onChanged: (value) {
                                  customerInfo.setfName(value);
                                },

                                ///VALIDATION TRIGGER
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autocorrect: false,
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                decoration: CustomInputs().formInputDecoration(
                                    label: 'First Name',
                                    icon: Icons.person_outlined),

                                validator: (value) {
                                  return validCharacters.hasMatch(value ?? '')
                                      ? null
                                      : 'Please enter a valid name.';
                                },
                                style: const TextStyle(
                                  color: Color(0xFF2E5899),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: TextFormField(
                                /// VARIABLE STORAGE
                                controller: customerInfo.parsedLName,
                                onChanged: (value) {
                                  customerInfo.setlName(value);
                                },

                                ///VALIDATION TRIGGER
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autocorrect: false,
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                decoration: CustomInputs().formInputDecoration(
                                    label: 'Last Name',
                                    icon: Icons.person_outlined),

                                validator: (value) {
                                  return validCharacters.hasMatch(value ?? '')
                                      ? null
                                      : 'Please enter a valid name.';
                                },
                                style: const TextStyle(
                                  color: Color(0xFF2E5899),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 150,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    /// VARIABLE STORAGE
                                    controller: customerInfo.parsedFName,
                                    onChanged: (value) {
                                      customerInfo.setfName(value);
                                    },

                                    ///VALIDATION TRIGGER
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    autocorrect: false,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    decoration: CustomInputs()
                                        .formInputDecoration(
                                            label: 'First Name',
                                            icon: Icons.person_outlined),

                                    validator: (value) {
                                      return validCharacters
                                              .hasMatch(value ?? '')
                                          ? null
                                          : 'Please enter a valid name.';
                                    },
                                    style: const TextStyle(
                                      color: Color(0xFF2E5899),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15, height: 15),
                                Expanded(
                                  child: TextFormField(
                                    /// VARIABLE STORAGE
                                    controller: customerInfo.parsedLName,
                                    onChanged: (value) {
                                      customerInfo.setlName(value);
                                    },

                                    ///VALIDATION TRIGGER
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    autocorrect: false,
                                    obscureText: false,
                                    keyboardType: TextInputType.name,
                                    decoration: CustomInputs()
                                        .formInputDecoration(
                                            label: 'Last Name',
                                            icon: Icons.person_outlined),

                                    validator: (value) {
                                      return validCharacters
                                              .hasMatch(value ?? '')
                                          ? null
                                          : 'Please enter a valid name.';
                                    },
                                    style: const TextStyle(
                                      color: Color(0xFF2E5899),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15, height: 15),
                              ]),
                        ),
                  SizedBox(height: mobile ? null : 25),
                  TextFormField(
                    /// VARIABLE STORAGE
                    controller: customerInfo.parsedPhone,
                    onChanged: (value) => customerInfo.setPhone(value),

                    ///VALIDATION TRIGGER
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    decoration: CustomInputs().formInputDecoration(
                        label: 'Phone Number', icon: Icons.phone_outlined),

                    inputFormatters: [
                      LengthLimitingTextInputFormatter(14),
                      phoneFormat
                    ],
                    validator: (value) {
                      return (phoneCharacters.hasMatch(value ?? '') &&
                              value?.length == 14)
                          ? null
                          : 'Please enter a valid phone number.';
                    },
                    style: const TextStyle(
                      color: Color(0xFF2E5899),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    /// VARIABLE STORAGE
                    controller: customerInfo.parsedEmail,
                    onChanged: (value) {
                      customerInfo.setEmail(value);
                    },

                    ///VALIDATION TRIGGER
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: CustomInputs().formInputDecoration(
                        label: 'E-mail Address', icon: Icons.mail_outlined),

                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = RegExp(pattern);
                      return regExp.hasMatch(value ?? '')
                          ? null
                          : 'Please enter a valid e-mail address.';
                    },
                    style: const TextStyle(
                      color: Color(0xFF2E5899),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                        'Please select the services you\'re interested in:',
                        textAlign: TextAlign.center,
                        style: textLabel),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: serviceCheckboxes,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      CustomOutlinedButton(
                        onPressed: () async {
                          stepper.stepBack();

                          // ignore: use_build_context_synchronously
                          //FocusScope.of(context).requestFocus(FocusNode());
                        },
                        text: 'Back',
                      ),
                      const SizedBox(width: 15),
                      CustomFilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            customerInfo.createLead();
                            customerInfo.orderStatus(true);
                          }
                          // ignore: use_build_context_synchronously
                          //FocusScope.of(context).requestFocus(FocusNode());
                        },
                        text: 'Submit',
                      ),
                    ],
                  ),
                ]),
          ),
        ));
      },
    );
  }
}
