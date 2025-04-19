import 'dart:developer';
import 'dart:ui';

import 'package:intl/intl.dart';

import '../config.dart';

class AppArray {
  List<Map<String, dynamic>> buttonItemsB(bool isFavourite) => [
        {
          'icon': eSvgAssets.calling,
          'label': appFonts.call,
          'action': () => print('Call tapped')
        },
        {
          'icon': eSvgAssets.direction,
          'label': appFonts.directions,
          'action': () => print('Directions tapped')
        },
        {
          'icon': "assets/svg/contact.svg",
          'label': appFonts.contact,
          'action': () => print('Website tapped')
        },
        {
          'icon': eSvgAssets.time,
          'label': appFonts.hours,
          'action': () => print('Hours tapped')
        },
        {
          'icon': "assets/svg/gallery1.svg",
          'label': appFonts.gallery,
          'action': () => print('Share tapped')
        },
        {
          'icon':
              isFavourite == true ? "assets/svg/likeFill.svg" : eSvgAssets.like,
          'label': appFonts.save,
          'action': () => print('Save tapped')
        }
      ];

  var localList = <Locale>[
    const Locale('en'),
    const Locale('el'),
    const Locale('he'),
    const Locale('es'),
    const Locale('ar'),
    const Locale('ru'),
  ];

  var languageList = [
    {
      "title": "English",
      "locale": const Locale('en', 'EN'),
      "code": "en",
      "icon": "assets/flags/en.png"
    },
    {
      "title": "Greek",
      "locale": const Locale("el", 'GR'),
      "code": "el",
      "icon": "assets/flags/gr.png"
    },
    {
      "title": "Hebrew",
      "locale": const Locale('he', 'HE'),
      "code": "he",
      "icon": "assets/flags/he.png"
    },
    {
      "title": "Spanish",
      "locale": const Locale('es', 'ES'),
      "code": "es",
      "icon": "assets/flags/es.png"
    },
    {
      "title": "Arabic",
      "locale": const Locale('ar', 'AR'),
      "code": "ar",
      "icon": "assets/flags/ar.png"
    },
    {
      "title": "Russian",
      "locale": const Locale('ru', 'RU'),
      "code": "ru",
      "icon": "assets/flags/ru.png"
    },
  ];

  List<Map<String, dynamic>> loginOptions = [
    {
      "image": eImageAssets.google,
      "onTap": (BuildContext context, LoginProvider value) =>
          value.signInWithGoogle(context)
    },
    {
      "image": eImageAssets.fbLogo,
      "onTap": (BuildContext context, LoginProvider value) =>
          value.signInWithFacebook(context)
    },
    {
      "image": eImageAssets.mobile,
      "onTap": (BuildContext context, dynamic value) =>
          route.pushNamed(context, routeName.loginWithPhone)
    }
  ];

  /////

  var dashboardList = [
    {
      "title": appFonts.home,
      "icon": eSvgAssets.homeOut,
      "icon2": eSvgAssets.homeFill
    },
    {
      "title": appFonts.booking,
      "icon": eSvgAssets.bookingOut,
      "icon2": eSvgAssets.bookingFill
    },
    {
      "title": appFonts.cart,
      "icon": eSvgAssets.cart,
      "icon2": eSvgAssets.cartFill
    },
    {
      "title": appFonts.offer,
      "icon": eSvgAssets.offerOut,
      "icon2": eSvgAssets.offerFill
    },
    {
      "title": appFonts.menu,
      "icon": eSvgAssets.profileOut,
      "icon2": eSvgAssets.profileFill
    }
  ];

  var bannerList = [
    {
      "id": 1,
      "title": null,
      "type": "category",
      "related_id": "3",
      "media": [
        {"id": 21, "original_url": eImageAssets.banner1}
      ]
    },
    {
      "id": 2,
      "title": null,
      "type": "service",
      "related_id": "2",
      "media": [
        {"id": 1, "original_url": eImageAssets.banner1}
      ]
    }
  ];

  // var categoriesList = [
  //   {"title": "Stays", "icon": eSvgAssets.ac},
  //   {"title": "Beauty", "icon": eSvgAssets.cleaning},
  //   {"title": "Restaurants", "icon": eSvgAssets.carpenter},
  //   {"title": "Fitness", "icon": eSvgAssets.cooking},
  //   {"title": "Health", "icon": eSvgAssets.electrician},
  //   {"title": "Nightlife", "icon": eSvgAssets.painter},
  //   {"title": "Shopping", "icon": eSvgAssets.plumber},
  //   {"title": "Real Estate", "icon": eSvgAssets.salon},
  //   {"title": "Bars", "icon": eSvgAssets.ac},
  //   {"title": "Cafes", "icon": eSvgAssets.cleaning},
  //   {"title": "Banks", "icon": eSvgAssets.carpenter},
  //   {"title": "Cooking", "icon": eSvgAssets.cooking},
  //   {"title": "Electrician", "icon": eSvgAssets.electrician},
  //   {"title": "Painter", "icon": eSvgAssets.painter},
  //   {"title": "Plumber", "icon": eSvgAssets.plumber},
  //   {"title": "Salon", "icon": eSvgAssets.salon},
  //   {"title": "Ac Repair", "icon": eSvgAssets.ac},
  //   {"title": "Cleaning", "icon": eSvgAssets.cleaning},
  // ];

  var servicesList = [
    {
      "id": 3,
      "title": "Anti-rust deep clean",
      "price": "30.00",
      "status": "1",
      "duration": "02:00",
      "duration_unit": "hour",
      "service_rate": "28.50",
      "discount": "5.00",
      "description": "Foamjet tachnology removes dust 2x deeper.",
      "user_id": "2",
      "required_servicemen": "2",
      "distance": 2.884202079111746,
      "review_ratings": [0, 0, 0, 0, 0],
      "media": [
        {"id": 32, "original_url": eImageAssets.fsl1}
      ],
      "user": {
        "id": 2,
        "name": "Stella Milevski",
        "review_ratings": 5,
        "media": [
          {"id": 1, "original_url": eImageAssets.fsl1}
        ],
      }
    },
    {
      "id": 4,
      "title": "Ac deep cleaning",
      "price": "12.00",
      "duration": "00:30",
      "duration_unit": "minute",
      "service_rate": "12.00",
      "discount": "0.00",
      "description": "Foamjet tachnology removes dust 2x dee",
      "user_id": "2",
      "required_servicemen": "2",
      "distance": 2.884202079111746,
      "review_ratings": [0, 0, 0, 0, 1],
      "media": [
        {"id": 34, "original_url": eImageAssets.fsl1}
      ],
      "user": {
        "id": 2,
        "name": "Victoria Popa",
        "review_ratings": 3,
        "media": [
          {"id": 1, "original_url": eImageAssets.fsl1}
        ]
      }
    },
    {
      "id": 5,
      "title": "Ac window service",
      "price": "15.00",
      "duration": "00:30",
      "duration_unit": "minute",
      "service_rate": "12.00",
      "discount": "10.00",
      "description": "Foamjet tachnology removes dust 2x dee",
      "user_id": "2",
      "required_servicemen": "1",
      "distance": 2.884202079111746,
      "review_ratings": [0, 0, 0, 0, 1],
      "media": [
        {"id": 34, "original_url": eImageAssets.fsl1}
      ],
      "user": {
        "id": 2,
        "name": "Kurt Bates",
        "review_ratings": 3,
        "media": [
          {"id": 1, "original_url": eImageAssets.fsl1}
        ]
      }
    },
  ];

  // var featuredList = [
  //   {
  //     "id": 4,
  //     "title": appFonts.cleaningBathroom,
  //     "price": "40.56",
  //     "status": "1",
  //     "duration": "00:30",
  //     "distance": "2 km",
  //     "duration_unit": "minute",
  //     "service_rate": "30",
  //     "discount": "10.00",
  //     "description": "Restaurants",
  //     "user_id": "2",
  //     "required_servicemen": "1",
  //     "created_by_id": "1",
  //     "review_ratings": [0, 0, 0, 0, 1],
  //     "total_review_ratings": 81,
  //     "rating_count": 5,
  //     "isFav": true,
  //     "phoneNum": '+30 210 4652115',
  //     "location": "Ag.Nikolaou 11, 18900",
  //     "media": [
  //       {"id": 34, "original_url": eImageAssets.fs1}
  //     ],
  //     "user": {
  //       "id": 2,
  //       "name": "Belair All Day Bar And Resto",
  //       "email": "provider@example.com",
  //       "served": "3",
  //       "phone": "3696566666",
  //       "code": "93",
  //       "provider_id": null,
  //       "experience_interval": "year",
  //       "experience_duration": "5",
  //       "description": "Loren Description",
  //       "review_ratings": 5,
  //       "media": [
  //         {"id": 1, "original_url": eImageAssets.fsProfile1}
  //       ],
  //     }
  //   },
  //   {
  //     "id": 3,
  //     "title": "",
  //     "price": "15.23",
  //     "status": "1",
  //     "duration": "02:00",
  //     "duration_unit": "hour",
  //     "distance": "0.5 km",
  //     "service_rate": "15.23",
  //     "discount": "Free Drink",
  //     "description": "Restaurants",
  //     "user_id": "2",
  //     "required_servicemen": "1",
  //     "review_ratings": [0, 0, 0, 0, 0],
  //     "total_review_ratings": 810,
  //     "rating_count": 3,
  //     "isFav": false,
  //     "phoneNum": '+30 210 4657587',
  //     "location": "Akti Karaiskaki 56, Salamina 189 00",
  //     "media": [
  //       {
  //         "id": 32,
  //         "original_url": eImageAssets.fs2,
  //       }
  //     ],
  //     "user": {
  //       "id": 2,
  //       "name": "Ouzeri Paralia",
  //       "email": "provider@example.com",
  //       "served": "3",
  //       "phone": "9537670615",
  //       "code": "93",
  //       "provider_id": null,
  //       "experience_interval": "year",
  //       "experience_duration": "5",
  //       "created_by": null,
  //       "description": "Loren Description",
  //       "review_ratings": 5,
  //       "ServicemanReviewRatings": null,
  //       "media": [
  //         {"id": 1, "original_url": eImageAssets.fsProfile2}
  //       ]
  //     }
  //   }
  // ];

  var featureAttractions = [
    {
      "id": 1,
      "name": "Faneromeni Monastery",
      "review_ratings": 5,
      "totalReviewRating": 810,
      "isFav": false,
      "distance": "0.5 km",
      "primary_address": {
        "id": 1,
        "user_id": "2",
        "is_primary": "1",
        "latitude": "21.19859653751037",
        "longitude": "72.79571843878242",
        "area": appFonts.santaAna,
        "postal_code": "394110",
        "country_id": "356",
        "state_id": "12",
        "city": "Surat",
        "address": "kim",
        "type": null,
        "code": null,
        "country": {"id": 356, "name": "India"},
        "state": {"id": 12, "name": "Gujarat"}
      },
      "media": [
        {"id": 1, "original_url": eImageAssets.es1}
      ],
      "expertise": [
        {
          "title": appFonts.paintingService,
          "id": 3,
          "review_ratings": [4, 5, 7, 67, 0],
        }
      ],
    },
    {
      "id": 2,
      "name": "The Stone Lighthouse",
      "review_ratings": 2,
      "totalReviewRating": 810,
      "isFav": true,
      "distance": "0.4 km",
      "primary_address": {
        "id": 1,
        "user_id": "2",
        "is_primary": "1",
        "latitude": "21.19859653751037",
        "longitude": "72.79571843878242",
        "area": appFonts.allentown,
        "postal_code": "394110",
        "country_id": "356",
        "state_id": "12",
        "city": "Surat",
        "address": "kim",
        "type": null,
        "code": null,
        "country": {"id": 356, "name": "India"},
        "state": {"id": 12, "name": "Gujarat"}
      },
      "media": [
        {"id": 1, "original_url": eImageAssets.es2}
      ],
      "expertise": [
        {
          "title": appFonts.salonService,
          "id": 3,
          "review_ratings": [23, 2, 0, 3, 2],
        }
      ],
    },
    {
      "id": 3,
      "name": "Fighters tomb of the naval Battle of Salamis",
      "review_ratings": 4,
      "totalReviewRating": 810,
      "isFav": false,
      "distance": "0.6 km",
      "primary_address": {
        "id": 1,
        "user_id": "2",
        "is_primary": "1",
        "latitude": "21.19859653751037",
        "longitude": "72.79571843878242",
        "area": appFonts.salamina,
        "postal_code": "394110",
        "country_id": "356",
        "state_id": "12",
        "city": "Surat",
        "address": "kim",
        "type": null,
        "code": null,
        "country": {"id": 356, "name": "India"},
        "state": {"id": 12, "name": "Gujarat"}
      },
      "media": [
        {"id": 1, "original_url": eImageAssets.es3}
      ],
      "expertise": [
        {
          "title": appFonts.salonService,
          "id": 3,
          "review_ratings": [0, 0, 0, 0, 0],
        }
      ],
    }
  ];

