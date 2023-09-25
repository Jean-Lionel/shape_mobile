import 'package:flutter/material.dart';

final countries = [
  {
    "id": 1,
    "name": "Congo-Kinshasa",
    "unit": "CD",
    "code": "+243",
  },
  {
    "id": 2,
    "name": "Burundi",
    "unit": "BI",
    "code": "+257",
  },
  {
    "id": 3,
    "name": "Rwanda",
    "unit": "RW",
    "code": "+250",
  },
];

InputDecoration defaultDecoration(String labelText) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      labelText: labelText,
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(35.0),
      ),
    );

String? stringValidator(context,
    {String? value, String? Function(String? value)? additional}) {
  if (value == null || value.isEmpty) {
    return "*";
  }

  if (additional != null) {
    return additional(value);
  }

  return null;
}

String simpleCapitalize(String w) => w.isEmpty
    ? ''
    : w.trim()[0].toUpperCase() + w.trim().substring(1).toLowerCase();

