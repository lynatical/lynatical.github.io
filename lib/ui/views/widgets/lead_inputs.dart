import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/ui/inputs/custom_inputs.dart';
import '../../../providers/customer_info_controller.dart';

class LeadInputs extends StatefulWidget {
  const LeadInputs({Key? key}) : super(key: key);

  @override
  State<LeadInputs> createState() => _LeadInputsState();
}

class _LeadInputsState extends State<LeadInputs> {
  @override
  Widget build(BuildContext context) {
    //Controllers
    final customerInfo = Provider.of<CustomerInfoProvider>(context);

    //Regular Expressions
    final validCharacters = RegExp(r'^[a-zA-Z\- ]+$');
    final phoneCharacters = RegExp(r'^[0-9\-() ]+$');

    //Phone Field Formatter
    var phoneFormat = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    bool mobile = MediaQuery.of(context).size.width > 550 ? false : true;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      !mobile
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FieldFirstName(
                    customerInfo: customerInfo,
                    validCharacters: validCharacters),
                const SizedBox(width: 10),
                FieldLastName(
                    customerInfo: customerInfo,
                    validCharacters: validCharacters),
              ],
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 130),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldFirstName(
                        customerInfo: customerInfo,
                        validCharacters: validCharacters),
                    const SizedBox(width: 15, height: 5),
                    FieldLastName(
                        customerInfo: customerInfo,
                        validCharacters: validCharacters),
                    const SizedBox(width: 15, height: 5),
                  ]),
            ),
      SizedBox(height: mobile ? null : 15),
      !mobile
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FieldPhone(
                    customerInfo: customerInfo,
                    phoneFormat: phoneFormat,
                    phoneCharacters: phoneCharacters),
                const SizedBox(width: 10),
                FieldEmail(customerInfo: customerInfo),
              ],
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 130),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldPhone(
                        customerInfo: customerInfo,
                        phoneFormat: phoneFormat,
                        phoneCharacters: phoneCharacters),
                    FieldEmail(customerInfo: customerInfo),
                  ]),
            ),
      const SizedBox(height: 20),
    ]);
  }
}

class FieldEmail extends StatelessWidget {
  const FieldEmail({
    Key? key,
    required this.customerInfo,
  }) : super(key: key);

  final CustomerInfoProvider customerInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
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
    );
  }
}

class FieldPhone extends StatelessWidget {
  const FieldPhone({
    Key? key,
    required this.customerInfo,
    required this.phoneFormat,
    required this.phoneCharacters,
  }) : super(key: key);

  final CustomerInfoProvider customerInfo;
  final MaskTextInputFormatter phoneFormat;
  final RegExp phoneCharacters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        /// VARIABLE STORAGE
        controller: customerInfo.parsedPhone,
        onChanged: (value) => customerInfo.setPhone(value),

        ///VALIDATION TRIGGER
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: false,
        keyboardType: TextInputType.phone,
        decoration: CustomInputs().formInputDecoration(
            label: 'Phone Number', icon: Icons.phone_outlined),

        inputFormatters: [LengthLimitingTextInputFormatter(14), phoneFormat],
        validator: (value) {
          return (phoneCharacters.hasMatch(value ?? '') && value?.length == 14)
              ? null
              : 'Please enter a valid phone number.';
        },
        style: const TextStyle(
          color: Color(0xFF2E5899),
        ),
      ),
    );
  }
}

class FieldFirstName extends StatelessWidget {
  const FieldFirstName({
    Key? key,
    required this.customerInfo,
    required this.validCharacters,
  }) : super(key: key);

  final CustomerInfoProvider customerInfo;
  final RegExp validCharacters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        /// VARIABLE STORAGE
        controller: customerInfo.parsedFName,
        onChanged: (value) {
          customerInfo.setfName(value);
        },

        ///VALIDATION TRIGGER
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autocorrect: false,
        obscureText: false,
        keyboardType: TextInputType.name,
        decoration: CustomInputs().formInputDecoration(
            label: 'First Name', icon: Icons.person_outlined),

        validator: (value) {
          return validCharacters.hasMatch(value ?? '')
              ? null
              : 'Please enter a valid name.';
        },
        style: const TextStyle(
          color: Color(0xFF2E5899),
        ),
      ),
    );
  }
}

class FieldLastName extends StatelessWidget {
  const FieldLastName({
    Key? key,
    required this.customerInfo,
    required this.validCharacters,
  }) : super(key: key);

  final CustomerInfoProvider customerInfo;
  final RegExp validCharacters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        /// VARIABLE STORAGE
        controller: customerInfo.parsedLName,
        onChanged: (value) {
          customerInfo.setlName(value);
        },

        ///VALIDATION TRIGGER
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autocorrect: false,
        obscureText: false,
        keyboardType: TextInputType.name,
        decoration: CustomInputs().formInputDecoration(
            label: 'Last Name', icon: Icons.person_outlined),

        validator: (value) {
          return validCharacters.hasMatch(value ?? '')
              ? null
              : 'Please enter a valid name.';
        },
        style: const TextStyle(
          color: Color(0xFF2E5899),
        ),
      ),
    );
  }
}