  var latestBlogList = [
    /* {
      "name": appFonts.switchboard,
      "image": eImageAssets.lb1,
      "subtext": appFonts.woodenPartition,
      "date": appFonts.feb25,
      "message": "23",
      "by": appFonts.byAdmin
    },
    {
      "name": appFonts.manTrimming,
      "image": eImageAssets.lb2,
      "subtext": appFonts.woodenPartition,
      "date": appFonts.feb25,
      "message": "30",
      "by": appFonts.byAdmin
    },
    {
      "name": appFonts.bringJoy,
      "image": eImageAssets.lb3,
      "subtext": appFonts.mar30,
      "date": appFonts.feb25,
      "message": "10",
      "by": appFonts.byAdmin
    },*/
    {
      "id": 3,
      "isTopRated": true,
      "isFav": true,
      "title": "Switchboard an a electrical..",
      "description":
          "Many people with their very own houses worry about air conditioning repair prices, as well as wonder in case their homeowner’s insurance covers this region.",
      "content": "<p>Many people with their very own houses worry about air conditioning repair prices, as well as wonder in case their homeowner’s insurance covers this region.</p>"
          "<p>In lots of cases where it is only the air conditioner that’s broken, or has a problem, in thatcase your homeowner insurance does not insure the repair costs.</p>"
          "<p>With regards to air conditioning repair, there’s another kind of insurance that home owners can purchase.</p>"
          "<p>This insurance was advertised in the media and could be obtained on-line, or you could also ask your agent insurance agent about it.</p>",
      "created_at": "2023-12-26T10:25:04.000000Z",
      "media": [
        {"id": 63, "original_url": eImageAssets.lb1}
      ],
      "categories": [
        {
          "id": 2,
          "title": "Must See",
        }
      ],
      "created_by": {
        "id": 1,
        "name": "admin",
      },
      "tags": [
        {
          "id": 4,
          "name": "Company",
        }
      ]
    },
    {
      "id": 2,
      "isTopRated": true,
      "isFav": false,
      "title": "Man trimming his beard at a..",
      ""
              "description":
          "Many people with their very own houses worry about air conditioning repair prices, as well as wonder in case their homeowner’s insurance covers this region.",
      "content":
          "<p>Many people with their very own houses worry about air conditioning repair prices, as well as wonder in case their homeowner’s insurance covers this region.</p><p>Whether you’ve a natural disaster, fire, or another calamity, as well as your air conditioning gets destroyed or damaged along with the home, then you’re covered by your insurance.</p><p>In lots of cases where it is only the air conditioner that’s broken, or has a problem, in that case your homeowner insurance does not insure the repair costs.</p>",
      "created_at": "2023-10-07T07:01:28.000000Z",
      "media": [
        {"id": 38, "original_url": eImageAssets.lb2}
      ],
      "categories": [
        {
          "id": 15,
          "title": "Landmarks",
        }
      ],
      "created_by": {
        "id": 1,
        "name": "admin",
      },
      "tags": [
        {"id": 2, "name": "Top rated"}
      ]
    },
    {
      "id": 1,
      "title": "Bring Joy and Unity on this...",
      "description": "Painting",
      "isTopRated": true,
      "isFav": false,
      "created_at": "2023-09-09T08:44:33.000000Z",
      "content":
          "<p>Whether you’ve a natural disaster, fire, or another calamity, as well as your air conditioning gets destroyed or damaged along with the home, then you’re covered by your insurance.<br><br>In lots of cases where it is only the air conditioner that’s broken, or has a problem, in that case your homeowner insurance does not insure the repair costs.<br><br>With regards to air conditioning repair, there’s another kind of insurance that home owners can purchase.<br><br>This insurance was advertised in the media and could be obtained on-line, or you could also ask your agent insurance agent about it.</p>",
      "media": [
        {"id": 8, "original_url": eImageAssets.lb3}
      ],
      "categories": [
        {
          "id": 2,
          "title": "Wooden partition",
        }
      ],
      "created_by": {
        "id": 1,
        "name": "admin",
      },
      "tags": [
        {"id": 3, "name": "Freelancer"}
      ]
    }
  ];

  var profileList = [
    {
      "title": appFonts.myAccount,
      "data": [
        {"icon": eSvgAssets.like, "title": appFonts.myProfile, "isArrow": true},
        {
          "icon": eSvgAssets.like,
          "title": appFonts.favouriteList,
          "isArrow": true
        },
        {"icon": eSvgAssets.like, "title": appFonts.myReviews, "isArrow": true},
        {
          "icon": eSvgAssets.like,
          "title": appFonts.appSettings,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.like,
          "title": appFonts.subscriptionPlans,
          "isArrow": true
        }
      ]
    },
    {"title": appFonts.registerYourBusiness},
    {
      "title": appFonts.generalInfo,
      "data": [
        {"icon": eSvgAssets.like, "title": appFonts.aboutUs, "isArrow": true},
        {
          "icon": eSvgAssets.like,
          "title": appFonts.privacyPolicy,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.like,
          "title": appFonts.cancellationPolicy,
          "isArrow": true
        },
        {"icon": eSvgAssets.like, "title": appFonts.contactUs, "isArrow": true},
        {"icon": eSvgAssets.like, "title": appFonts.faq, "isArrow": true},
      ]
    },
    {
      "data": [
        {"icon": eSvgAssets.logout, "title": appFonts.logout, "isArrow": false}
      ]
    }
  ];

