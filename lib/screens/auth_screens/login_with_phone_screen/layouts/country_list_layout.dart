import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:goapp/widgets/country_picker_custom/country_picker_custom.dart';
import 'package:goapp/widgets/country_picker_custom/layouts/country_theme.dart';

import '../../../../config.dart';

List<Map> countriesEnglish = [
  {
    "name": "Afghanistan",
    "dial_code": "+93",
    "code": "AF",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Aland Islands",
    "dial_code": "+358",
    "code": "AX",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Albania",
    "dial_code": "+355",
    "code": "AL",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Algeria",
    "dial_code": "+213",
    "code": "DZ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "AmericanSamoa",
    "dial_code": "+1684",
    "code": "AS",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Andorra",
    "dial_code": "+376",
    "code": "AD",
    "min_length": 6,
    "max_length": 9
  },
  {
    "name": "Angola",
    "dial_code": "+244",
    "code": "AO",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Anguilla",
    "dial_code": "+1264",
    "code": "AI",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Antarctica",
    "dial_code": "+672",
    "code": "AQ",
    "min_length": 6,
    "max_length": 12
  },
  {
    "name": "Antigua and Barbuda",
    "dial_code": "+1268",
    "code": "AG",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Argentina",
    "dial_code": "+54",
    "code": "AR",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Armenia",
    "dial_code": "+374",
    "code": "AM",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Aruba",
    "dial_code": "+297",
    "code": "AW",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Australia",
    "dial_code": "+61",
    "code": "AU",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Austria",
    "dial_code": "+43",
    "code": "AT",
    "min_length": 10,
    "max_length": 13
  },
  {
    "name": "Azerbaijan",
    "dial_code": "+994",
    "code": "AZ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Bahamas",
    "dial_code": "+1242",
    "code": "BS",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Bahrain",
    "dial_code": "+973",
    "code": "BH",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Bangladesh",
    "dial_code": "+880",
    "code": "BD",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Barbados",
    "dial_code": "+1246",
    "code": "BB",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Belarus",
    "dial_code": "+375",
    "code": "BY",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Belgium",
    "dial_code": "+32",
    "code": "BE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Belize",
    "dial_code": "+501",
    "code": "BZ",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Benin",
    "dial_code": "+229",
    "code": "BJ",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Bermuda",
    "dial_code": "+1441",
    "code": "BM",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Bhutan",
    "dial_code": "+975",
    "code": "BT",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Bolivia, Plurinational State of",
    "dial_code": "+591",
    "code": "BO",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Bosnia and Herzegovina",
    "dial_code": "+387",
    "code": "BA",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Botswana",
    "dial_code": "+267",
    "code": "BW",
    "min_length": 7,
    "max_length": 8
  },
  {
    "name": "Brazil",
    "dial_code": "+55",
    "code": "BR",
    "min_length": 10,
    "max_length": 11
  },
  {
    "name": "British Indian Ocean Territory",
    "dial_code": "+246",
    "code": "IO",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Brunei Darussalam",
    "dial_code": "+673",
    "code": "BN",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Bulgaria",
    "dial_code": "+359",
    "code": "BG",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Burkina Faso",
    "dial_code": "+226",
    "code": "BF",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Burundi",
    "dial_code": "+257",
    "code": "BI",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Cambodia",
    "dial_code": "+855",
    "code": "KH",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Cameroon",
    "dial_code": "+237",
    "code": "CM",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Canada",
    "dial_code": "+1",
    "code": "CA",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Cape Verde",
    "dial_code": "+238",
    "code": "CV",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Cayman Islands",
    "dial_code": "+1345",
    "code": "KY",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Central African Republic",
    "dial_code": "+236",
    "code": "CF",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Chad",
    "dial_code": "+235",
    "code": "TD",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Chile",
    "dial_code": "+56",
    "code": "CL",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "China",
    "dial_code": "+86",
    "code": "CN",
    "min_length": 11,
    "max_length": 11
  },
  {
    "name": "Christmas Island",
    "dial_code": "+61",
    "code": "CX",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Cocos (Keeling) Islands",
    "dial_code": "+61",
    "code": "CC",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Colombia",
    "dial_code": "+57",
    "code": "CO",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Comoros",
    "dial_code": "+269",
    "code": "KM",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Congo",
    "dial_code": "+242",
    "code": "CG",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Congo, The Democratic Republic of the Congo",
    "dial_code": "+243",
    "code": "CD",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Cook Islands",
    "dial_code": "+682",
    "code": "CK",
    "min_length": 5,
    "max_length": 5
  },
  {
    "name": "Costa Rica",
    "dial_code": "+506",
    "code": "CR",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Cote d'Ivoire",
    "dial_code": "+225",
    "code": "CI",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Croatia",
    "dial_code": "+385",
    "code": "HR",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Cuba",
    "dial_code": "+53",
    "code": "CU",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Cyprus",
    "dial_code": "+357",
    "code": "CY",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Czech Republic",
    "dial_code": "+420",
    "code": "CZ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Denmark",
    "dial_code": "+45",
    "code": "DK",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Djibouti",
    "dial_code": "+253",
    "code": "DJ",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Dominica",
    "dial_code": "+1767",
    "code": "DM",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Dominican Republic",
    "dial_code": "+1849",
    "code": "DO",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Ecuador",
    "dial_code": "+593",
    "code": "EC",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Egypt",
    "dial_code": "+20",
    "code": "EG",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "El Salvador",
    "dial_code": "+503",
    "code": "SV",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Equatorial Guinea",
    "dial_code": "+240",
    "code": "GQ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Eritrea",
    "dial_code": "+291",
    "code": "ER",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Estonia",
    "dial_code": "+372",
    "code": "EE",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Ethiopia",
    "dial_code": "+251",
    "code": "ET",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Falkland Islands (Malvinas)",
    "dial_code": "+500",
    "code": "FK",
    "min_length": 5,
    "max_length": 5
  },
  {
    "name": "Faroe Islands",
    "dial_code": "+298",
    "code": "FO",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "Fiji",
    "dial_code": "+679",
    "code": "FJ",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Finland",
    "dial_code": "+358",
    "code": "FI",
    "min_length": 9,
    "max_length": 12
  },
  {
    "name": "France",
    "dial_code": "+33",
    "code": "FR",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "French Guiana",
    "dial_code": "+594",
    "code": "GF",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "French Polynesia",
    "dial_code": "+689",
    "code": "PF",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Gabon",
    "dial_code": "+241",
    "code": "GA",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Gambia",
    "dial_code": "+220",
    "code": "GM",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Georgia",
    "dial_code": "+995",
    "code": "GE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Germany",
    "dial_code": "+49",
    "code": "DE",
    "min_length": 10,
    "max_length": 11
  },
  {
    "name": "Ghana",
    "dial_code": "+233",
    "code": "GH",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Gibraltar",
    "dial_code": "+350",
    "code": "GI",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Greece",
    "dial_code": "+30",
    "code": "GR",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Greenland",
    "dial_code": "+299",
    "code": "GL",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "Grenada",
    "dial_code": "+1473",
    "code": "GD",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Guadeloupe",
    "dial_code": "+590",
    "code": "GP",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Guam",
    "dial_code": "+1671",
    "code": "GU",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Guatemala",
    "dial_code": "+502",
    "code": "GT",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Guernsey",
    "dial_code": "+44",
    "code": "GG",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Guinea",
    "dial_code": "+224",
    "code": "GN",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Guinea-Bissau",
    "dial_code": "+245",
    "code": "GW",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Guyana",
    "dial_code": "+592",
    "code": "GY",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Haiti",
    "dial_code": "+509",
    "code": "HT",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Holy See (Vatican City State)",
    "dial_code": "+379",
    "code": "VA",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Honduras",
    "dial_code": "+504",
    "code": "HN",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Hong Kong",
    "dial_code": "+852",
    "code": "HK",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Hungary",
    "dial_code": "+36",
    "code": "HU",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Iceland",
    "dial_code": "+354",
    "code": "IS",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "India",
    "dial_code": "+91",
    "code": "IN",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Indonesia",
    "dial_code": "+62",
    "code": "ID",
    "min_length": 10,
    "max_length": 12
  },
  {
    "name": "Iran, Islamic Republic of Persian Gulf",
    "dial_code": "+98",
    "code": "IR",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Iraq",
    "dial_code": "+964",
    "code": "IQ",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Ireland",
    "dial_code": "+353",
    "code": "IE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Isle of Man",
    "dial_code": "+44",
    "code": "IM",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Israel",
    "dial_code": "+972",
    "code": "IL",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Italy",
    "dial_code": "+39",
    "code": "IT",
    "min_length": 9,
    "max_length": 10
  },
  {
    "name": "Jamaica",
    "dial_code": "+1876",
    "code": "JM",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Japan",
    "dial_code": "+81",
    "code": "JP",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Jersey",
    "dial_code": "+44",
    "code": "JE",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Jordan",
    "dial_code": "+962",
    "code": "JO",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Kazakhstan",
    "dial_code": "+7",
    "code": "KZ",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Kenya",
    "dial_code": "+254",
    "code": "KE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Kiribati",
    "dial_code": "+686",
    "code": "KI",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Korea, Democratic People's Republic of Korea",
    "dial_code": "+850",
    "code": "KP",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Korea, Republic of South Korea",
    "dial_code": "+82",
    "code": "KR",
    "min_length": 9,
    "max_length": 10
  },
  {
    "name": "Kuwait",
    "dial_code": "+965",
    "code": "KW",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Kyrgyzstan",
    "dial_code": "+996",
    "code": "KG",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Laos",
    "dial_code": "+856",
    "code": "LA",
    "min_length": 8,
    "max_length": 9
  },
  {
    "name": "Latvia",
    "dial_code": "+371",
    "code": "LV",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Lebanon",
    "dial_code": "+961",
    "code": "LB",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Lesotho",
    "dial_code": "+266",
    "code": "LS",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Liberia",
    "dial_code": "+231",
    "code": "LR",
    "min_length": 7,
    "max_length": 9
  },
  {
    "name": "Libyan Arab Jamahiriya",
    "dial_code": "+218",
    "code": "LY",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Liechtenstein",
    "dial_code": "+423",
    "code": "LI",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Lithuania",
    "dial_code": "+370",
    "code": "LT",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Luxembourg",
    "dial_code": "+352",
    "code": "LU",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Macao",
    "dial_code": "+853",
    "code": "MO",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Macedonia",
    "dial_code": "+389",
    "code": "MK",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Madagascar",
    "dial_code": "+261",
    "code": "MG",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Malawi",
    "dial_code": "+265",
    "code": "MW",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Malaysia",
    "dial_code": "+60",
    "code": "MY",
    "min_length": 9,
    "max_length": 10
  },
  {
    "name": "Maldives",
    "dial_code": "+960",
    "code": "MV",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Mali",
    "dial_code": "+223",
    "code": "ML",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Malta",
    "dial_code": "+356",
    "code": "MT",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Marshall Islands",
    "dial_code": "+692",
    "code": "MH",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Martinique",
    "dial_code": "+596",
    "code": "MQ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Mauritania",
    "dial_code": "+222",
    "code": "MR",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Mauritius",
    "dial_code": "+230",
    "code": "MU",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Mayotte",
    "dial_code": "+262",
    "code": "YT",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Mexico",
    "dial_code": "+52",
    "code": "MX",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Micronesia, Federated States of Micronesia",
    "dial_code": "+691",
    "code": "FM",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Moldova",
    "dial_code": "+373",
    "code": "MD",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Monaco",
    "dial_code": "+377",
    "code": "MC",
    "min_length": 8,
    "max_length": 9
  },
  {
    "name": "Mongolia",
    "dial_code": "+976",
    "code": "MN",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Montenegro",
    "dial_code": "+382",
    "code": "ME",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Montserrat",
    "dial_code": "+1664",
    "code": "MS",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Morocco",
    "dial_code": "+212",
    "code": "MA",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Mozambique",
    "dial_code": "+258",
    "code": "MZ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Myanmar",
    "dial_code": "+95",
    "code": "MM",
    "min_length": 9,
    "max_length": 10
  },
  {
    "name": "Namibia",
    "dial_code": "+264",
    "code": "NA",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Nauru",
    "dial_code": "+674",
    "code": "NR",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Nepal",
    "dial_code": "+977",
    "code": "NP",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Netherlands",
    "dial_code": "+31",
    "code": "NL",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Netherlands Antilles",
    "dial_code": "+599",
    "code": "AN",
    "min_length": 7,
    "max_length": 8
  },
  {
    "name": "New Caledonia",
    "dial_code": "+687",
    "code": "NC",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "New Zealand",
    "dial_code": "+64",
    "code": "NZ",
    "min_length": 9,
    "max_length": 10
  },
  {
    "name": "Nicaragua",
    "dial_code": "+505",
    "code": "NI",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Niger",
    "dial_code": "+227",
    "code": "NE",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Nigeria",
    "dial_code": "+234",
    "code": "NG",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Niue",
    "dial_code": "+683",
    "code": "NU",
    "min_length": 4,
    "max_length": 4
  },
  {
    "name": "Norfolk Island",
    "dial_code": "+672",
    "code": "NF",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "Northern Mariana Islands",
    "dial_code": "+1670",
    "code": "MP",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Norway",
    "dial_code": "+47",
    "code": "NO",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Oman",
    "dial_code": "+968",
    "code": "OM",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Pakistan",
    "dial_code": "+92",
    "code": "PK",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Palau",
    "dial_code": "+680",
    "code": "PW",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Palestinian Territory, Occupied",
    "dial_code": "+970",
    "code": "PS",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Panama",
    "dial_code": "+507",
    "code": "PA",
    "min_length": 7,
    "max_length": 8
  },
  {
    "name": "Papua New Guinea",
    "dial_code": "+675",
    "code": "PG",
    "min_length": 7,
    "max_length": 8
  },
  {
    "name": "Paraguay",
    "dial_code": "+595",
    "code": "PY",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Peru",
    "dial_code": "+51",
    "code": "PE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Philippines",
    "dial_code": "+63",
    "code": "PH",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Pitcairn",
    "dial_code": "+872",
    "code": "PN",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Poland",
    "dial_code": "+48",
    "code": "PL",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Portugal",
    "dial_code": "+351",
    "code": "PT",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Puerto Rico",
    "dial_code": "+1939",
    "code": "PR",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Qatar",
    "dial_code": "+974",
    "code": "QA",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Romania",
    "dial_code": "+40",
    "code": "RO",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Russia",
    "dial_code": "+7",
    "code": "RU",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Rwanda",
    "dial_code": "+250",
    "code": "RW",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Reunion",
    "dial_code": "+262",
    "code": "RE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Saint Barthelemy",
    "dial_code": "+590",
    "code": "BL",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Saint Helena, Ascension and Tristan Da Cunha",
    "dial_code": "+290",
    "code": "SH",
    "min_length": 4,
    "max_length": 4
  },
  {
    "name": "Saint Kitts and Nevis",
    "dial_code": "+1869",
    "code": "KN",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Saint Lucia",
    "dial_code": "+1758",
    "code": "LC",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Saint Martin",
    "dial_code": "+590",
    "code": "MF",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Saint Pierre and Miquelon",
    "dial_code": "+508",
    "code": "PM",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "Saint Vincent and the Grenadines",
    "dial_code": "+1784",
    "code": "VC",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Samoa",
    "dial_code": "+685",
    "code": "WS",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "San Marino",
    "dial_code": "+378",
    "code": "SM",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Sao Tome and Principe",
    "dial_code": "+239",
    "code": "ST",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Saudi Arabia",
    "dial_code": "+966",
    "code": "SA",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Senegal",
    "dial_code": "+221",
    "code": "SN",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Serbia",
    "dial_code": "+381",
    "code": "RS",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Seychelles",
    "dial_code": "+248",
    "code": "SC",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Sierra Leone",
    "dial_code": "+232",
    "code": "SL",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Singapore",
    "dial_code": "+65",
    "code": "SG",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Slovakia",
    "dial_code": "+421",
    "code": "SK",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Slovenia",
    "dial_code": "+386",
    "code": "SI",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Solomon Islands",
    "dial_code": "+677",
    "code": "SB",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Somalia",
    "dial_code": "+252",
    "code": "SO",
    "min_length": 8,
    "max_length": 9
  },
  {
    "name": "South Africa",
    "dial_code": "+27",
    "code": "ZA",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "South Sudan",
    "dial_code": "+211",
    "code": "SS",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "South Georgia and the South Sandwich Islands",
    "dial_code": "+500",
    "code": "GS",
    "min_length": 5,
    "max_length": 5
  },
  {
    "name": "Spain",
    "dial_code": "+34",
    "code": "ES",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Sri Lanka",
    "dial_code": "+94",
    "code": "LK",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Sudan",
    "dial_code": "+249",
    "code": "SD",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Suriname",
    "dial_code": "+597",
    "code": "SR",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Svalbard and Jan Mayen",
    "dial_code": "+47",
    "code": "SJ",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Swaziland",
    "dial_code": "+268",
    "code": "SZ",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Sweden",
    "dial_code": "+46",
    "code": "SE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Switzerland",
    "dial_code": "+41",
    "code": "CH",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Syrian Arab Republic",
    "dial_code": "+963",
    "code": "SY",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Taiwan",
    "dial_code": "+886",
    "code": "TW",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Tajikistan",
    "dial_code": "+992",
    "code": "TJ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Tanzania, United Republic of Tanzania",
    "dial_code": "+255",
    "code": "TZ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Thailand",
    "dial_code": "+66",
    "code": "TH",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Timor-Leste",
    "dial_code": "+670",
    "code": "TL",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Togo",
    "dial_code": "+228",
    "code": "TG",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Tokelau",
    "dial_code": "+690",
    "code": "TK",
    "min_length": 4,
    "max_length": 4
  },
  {
    "name": "Tonga",
    "dial_code": "+676",
    "code": "TO",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Trinidad and Tobago",
    "dial_code": "+1868",
    "code": "TT",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Tunisia",
    "dial_code": "+216",
    "code": "TN",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Turkey",
    "dial_code": "+90",
    "code": "TR",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Turkmenistan",
    "dial_code": "+993",
    "code": "TM",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Turks and Caicos Islands",
    "dial_code": "+1649",
    "code": "TC",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Tuvalu",
    "dial_code": "+688",
    "code": "TV",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "Uganda",
    "dial_code": "+256",
    "code": "UG",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Ukraine",
    "dial_code": "+380",
    "code": "UA",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "United Arab Emirates",
    "dial_code": "+971",
    "code": "AE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "United Kingdom",
    "dial_code": "+44",
    "code": "GB",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "United States",
    "dial_code": "+1",
    "code": "US",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Uruguay",
    "dial_code": "+598",
    "code": "UY",
    "min_length": 8,
    "max_length": 8
  },
  {
    "name": "Uzbekistan",
    "dial_code": "+998",
    "code": "UZ",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Vanuatu",
    "dial_code": "+678",
    "code": "VU",
    "min_length": 7,
    "max_length": 7
  },
  {
    "name": "Venezuela, Bolivarian Republic of Venezuela",
    "dial_code": "+58",
    "code": "VE",
    "min_length": 10,
    "max_length": 10
  },
  {
    "name": "Vietnam",
    "dial_code": "+84",
    "code": "VN",
    "min_length": 9,
    "max_length": 10
  },
  {
    "name": "Virgin Islands, British",
    "dial_code": "+1284",
    "code": "VG",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Virgin Islands, U.S.",
    "dial_code": "+1340",
    "code": "VI",
    "min_length": 7,
    "max_length": 10
  },
  {
    "name": "Wallis and Futuna",
    "dial_code": "+681",
    "code": "WF",
    "min_length": 6,
    "max_length": 6
  },
  {
    "name": "Yemen",
    "dial_code": "+967",
    "code": "YE",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Zambia",
    "dial_code": "+260",
    "code": "ZM",
    "min_length": 9,
    "max_length": 9
  },
  {
    "name": "Zimbabwe",
    "dial_code": "+263",
    "code": "ZW",
    "min_length": 9,
    "max_length": 9
  }
];

