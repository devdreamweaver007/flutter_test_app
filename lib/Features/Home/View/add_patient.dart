import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/app_strings.dart';
import 'package:flutter_test_app/Commons/common_appbar.dart';
import 'package:flutter_test_app/Commons/custom_button.dart';
import 'package:flutter_test_app/Commons/custom_input_decoration.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';
import 'package:flutter_test_app/Extentions/reg_exp.dart';
import 'package:flutter_test_app/Features/Home/Model/add_patient_model.dart';
import 'package:flutter_test_app/Features/Home/View/Widgets/add_patients_sheet.dart';
import 'package:flutter_test_app/Features/Home/View/Widgets/pop_up_menu.dart';
import 'package:flutter_test_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  late HomeViewModel addViewmodel = HomeViewModel();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDateTime;

  Future<void> _pickDateTime(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _selectedDateTime = date;
        addViewmodel.dateController.text =
            "${_selectedDateTime?.day}/${_selectedDateTime?.month}/${_selectedDateTime?.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    addViewmodel = Provider.of<HomeViewModel>(context, listen: false);
    addViewmodel.getAlltreatments(context);
    addViewmodel.getAllBranchs(context);
  }

  @override
  Widget build(BuildContext context) {
    final addViewmodel = Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: commonAppbar(text: "Add Patient", size: size, isNormal: false),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                    controller: addViewmodel.nameController,
                    name: "Name",
                    size: size,
                    icon: Icons.person,
                    isreadOnly: false,
                    ontap: () {}),
                customTextField(
                    isreadOnly: false,
                    ontap: () {},
                    controller: addViewmodel.executiveController,
                    name: "Executive",
                    size: size,
                    icon: Icons.person),
                customTextField(
                    isreadOnly: true,
                    ontap: () {
                      showPopupDialog(
                          context,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: addViewmodel.payMnetType.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    addViewmodel.paymentController.text =
                                        addViewmodel.payMnetType[index];
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      addViewmodel.payMnetType[index],
                                      style: normalFont1(
                                          fontsize: size * .04,
                                          fontweight: FontWeight.w500,
                                          color: AppColors.greyColor),
                                    ),
                                  )));
                            },
                          ),
                          "Payment Types");
                    },
                    controller: addViewmodel.paymentController,
                    name: "Payment",
                    size: size,
                    icon: Icons.money),
                customTextField(
                    isreadOnly: false,
                    ontap: () {},
                    controller: addViewmodel.phoneController,
                    name: "Phone",
                    size: size,
                    icon: Icons.phone,
                    inputType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ]),
                customTextField(
                    isreadOnly: true,
                    ontap: () {
                      showPopupDialog(
                          context,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: addViewmodel.keralaAddresses.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    addViewmodel.addressController.text =
                                        addViewmodel.keralaAddresses[index];
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        addViewmodel.keralaAddresses[index],
                                        style: normalFont1(
                                            fontsize: size * .04,
                                            fontweight: FontWeight.w500,
                                            color: AppColors.greyColor),
                                      ),
                                    ),
                                  ));
                            },
                          ),
                          "Select Address");
                    },
                    controller: addViewmodel.addressController,
                    name: "Address",
                    size: size,
                    icon: Icons.location_on),
                customTextField(
                    isreadOnly: false,
                    ontap: () {},
                    controller: addViewmodel.totalAmountController,
                    name: "Total Amount",
                    size: size,
                    icon: Icons.money,
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                customTextField(
                    isreadOnly: false,
                    ontap: () {},
                    controller: addViewmodel.discountAmountController,
                    name: "Discount Amount",
                    size: size,
                    icon: Icons.discount,
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                customTextField(
                    isreadOnly: false,
                    ontap: () {},
                    controller: addViewmodel.advanceAmountController,
                    name: "Advance Amount",
                    size: size,
                    icon: Icons.payment,
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                customTextField(
                    isreadOnly: false,
                    ontap: () {},
                    controller: addViewmodel.balanceAmountController,
                    name: "Balance Amount",
                    size: size,
                    icon: Icons.account_balance,
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                customTextField(
                  controller: addViewmodel.dateController,
                  name: "select date",
                  isreadOnly: true,
                  size: size,
                  icon: Icons.calendar_month,
                  ontap: () => _pickDateTime(context),
                ),
                customTextField(
                  isreadOnly: true,
                  ontap: () {
                    showCustomBottomSheet(context, size);
                  },
                  controller: addViewmodel.maleFemaleController,
                  name: "Male/Female",
                  size: size,
                  icon: Icons.group,
                  inputType: TextInputType.number,
                ),
                customTextField(
                    isreadOnly: true,
                    ontap: () {
                      showPopupDialog(
                          context,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: addViewmodel.treatments.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: GestureDetector(
                                    onTap: () {
                                      addViewmodel.treatmentIdController.text =
                                          "${addViewmodel.treatments[index].id}";
                                      addViewmodel.treatmentsController.text =
                                          addViewmodel.treatments[index].name ??
                                              "";
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          addViewmodel.treatments[index].name ??
                                              "",
                                          style: normalFont1(
                                              fontsize: size * .04,
                                              fontweight: FontWeight.w500,
                                              color: AppColors.greyColor),
                                        ),
                                      ),
                                    )),
                              );
                            },
                          ),
                          "Treatments");
                    },
                    controller: addViewmodel.treatmentsController,
                    name: "Treatments",
                    size: size,
                    icon: Icons.medical_services),
                customTextField(
                    isreadOnly: true,
                    ontap: () {
                      showPopupDialog(
                          context,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: addViewmodel.branches.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: GestureDetector(
                                    onTap: () {
                                      addViewmodel.branchControllerid.text =
                                          "${addViewmodel.branches[index].id}";
                                      addViewmodel.branchController.text =
                                          addViewmodel.branches[index].name ??
                                              "";
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          addViewmodel.branches[index].name ??
                                              "",
                                          style: normalFont1(
                                              fontsize: size * .04,
                                              fontweight: FontWeight.w500,
                                              color: AppColors.greyColor),
                                        ),
                                      ),
                                    )),
                              );
                            },
                          ),
                          "All Branches");
                    },
                    controller: addViewmodel.branchController,
                    name: "Branch",
                    size: size,
                    icon: Icons.location_city),
                SizedBox(height: size * .1),
                customButton(
                  size: size,
                  text: "ADD",
                  color: AppColors.greenColor,
                  ontap: () {
                    if (_formKey.currentState!.validate()) {
                      addViewmodel.addPatient(
                          context: context,
                          patient: AddPatient(
                              name: addViewmodel.nameController.text,
                              excecutive: addViewmodel.executiveController.text,
                              payment: addViewmodel.paymentController.text,
                              phone: addViewmodel.phoneController.text,
                              address: addViewmodel.addressController.text,
                              totalAmount:
                                  addViewmodel.totalAmountController.text,
                              discountAmount:
                                  addViewmodel.discountAmountController.text,
                              advanceAmount:
                                  addViewmodel.advanceAmountController.text,
                              balanceAmount:
                                  addViewmodel.balanceAmountController.text,
                              dateAndTime: addViewmodel.dateController.text,
                              id: "",
                              male: "${addViewmodel.man}",
                              female: "${addViewmodel.women}",
                              branch: addViewmodel.branchControllerid.text,
                              treatments:
                                  addViewmodel.treatmentIdController.text));
                    }
                  },
                ),
                SizedBox(height: size * .2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField({
    required TextEditingController controller,
    required String name,
    required bool isreadOnly,
    required double size,
    required IconData icon,
    required VoidCallback ontap,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: isreadOnly,
        onTap: ontap,
        controller: controller,
        validator: (value) {
          if (FieldValidator.isFieldEmpty(value!)) {
            return AppStrings.required;
          }
          // if (FieldValidator.hasNoSpace(value)) {
          //   return AppStrings.spaceError;
          // }
          return null;
        },
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        decoration: customInputDecoration(
          size: size,
          hinttext: name,
          icon: icon,
          onTap: () {},
        ),
      ),
    );
  }
}
