import 'package:flutter/material.dart';
import 'package:tbr_group_test_assignment/models/country.dart';

import '../models/app_colors.dart';
import '../api/countries_api.dart';
import 'dart:developer';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController searchController = TextEditingController();
  late List<Country> countries;

  @override
  void initState() {
    super.initState();
    log(fetchCountries().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Country code',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.defaultHeaderColor),
              ),
              TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    maximumSize: MaterialStateProperty.all(const Size(30, 30)),
                    minimumSize: MaterialStateProperty.all(const Size(20, 20)),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.4))),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.iconColor2,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, top: 20, left: 20),
          padding: const EdgeInsets.only(left: 10, right: 5),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
              controller: searchController,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: AppColors.iconColor2,
                ),
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor2),
              )),
        ),
      ]),
    );
  }
}