final codes = [
  {
    "name": "افغانستان",
    "code": "AF",
    "dial_code": "+93",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Åland",
    "code": "AX",
    "dial_code": "+358",
    "min_length": 5,
    "max_length": 10,
  },
  {
    "name": "Shqipëria",
    "code": "AL",
    "dial_code": "+355",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "الجزائر",
    "code": "DZ",
    "dial_code": "+213",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "American Samoa",
    "code": "AS",
    "dial_code": "+1684",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Andorra",
    "code": "AD",
    "dial_code": "+376",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "Angola",
    "code": "AO",
    "dial_code": "+244",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Anguilla",
    "code": "AI",
    "dial_code": "+1264",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Antarctica",
    "code": "AQ",
    "dial_code": "+672",
    "min_length": 3,
    "max_length": 3,
  },
  {
    "name": "Antigua and Barbuda",
    "code": "AG",
    "dial_code": "+1268",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Argentina",
    "code": "AR",
    "dial_code": "+54",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Հայաստան",
    "code": "AM",
    "dial_code": "+374",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Aruba",
    "code": "AW",
    "dial_code": "+297",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Australia",
    "code": "AU",
    "dial_code": "+61",
    "min_length": 9,
    "max_length": 10,
  },
  {
    "name": "Österreich",
    "code": "AT",
    "dial_code": "+43",
    "min_length": 4,
    "max_length": 13,
  },
  {
    "name": "Azərbaycan",
    "code": "AZ",
    "dial_code": "+994",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Bahamas",
    "code": "BS",
    "dial_code": "+1242",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "‏البحرين",
    "code": "BH",
    "dial_code": "+973",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Bangladesh",
    "code": "BD",
    "dial_code": "+880",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "Barbados",
    "code": "BB",
    "dial_code": "+1246",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Белару́сь",
    "code": "BY",
    "dial_code": "+375",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "België",
    "code": "BE",
    "dial_code": "+32",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Belize",
    "code": "BZ",
    "dial_code": "+501",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Bénin",
    "code": "BJ",
    "dial_code": "+229",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Bermuda",
    "code": "BM",
    "dial_code": "+1441",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "ʼbrug-yul",
    "code": "BT",
    "dial_code": "+975",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Bolivia",
    "code": "BO",
    "dial_code": "+591",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Bosna i Hercegovina",
    "code": "BA",
    "dial_code": "+387",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Botswana",
    "code": "BW",
    "dial_code": "+267",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Bouvetøya",
    "code": "BV",
    "dial_code": "+47",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Brasil",
    "code": "BR",
    "dial_code": "+55",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "British Indian Ocean Territory",
    "code": "IO",
    "dial_code": "+246",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Negara Brunei Darussalam",
    "code": "BN",
    "dial_code": "+673",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "България",
    "code": "BG",
    "dial_code": "+359",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Burkina Faso",
    "code": "BF",
    "dial_code": "+226",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Burundi",
    "code": "BI",
    "dial_code": "+257",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Cambodia",
    "code": "KH",
    "dial_code": "+855",
    "min_length": 8,
    "max_length": 9,
  },
  {
    "name": "Cameroon",
    "code": "CM",
    "dial_code": "+237",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Canada",
    "code": "CA",
    "dial_code": "+1",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Cabo Verde",
    "code": "CV",
    "dial_code": "+238",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Cayman Islands",
    "code": "KY",
    "dial_code": "+1345",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Ködörösêse tî Bêafrîka",
    "code": "CF",
    "dial_code": "+236",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Tchad",
    "code": "TD",
    "dial_code": "+235",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Chile",
    "code": "CL",
    "dial_code": "+56",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "中国",
    "code": "CN",
    "dial_code ": "+86",
    "min_length": 11,
    "max_length": 11,
  },
  {
    "name": "Christmas Island",
    "code": "CX",
    "dial_code": "+61",
    "min_length": 9,
    "max_length": 10,
  },
  {
    "name": "Cocos (Keeling) Islands",
    "code": "CC",
    "dial_code": "+61",
    "min_length": 9,
    "max_length": 10,
  },
  {
    "name": "Colombia",
    "code": "CO",
    "dial_code": "+57",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Komori",
    "code": "KM",
    "dial_code": "+269",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "République du Congo",
    "code": "CG",
    "dial_code": "+242",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "République démocratique du Congo",
    "code": "CD",
    "dial_code": "+243",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Cook Islands",
    "code": "CK",
    "dial_code": "+682",
    "min_length": 5,
    "max_length": 5,
  },
  {
    "name": "Costa Rica",
    "code": "CR",
    "dial_code": "+506",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Côte d'Ivoire",
    "code": "CI",
    "dial_code": "+225",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Hrvatska",
    "code": "HR",
    "dial_code": "+385",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Cuba",
    "code": "CU",
    "dial_code": "+53",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Κύπρος",
    "code": "CY",
    "dial_code": "+357",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Česká republika",
    "code": "CZ",
    "dial_code": "+420",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Danmark",
    "code": "DK",
    "dial_code": "+45",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Djibouti",
    "code": "DJ",
    "dial_code": "+253",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "Dominica",
    "code": "DM",
    "dial_code": "+1767",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "República Dominicana",
    "code": "DO",
    "dial_code": "+1",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Ecuador",
    "code": "EC",
    "dial_code": "+593",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "مصر‎",
    "code": "EG",
    "dial_code": "+20",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "El Salvador",
    "code": "SV",
    "dial_code": "+503",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Guinea Ecuatorial",
    "code": "GQ",
    "dial_code": "+240",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "ኤርትራ",
    "code": "ER",
    "dial_code": "+291",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Eesti",
    "code": "EE",
    "dial_code": "+372",
    "min_length": 7,
    "max_length": 9,
  },
  {
    "name": "ኢትዮጵያ",
    "code": "ET",
    "dial_code": "+251",
    "min_length": 9,
    "max_length": 10,
  },
  {
    "name": "Falkland Islands",
    "code": "FK",
    "dial_code": "+500",
    "min_length": 4,
    "max_length": 4,
  },
  {
    "name": "Føroyar",
    "code": "FO",
    "dial_code": "+298",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "Fiji",
    "code": "FJ",
    "dial_code": "+679",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Suomi",
    "code": "FI",
    "dial_code": "+358",
    "min_length": 6,
    "max_length": 10,
  },
  {
    "name": "France",
    "code": "FR",
    "dial_code": "+33",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Guyane française",
    "code": "GF",
    "dial_code": "+594",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Polynésie française",
    "code": "PF",
    "dial_code": "+689",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "Territoire des Terres australes et antarctiques fr",
    "code": "TF",
    "dial_code": "+262",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Gabon",
    "code": "GA",
    "dial_code": "+241",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Gambia",
    "code": "GM",
    "dial_code": "+220",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "საქართველო",
    "code": "GE",
    "dial_code": "+995",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Deutschland",
    "code": "DE",
    "dial_code": "+49",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "Ghana",
    "code": "GH",
    "dial_code": "+233",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Gibraltar",
    "code": "GI",
    "dial_code": "+350",
    "min_length": 4,
    "max_length": 4,
  },
  {
    "name": "Ελλάδα",
    "code": "GR",
    "dial_code": "+30",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Kalaallit Nunaat",
    "code": "GL",
    "dial_code": "+299",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Grenada",
    "code": "GD",
    "dial_code": "+1473",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Guadeloupe",
    "code": "GP",
    "dial_code": "+590",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Guam",
    "code": "GU",
    "dial_code": "+1671",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Guatemala",
    "code": "GT",
    "dial_code": "+502",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Guernsey",
    "code": "GG",
    "dial_code": "+44",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Guinée",
    "code": "GN",
    "dial_code": "+224",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Guiné-Bissau",
    "code": "GW",
    "dial_code": "+245",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Guyana",
    "code": "GY",
    "dial_code": "+592",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Haïti",
    "code": "HT",
    "dial_code": "+509",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Heard Island and McDonald Islands",
    "code": "HM",
    "dial_code": "+0",
    "min_length": 3,
    "max_length": 3,
  },
  {
    "name": "Vaticano",
    "code": "VA",
    "dial_code": "+379",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Honduras",
    "code": "HN",
    "dial_code": "+504",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "香港",
    "code": "HK",
    "dial_code": "+852",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Magyarország",
    "code": "HU",
    "dial_code": "+36",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Ísland",
    "code": "IS",
    "dial_code": "+354",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "भारत",
    "code": "IN",
    "dial_code": "+91",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Indonesia",
    "code": "ID",
    "dial_code": "+62",
    "min_length": 10,
    "max_length": 13,
  },
  {
    "name": "ایران",
    "code": "IR",
    "dial_code": "+98",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "العراق",
    "code": "IQ",
    "dial_code": "+964",
    "min_length": 8,
    "max_length": 10,
  },
  {
    "name": "Éire",
    "code": "IE",
    "dial_code": "+353",
    "min_length": 7,
    "max_length": 9,
  },
  {
    "name": "Isle of Man",
    "code": "IM",
    "dial_code": "+44",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "ישראל",
    "code": "IL",
    "dial_code": "+972",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Italia",
    "code": "IT",
    "dial_code": "+39",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Jamaica",
    "code": "JM",
    "dial_code": "+1876",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "日本",
    "code": "JP",
    "dial_code": "+81",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "Jersey",
    "code": "JE",
    "dial_code": "+44",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "الأردن",
    "code": "JO",
    "dial_code": "+962",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Қазақстан",
    "code": "KZ",
    "dial_code": "+7",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Kenya",
    "code": "KE",
    "dial_code": "+254",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Kiribati",
    "code": "KI",
    "dial_code": "+686",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "북한",
    "code": "KP",
    "dial_code": "+850",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "대한민국",
    "code": "KR",
    "dial_code": "+82",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "Republika e Kosovës",
    "code": "XK",
    "dial_code": "+383",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "الكويت",
    "code": "KW",
    "dial_code": "+965",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Кыргызстан",
    "code": "KG",
    "dial_code": "+996",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "ສປປລາວ",
    "code": "LA",
    "dial_code": "+856",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Latvija",
    "code": "LV",
    "dial_code": "+371",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "لبنان",
    "code": "LB",
    "dial_code": "+961",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Lesotho",
    "code": "LS",
    "dial_code": "+266",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Liberia",
    "code": "LR",
    "dial_code": "+231",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "‏ليبيا",
    "code": "LY",
    "dial_code": "+218",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Liechtenstein",
    "code": "LI",
    "dial_code": "+423",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Lietuva",
    "code": "LT",
    "dial_code": "+370",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Luxembourg",
    "code": "LU",
    "dial_code": "+352",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "澳門",
    "code": "MO",
    "dial_code": "+853",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Македонија",
    "code": "MK",
    "dial_code": "+389",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Madagasikara",
    "code": "MG",
    "dial_code": "+261",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Malawi",
    "code": "MW",
    "dial_code": "+265",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Malaysia",
    "code": "MY",
    "dial_code": "+60",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Maldives",
    "code": "MV",
    "dial_code": "+960",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Mali",
    "code": "ML",
    "dial_code": "+223",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Malta",
    "code": "MT",
    "dial_code": "+356",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "M̧ajeļ",
    "code": "MH",
    "dial_code": "+692",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Martinique",
    "code": "MQ",
    "dial_code": "+596",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "موريتانيا",
    "code": "MR",
    "dial_code": "+222",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Maurice",
    "code": "MU",
    "dial_code": "+230",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Mayotte",
    "code": "YT",
    "dial_code": "+262",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "México",
    "code": "MX",
    "dial_code": "+52",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Micronesia",
    "code": "FM",
    "dial_code": "+691",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Moldova",
    "code": "MD",
    "dial_code": "+373",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Monaco",
    "code": "MC",
    "dial_code": "+377",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Монгол улс",
    "code": "MN",
    "dial_code": "+976",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Црна Гора",
    "code": "ME",
    "dial_code": "+382",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Montserrat",
    "code": "MS",
    "dial_code": "+1664",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "المغرب",
    "code": "MA",
    "dial_code": "+212",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Moçambique",
    "code": "MZ",
    "dial_code": "+258",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Myanmar",
    "code": "MM",
    "dial_code": "+95",
    "min_length": 8,
    "max_length": 9,
  },
  {
    "name": "Namibia",
    "code": "NA",
    "dial_code": "+264",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Nauru",
    "code": "NR",
    "dial_code": "+674",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "नपल",
    "code": "NP",
    "dial_code": "+977",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Nederland",
    "code": "NL",
    "dial_code": "+31",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Netherlands Antilles",
    "code": "AN",
    "dial_code": "+599",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Nouvelle-Calédonie",
    "code": "NC",
    "dial_code": "+687",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "New Zealand",
    "code": "NZ",
    "dial_code": "+64",
    "min_length": 9,
    "max_length": 10,
  },
  {
    "name": "Nicaragua",
    "code": "NI",
    "dial_code": "+505",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Niger",
    "code": "NE",
    "dial_code": "+227",
    "min_length": 8,
    "max _length": 8,
  },
  {
    "name": "Nigeria",
    "code": "NG",
    "dial_code": "+234",
    "min_length": 10,
    "max_length": 11,
  },
  {
    "name": "Niuē",
    "code": "NU",
    "dial_code": "+683",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Norfolk Island",
    "code": "NF",
    "dial_code": "+672",
    "min_length": 4,
    "max_length": 4,
  },
  {
    "name": "Northern Mariana Islands",
    "code": "MP",
    "dial_code": "+1670",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Norge",
    "code": "NO",
    "dial_code": "+47",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "عمان",
    "code": "OM",
    "dial_code": "+968",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Pakistan",
    "code": "PK",
    "dial_code": "+92",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Palau",
    "code": "PW",
    "dial_code": "+680",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "فلسطين",
    "code": "PS",
    "dial_code": "+970",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Panamá",
    "code": "PA",
    "dial_code": "+507",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Papua Niugini",
    "code": "PG",
    "dial_code": "+675",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Paraguay",
    "code": "PY",
    "dial_code": "+595",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Perú",
    "code": "PE",
    "dial_code": "+51",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Pilipinas",
    "code": "PH",
    "dial_code": "+63",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Pitcairn Islands",
    "code": "PN",
    "dial_code": "+64",
    "min_length": 4,
    "max_length": 4,
  },
  {
    "name": "Polska",
    "code": "PL",
    "dial_code": "+48",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Portugal",
    "code": "PT",
    "dial_code": "+351",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Puerto Rico",
    "code": "PR",
    "dial_code": "+1939",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Puerto Rico",
    "code": "PR",
    "dial_code": "+1787",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "قطر",
    "code": "QA",
    "dial_code": "+974",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "România",
    "code": "RO",
    "dial_code": "+40",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Россия",
    "code": "RU",
    "dial_code": "+7",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Rwanda",
    "code": "RW",
    "dial_code": "+250",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "La Réunion",
    "code": "RE ",
    "dial_code": "+262",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Saint-Barthélemy",
    "code": "BL",
    "dial_code": "+590",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Saint Helena",
    "code": "SH",
    "dial_code": "+290",
    "min_length": 5,
    "max_length": 5,
  },
  {
    "name": "Saint Kitts and Nevis",
    "code": "KN",
    "dial_code": "+1869",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Saint Lucia",
    "code": "LC",
    "dial_code": "+1758",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Saint-Martin",
    "code": "MF",
    "dial_code": "+590",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Saint-Pierre-et-Miquelon",
    "code": "PM",
    "dial_code": "+508",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "Saint Vincent and the Grenadines",
    "code": "VC",
    "dial_code": "+1784",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Samoa",
    "code": "WS",
    "dial_code": "+685",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "San Marino",
    "code": "SM",
    "dial_code": "+378",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "São Tomé e Príncipe",
    "code": "ST",
    "dial_code": "+239",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "العربية السعودية",
    "code": "SA",
    "dial_code": "+966",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Sénégal",
    "code": "SN",
    "dial_code": "+221",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Србија",
    "code": "RS",
    "dial_code": "+381",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Seychelles",
    "code": "SC",
    "dial_code": "+248",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Sierra Leone",
    "code": "SL",
    "dial_code": "+232",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Singapore",
    "code": "SG",
    "dial_code": "+65",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Slovensko",
    "code": "SK",
    "dial_code": "+421",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Slovenija",
    "code": "SI",
    "dial_code": "+386",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Solomon Islands",
    "code": "SB",
    "dial_code": "+677",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Soomaaliya",
    "code": "SO",
    "dial_code": "+252",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "South Africa",
    "code": "ZA",
    "dial_code": "+27",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "South Sudan",
    "code": "SS",
    "dial_code": "+211",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "South Georgia",
    "code": "GS",
    "dial_code": "+500",
    "min_length": 4,
    "max_length": 4,
  },
  {
    "name": "España",
    "code": "ES",
    "dial_code": "+34",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Sri Lanka",
    "code": "LK",
    "dial_code": "+94",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "السودان",
    "code": "SD",
    "dial_code": "+249",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Suriname",
    "code": "SR",
    "dial_code": "+597",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Svalbard og Jan Mayen",
    "code": "SJ",
    "dial_code": "+47",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Swaziland",
    "code": "SZ",
    "dial_code": "+268",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Sverige",
    "code": "SE",
    "dial_code": "+46",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Schweiz",
    "code": "CH",
    "dial_code": "+41",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "سوريا",
    "code": "SY",
    "dial_code": "+963",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "臺灣",
    "code": "TW",
    "dial_code": "+886",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Тоҷикистон",
    "code": "TJ",
    "dial_code": "+992",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Tanzania",
    "code": "TZ",
    "dial_code": "+255",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "ประเทศไทย",
    "code": "TH",
    "dial_code": "+66",
    "min_length": 9,
    "max_length": 10,
  },
  {
    "name": "Timor-Leste",
    "code": "TL",
    "dial_code": "+670",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Togo",
    "code": "TG",
    "dial_code": "+228",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Tokelau",
    "code": "TK",
    "dial_code": "+690",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Tonga",
    "code": "TO",
    "dial_code": "+676",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Trinidad and Tobago",
    "code": "TT",
    "dial_code": "+1868",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "تونس",
    "code": "TN",
    "dial_code": "+216",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Türkiye",
    "code": "TR",
    "dial_code": "+90",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Türkmenistan",
    "code": "TM",
    "dial_code": "+993",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "Turks and Caicos Islands",
    "code": "TC",
    "dial_code": "+1649",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Tuvalu",
    "code": "TV",
    "dial_code": "+688",
    "min_length": 7,
    " max_length": 7,
  },
  {
    "name": "Uganda",
    "code": "UG",
    "dial_code": "+256",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Україна",
    "code": "UA",
    "dial_code": "+380",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "دولة الإمارات العربية المتحدة",
    "code": "AE",
    "dial_code": "+971",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "United Kingdom",
    "code": "GB",
    "dial_code": "+44",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "United States",
    "code": "US",
    "dial_code": "+1",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Uruguay",
    "code": "UY",
    "dial_code": "+598",
    "min_length": 8,
    "max_length": 8,
  },
  {
    "name": "O‘zbekiston",
    "code": "UZ",
    "dial_code": "+998",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Vanuatu",
    "code": "VU",
    "dial_code": "+678",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Venezuela",
    "code": "VE",
    "dial_code": "+58",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Việt Nam",
    "code": "VN",
    "dial_code": "+84",
    "min_length": 9,
    "max_length": 11,
  },
  {
    "name": "British Virgin Islands",
    "code": "VG",
    "dial_code": "+1284",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "United States Virgin Islands",
    "code": "VI",
    "dial_code": "+1340",
    "min_length": 7,
    "max_length": 7,
  },
  {
    "name": "Wallis et Futuna",
    "code": "WF",
    "dial_code": "+681",
    "min_length": 6,
    "max_length": 6,
  },
  {
    "name": "اليَمَن",
    "code": "YE",
    "dial_code": "+967",
    "min_length": 9,
    "max_length": 9,
  },
  {
    "name": "Zambia",
    "code": "ZM",
    "dial_code": "+260",
    "min_length": 10,
    "max_length": 10,
  },
  {
    "name": "Zimbabwe",
    "code": "ZW",
    "dial_code": "+263",
    "min_length": 9,
    "max_length": 9,
  }
];