  //app setting
  List appSetting() => [
        {'title': appFonts.changeLanguage, 'icon': eSvgAssets.translate},
        {'title': appFonts.changePassword, 'icon': eSvgAssets.lock}
      ];

//currency
  var currencyList = [
    {
      "id": 1,
      "code": "USD",
      "symbol": "\$",
      "no_of_decimal": "2.00",
      "exchange_rate": "1.00",
      "thousands_separator": "comma",
      "decimal_separator": "comma",
      "system_reserve": "0",
      "status": "1",
      "created_by_id": null,
      "created_at": "2023-09-08T16:55:08.000000Z",
      "updated_at": "2023-11-13T03:43:17.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 1, "original_url": eSvgAssets.ukCurrency}
      ]
    },
    {
      "id": 2,
      "code": "INR",
      "symbol": "₹",
      "no_of_decimal": "2.00",
      "exchange_rate": "83.24",
      "thousands_separator": "comma",
      "decimal_separator": "comma",
      "system_reserve": "1",
      "status": "1",
      "created_by_id": null,
      "created_at": "2023-09-08T16:55:08.000000Z",
      "updated_at": "2023-11-13T03:43:17.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 2, "original_url": eSvgAssets.inCurrency}
      ]
    },
    {
      "id": 3,
      "code": "GBP",
      "symbol": "£",
      "no_of_decimal": "2.00",
      "exchange_rate": "100.00",
      "thousands_separator": "comma",
      "decimal_separator": "comma",
      "system_reserve": "0",
      "status": "1",
      "created_by_id": null,
      "created_at": "2023-09-08T16:55:08.000000Z",
      "updated_at": "2023-09-08T16:55:08.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 3, "original_url": eSvgAssets.auCurrency}
      ]
    },
    {
      "id": 4,
      "code": "EUR",
      "symbol": "€",
      "no_of_decimal": "2.00",
      "exchange_rate": "0.01",
      "thousands_separator": "comma",
      "decimal_separator": "comma",
      "system_reserve": "0",
      "status": "1",
      "created_by_id": null,
      "created_at": "2023-09-08T16:55:08.000000Z",
      "updated_at": "2023-09-08T16:55:08.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 4, "original_url": eSvgAssets.euroCurrency}
      ]
    }
  ];

  var homeCouponList = [
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
  ];

  var historyList = [
    {
      "id": 19,
      "amount": 30.50,
      "type": "credit",
      "detail": "Painting cancelled #1256",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 12.77,
      "type": "debit",
      "detail": "House hold cook #4589",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 15.85,
      "type": "debit",
      "detail": "Commercial laundry #5966",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 50.25,
      "type": "debit",
      "detail": "Display wiring #4534",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 23.11,
      "type": "debit",
      "detail": "Ac installation #2345",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 15.12,
      "type": "credit",
      "detail": "Cashback #2334",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 10.45,
      "type": "credit",
      "detail": "Ac cleaning cancelled #4536",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    },
    {
      "id": 19,
      "amount": 9.78,
      "type": "credit",
      "detail": "Salon #4321",
      "from": 19,
      "created_at": "2024-02-10T03:51:59.000000Z"
    }
  ];

  var pagesList = [
    {
      "id": 1,
      "title": "About Us",
      "content":
          "<p><strong>About Us!</strong><br><br><i>Welcome To </i>: <i><strong>Fixit User</strong></i></p><p><br><strong>Fixit User</strong> is a Professional Home services Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of “Home services”, with a focus on dependability and can rent home cleaning, beauty services, and even interior design at home. We're working to turn our passion for Home services into a booming &lt;a href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\" style=\"color: inherit; text-decoration: none;\"&gt;online website&lt;/a&gt;. We hope you enjoy our &lt;span id=\"W_Type4\"&gt;Home services&lt;/span&gt; as much as we enjoy offering them to you.&lt;/p&gt;<br>&lt;p&gt;I will keep posting more important posts on my Website for all of you. Please give your support and love.&lt;/p&gt;<br>&lt;p style=\"font-weight: bold; text-align: center;\"&gt;Thanks For Visiting Our Site&lt;br&gt;&lt;br&gt;<br>&lt;span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\"&gt;Have a nice day!&lt;/span&gt;&lt;/p&gt;<br> </p>",
    },
    {
      "id": 1,
      "title": "Privacy Policy",
      "content":
          "<p><strong>About Us!</strong><br><br><i>Welcome To </i>: <i><strong>Fixit User</strong></i></p><p><br><strong>Fixit User</strong> is a Professional Home services Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of “Home services”, with a focus on dependability and can rent home cleaning, beauty services, and even interior design at home. We're working to turn our passion for Home services into a booming &lt;a href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\" style=\"color: inherit; text-decoration: none;\"&gt;online website&lt;/a&gt;. We hope you enjoy our &lt;span id=\"W_Type4\"&gt;Home services&lt;/span&gt; as much as we enjoy offering them to you.&lt;/p&gt;<br>&lt;p&gt;I will keep posting more important posts on my Website for all of you. Please give your support and love.&lt;/p&gt;<br>&lt;p style=\"font-weight: bold; text-align: center;\"&gt;Thanks For Visiting Our Site&lt;br&gt;&lt;br&gt;<br>&lt;span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\"&gt;Have a nice day!&lt;/span&gt;&lt;/p&gt;<br> </p>",
    },
    {
      "id": 1,
      "title": "Cancellation Policy",
      "content":
          "<p><strong>About Us!</strong><br><br><i>Welcome To </i>: <i><strong>Fixit User</strong></i></p><p><br><strong>Fixit User</strong> is a Professional Home services Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of “Home services”, with a focus on dependability and can rent home cleaning, beauty services, and even interior design at home. We're working to turn our passion for Home services into a booming &lt;a href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\" style=\"color: inherit; text-decoration: none;\"&gt;online website&lt;/a&gt;. We hope you enjoy our &lt;span id=\"W_Type4\"&gt;Home services&lt;/span&gt; as much as we enjoy offering them to you.&lt;/p&gt;<br>&lt;p&gt;I will keep posting more important posts on my Website for all of you. Please give your support and love.&lt;/p&gt;<br>&lt;p style=\"font-weight: bold; text-align: center;\"&gt;Thanks For Visiting Our Site&lt;br&gt;&lt;br&gt;<br>&lt;span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\"&gt;Have a nice day!&lt;/span&gt;&lt;/p&gt;<br> </p>",
    },
    {
      "id": 1,
      "title": "Refund Policy",
      "content":
          "<p><strong>About Us!</strong><br><br><i>Welcome To </i>: <i><strong>Fixit User</strong></i></p><p><br><strong>Fixit User</strong> is a Professional Home services Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of “Home services”, with a focus on dependability and can rent home cleaning, beauty services, and even interior design at home. We're working to turn our passion for Home services into a booming &lt;a href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\" style=\"color: inherit; text-decoration: none;\"&gt;online website&lt;/a&gt;. We hope you enjoy our &lt;span id=\"W_Type4\"&gt;Home services&lt;/span&gt; as much as we enjoy offering them to you.&lt;/p&gt;<br>&lt;p&gt;I will keep posting more important posts on my Website for all of you. Please give your support and love.&lt;/p&gt;<br>&lt;p style=\"font-weight: bold; text-align: center;\"&gt;Thanks For Visiting Our Site&lt;br&gt;&lt;br&gt;<br>&lt;span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\"&gt;Have a nice day!&lt;/span&gt;&lt;/p&gt;<br> </p>",
    },
    {
      "id": 1,
      "title": "Help & support",
      "content":
          "<p><strong>About Us!</strong><br><br><i>Welcome To </i>: <i><strong>Fixit User</strong></i></p><p><br><strong>Fixit User</strong> is a Professional Home services Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of “Home services”, with a focus on dependability and can rent home cleaning, beauty services, and even interior design at home. We're working to turn our passion for Home services into a booming &lt;a href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\" style=\"color: inherit; text-decoration: none;\"&gt;online website&lt;/a&gt;. We hope you enjoy our &lt;span id=\"W_Type4\"&gt;Home services&lt;/span&gt; as much as we enjoy offering them to you.&lt;/p&gt;<br>&lt;p&gt;I will keep posting more important posts on my Website for all of you. Please give your support and love.&lt;/p&gt;<br>&lt;p style=\"font-weight: bold; text-align: center;\"&gt;Thanks For Visiting Our Site&lt;br&gt;&lt;br&gt;<br>&lt;span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\"&gt;Have a nice day!&lt;/span&gt;&lt;/p&gt;<br> </p>",
    }
  ];

  var favouriteTabList = [appFonts.provider, appFonts.service];

  var favouriteProviderList = [
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": "2",
      "service_id": null,
      "provider": {
        "id": 2,
        "name": appFonts.leslie,
        "description": appFonts.paintingCleaning,
        "review_ratings": 5,
        "media": [
          {
            "id": 1,
            "original_url": eImageAssets.es1,
          }
        ],
      },
      "service": null
    },
    {
      "id": 71,
      "consumer_id": "53",
      "provider_id": null,
      "service_id": "4",
      "provider": null,
      "service": {
        "id": 4,
        "title": "Ac water drop solution",
        "price": "30.56",
        "service_rate": "30.56",
        "selectedRequiredServiceMan": "2",
        "required_servicemen": "2",
        "categories": [
          {
            "id": 12,
            "title": "Ac repair",
          }
        ],
        "media": [
          {"id": 34, "original_url": eImageAssets.fsl1}
        ],
      }
    },
    {
      "id": 72,
      "consumer_id": "53",
      "provider_id": "3",
      "service_id": null,
      "provider": {
        "id": 3,
        "name": "Sledge Hammer",
        "description": appFonts.paintingService,
        "review_ratings": 4,
        "media": [
          {
            "id": 1,
            "original_url": eImageAssets.es,
          }
        ],
      },
      "service": null
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": null,
      "service_id": "5",
      "provider": null,
      "service": {
        "id": 5,
        "title": "Feather hair cutting",
        "price": "15",
        "service_rate": "15",
        "selectedRequiredServiceMan": "1",
        "required_servicemen": "1",
        "categories": [
          {
            "id": 12,
            "title": "Salon",
          }
        ],
        "media": [
          {"id": 34, "original_url": eImageAssets.fsl2}
        ],
      }
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": "4",
      "service_id": null,
      "provider": {
        "id": 4,
        "name": "Jonathan Higgins",
        "description": appFonts.salonService,
        "review_ratings": 2,
        "media": [
          {
            "id": 1,
            "original_url": eImageAssets.es,
          }
        ],
      },
      "service": null
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": null,
      "service_id": "6",
      "provider": null,
      "service": {
        "id": 6,
        "title": "Furniture & carpenter",
        "price": "25",
        "service_rate": "25",
        "selectedRequiredServiceMan": "2",
        "required_servicemen": "2",
        "categories": [
          {
            "id": 12,
            "title": "Carpenter",
          }
        ],
        "media": [
          {"id": 34, "original_url": eImageAssets.fsl3}
        ],
      }
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": "5",
      "service_id": null,
      "provider": {
        "id": 5,
        "name": "Capt. Trunk",
        "description": appFonts.paintingCleaning,
        "review_ratings": 4,
        "media": [
          {
            "id": 1,
            "original_url": eImageAssets.es,
          }
        ],
      },
      "service": null
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": null,
      "service_id": "7",
      "provider": null,
      "service": {
        "id": 7,
        "selectedRequiredServiceMan": "1",
        "required_servicemen": "1",
        "title": "Wall painting",
        "price": "58.23",
        "service_rate": "58.23",
        "categories": [
          {
            "id": 12,
            "title": "Painter",
          }
        ],
        "media": [
          {"id": 34, "original_url": eImageAssets.fsl4}
        ],
      }
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": "6",
      "service_id": null,
      "provider": {
        "id": 6,
        "name": "Jonathan Higgins",
        "description": appFonts.salonService,
        "review_ratings": 3,
        "media": [
          {
            "id": 1,
            "original_url": eImageAssets.es3,
          }
        ],
      },
      "service": null
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": null,
      "service_id": "8",
      "provider": null,
      "service": {
        "id": 8,
        "title": "Marriage cooking",
        "price": "41.25",
        "selectedRequiredServiceMan": "2",
        "required_servicemen": "2",
        "service_rate": "41.25",
        "categories": [
          {
            "id": 12,
            "title": "Cooking",
          }
        ],
        "media": [
          {"id": 34, "original_url": eImageAssets.fsl5}
        ],
      }
    },
    {
      "id": 70,
      "consumer_id": "53",
      "provider_id": null,
      "service_id": "9",
      "provider": null,
      "service": {
        "id": 9,
        "title": "Light fitting & repair",
        "price": "10.26",
        "service_rate": "10.26",
        "selectedRequiredServiceMan": "2",
        "required_servicemen": "2",
        "categories": [
          {
            "id": 12,
            "title": "Electrician",
          }
        ],
        "media": [
          {"id": 34, "original_url": eImageAssets.fsl6}
        ],
      }
    },
  ];

  var myLocationList = [
    {
      "id": 46,
      "user_id": "53",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.1982995",
      "longitude": "72.7960809",
      "area": "3891 Ranchview Dr. Richardson",
      "postal_code": "62639",
      "country_id": "4",
      "state_id": "42",
      "city": "Surat",
      "address": "B-1",
      "type": "home",
      "code": "406",
      "alternative_name": "Kristin Watson",
      "alternative_phone": "555-0120",
      "country": {"id": 4, "name": "California"},
      "state": {"id": 42, "name": "USA"}
    },
    {
      "id": 44,
      "user_id": "53",
      "service_id": null,
      "is_primary": "0",
      "latitude": "21.1982964",
      "longitude": "72.7960976",
      "area": "2118 Thornridge Cir. Syracuse",
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "Surat",
      "address": "B-1",
      "type": "work",
      "code": "684",
      "alternative_name": "Floyd Miles",
      "alternative_phone": "555-0120",
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    {
      "id": 43,
      "user_id": "53",
      "service_id": null,
      "is_primary": "0",
      "latitude": "21.1983",
      "longitude": "72.7960943",
      "area": "226, Paul University near Badakhana",
      "postal_code": "395009",
      "country_id": "356",
      "state_id": "1",
      "city": "Surat",
      "address": "B-1",
      "type": "other",
      "code": "91",
      "alternative_name": "Kurt Bates",
      "alternative_phone": "366562241",
      "country": {"id": 356, "name": "India"},
      "state": {"id": 1, "name": "Andaman and Nicobar Islands"}
    }
  ];

  var reviewList = [
    {
      "id": 5,
      "service_id": 4,
      "category": "Restaurant",
      "consumer_id": 53,
      "provider_id": 2,
      "serviceman_id": null,
      "rating": 5,
      "description":
          "“I just love their service & the staff nature for work, I’d like to hire them again”",
      "created_at": "2024-01-10T12:24:10.000000Z",
      "service": {
        "id": 4,
        "title": "Cleaning service",
      },
      "serviceman": null,
      "provider": {
        "id": 2,
        "name": "Kurt Bates",
        "review_ratings": 3.5,
        "media": [
          {"id": 1, "original_url": eImageAssets.profile}
        ]
      }
    },
    {
      "id": 8,
      "service_id": null,
      "category": "Bar",
      "consumer_id": 53,
      "provider_id": null,
      "serviceman_id": 34,
      "rating": 5,
      "description":
          "This provider has the best staff who assist us until the service is complete. Thank you!",
      "created_at": "2024-01-24T12:48:38.000000Z",
      "service": null,
      "serviceman": {
        "id": 34,
        "name": "Jane Cooper",
        "media": [
          {
            "id": 53,
            "original_url":
                "https://fixit.webiots.co.in/storage/53/Mask-group.png",
          }
        ]
      },
      "provider": null
    },
    {
      "id": 5,
      "service_id": 4,
      "category": "Hotel",
      "consumer_id": 53,
      "provider_id": 2,
      "serviceman_id": null,
      "rating": 5,
      "description": "“I love their work with ease, Thank you !”",
      "created_at": "2024-01-10T12:24:10.000000Z",
      "service": {
        "id": 4,
        "title": "Painting Package",
        "categories": [
          {
            "id": 12,
            "title": "Painter",
          }
        ]
      },
      "serviceman": null,
      "provider": {
        "id": 2,
        "name": "Lorri Warf",
        "review_ratings": 3.5,
        "media": [
          {
            "id": 1,
            "original_url":
                "https://fixit.webiots.co.in/storage/1/provider.png",
          }
        ]
      }
    },
    {
      "id": 8,
      "service_id": null,
      "category": "Restaurant",
      "consumer_id": 53,
      "provider_id": null,
      "serviceman_id": 34,
      "rating": 5,
      "description":
          "“I just love their service & the staff nature for work, I’d like to hire them again”",
      "created_at": "2024-01-24T12:48:38.000000Z",
      "service": null,
      "serviceman": {
        "id": 34,
        "name": "Jane Cooper",
        "media": [
          {
            "id": 53,
            "original_url":
                "https://fixit.webiots.co.in/storage/53/Mask-group.png",
          }
        ]
      },
      "provider": null
    }
  ];

  var editReviewList = [
    {"icon": eSvgAssets.bad, "title": appFonts.bad},
    {"icon": eSvgAssets.okay, "title": appFonts.okay},
    {"icon": eSvgAssets.good, "title": appFonts.good},
    {"icon": eSvgAssets.amazing, "title": appFonts.amazing},
    {"icon": eSvgAssets.excellent, "title": appFonts.excellent},
  ];

  var appDetailsList = [
    {
      "title": appFonts.aboutUs,
      "icon": eSvgAssets.about,
    },
    {
      "title": appFonts.privacyPolicy,
      "icon": eSvgAssets.privacy,
    },
    {
      "title": appFonts.cancellationPolicy,
      "icon": eSvgAssets.cancellation,
    },
    {
      "title": appFonts.refundPolicy,
      "icon": eSvgAssets.refund,
    },
    {
      "title": appFonts.helpSupport,
      "icon": eSvgAssets.help,
    },
  ];

  var selectErrorList = [
    "Purchase error",
    "Technical error",
    "Question",
    "Feedback"
  ];

  var notificationList = [
    {
      "created_at": DateTime.now().toString(),
      "id": "1",
      "data": {
        "title": "Reminder !",
        "message": "You have booked plumber service today at 6:30pm.",
        "provider_id": "1",
        "type": "provider",
        "thumbnail": eImageAssets.not1,
      }
    },
    {
      "created_at": DateTime.now().add(const Duration(minutes: 2)).toString(),
      "id": "1",
      "data": {
        "title": "Service start",
        "message": "Jane cooper has started service of cleaning.",
        "provider_id": "1",
        "type": "provider",
        "thumbnail": eImageAssets.not2,
      }
    },
    {
      "created_at": DateTime.now().add(const Duration(minutes: 2)).toString(),
      "read_at": DateTime.now().toString(),
      "id": "3",
      "data": {
        "title": "Add new image",
        "message": "Add a new carpenter & furnishing category service picture.",
        "provider_id": "1",
        "type": "category",
        "thumbnail": eImageAssets.not3,
        "image": eImageAssets.appLogo
      }
    },
    {
      "created_at": DateTime.now().add(const Duration(minutes: 2)).toString(),
      "read_at": DateTime.now().toString(),
      "id": "4",
      "data": {
        "title": "Payment update",
        "message": "Your payment is done of cleaning service.",
        "provider_id": "1",
        "type": "payment",
        "thumbnail": eImageAssets.not4,
      }
    },
    {
      "created_at": DateTime.now().add(const Duration(minutes: 2)).toString(),
      "read_at": DateTime.now().toString(),
      "id": "4",
      "data": {
        "title": "Update status",
        "message": "Booking status has been changed from pending to accepted.",
        "provider_id": "1",
        "type": "booking",
        "thumbnail": eImageAssets.not3,
      }
    },
    {
      "created_at": DateTime.now().add(const Duration(minutes: 2)).toString(),
      "read_at": DateTime.now().toString(),
      "id": "4",
      "data": {
        "title": "Reminder !",
        "message": "You have booked plumber service today at 6:30pm.",
        "provider_id": "1",
        "type": "booking",
        "thumbnail": eImageAssets.not2,
      }
    }
  ];

  List countryList = [
    {
      "id": 4,
      "name": "Afghanistan",
      "state": [
        {"id": 42, "name": "Badakhshan", "country_id": "4"},
        {"id": 43, "name": "Badgis", "country_id": "4"},
        {"id": 44, "name": "Baglan", "country_id": "4"},
        {"id": 45, "name": "Balkh", "country_id": "4"},
        {"id": 46, "name": "Bamiyan", "country_id": "4"},
        {"id": 47, "name": "Farah", "country_id": "4"},
        {"id": 71, "name": "Uruzgan", "country_id": "4"},
        {"id": 72, "name": "Wardak", "country_id": "4"},
        {"id": 73, "name": "Zabul", "country_id": "4"}
      ]
    },
    {
      "id": 8,
      "name": "Albania",
      "state": [
        {"id": 74, "name": "Berat", "country_id": "8"},
        {"id": 75, "name": "Bulqize", "country_id": "8"},
        {"id": 76, "name": "Delvine", "country_id": "8"},
        {"id": 77, "name": "Devoll", "country_id": "8"},
        {"id": 78, "name": "Dibre", "country_id": "8"},
        {"id": 79, "name": "Durres", "country_id": "8"},
        {"id": 80, "name": "Elbasan", "country_id": "8"}
      ]
    },
    {
      "id": 10,
      "name": "Antarctica",
      "state": [
        {
          "id": 194,
          "name": "Sector claimed by Argentina/Ch",
          "country_id": "10"
        },
        {
          "id": 195,
          "name": "Sector claimed by Argentina/UK",
          "country_id": "10"
        },
        {
          "id": 196,
          "name": "Sector claimed by Australia",
          "country_id": "10",
        },
        {"id": 197, "name": "Sector claimed by France", "country_id": "10"},
        {
          "id": 198,
          "name": "Sector claimed by New Zealand",
          "country_id": "10"
        },
        {"id": 199, "name": "Sector claimed by Norway", "country_id": "10"},
        {"id": 200, "name": "Unclaimed Sector", "country_id": "10"}
      ]
    },
    {
      "id": 12,
      "name": "Algeria",
      "state": [
        {"id": 110, "name": "'Ayn Daflah", "country_id": "12"},
        {"id": 111, "name": "'Ayn Tamushanat", "country_id": "12"},
        {"id": 112, "name": "Adrar", "country_id": "12"},
        {"id": 113, "name": "Algiers", "country_id": "12"},
        {"id": 114, "name": "Annabah", "country_id": "12"},
        {"id": 115, "name": "Bashshar", "country_id": "12"}
      ]
    },
    {
      "id": 16,
      "name": "American Samoa",
      "state": [
        {"id": 164, "name": "Eastern", "country_id": "16"},
        {"id": 165, "name": "Manu'a", "country_id": "16"},
        {"id": 166, "name": "Swains Island", "country_id": "16"},
        {"id": 167, "name": "Western", "country_id": "16"}
      ]
    },
    {
      "id": 356,
      "name": "India",
      "state": [
        {"id": 1, "name": "Andaman and Nicobar Islands", "country_id": "356"},
        {"id": 2, "name": "Andhra Pradesh", "country_id": "356"},
        {"id": 3, "name": "Arunachal Pradesh", "country_id": "356"},
        {"id": 4, "name": "Assam", "country_id": "356"},
        {"id": 5, "name": "Bihar", "country_id": "356"},
        {"id": 6, "name": "Chandigarh", "country_id": "356"},
        {"id": 7, "name": "Chhattisgarh", "country_id": "356"},
        {"id": 8, "name": "Dadra and Nagar Haveli", "country_id": "356"},
        {"id": 9, "name": "Daman and Diu", "country_id": "356"},
        {"id": 10, "name": "Delhi", "country_id": "356"},
        {"id": 11, "name": "Goa", "country_id": "356"},
        {"id": 12, "name": "Gujarat", "country_id": "356"},
        {"id": 13, "name": "Haryana", "country_id": "356"},
        {"id": 14, "name": "Himachal Pradesh", "country_id": "356"},
        {"id": 15, "name": "Jammu and Kashmir", "country_id": "356"},
        {"id": 16, "name": "Jharkhand", "country_id": "356"},
        {"id": 17, "name": "Karnataka", "country_id": "356"},
        {"id": 18, "name": "Kenmore", "country_id": "356"},
        {"id": 19, "name": "Kerala", "country_id": "356"}
      ]
    },
    {
      "id": 20,
      "name": "Andorra",
      "state": [
        {
          "id": 168,
          "name": "Andorra la Vella",
          "country_id": "20",
        },
        {"id": 169, "name": "Canillo", "country_id": "20"},
        {"id": 170, "name": "Encamp", "country_id": "20"},
        {"id": 171, "name": "La Massana", "country_id": "20"},
        {"id": 172, "name": "Les Escaldes", "country_id": "20"},
        {"id": 173, "name": "Ordino", "country_id": "20"},
        {"id": 174, "name": "Sant Julia de Loria", "country_id": "20"}
      ]
    }
  ];

  List stateList = [
    {"id": 1, "title": "Maharashtra"},
    {"id": 2, "title": "Gujarat"},
    {"id": 3, "title": "Delhi"},
    {"id": 4, "title": "Rajasthan"},
    {"id": 5, "title": "Madhya Pradesh"},
    {"id": 6, "title": "Punjab"},
  ];

  List type = [
    {
      "id": 1,
      "title": "Discount (%)",
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:22:08.000000Z",
      "updated_at": "2023-10-04T11:22:08.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 1, "original_url": eSvgAssets.ac}
      ]
    },
    {
      "id": 2,
      "title": "Discount (€)",
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:21:38.000000Z",
      "updated_at": "2023-10-04T11:21:38.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 2, "original_url": eSvgAssets.cleaning}
      ]
    },
    {
      "id": 12,
      "title": "Free Gift",
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:20:52.000000Z",
      "updated_at": "2023-10-04T11:20:52.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 29, "original_url": eSvgAssets.carpenter}
      ]
    },
    {
      "id": 11,
      "title": "Buy and Get",
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T06:36:29.000000Z",
      "updated_at": "2023-10-04T06:36:29.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 28, "original_url": eSvgAssets.cooking}
      ]
    },
    {
      "id": 6,
      "title": "Volume discount",
      "description": "Cooking",
      "parent_id": null,
      "created_at": "2023-09-25T13:18:33.000000Z",
      "updated_at": "2023-09-25T13:18:33.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 27, "original_url": eSvgAssets.electrician}
      ]
    },
  ];
  List categoryList = [
    {
      "id": 1,
      "title": appFonts.acRepair,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:22:08.000000Z",
      "updated_at": "2023-10-04T11:22:08.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 1, "original_url": eSvgAssets.ac}
      ]
    },
    {
      "id": 2,
      "title": appFonts.cleaning,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:21:38.000000Z",
      "updated_at": "2023-10-04T11:21:38.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 2, "original_url": eSvgAssets.cleaning}
      ]
    },
    {
      "id": 12,
      "title": appFonts.carpenter,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:20:52.000000Z",
      "updated_at": "2023-10-04T11:20:52.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 29, "original_url": eSvgAssets.carpenter}
      ]
    },
    {
      "id": 11,
      "title": appFonts.cooking,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T06:36:29.000000Z",
      "updated_at": "2023-10-04T06:36:29.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 28, "original_url": eSvgAssets.cooking}
      ]
    },
    {
      "id": 6,
      "title": appFonts.electrician,
      "description": "Cooking",
      "parent_id": null,
      "created_at": "2023-09-25T13:18:33.000000Z",
      "updated_at": "2023-09-25T13:18:33.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 27, "original_url": eSvgAssets.electrician}
      ]
    },
    {
      "id": 5,
      "title": appFonts.painter,
      "description": "Carpenter",
      "parent_id": null,
      "created_at": "2023-09-25T13:17:35.000000Z",
      "updated_at": "2023-09-25T13:17:35.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 26, "original_url": eSvgAssets.painter}
      ]
    },
    {
      "id": 4,
      "title": appFonts.plumber,
      "description": "Cleaning",
      "parent_id": null,
      "created_at": "2023-09-25T13:12:45.000000Z",
      "updated_at": "2023-09-25T13:12:45.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 25, "original_url": eSvgAssets.plumber}
      ]
    },
    {
      "id": 3,
      "title": appFonts.salon,
      "description": "Ac Repair",
      "parent_id": null,
      "created_at": "2023-09-25T13:11:16.000000Z",
      "updated_at": "2023-09-25T13:11:16.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 24, "original_url": eSvgAssets.salon}
      ]
    },
    {
      "id": 1,
      "title": appFonts.acRepair,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:22:08.000000Z",
      "updated_at": "2023-10-04T11:22:08.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 1, "original_url": eSvgAssets.ac}
      ]
    },
    {
      "id": 2,
      "title": appFonts.cleaning,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:21:38.000000Z",
      "updated_at": "2023-10-04T11:21:38.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 2, "original_url": eSvgAssets.cleaning}
      ]
    },
    {
      "id": 12,
      "title": appFonts.carpenter,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:20:52.000000Z",
      "updated_at": "2023-10-04T11:20:52.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 29, "original_url": eSvgAssets.carpenter}
      ]
    },
    {
      "id": 11,
      "title": appFonts.cooking,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T06:36:29.000000Z",
      "updated_at": "2023-10-04T06:36:29.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 28, "original_url": eSvgAssets.cooking}
      ]
    },
    {
      "id": 6,
      "title": appFonts.electrician,
      "description": "Cooking",
      "parent_id": null,
      "created_at": "2023-09-25T13:18:33.000000Z",
      "updated_at": "2023-09-25T13:18:33.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 27, "original_url": eSvgAssets.electrician}
      ]
    },
    {
      "id": 5,
      "title": appFonts.painter,
      "description": "Carpenter",
      "parent_id": null,
      "created_at": "2023-09-25T13:17:35.000000Z",
      "updated_at": "2023-09-25T13:17:35.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 26, "original_url": eSvgAssets.painter}
      ]
    },
    {
      "id": 4,
      "title": appFonts.plumber,
      "description": "Cleaning",
      "parent_id": null,
      "created_at": "2023-09-25T13:12:45.000000Z",
      "updated_at": "2023-09-25T13:12:45.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 25, "original_url": eSvgAssets.plumber}
      ]
    },
    {
      "id": 3,
      "title": appFonts.salon,
      "description": "Ac Repair",
      "parent_id": null,
      "created_at": "2023-09-25T13:11:16.000000Z",
      "updated_at": "2023-09-25T13:11:16.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 24, "original_url": eSvgAssets.salon}
      ]
    }
  ];

  List blogFilterList = [
    {
      "id": 1,
      "title": appFonts.acRepair,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:22:08.000000Z",
      "updated_at": "2023-10-04T11:22:08.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 1, "original_url": eSvgAssets.ac}
      ]
    },
    {
      "id": 2,
      "title": appFonts.cleaning,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:21:38.000000Z",
      "updated_at": "2023-10-04T11:21:38.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 2, "original_url": eSvgAssets.cleaning}
      ]
    },
    {
      "id": 12,
      "title": appFonts.carpenter,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T11:20:52.000000Z",
      "updated_at": "2023-10-04T11:20:52.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 29, "original_url": eSvgAssets.carpenter}
      ]
    },
    {
      "id": 11,
      "title": appFonts.cooking,
      "description": null,
      "parent_id": null,
      "created_at": "2023-10-04T06:36:29.000000Z",
      "updated_at": "2023-10-04T06:36:29.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 28, "original_url": eSvgAssets.cooking}
      ]
    },
    {
      "id": 6,
      "title": appFonts.electrician,
      "description": "Cooking",
      "parent_id": null,
      "created_at": "2023-09-25T13:18:33.000000Z",
      "updated_at": "2023-09-25T13:18:33.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 27, "original_url": eSvgAssets.electrician}
      ]
    },
    {
      "id": 5,
      "title": appFonts.painter,
      "description": "Carpenter",
      "parent_id": null,
      "created_at": "2023-09-25T13:17:35.000000Z",
      "updated_at": "2023-09-25T13:17:35.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 26, "original_url": eSvgAssets.painter}
      ]
    },
    {
      "id": 4,
      "title": appFonts.plumber,
      "description": "Cleaning",
      "parent_id": null,
      "created_at": "2023-09-25T13:12:45.000000Z",
      "updated_at": "2023-09-25T13:12:45.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 25, "original_url": eSvgAssets.plumber}
      ]
    },
    {
      "id": 3,
      "title": appFonts.salon,
      "description": "Ac Repair",
      "parent_id": null,
      "created_at": "2023-09-25T13:11:16.000000Z",
      "updated_at": "2023-09-25T13:11:16.000000Z",
      "deleted_at": null,
      "media": [
        {"id": 24, "original_url": eSvgAssets.salon}
      ]
    },
  ];

  var ratingList = [
    {"rate": appFonts.fiveRate, "icon": eSvgAssets.star5, "value": 5},
    {"rate": appFonts.fourRate, "icon": eSvgAssets.star4, "value": 4},
    {"rate": appFonts.threeRate, "icon": eSvgAssets.star3, "value": 3},
    {"rate": appFonts.twoRate, "icon": eSvgAssets.star2, "value": 2},
    {"rate": appFonts.oneRate, "icon": eSvgAssets.star1, "value": 1},
  ];

  var filterList = [appFonts.category, appFonts.rating, appFonts.distance];
  var favList = ["Offers", "Businesses", "Attractions"];

  var filterList1 = [appFonts.category, appFonts.type, appFonts.distance];

  List experienceList = [
    {
      "id": 0,
      "title": appFonts.highestExperience,
    },
    {"id": 1, "title": appFonts.lowestExperience},
    {"id": 2, "title": appFonts.highestServed},
    {"id": 3, "title": appFonts.lowestServed},
  ];

  List providerExpList = [
    {
      "id": 14,
      "name": "Heidi Russo",
      "served": "105",
      "experience_interval": "years",
      "experience_duration": "8",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Stella Milevski",
      "served": "141",
      "experience_interval": "years",
      "experience_duration": "7",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Kurt Bates",
      "served": "142",
      "experience_interval": "years",
      "experience_duration": "5.5",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Rhonda Rhodes",
      "served": "30",
      "experience_interval": "years",
      "experience_duration": "5",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Ricky Smith",
      "served": "50",
      "experience_interval": "years",
      "experience_duration": "4.5",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Victoria Popa",
      "served": "50",
      "experience_interval": "years",
      "experience_duration": "4.5",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Kierra Lubin",
      "served": "80",
      "experience_interval": "years",
      "experience_duration": "3",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Arlene McCoy",
      "served": "80",
      "experience_interval": "years",
      "experience_duration": "4",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Kierra Lubi",
      "served": "80",
      "experience_interval": "years",
      "experience_duration": "4",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
    {
      "id": 14,
      "name": "Kierra Lubi",
      "served": "80",
      "experience_interval": "years",
      "experience_duration": "4",
      "media": [
        {"id": 17, "original_url": eImageAssets.p1}
      ]
    },
  ];

  var servicesImageList = [
    eImageAssets.servicesImage,
    eImageAssets.s1,
    eImageAssets.s2
  ];

  var reviewRating = [
    {
      "star": appFonts.star5,
      "percentage": "84",
    },
    {
      "star": appFonts.star4,
      "percentage": "9",
    },
    {
      "star": appFonts.star3,
      "percentage": "4",
    },
    {
      "star": appFonts.star2,
      "percentage": "2",
    },
    {
      "star": appFonts.star1,
      "percentage": "1",
    },
  ];

  List reviewLowHighList = [
    {"id": 0, "title": appFonts.lowestRate},
    {"id": 1, "title": appFonts.highestRate},
  ];

  var servicemanChooseList = [
    appFonts.letAppChoose,
    appFonts.selectServicemenAs
  ];

  var selectList = [
    {"image": eSvgAssets.gallery, "title": "Choose From Gallery"},
    {"image": eSvgAssets.camera, "title": "Open Camera"}
  ];

  List monthList = [
    {"title": "January", "index": 1},
    {"title": "February", "index": 2},
    {"title": "March", "index": 3},
    {"title": "April", "index": 4},
    {"title": "May", "index": 5},
    {"title": "June", "index": 6},
    {"title": "July", "index": 7},
    {"title": "August", "index": 8},
    {"title": "September", "index": 9},
    {"title": "October", "index": 10},
    {"title": "November", "index": 11},
    {"title": "December", "index": 12}
  ];

  List<String> hourList = List.generate(12, (index) {
    DateTime time = DateTime.now().add(Duration(hours: index));
    String formattedTime = DateFormat('hh').format(time);
    return formattedTime;
  });

  List<String> minList = List.generate(60, (index) {
    DateTime time = DateTime.now().add(Duration(minutes: index));
    String formattedTime = DateFormat('mm').format(time);
    // log("$time:::::::$formattedTime");
    return formattedTime;
  });

  List<String> dayList = List.generate(2, (index) {
    DateTime time = DateTime.now().add(Duration(days: index));
    String formattedTime = DateFormat('a').format(time);
    // log("$time:::::::$formattedTime");
    return formattedTime;
  });

  var amPmList = ["AM", "PM"];

  var timeSlotsList = [
    "1:00",
    "2:30",
    "2:50",
    "3:00",
    "4:15",
    "4:30",
    "4:55",
    "5:15",
    "5:20",
    "5:35",
    "6:25",
    "7:15",
    "7:30",
  ];

  var recentSearch = [
    {
      "id": 4,
      "title": appFonts.cleaningBathroom,
      "price": "40.56",
      "status": "1",
      "duration": "00:30",
      "distance": "2 km",
      "duration_unit": "minute",
      "service_rate": "30",
      "discount": "10.00",
      "description": "Restaurants",
      "user_id": "2",
      "required_servicemen": "1",
      "created_by_id": "1",
      "review_ratings": [0, 0, 0, 0, 1],
      "total_review_ratings": 81,
      "rating_count": 5,
      "isFav": true,
      "phoneNum": '+30 210 4652115',
      "location": "Ag.Nikolaou 11, 18900",
      "media": [
        {"id": 34, "original_url": eImageAssets.fs1}
      ],
      "user": {
        "id": 2,
        "name": "Belair All Day Bar And Resto",
        "email": "provider@example.com",
        "served": "3",
        "phone": "3696566666",
        "code": "93",
        "provider_id": null,
        "experience_interval": "year",
        "experience_duration": "5",
        "description": "Loren Description",
        "review_ratings": 5,
        "media": [
          {"id": 1, "original_url": eImageAssets.fsProfile1}
        ],
      }
    },
    {
      "id": 3,
      "title": "",
      "price": "15.23",
      "status": "1",
      "duration": "02:00",
      "duration_unit": "hour",
      "distance": "0.5 km",
      "service_rate": "15.23",
      "discount": "Free Drink",
      "description": "Restaurants",
      "user_id": "2",
      "required_servicemen": "1",
      "review_ratings": [0, 0, 0, 0, 0],
      "total_review_ratings": 810,
      "rating_count": 3,
      "isFav": false,
      "phoneNum": '+30 210 4657587',
      "location": "Akti Karaiskaki 56, Salamina 189 00",
      "media": [
        {
          "id": 32,
          "original_url": eImageAssets.fs2,
        }
      ],
      "user": {
        "id": 2,
        "name": "Ouzeri Paralia",
        "email": "provider@example.com",
        "served": "3",
        "phone": "9537670615",
        "code": "93",
        "provider_id": null,
        "experience_interval": "year",
        "experience_duration": "5",
        "created_by": null,
        "description": "Loren Description",
        "review_ratings": 5,
        "ServicemanReviewRatings": null,
        "media": [
          {"id": 1, "original_url": eImageAssets.fsProfile2}
        ]
      }
    }
  ];

  var cartList = [
    {
      "isPackage": false,
      "servicePackageList": null,
      "serviceList": {
        "id": 4,
        "title": "Ac cleaning service",
        "price": "22.00",
        "service_rate": "30",
        "discount": "10",
        "user_id": "2",
        "required_servicemen": "1",
        "selectServiceManType": "app_choose",
        "serviceDate": "2024-01-25T18:30:00.000Z",
        "rating_count": 5,
        "selectedRequiredServiceMan": "1",
        "selectDateTimeOption": "custom",
        "selectedDateTimeFormat": "AM",
        "selectedServiceNote": "",
        "user": {
          "name": "Kurt Bates",
          "review_ratings": 3.0,
          "media": [
            {"id": 1, "original_url": eImageAssets.fr}
          ],
        },
        "media": [
          {"id": 1, "original_url": eImageAssets.servicesImage}
        ],
      },
    },
    {
      "isPackage": false,
      "servicePackageList": null,
      "serviceList": {
        "id": 5,
        "title": "Furnishing & carpentry",
        "price": "15.23",
        "service_rate": "15.23",
        "discount": "10",
        "user_id": "2",
        "required_servicemen": "1",
        "selectServiceManType": "as_per_my_choice",
        "serviceDate": "2024-01-25T18:30:00.000Z",
        "rating_count": 4,
        "selectedRequiredServiceMan": "1",
        "selectDateTimeOption": "custom",
        "selectedDateTimeFormat": "PM",
        "selectedServiceNote": "",
        "user": {
          "name": "Kurt Bates",
          "review_ratings": 4.0,
          "media": [
            {"id": 1, "original_url": eImageAssets.fsProfile2}
          ],
        },
        "media": [
          {"id": 1, "original_url": eImageAssets.fs2}
        ],
      },
    },
    {
      "isPackage": true,
      "serviceList": null,
      "servicePackageList": {
        "id": 1,
        "title": "Cleaning package",
        "price": "15.23",
        "discount": "",
        "provider_id": "2",
        "services": [
          {
            "id": 2,
            "title": "Ac cleaning servicemen",
            "price": "30.00",
            "selectServiceManType": "app_choose",
            "selectedRequiredServiceMan": "1",
            "required_servicemen": "1",
            "serviceDate": "2024-01-25T18:30:00.000Z",
            "user": {
              "name": "Kurt Bates",
              "review_ratings": 4.0,
              "media": [
                {"id": 1, "original_url": eImageAssets.fsProfile2}
              ],
            },
          },
          {
            "id": 1,
            "title": "Ac cleaning servicemen",
            "price": "30.00",
            "selectServiceManType": "as_per_my_choice",
            "selectedRequiredServiceMan": "2",
            "required_servicemen": "2",
            "serviceDate": "2024-01-25T18:30:00.000Z"
          }
        ],
        "selectedServiceMan": [
          {
            "name": "Templeton Peck",
            "provider_id": 2,
            "review_ratings": 3.5,
            "media": [
              {"id": 53, "original_url": eImageAssets.es1}
            ]
          },
          {
            "name": "Templeton Peck",
            "provider_id": 2,
            "review_ratings": 3.5,
            "media": [
              {"id": 53, "original_url": eImageAssets.es1}
            ]
          }
        ],
        "user": {
          "name": "Kurt Bates",
          "review_ratings": 4.0,
          "media": [
            {"id": 1, "original_url": eImageAssets.es1}
          ],
        }
      },
      "servicesList": null,
    }
  ];

  var couponList = [
    {
      "id": 1,
      "validTill": "Mon-Fri only",
      "code": "#A125",
      "type": "percentage",
      "subTitle": "Get 5% off all cocktails before midnight",
      "amount": "5% OFF",
      "min_spend": 150,
      "is_unlimited": 1,
      "usage_per_coupon": null,
      "usage_per_customer": null,
      "used": "0",
      "status": 1,
      "is_expired": 0,
      "is_apply_all": 1,
      "is_first_order": 0,
      "start_date": null,
      "end_date": null,
      "created_by_id": "1",
      "created_at": "2023-12-06T11:33:29.000000Z",
      "updated_at": "2023-12-06T11:33:29.000000Z",
      "deleted_at": null,
      "services": [],
      "exclude_services": [],
      "icon": "assets/images/coupon1.png",
      "title": "Sparrow Coffee & Sweets"
    },
    {
      "id": 2,
      "validTill": "13th Aug, 2025",
      "code": "#A126",
      "type": "percentage",
      "subTitle": "Book 1 night and get 1 free breakfast",
      "amount": "Buy 1 Get 1",
      "min_spend": 300,
      "is_unlimited": 1,
      "usage_per_coupon": null,
      "usage_per_customer": null,
      "used": "0",
      "status": 1,
      "is_expired": 1,
      "is_apply_all": 1,
      "is_first_order": 0,
      "start_date": "2023-10-05",
      "end_date": "2023-10-15",
      "created_by_id": "1",
      "created_at": "2023-10-05T06:48:26.000000Z",
      "updated_at": "2023-10-05T06:48:26.000000Z",
      "deleted_at": null,
      "services": [],
      "exclude_services": [],
      "icon": "assets/images/coupon2.png",
      "title": "All About Coffee"
    },
    {
      "id": 3,
      "validTill": "30 Jun, 2025",
      "code": "#A127",
      "type": "percentage",
      "subTitle": "Get 10€ off your dinner when you send a min of 100€.",
      "amount": "10€ OFF",
      "min_spend": 300,
      "is_unlimited": 1,
      "usage_per_coupon": null,
      "usage_per_customer": null,
      "used": "0",
      "status": 1,
      "is_expired": 0,
      "is_apply_all": 0,
      "is_first_order": 0,
      "start_date": null,
      "end_date": null,
      "created_by_id": "1",
      "created_at": "2023-09-08T17:13:16.000000Z",
      "updated_at": "2023-09-08T17:13:16.000000Z",
      "deleted_at": null,
      "services": [],
      "exclude_services": [],
      "icon": "assets/images/c3.png",
      "title": "Ouzeri Paralia"
    },
    {
      "id": 4,
      "validTill": "13th Aug, 2023",
      "code": "#A129",
      "type": "percentage",
      "subTitle": "Get free soft drink for every mix grill you order",
      "amount": "FREE GIFT",
      "min_spend": 400,
      "is_unlimited": 1,
      "usage_per_coupon": null,
      "usage_per_customer": null,
      "used": "0",
      "status": 1,
      "is_expired": 0,
      "is_apply_all": 0,
      "is_first_order": 0,
      "start_date": null,
      "end_date": null,
      "created_by_id": "1",
      "created_at": "2023-09-08T17:13:16.000000Z",
      "updated_at": "2023-09-08T17:13:16.000000Z",
      "deleted_at": null,
      "services": [],
      "exclude_services": [],
      "icon": "assets/images/c4.png",
      "title": "Hot Island Beach Bar"
    }
  ];

  // var paymentMethodList = [
  //   {
  //     "image": eSvgAssets.wallet,
  //     "title": appFonts.wallet,
  //     "value": appFonts.wallet
  //   },
  //   {
  //     "image": eSvgAssets.wallet,
  //     "title": appFonts.paypal,
  //     "value": appFonts.paypal
  //   },
  //   {
  //     "image": eSvgAssets.razorpay,
  //     "title": appFonts.razorPay,
  //     "value": appFonts.wallet
  //   },
  //   {
  //     "image": eSvgAssets.stripe,
  //     "title": appFonts.stripe,
  //     "value": appFonts.wallet
  //   },
  //   {
  //     "image": eSvgAssets.visa,
  //     "title": appFonts.mastercardVisa,
  //     "value": appFonts.wallet
  //   },
  //   {
  //     "image": eSvgAssets.cash,
  //     "title": appFonts.payOnHold,
  //     "value": appFonts.onHand
  //   },
  // ];

  // var paymentGatewayList = [
  //   {"id": 0, "title": appFonts.razorPay, 'icon': eSvgAssets.razorpay},
  //   {"id": 1, "title": appFonts.stripe, 'icon': eSvgAssets.stripe}
  // ];

  var servicemanList = [
    {
      "id": 1,
      "name": "Templeton Peck",
      "provider_id": "2",
      "experience_interval": "years",
      "experience_duration": "2",
      "review_ratings": 3.5,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
    {
      "id": 2,
      "name": "Lynn Tanner",
      "provider_id": "3",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
    {
      "id": 3,
      "name": "Kate Tanner",
      "provider_id": "1",
      "experience_interval": "years",
      "experience_duration": "5",
      "review_ratings": 3.5,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
    {
      "id": 4,
      "name": "Murdock",
      "provider_id": "2",
      "experience_interval": "years",
      "experience_duration": "1",
      "review_ratings": 3,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
    {
      "id": 5,
      "name": "Theodore Calvin",
      "provider_id": "2",
      "experience_interval": "months",
      "experience_duration": "6",
      "review_ratings": 3,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
    {
      "id": 6,
      "name": "Willie Tanner",
      "provider_id": "2",
      "experience_interval": "years",
      "experience_duration": "2",
      "review_ratings": 3,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
    {
      "id": 7,
      "name": "Michael Knight",
      "provider_id": "2",
      "experience_interval": "years",
      "experience_duration": "1.5",
      "review_ratings": 3,
      "media": [
        {"id": 53, "original_url": eImageAssets.es1}
      ],
    },
  ];

  var jobExperienceList = [
    {
      "id": 0,
      "title": appFonts.highestExperience,
    },
    {"id": 1, "title": appFonts.lowestExperience},
  ];

  var expertiseList = [
    appFonts.acRepair,
    appFonts.carpenter,
    appFonts.cleaning,
  ];

  List includedServiceList = [
    {
      "title": "Ac cleaning service",
      "image": eImageAssets.es1,
      "price": "12.14",
      "rate": "3.0",
      "time": "30 mins",
      "servicemanRequired": "1",
      "desc": "Foam jet technology removes dust 2x deeper."
    },
    {
      "title": "Bathroom cleaning",
      "image": eImageAssets.es2,
      "price": "30.25",
      "rate": "4.0",
      "time": "30 mins",
      "servicemanRequired": "2",
      "desc": "Get the best and most durable wooden furniture.",
    },
  ];

  var servicePackageList = [
    {
      "id": 2,
      "title": "Cleaning package",
      "price": "20.05",
      "description":
          "As a servicemember, I believe I am capable of problem solving. I too face a variety of obstacles at work and must develop effective solutions to ensure client satisfaction.",
      "hexa_code": "#808CFF",
      "provider_id": "2",
      "created_at": "2023-10-05T06:40:30.000000Z",
      "updated_at": "2023-10-05T09:53:20.000000Z",
      "services": [
        {
          "id": 4,
          "title": "Ac cleaning service",
          "price": "12.14",
          "duration": "00:30",
          "duration_unit": "minute",
          "service_rate": "12.14",
          "discount": "10.00",
          "required_servicemen": "1",
          "description": "Foamjet tachnology removes dust 2x deeper.",
          "user_id": "2",
          "review_ratings": [0, 0, 0, 0, 1],
          "rating_count": 5,
          "media": [
            {"id": 34, "original_url": eImageAssets.s1}
          ],
        }
      ],
      "media": [
        {"id": 1, "original_url": eImageAssets.cleaning}
      ],
      "user": {
        "id": 2,
        "name": "Kurt Bates",
        "experience_interval": "year",
        "experience_duration": "5",
        "review_ratings": 5,
        "primary_address": {
          "id": 1,
          "user_id": "2",
          "is_primary": "1",
          "latitude": "21.19859653751037",
          "longitude": "72.79571843878242",
          "area": "Allentown, New Mexico",
          "postal_code": "394110",
          "country_id": "356",
          "state_id": "12",
          "city": "Surat",
          "address": "kim",
          "alternative_name": null,
          "alternative_phone": null,
          "created_at": "2023-09-08T17:01:18.000000Z",
          "updated_at": "2023-09-08T17:01:18.000000Z",
          "deleted_at": null,
          "country": {"id": 356, "name": "India"},
          "state": {"id": 12, "name": "Gujarat"}
        },
        "media": [
          {"original_url": eSvgAssets.c3}
        ],
      }
    },
    {
      "id": 1,
      "title": "Repair package",
      "price": "15.52",
      "description":
          "Service Package, Dusting, sweeping, mopping, and washing floors, toilets, showers, tubs, driveways, windows, and counters. Vacuuming carpets, upholstery, and any other dusty surface. Cleaning all surfaces in the kitchen and bathroom. Making beds and fluffing pillows.",
      "discount": "10.00",
      "status": "1",
      "created_at": "2023-09-09T11:51:08.000000Z",
      "updated_at": "2023-11-17T04:49:25.000000Z",
      "hexa_code": "#FF7456",
      "provider_id": "1",
      "services": [
        {
          "id": 3,
          "title": "Cleaning of bathroom",
          "price": "30.00",
          "status": "1",
          "duration": "02:00",
          "duration_unit": "hour",
          "service_rate": "28.50",
          "discount": "5.00",
          "description": "Foamjet tachnology removes dust 2x deeper.",
          "user_id": "2",
          "type": "fixed",
          "required_servicemen": "2",
          "deleted_at": null,
          "created_at": "2023-10-04T11:43:23.000000Z",
          "updated_at": "2023-11-01T04:44:43.000000Z",
          "review_ratings": [0, 0, 0, 0, 0],
          "rating_count": null,
          "media": [
            {"id": 32, "original_url": eImageAssets.s2}
          ],
          "reviews": []
        },
        {
          "id": 5,
          "title": "Bathroom cleaning",
          "price": "30.25",
          "duration": "05:00",
          "duration_unit": "hour",
          "service_rate": "28.25",
          "discount": "10.00",
          "description":
              "Dusting, sweeping, mopping, and washing floors, toilets, showers, tubs, driveways, windows, and counters. Vacuuming carpets, upholstery, and any other dusty surface. Cleaning all surfaces in the kitchen and bathroom. Making beds and fluffing pillows.",
          "user_id": "5",
          "type": "free",
          "deleted_at": null,
          "created_at": "2023-11-17T04:49:04.000000Z",
          "updated_at": "2023-11-17T04:49:04.000000Z",
          "review_ratings": [0, 0, 0, 0, 0],
          "rating_count": null,
          "media": [
            {"id": 32, "original_url": eImageAssets.fs2}
          ],
          "reviews": []
        }
      ],
      "media": [
        {"id": 52, "original_url": eImageAssets.paint}
      ],
      "user": {
        "id": 2,
        "name": "Provider",
        "experience_interval": "year",
        "experience_duration": "5",
        "review_ratings": 5,
        "primary_address": {
          "id": 1,
          "user_id": "2",
          "service_id": null,
          "is_primary": "1",
          "latitude": "21.19859653751037",
          "longitude": "72.79571843878242",
          "area": "adajan gam",
          "postal_code": "394110",
          "country_id": "356",
          "state_id": "12",
          "city": "Surat",
          "address": "kim",
          "alternative_name": null,
          "alternative_phone": null,
          "created_at": "2023-09-08T17:01:18.000000Z",
          "updated_at": "2023-09-08T17:01:18.000000Z",
          "country": {"id": 356, "name": "India"},
          "state": {"id": 12, "name": "Gujarat"}
        },
        "media": [
          {"id": 1, "original_url": eImageAssets.es1}
        ],
      }
    },
    {
      "id": 1,
      "title": "Repair package",
      "price": "15.52",
      "description":
          "Service Package, Dusting, sweeping, mopping, and washing floors, toilets, showers, tubs, driveways, windows, and counters. Vacuuming carpets, upholstery, and any other dusty surface. Cleaning all surfaces in the kitchen and bathroom. Making beds and fluffing pillows.",
      "discount": "10.00",
      "status": "1",
      "created_at": "2023-09-09T11:51:08.000000Z",
      "updated_at": "2023-11-17T04:49:25.000000Z",
      "hexa_code": "#48BFFD",
      "provider_id": "1",
      "services": [
        {
          "id": 3,
          "title": "Cleaning of bathroom",
          "price": "30.00",
          "status": "1",
          "duration": "02:00",
          "duration_unit": "hour",
          "service_rate": "28.50",
          "discount": "5.00",
          "description": "Foamjet tachnology removes dust 2x deeper.",
          "user_id": "2",
          "type": "fixed",
          "required_servicemen": "2",
          "deleted_at": null,
          "created_at": "2023-10-04T11:43:23.000000Z",
          "updated_at": "2023-11-01T04:44:43.000000Z",
          "review_ratings": [0, 0, 0, 0, 0],
          "rating_count": null,
          "media": [
            {"id": 32, "original_url": eImageAssets.s2}
          ],
          "reviews": []
        },
        {
          "id": 5,
          "title": "Bathroom cleaning",
          "price": "30.25",
          "duration": "05:00",
          "duration_unit": "hour",
          "service_rate": "28.25",
          "discount": "10.00",
          "description":
              "Dusting, sweeping, mopping, and washing floors, toilets, showers, tubs, driveways, windows, and counters. Vacuuming carpets, upholstery, and any other dusty surface. Cleaning all surfaces in the kitchen and bathroom. Making beds and fluffing pillows.",
          "user_id": "5",
          "type": "free",
          "deleted_at": null,
          "created_at": "2023-11-17T04:49:04.000000Z",
          "updated_at": "2023-11-17T04:49:04.000000Z",
          "review_ratings": [0, 0, 0, 0, 0],
          "rating_count": null,
          "media": [
            {"id": 32, "original_url": eImageAssets.fs2}
          ],
          "reviews": []
        }
      ],
      "media": [
        {"id": 52, "original_url": eImageAssets.fire}
      ],
      "user": {
        "id": 2,
        "name": "Provider",
        "experience_interval": "year",
        "experience_duration": "5",
        "review_ratings": 5,
        "primary_address": {
          "id": 1,
          "user_id": "2",
          "service_id": null,
          "is_primary": "1",
          "latitude": "21.19859653751037",
          "longitude": "72.79571843878242",
          "area": "adajan gam",
          "postal_code": "394110",
          "country_id": "356",
          "state_id": "12",
          "city": "Surat",
          "address": "kim",
          "alternative_name": null,
          "alternative_phone": null,
          "created_at": "2023-09-08T17:01:18.000000Z",
          "updated_at": "2023-09-08T17:01:18.000000Z",
          "country": {"id": 356, "name": "India"},
          "state": {"id": 12, "name": "Gujarat"}
        },
        "media": [
          {"id": 1, "original_url": eImageAssets.es1}
        ],
      }
    }
  ];

  var bookingList = [
    {
      "id": 18,
      "parent_id": "17",
      "booking_number": "#58961",
      "consumer_id": 19,
      "coupon_total_discount": 10,
      "required_servicemen": "1",
      "total_extra_servicemen": "0",
      "total_servicemen": "0",
      "total_extra_servicemen_charge": "0.00",
      "subtotal": "25.23",
      "service_package_id": null,
      "total": 23.63,
      "date_time": "2024-02-22 10:28:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "created_by_id": 19,
      "provider": {
        "id": 11,
        "name": "Arlene McCoy",
        "review_ratings": 3.5,
        "primary_address": {
          "id": 7,
          "user_id": "11",
          "service_id": null,
          "is_primary": "1",
          "latitude": "21.19860",
          "longitude": "72.79572",
          "area": "Nihil repudiandae er",
          "postal_code": "200000",
          "country_id": "392",
          "state_id": "1857",
          "city": "Kolkata",
          "address": "Dolores est in eos",
          "type": "home",
          "alternative_name": "Demo Alternative Name",
          "code": "91",
          "alternative_phone": "9635689745",
          "created_at": "2024-01-26T20:35:57.000000Z",
          "updated_at": "2024-01-26T20:35:57.000000Z",
          "deleted_at": null,
          "company_id": null,
          "availability_radius": null,
          "country": {"id": 392, "name": "Japan"},
          "state": {"id": 1857, "name": "Hyogo"}
        },
        "media": [
          {"id": 43, "original_url": eImageAssets.fsProfile1}
        ],
      },
      "service": {
        "id": 4,
        "title": "Curtain cleaning",
        "service_rate": "450.00",
        "media": [
          {"id": 41, "original_url": eImageAssets.fs1}
        ],
        "reviews": []
      },
      "servicemen": [],
      "coupon": null,
      "booking_status": {"id": 1, "name": "pending"},
      "address": {
        "id": 21,
        "user_id": "19",
        "country": {"id": 4, "name": "California"},
        "state": {"id": 42, "name": "USA"}
      }
    },
    {
      "id": 18,
      "parent_id": "17",
      "booking_number": "#58961",
      "consumer_id": 19,
      "coupon_total_discount": 10,
      "required_servicemen": "1",
      "total_extra_servicemen": "0",
      "total_servicemen": "0",
      "total_extra_servicemen_charge": "0.00",
      "subtotal": "25.23",
      "service_package_id": null,
      "total": 23.63,
      "date_time": "2024-02-22 10:28:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "created_by_id": 19,
      "provider": {
        "id": 11,
        "name": "Arlene McCoy",
        "review_ratings": 3.5,
        "primary_address": {
          "id": 7,
          "user_id": "11",
          "service_id": null,
          "is_primary": "1",
          "latitude": "21.19860",
          "longitude": "72.79572",
          "area": "Nihil repudiandae er",
          "postal_code": "200000",
          "country_id": "392",
          "state_id": "1857",
          "city": "Kolkata",
          "address": "Dolores est in eos",
          "type": "home",
          "alternative_name": "Demo Alternative Name",
          "code": "91",
          "alternative_phone": "9635689745",
          "created_at": "2024-01-26T20:35:57.000000Z",
          "updated_at": "2024-01-26T20:35:57.000000Z",
          "deleted_at": null,
          "company_id": null,
          "availability_radius": null,
          "country": {"id": 392, "name": "Japan"},
          "state": {"id": 1857, "name": "Hyogo"}
        },
        "media": [
          {"id": 43, "original_url": eImageAssets.fsProfile1}
        ],
      },
      "service": {
        "id": 4,
        "title": "Curtain cleaning",
        "service_rate": "450.00",
        "media": [
          {"id": 41, "original_url": eImageAssets.es1}
        ],
        "reviews": []
      },
      "servicemen": [
        {
          "id": 16,
          "name": "Nolan Westervelt",
          "review_ratings": 3.0,
          "media": [
            {"id": 23, "original_url": eImageAssets.es1}
          ],
        },
        {
          "id": 17,
          "name": "Kate Tanner",
          "review_ratings": 3.5,
          "media": [
            {"id": 23, "original_url": eImageAssets.es3}
          ],
        }
      ],
      "coupon": null,
      "booking_status": {"id": 1, "name": "pending"},
      "address": {
        "id": 21,
        "user_id": "19",
        "country": {"id": 4, "name": "California"},
        "state": {"id": 42, "name": "USA"}
      }
    },
    {
      "id": 19,
      "parent_id": "17",
      "booking_number": "#25636",
      "consumer_id": 19,
      "service_package_id": null,
      "per_serviceman_charge": "332.50",
      "coupon_total_discount": 10,
      "required_servicemen": "2",
      "total_extra_servicemen": "0",
      "total_servicemen": "2",
      "total_extra_servicemen_charge": "665.00",
      "subtotal": "30.25",
      "total": 698.25,
      "date_time": "2024-02-23 10:17:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "created_by_id": 19,
      "provider": {
        "id": 12,
        "name": "Kierra Lubin",
        "review_ratings": 3.0,
        "media": [
          {"id": 13, "original_url": eImageAssets.fr}
        ]
      },
      "service": {
        "id": 5,
        "title": "House hold cook",
        "media": [
          {"id": 42, "original_url": eImageAssets.fs2}
        ],
      },
      "servicemen": [
        {
          "id": 16,
          "name": "Kate Tanner",
          "review_ratings": 4.0,
          "media": [
            {"id": 23, "original_url": eImageAssets.es1}
          ],
        }
      ],
      "coupon": null,
      "booking_status": {"id": 1, "name": "accepted"},
      "address": {
        "id": 21,
        "user_id": "19",
        "country": {"id": 4, "name": "Afghanistan"},
        "state": {"id": 42, "name": "Badakhshan"}
      },
      "booking_reasons": []
    },
    {
      "id": 7,
      "parent_id": "6",
      "booking_number": "#85962",
      "consumer_id": 19,
      "service_package_id": null,
      "coupon_total_discount": 15,
      "required_servicemen": "2",
      "total_extra_servicemen": "0",
      "total_servicemen": "2",
      "total_extra_servicemen_charge": "450.00",
      "subtotal": "15.23",
      "total": 472.5,
      "date_time": "2024-03-15 04:14:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "provider": {
        "id": 4,
        "name": "Kierra Lubin",
        "review_ratings": 3.0,
        "media": [
          {"id": 54, "original_url": eImageAssets.fr}
        ],
        "wallet": null,
        "known_languages": [],
        "expertise": [],
        "reviews": [],
        "servicemanreviews": []
      },
      "service": {
        "id": 6,
        "title": "Hair spa & color",
        "rating_count": null,
        "media": [
          {"id": 54, "original_url": eImageAssets.fr}
        ],
      },
      "servicemen": [
        {
          "id": 16,
          "name": "Nolan Westervelt",
          "review_ratings": 3.0,
          "media": [
            {"id": 23, "original_url": eImageAssets.fr}
          ],
        },
        {
          "id": 17,
          "name": "Kate Tanner",
          "review_ratings": 3.5,
          "media": [
            {"id": 23, "original_url": eImageAssets.es3}
          ],
        }
      ],
      "booking_status": {"id": 1, "name": "ongoing"},
      "booking_status_logs": [
        {
          "id": 4,
          "title": "Pending booking request",
          "description": "New booking is added.",
          "booking_id": "7",
          "booking_status_id": "1",
          "status": {
            "id": 1,
            "name": "pending",
            "slug": "pending",
            "sequence": "1",
            "description": null,
            "created_by_id": "1",
            "system_reserve": "1",
            "hexa_code": "#FDB448",
            "status": 1,
          }
        }
      ],
      "address": {
        "id": 19,
        "user_id": null,
        "country": {"id": 356, "name": "India"},
        "state": {"id": 1, "name": "Andaman and Nicobar Islands"}
      },
      "booking_reasons": []
    },
    {
      "id": 7,
      "parent_id": "6",
      "booking_number": "#85962",
      "consumer_id": 19,
      "service_package_id": null,
      "coupon_total_discount": 15,
      "required_servicemen": "2",
      "total_extra_servicemen": "0",
      "total_servicemen": "2",
      "total_extra_servicemen_charge": "450.00",
      "subtotal": "15.23",
      "total": 472.5,
      "date_time": "2024-03-15 04:14:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "provider": {
        "id": 4,
        "name": "Kierra Lubin",
        "review_ratings": 3.0,
        "media": [
          {"id": 54, "original_url": eImageAssets.fr}
        ],
        "wallet": null,
        "known_languages": [],
        "expertise": [],
        "reviews": [],
        "servicemanreviews": []
      },
      "service": {
        "id": 6,
        "title": "Hair spa & color",
        "rating_count": null,
        "media": [
          {"id": 54, "original_url": eImageAssets.fr}
        ],
      },
      "servicemen": [
        {
          "id": 16,
          "name": "Nolan Westervelt",
          "review_ratings": 3.0,
          "media": [
            {"id": 23, "original_url": eImageAssets.fr}
          ],
        },
        {
          "id": 17,
          "name": "Kate Tanner",
          "review_ratings": 3.5,
          "media": [
            {"id": 23, "original_url": eImageAssets.es3}
          ],
        }
      ],
      "booking_status": {"id": 1, "name": "ontheway"},
      "booking_status_logs": [
        {
          "id": 4,
          "title": "Pending booking request",
          "description": "New booking is added.",
          "booking_id": "7",
          "booking_status_id": "1",
          "status": {
            "id": 1,
            "name": "pending",
            "slug": "pending",
            "sequence": "1",
            "description": null,
            "created_by_id": "1",
            "system_reserve": "1",
            "hexa_code": "#FDB448",
            "status": 1,
          }
        }
      ],
      "address": {
        "id": 19,
        "user_id": null,
        "country": {"id": 356, "name": "India"},
        "state": {"id": 1, "name": "Andaman and Nicobar Islands"}
      },
      "booking_reasons": []
    },
    {
      "id": 8,
      "parent_id": "6",
      "booking_number": "#56236",
      "consumer_id": 19,
      "service_package_id": null,
      "address_id": "19",
      "coupon_total_discount": 12,
      "required_servicemen": "2",
      "total_extra_servicemen": "-1",
      "total_servicemen": "2",
      "total_extra_servicemen_charge": "225.00",
      "subtotal": "40.26",
      "total": 236.25,
      "date_time": "2024-03-15 04:14:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "created_by_id": 19,
      "provider": {
        "id": 4,
        "name": "Kierra Lubin",
        "review_ratings": null,
        "media": [
          {"id": 54, "original_url": eImageAssets.fr}
        ],
        "wallet": null,
      },
      "service": {
        "id": 6,
        "title": "Furnishing & carpentry",
        "rating_count": null,
        "media": [
          {"id": 54, "original_url": eImageAssets.fr}
        ],
      },
      "servicemen": [
        {
          "id": 16,
          "name": "Nolan Westervelt",
          "review_ratings": 3.0,
          "media": [
            {"id": 23, "original_url": eImageAssets.fr}
          ],
        },
        {
          "id": 17,
          "name": "Kate Tanner",
          "review_ratings": 3.5,
          "media": [
            {"id": 23, "original_url": eImageAssets.fr}
          ],
        }
      ],
      "booking_status": {"id": 1, "name": "completed"},
      "booking_status_logs": [
        {
          "id": 5,
          "title": "Pending booking request",
          "description": "New booking is added.",
          "booking_id": "8",
          "booking_status_id": "1",
          "status": {
            "id": 1,
            "name": "pending",
            "slug": "pending",
            "sequence": "1",
            "description": null,
            "created_by_id": "1",
            "system_reserve": "1",
            "hexa_code": "#FDB448",
            "status": 1,
          }
        }
      ],
      "address": {
        "id": 19,
        "user_id": null,
        "country": {"id": 356, "name": "India"},
        "state": {"id": 1, "name": "Andaman and Nicobar Islands"}
      },
      "booking_reasons": []
    },
    {
      "id": 18,
      "parent_id": "17",
      "booking_number": "#15263",
      "consumer_id": 19,
      "coupon_total_discount": 10,
      "required_servicemen": "1",
      "total_extra_servicemen": "0",
      "total_servicemen": "0",
      "total_extra_servicemen_charge": "0.00",
      "subtotal": "21.78",
      "service_package_id": null,
      "total": 23.63,
      "date_time": "2024-02-22 10:28:00",
      "booking_status_id": 1,
      "payment_method": "on_hand",
      "payment_status": "COMPLETED",
      "description": null,
      "created_by_id": 19,
      "provider": {
        "id": 11,
        "name": "Arlene McCoy",
        "review_ratings": 3.5,
        "media": [
          {"id": 43, "original_url": eImageAssets.fr}
        ],
      },
      "service": {
        "id": 4,
        "title": "Chimney sweeping",
        "service_rate": "450.00",
        "media": [
          {"id": 41, "original_url": eImageAssets.fr}
        ],
        "reviews": []
      },
      "servicemen": [],
      "coupon": null,
      "booking_status": {"id": 1, "name": "cancel"},
      "address": {
        "id": 21,
        "user_id": "19",
        "country": {"id": 4, "name": "California"},
        "state": {"id": 42, "name": "USA"}
      }
    },
  ];

  var bookingFilterList = [
    appFonts.status,
    appFonts.date,
    appFonts.category,
  ];

  var bookingStatusList = [
    {
      "id": 1,
      "name": "pending",
      "slug": "pending",
      "sequence": "1",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FDB448",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 2,
      "name": "accepted",
      "slug": "accepted",
      "sequence": "2",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#48BFFD",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 3,
      "name": "assigned",
      "slug": "assigned",
      "sequence": "3",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#AD46FF",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 4,
      "name": "ontheway",
      "slug": "ontheway",
      "sequence": "4",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FF7456",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 5,
      "name": "decline",
      "slug": "decline",
      "sequence": "5",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FF4B4B",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 6,
      "name": "cancel",
      "slug": "cancel",
      "sequence": "6",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FF4B4B",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 7,
      "name": "onGoing",
      "slug": "ongoing",
      "sequence": "7",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FF7456",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 8,
      "name": "on hold",
      "slug": "on-hold",
      "sequence": "8",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FF1D53",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 9,
      "name": "start again",
      "slug": "start-again",
      "sequence": "9",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#FF1D53",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 10,
      "name": "completed",
      "slug": "completed",
      "sequence": "10",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#5465FF",
      "status": 1,
      "deleted_at": null
    },
    {
      "id": 11,
      "name": "Pending approval",
      "slug": "pending-approval",
      "sequence": "11",
      "description": null,
      "created_by_id": "1",
      "system_reserve": "1",
      "hexa_code": "#5498FF",
      "status": 1,
      "deleted_at": null
    }
  ];

  var timeSlotStartAtList = [appFonts.days, "Start at", "End at"];

  var timeSlotList = [
    {"days": 'Monday', "start_at": "09:00", "end_at": "02:00", "status": true},
    {"days": 'Tuesday', "start_at": "00:00", "end_at": "00:00", "status": true},
    {
      "days": 'Wednesday',
      "start_at": "00:00",
      "end_at": "00:00",
      "status": true
    },
    {
      "days": 'Thursday',
      "start_at": "00:00",
      "end_at": "00:00",
      "status": false
    },
    {"days": 'Friday', "start_at": "00:00", "end_at": "00:00", "status": true},
    {
      "days": 'Saturday',
      "start_at": "00:00",
      "end_at": "00:00",
      "status": true
    },
    {"days": 'Sunday', "start_at": "00:00", "end_at": "00:00", "status": false}
  ];

  final List<Map<String, dynamic>> buttonItems = [
    {
      'icon': eSvgAssets.calling,
      'label': appFonts.call,
      'action': () => print('Call tapped')
    },
    {
      'icon': eSvgAssets.direction,
      'label': appFonts.directions,
      'action': () => print('Directions tapped')
    },
    {
      'icon': "assets/svg/contact.svg",
      'label': appFonts.contact,
      'action': () => print('Website tapped')
    },
    {
      'icon': eSvgAssets.time,
      'label': appFonts.hours,
      'action': () => print('Hours tapped')
    },
    {
      'icon': "assets/svg/gallery1.svg",
      'label': appFonts.gallery,
      'action': () => print('Share tapped')
    },
    {
      'icon': eSvgAssets.like,
      'label': appFonts.save,
      'action': () => print('Save tapped')
    },
  ];

  final List galleryList = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png'
  ];

  final List contactItems = [
    {
      'icon': eSvgAssets.calling,
      'label': "+30 555 666 111",
      'action': () => print("Call tapped")
    },
    {
      'icon': eSvgAssets.mail,
      'label': "support@mydomain.com",
      'action': () => print("Email tapped")
    },
    {
      'icon': eSvgAssets.locationOut1,
      'label': "Telamonos 14, Salamina",
      'action': () => print("Address tapped")
    },
    {
      'icon': eSvgAssets.global,
      'label': "www.mysite.com",
      'action': () => print("Website tapped")
    },
    {
      'icon': eImageAssets.fbIcon,
      'label': "Facebook",
      'action': () => print("Facebook tapped")
    },
    {
      'icon': eImageAssets.insta,
      'label': "Instagram",
      'action': () => print("Instagram tapped")
    },
    {
      'icon': eImageAssets.tiktok,
      'label': "TikTok",
      'action': () => print("TikTok tapped")
    },
    {
      'icon': eImageAssets.ytIcon,
      'label': "YouTube",
      'action': () => print("YouTube tapped")
    },
  ];

  var socialList = [
    {"image": eSvgAssets.phone1, "title": appFonts.call},
    {"image": eSvgAssets.chat, "title": appFonts.chat},
    {"image": eSvgAssets.wp, "title": appFonts.wp},
  ];

  //chat list
  var chatList = [
    {
      "type": "receiver",
      "message": "Hello ! How can i help you ?",
    },
    {
      "type": "source",
      "message": "Hello ! When will you arrive ?",
    },
    {
      "type": "receiver",
      "message": "I’ll be there soon.",
    },
    {
      "type": "source",
      "message": "Okay !! Thank you.",
    }
  ];

  var optionList = [
    appFonts.callNow,
    appFonts.clearChat,
  ];

  var pendingBookingDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#58961",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Kurt Bates",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Curtain cleaning service",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Ac cleaning"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "servicemen": [],
    "coupon": null,
    "booking_status": {"id": 1, "name": "pending"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "booking_reasons": []
  };

  var pendingBookingWithServicemanDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#58961",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Kurt Bates",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Curtain cleaning service",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Ac cleaning"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "servicemen": [
      {
        "id": 16,
        "name": "Kierra Lubin",
        "experience_interval": "years",
        "experience_duration": "3",
        "email": "sypyvamiqu@mailinator.com",
        "phone": "3236952222",
        "review_ratings": 3.0,
        "media": [
          {"id": 23, "original_url": eImageAssets.fr}
        ],
      }
    ],
    "coupon": null,
    "booking_status": {"id": 1, "name": "pending"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "booking_reasons": []
  };

  var acceptBookingDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#25636",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Zain Dorwart",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "email": "kurtbsted56@gmail.com",
      "phone": "+25 632 256 4562",
      "primary_address": {
        "id": 6,
        "area": "3891 Ranchview Dr. Richardson",
        "postal_code": "62639",
        "country_id": "392",
        "state_id": "1871",
        "city": "Taiwan",
        "address": "Japan Taiwan",
        "type": "home",
        "alternative_name": "Demo Alternative Name",
        "code": "91",
        "alternative_phone": "8945654456",
        "created_at": "2024-01-26T20:13:33.000000Z",
        "updated_at": "2024-01-26T20:13:33.000000Z",
        "deleted_at": null,
        "company_id": null,
        "availability_radius": null,
        "country": {"id": 392, "name": "California"},
        "state": {"id": 1871, "name": "USA"}
      },
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Hair cutting & spa",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Beauty"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fsl1}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "coupon": null,
    "booking_status": {"id": 1, "name": "pending"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "servicemen": [
      {
        "id": 16,
        "name": "Kierra Lubin",
        "experience_interval": "years",
        "experience_duration": "3",
        "email": "sypyvamiqu@mailinator.com",
        "phone": "3236952222",
        "review_ratings": 3.0,
        "media": [
          {"id": 23, "original_url": eImageAssets.fr}
        ],
      }
    ],
    "booking_reasons": []
  };

  var ongoingBookingDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#25636",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Zain Dorwart",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "email": "kurtbsted56@gmail.com",
      "phone": "+25 632 256 4562",
      "primary_address": {
        "id": 6,
        "area": "3891 Ranchview Dr. Richardson",
        "postal_code": "62639",
        "country_id": "392",
        "state_id": "1871",
        "city": "Taiwan",
        "address": "Japan Taiwan",
        "type": "home",
        "alternative_name": "Demo Alternative Name",
        "code": "91",
        "alternative_phone": "8945654456",
        "created_at": "2024-01-26T20:13:33.000000Z",
        "updated_at": "2024-01-26T20:13:33.000000Z",
        "deleted_at": null,
        "company_id": null,
        "availability_radius": null,
        "country": {"id": 392, "name": "California"},
        "state": {"id": 1871, "name": "USA"}
      },
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Hair cutting & spa",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Beauty"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fsl1}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "coupon": null,
    "booking_status": {"id": 1, "name": "ongoing"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "servicemen": [
      {
        "id": 16,
        "name": "Kierra Lubin",
        "experience_interval": "years",
        "experience_duration": "3",
        "email": "sypyvamiqu@mailinator.com",
        "phone": "3236952222",
        "review_ratings": 3.0,
        "media": [
          {"id": 23, "original_url": eImageAssets.fr}
        ],
      }
    ],
    "booking_reasons": []
  };

  var onTheBookingDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#25636",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Zain Dorwart",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "email": "kurtbsted56@gmail.com",
      "phone": "+25 632 256 4562",
      "primary_address": {
        "id": 6,
        "area": "3891 Ranchview Dr. Richardson",
        "postal_code": "62639",
        "country_id": "392",
        "state_id": "1871",
        "city": "Taiwan",
        "address": "Japan Taiwan",
        "type": "home",
        "alternative_name": "Demo Alternative Name",
        "code": "91",
        "alternative_phone": "8945654456",
        "created_at": "2024-01-26T20:13:33.000000Z",
        "updated_at": "2024-01-26T20:13:33.000000Z",
        "deleted_at": null,
        "company_id": null,
        "availability_radius": null,
        "country": {"id": 392, "name": "California"},
        "state": {"id": 1871, "name": "USA"}
      },
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Hair cutting & spa",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Beauty"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fsl1}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "coupon": null,
    "booking_status": {"id": 1, "name": "ontheway"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "servicemen": [
      {
        "id": 16,
        "name": "Kierra Lubin",
        "experience_interval": "years",
        "experience_duration": "3",
        "email": "sypyvamiqu@mailinator.com",
        "phone": "3236952222",
        "review_ratings": 3.0,
        "media": [
          {"id": 23, "original_url": eImageAssets.fr}
        ],
      }
    ],
    "booking_reasons": []
  };

  var completedBookingDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#25636",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Zain Dorwart",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "email": "kurtbsted56@gmail.com",
      "phone": "+25 632 256 4562",
      "primary_address": {
        "id": 6,
        "area": "3891 Ranchview Dr. Richardson",
        "postal_code": "62639",
        "country_id": "392",
        "state_id": "1871",
        "city": "Taiwan",
        "address": "Japan Taiwan",
        "type": "home",
        "alternative_name": "Demo Alternative Name",
        "code": "91",
        "alternative_phone": "8945654456",
        "created_at": "2024-01-26T20:13:33.000000Z",
        "updated_at": "2024-01-26T20:13:33.000000Z",
        "deleted_at": null,
        "company_id": null,
        "availability_radius": null,
        "country": {"id": 392, "name": "California"},
        "state": {"id": 1871, "name": "USA"}
      },
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Hair cutting & spa",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Beauty"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fsl1}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "coupon": null,
    "booking_status": {"id": 1, "name": "completed"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "servicemen": [
      {
        "id": 16,
        "name": "Kierra Lubin",
        "experience_interval": "years",
        "experience_duration": "3",
        "email": "sypyvamiqu@mailinator.com",
        "phone": "3236952222",
        "review_ratings": 3.0,
        "media": [
          {"id": 23, "original_url": eImageAssets.fr}
        ],
      }
    ],
    "booking_reasons": []
  };

  var cancelledBookingDetailList = {
    "id": 19,
    "parent_id": "17",
    "booking_number": "#25636",
    "consumer_id": 19,
    "coupon_id": null,
    "wallet_balance": null,
    "convert_wallet_balance": null,
    "provider_id": "12",
    "service_id": "5",
    "service_package_id": null,
    "address_id": "21",
    "service_price": "665.00",
    "tax": "33.25",
    "per_serviceman_charge": "332.50",
    "coupon_total_discount": 0,
    "platform_fees": "0.00",
    "platform_fees_type": "fixed",
    "required_servicemen": "2",
    "total_extra_servicemen": "0",
    "total_servicemen": "2",
    "total_extra_servicemen_charge": "665.00",
    "subtotal": "665.00",
    "total": 698.25,
    "date_time": "2024-02-23 10:17:00",
    "booking_status_id": 1,
    "payment_method": "on_hand",
    "payment_status": "COMPLETED",
    "description": null,
    "created_by_id": 19,
    "provider": {
      "id": 12,
      "name": "Zain Dorwart",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3.0,
      "email": "kurtbsted56@gmail.com",
      "phone": "+25 632 256 4562",
      "primary_address": {
        "id": 6,
        "area": "3891 Ranchview Dr. Richardson",
        "postal_code": "62639",
        "country_id": "392",
        "state_id": "1871",
        "city": "Taiwan",
        "address": "Japan Taiwan",
        "type": "home",
        "alternative_name": "Demo Alternative Name",
        "code": "91",
        "alternative_phone": "8945654456",
        "created_at": "2024-01-26T20:13:33.000000Z",
        "updated_at": "2024-01-26T20:13:33.000000Z",
        "deleted_at": null,
        "company_id": null,
        "availability_radius": null,
        "country": {"id": 392, "name": "California"},
        "state": {"id": 1871, "name": "USA"}
      },
      "media": [
        {"id": 78, "original_url": eImageAssets.fr}
      ]
    },
    "service": {
      "id": 5,
      "title": "Hair cutting & spa",
      "service_rate": "665.00",
      "review_ratings": [0, 0, 0, 0, 0],
      "rating_count": 3.5,
      "description":
          "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
      "categories": [
        {"id": 8, "title": "Beauty"}
      ],
      "media": [
        {"id": 78, "original_url": eImageAssets.fsl1}
      ],
      "reviews": [
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“This is amazing service i have ever get”",
          "consumer": {
            "name": "Devon Lane",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description":
              "I just love their service & the staff nature for work, I’d like to hire them again",
          "consumer": {
            "name": "Guy Hawkins",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        },
        {
          "service_id": 1,
          "provider_id": 2,
          "serviceman_id": 2,
          "rating": 3,
          "description": "“I love their work with ease, Thank you !”",
          "consumer": {
            "name": "Jane Cooper",
            "media": [
              {"id": 78, "original_url": eImageAssets.fr}
            ]
          },
          "created_at": "2024-02-23 10:17:00"
        }
      ]
    },
    "coupon": null,
    "booking_status": {"id": 1, "name": "cancel"},
    "booking_status_logs": [
      {
        "id": 12,
        "title": "Pending booking request",
        "description": "New booking is added.",
        "booking_id": "19",
        "booking_status_id": "1",
        "created_at": "2024-02-06T05:08:14.000000Z",
        "updated_at": "2024-02-06T05:08:14.000000Z",
        "status": {
          "id": 1,
          "name": "pending",
          "slug": "pending",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
          "deleted_at": null
        }
      }
    ],
    "address": {
      "id": 21,
      "user_id": "19",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.175849",
      "longitude": "72.930988",
      "area": null,
      "postal_code": "35624",
      "country_id": "4",
      "state_id": "42",
      "city": "surat",
      "address": "2118 Thornridge Cir. Syracuse",
      "type": "work",
      "alternative_name": "testting",
      "code": "91",
      "alternative_phone": "95456575785",
      "created_at": "2024-02-05T13:16:30.000000Z",
      "updated_at": "2024-02-05T13:16:30.000000Z",
      "deleted_at": null,
      "company_id": null,
      "availability_radius": null,
      "country": {"id": 4, "name": "Connecticut"},
      "state": {"id": 42, "name": "USA"}
    },
    "servicemen": [
      {
        "id": 16,
        "name": "Kierra Lubin",
        "experience_interval": "years",
        "experience_duration": "3",
        "email": "sypyvamiqu@mailinator.com",
        "phone": "3236952222",
        "review_ratings": 3.0,
        "media": [
          {"id": 23, "original_url": eImageAssets.fr}
        ],
      }
    ],
    "booking_reasons": [
      {
        "id": 1,
        "bookingId": 2,
        "status_id": "1",
        "reason": "I accomplished it on my own.",
        "status": {
          "id": 1,
          "name": "cancel",
          "slug": "cancel",
          "sequence": "1",
          "description": null,
          "created_by_id": "1",
          "system_reserve": "1",
          "hexa_code": "#FDB448",
          "status": 1,
        }
      }
    ]
  };

  var offerList = [
    {
      "id": 1,
      "title": "Most valuable offer",
      "type": "service",
      "related_id": "3",
      "media": [
        {
          "id": 1,
          "original_url": eImageAssets.fr,
        },
        {
          "id": 2,
          "original_url": eImageAssets.fr,
        }
      ]
    },
    {
      "id": 2,
      "title": "Most valuable offer",
      "type": "provider",
      "related_id": "5",
      "media": [
        {"id": 3, "original_url": eImageAssets.fr},
        {"id": 4, "original_url": eImageAssets.fr},
        {"id": 5, "original_url": eImageAssets.fr}
      ]
    }
  ];

  var servicePackage = {
    "id": 1,
    "title": "Cleaning service package",
    "price": "32.08",
    "description":
        "As a servicemember, I believe I am capable of problem solving. I too face a variety of obstacles at work and must develop effective solutions to ensure client satisfaction.",
    "discount": "",
    "provider_id": "2",
    "services": [
      {
        "id": 3,
        "title": "Bathroom cleaning",
        "price": "30.00",
        "duration": "00:30",
        "duration_unit": "minute",
        "service_rate": "28.50",
        "discount": "5.00",
        "description": "Foamjet tachnology removes dust 2x deeper.",
        "user_id": "2",
        "required_servicemen": "1",
        "rating_count": 3,
        "media": [
          {"id": 32, "original_url": eImageAssets.fr}
        ]
      },
      {
        "id": 3,
        "title": "Bathroom cleaning",
        "price": "30.25",
        "duration": "00:30",
        "duration_unit": "minute",
        "service_rate": "28.50",
        "discount": "5.00",
        "description": "Get the best and most durable wooden furniture.",
        "user_id": "2",
        "required_servicemen": "2",
        "rating_count": 4,
        "media": [
          {"id": 32, "original_url": eImageAssets.fs2}
        ]
      },
    ],
    "user": {
      "id": 2,
      "name": "Kurt Bates",
      "review_ratings": 3,
      "media": [
        {"id": 1, "original_url": eImageAssets.fr}
      ]
    }
  };

  var providerDetail = {
    "id": 14,
    "name": "Kurt Bates",
    "email": "kurtbatespersonal1256@gmail.com",
    "system_reserve": null,
    "served": "250",
    "phone": "236 236 5653",
    "code": "+1",
    "provider_id": null,
    "experience_interval": "yeards",
    "experience_duration": "3",
    "description":
        "This business was founded in 2021 by Kurt. Working well together, he and his staff.",
    "review_ratings": 3.8,
    "primary_address": {
      "id": 10,
      "user_id": "14",
      "service_id": null,
      "is_primary": "1",
      "latitude": "21.19860",
      "longitude": "72.79572",
      "area": "Nihil repudiandae er",
      "postal_code": "394110",
      "country_id": "136",
      "state_id": "676",
      "city": "Kolkata",
      "address": "kohinur",
      "type": "home",
      "alternative_name": "Sheila Tillman",
      "code": "672",
      "alternative_phone": "8956231753",
      "country": {"id": 136, "name": "Cayman Islands"},
      "state": {"id": 676, "name": "Grand Cayman"}
    },
    "ServicemanReviewRatings": null,
    "media": [
      {"id": 17, "original_url": eImageAssets.fr}
    ],
    "known_languages": [
      {
        "key": "Afrikaans",
        "id": 1,
        "pivot": {"user_id": "14", "language_id": "1"}
      },
      {
        "key": "English",
        "id": 2,
        "pivot": {"user_id": "14", "language_id": "2"}
      },
      {
        "key": "Albanian",
        "id": 3,
        "pivot": {"user_id": "14", "language_id": "3"}
      },
      {
        "key": "Amharic",
        "id": 4,
        "pivot": {"user_id": "14", "language_id": "4"}
      }
    ],
    "addresses": [
      {
        "id": 10,
        "user_id": "14",
        "service_id": null,
        "is_primary": "1",
        "latitude": "21.19860",
        "longitude": "72.79572",
        "area": "Nihil repudiandae er",
        "postal_code": "394110",
        "country_id": "136",
        "state_id": "676",
        "city": "Kolkata",
        "address": "kohinur",
        "type": "home",
        "alternative_name": "Sheila Tillman",
        "code": "672",
        "alternative_phone": "8956231753",
        "created_at": "2024-01-26T20:44:50.000000Z",
        "updated_at": "2024-01-26T20:44:50.000000Z",
        "deleted_at": null,
        "company_id": null,
        "availability_radius": null,
        "country": {"id": 136, "name": "Cayman Islands"},
        "state": {"id": 676, "name": "Grand Cayman"}
      }
    ],
  };

  var servicemanDetail = {
    "id": 18,
    "name": "Theodore T.C. Calvin",
    "email": "theodoret.c.calvin@gmail.com",
    "served": "250",
    "phone": "236 236 5653",
    "code": "+1",
    "provider_id": "13",
    "status": "1",
    "is_featured": "1",
    "is_verified": "0",
    "experience_interval": "years",
    "experience_duration": "2",
    "description":
        "As a servicemember, I believe I am capable of problem solving. I too face a variety of obstacles at work and must develop effective solutions.",
    "review_ratings": "3.5",
    "primary_address": {
      "id": 14,
      "user_id": "18",
      "service_id": null,
      "is_primary": "1",
      "latitude": "26.45172245105316",
      "longitude": "80.33225309782762",
      "area": "F82J+JV8,",
      "postal_code": "208004",
      "country_id": "356",
      "state_id": "12",
      "city": "Surat",
      "address": "New Shivli Rd, Kalyanpur, Kanpur, Uttar Pradesh",
      "type": null,
      "alternative_name": null,
      "code": null,
      "country": {"id": 356, "name": "New jersey"},
      "state": {"id": 12, "name": "USA"}
    },
    "media": [
      {"id": 25, "original_url": eImageAssets.fr}
    ],
    "wallet": null,
    "known_languages": [
      {
        "key": "English",
        "id": 2,
        "pivot": {"user_id": "18", "language_id": "2"}
      },
      {
        "key": "Spanish",
        "id": 3,
        "pivot": {"user_id": "18", "language_id": "3"}
      },
      {
        "key": "Chinese",
        "id": 20,
        "pivot": {"user_id": "18", "language_id": "20"}
      }
    ],
    "expertise": [
      {
        "title": "Ac repair",
        "id": 10,
        "review_ratings": [5, 5, 5, 45, 9]
      },
      {
        "title": "Carpenter",
        "id": 10,
        "review_ratings": [5, 5, 5, 45, 9]
      },
      {
        "title": "Cleaning",
        "id": 10,
        "review_ratings": [5, 5, 5, 45, 9]
      }
    ]
  };

  var serviceDetail = {
    "id": 4,
    "title": "AC cleaning service",
    "price": "12.00",
    "status": "1",
    "duration": "00:45",
    "duration_unit": "minute",
    "service_rate": "15.00",
    "discount": "10.00",
    "description":
        "The Battle of Salamis was a decisive naval engagement fought in 480 BC during the Greco-Persian Wars. It took place in the Saronic Gulf near the island of Salamis, between the Greek city-states, led by the Athenian general Themistocles, and the Persian Empire under King Xerxes. After the Persian invasion of Greece, Xerxes sought to crush the Greek resistance by defeating their navy, but Themistocles devised a brilliant strategy to turn the tide in favour of the Greeks. Despite being heavily outnumbered, the Greek fleet lured the larger Persian fleet into the narrow straits between Salamis and the mainland, where their superior manoeuvrability and tactics gave them a distinct advantage.",
    "user_id": "4",
    "type": "fixed",
    "is_featured": "1",
    "required_servicemen": "2",
    "reviews_count": "3.8",
    "review_ratings": [25, 20, 15, 15, 5],
    "rating_count": 3.8,
    "categories": [
      {
        "id": 8,
        "title": "Ac repairing",
      }
    ],
    "media": [
      {"id": 79, "original_url": eImageAssets.fr},
      {"id": 79, "original_url": eImageAssets.s1},
      {"id": 79, "original_url": eImageAssets.s2}
    ],
    "user": {
      "id": 4,
      "name": "Kurt Bates",
      "system_reserve": "1",
      "served": "250",
      "experience_interval": "years",
      "experience_duration": "3",
      "review_ratings": 3,
      "media": [
        {"id": 79, "original_url": eImageAssets.fr}
      ],
    },
    "related_services": [
      {
        "id": 5,
        "title": "Ac water drop solu..",
        "price": "30.56",
        "required_servicemen": "1",
        "reviews_count": "3.0",
        "review_ratings": [0, 0, 0, 0, 0],
        "rating_count": "3.0",
        "categories": [
          {
            "id": 8,
            "title": "Ac repair",
          },
        ],
        "media": [
          {"id": 73, "original_url": eImageAssets.fsl1}
        ]
      },
      {
        "id": 6,
        "title": "Ac master service",
        "price": "30.56",
        "required_servicemen": "1",
        "reviews_count": "3.0",
        "review_ratings": [0, 0, 0, 0, 0],
        "rating_count": "3.0",
        "categories": [
          {
            "id": 8,
            "title": "Ac repair",
          },
        ],
        "media": [
          {"id": 73, "original_url": eImageAssets.fr}
        ]
      },
    ],
    "reviews": [
      {
        "service_id": 1,
        "provider_id": 2,
        "serviceman_id": 2,
        "rating": 3,
        "description": "“This is amazing service i have ever get”",
        "consumer": {
          "name": "Devon Lane",
          "media": [
            {"id": 78, "original_url": eImageAssets.fr}
          ]
        },
        "created_at": "2024-02-23 10:17:00"
      },
      {
        "service_id": 1,
        "provider_id": 2,
        "serviceman_id": 2,
        "rating": 3,
        "description":
            "I just love their service & the staff nature for work, I’d like to hire them again",
        "consumer": {
          "name": "Guy Hawkins",
          "media": [
            {"id": 78, "original_url": eImageAssets.fr}
          ]
        },
        "created_at": "2024-02-23 10:17:00"
      },
      {
        "service_id": 1,
        "provider_id": 2,
        "serviceman_id": 2,
        "rating": 3,
        "description": "“I love their work with ease, Thank you !”",
        "consumer": {
          "name": "Jane Cooper",
          "media": [
            {"id": 78, "original_url": eImageAssets.fr}
          ]
        },
        "created_at": "2024-02-23 10:17:00"
      }
    ]
  };

  var allReview = [
    {
      "service_id": 3,
      "provider_id": 2,
      "serviceman_id": 2,
      "rating": 3,
      "description": "“This is amazing service i have ever get”",
      "consumer": {
        "name": "Devon Lane",
        "media": [
          {"id": 78, "original_url": eImageAssets.fr}
        ]
      },
      "created_at": "2024-02-23 10:17:00"
    },
    {
      "service_id": 4,
      "provider_id": 2,
      "serviceman_id": 2,
      "rating": 3,
      "description":
          "I just love their service & the staff nature for work, I’d like to hire them again",
      "consumer": {
        "name": "Guy Hawkins",
        "media": [
          {"id": 78, "original_url": eImageAssets.fr}
        ]
      },
      "created_at": "2024-02-23 10:17:00"
    },
    {
      "service_id": 5,
      "provider_id": 2,
      "serviceman_id": 2,
      "rating": 3,
      "description": "“I love their work with ease, Thank you !”",
      "consumer": {
        "name": "Jane Cooper",
        "media": [
          {"id": 78, "original_url": eImageAssets.fr}
        ]
      },
      "created_at": "2024-02-23 10:17:00"
    },
    {
      "service_id": 1,
      "provider_id": 2,
      "serviceman_id": 2,
      "rating": 3,
      "description":
          "This provider has the best staff who assist us until the service is complete. Thank you!",
      "consumer": {
        "name": "Lorri Warf",
        "media": [
          {"id": 78, "original_url": eImageAssets.fr}
        ]
      },
      "created_at": "2024-02-23 10:17:00"
    },
    {
      "service_id": 1,
      "provider_id": 2,
      "serviceman_id": 2,
      "rating": 3,
      "description": "“I love their work with ease, Thank you !”",
      "consumer": {
        "name": "Iva Ryan",
        "media": [
          {"id": 78, "original_url": eImageAssets.fr}
        ]
      },
      "created_at": "2024-02-09 17:45:00"
    },
  ];
}