class CountryListLayout extends StatelessWidget {
  final Function(CountryCodeCustom?)? onChanged;
  final String? dialCode;

  const CountryListLayout({super.key, this.onChanged, this.dialCode});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context1, register, child) {
      log("dialCode::$dialCode");
      return SizedBox(
              height: Sizes.s50,
              child: CountryListPickCustom(
                  appBar: AppBar(
                      centerTitle: true,
                      title: Text(language(context, appFonts.selectCountry),
                          style: appCss.dmDenseBold20
                              .textColor(appColor(context).whiteBg)),
                      elevation: 0,
                      backgroundColor: appColor(context).primary),
                  countryBuilder: (context, countryCode) => Container(
                      height: 50,
                      color: Colors.white,
                      child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                              leading: Image.asset(countryCode.flagUri!,
                                  width: 30.0),
                              title: Text(countryCode.name!,
                                  style: appCss.dmDenseMedium14
                                      .textColor(appColor(context).darkText)),
                              onTap: () =>
                                  Navigator.pop(context, countryCode)))),
                  pickerBuilder: (context, CountryCodeCustom? countryCode) {
                    return Row(children: [
                      Image.asset("${countryCode!.flagUri}",
                          // package: 'country_list_pick',
                          width: Sizes.s22,
                          height: Sizes.s16),
                      Text(countryCode.dialCode.toString(),
                              style: appCss.dmDenseMedium14
                                  .textColor(appColor(context).darkText))
                          .paddingSymmetric(horizontal: Insets.i5),
                      Icon(CupertinoIcons.chevron_down,
                          size: Sizes.s16, color: appColor(context).darkText)
                    ]);
                  },
                  theme: CountryTheme(
                      labelColor: appColor(context).darkText,
                      isShowFlag: true,
                      alphabetSelectedBackgroundColor:
                          appColor(context).primary),
                  initialSelection: dialCode,
                  onChanged: onChanged))
          .decorated(
              color: appColor(context).whiteBg,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppRadius.r8)));
    });
  }
}
