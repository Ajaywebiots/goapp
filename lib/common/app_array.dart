import 'package:goapp/screens/app_pages_screen/change_language_screen/change_language_screen.dart';
import 'package:goapp/screens/app_pages_screen/fav_screen/fav_screen_list.dart';
import 'package:goapp/screens/app_pages_screen/profile_detail_screen/profile_detail_screen.dart';
import 'package:goapp/screens/app_pages_screen/review_screen/review_screen.dart';
import 'package:intl/intl.dart';

import '../config.dart';
import '../models/app_model/MenuItem.dart';

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
  var durationList = [
    {"id": 0, "title": "Hour"},
    {"id": 1, "title": "Minuets"},
  ];

  var localList = <Locale>[
    const Locale('en'),
    const Locale('el'),
    // const Locale('he'),
    // const Locale('es'),
    // const Locale('ar'),
    // const Locale('ru'),
  ];

  List<MenuItem> menuItems(context) => [
        MenuItem(
          title: 'Business Club',
          icon: SvgPicture.asset(
            "assets/svg/business.svg",
            height: 18,
            width: 18,
          ),
        ),
        MenuItem(
          title: 'Travel Guide',
          icon: SvgPicture.asset(
            eSvgAssets.global,
            height: 18,
            width: 18,
          ),
        ),
        MenuItem(
          title: 'Salamina Municipality',
          icon: SvgPicture.asset(
            "assets/svg/municipal.svg",
            height: 18,
            width: 18,
          ),
        ),
        MenuItem(
          title: 'My Account',
          icon: SvgPicture.asset(
            "assets/svg/myAccount.svg",
            height: 18,
            width: 18,
          ),
        ),
        MenuItem(
          title: 'App Details',
          icon: SvgPicture.asset(
            eSvgAssets.mobile,
            height: 18,
            width: 18,
          ),
        ),
        MenuItem(
            title: 'Customer Support',
            icon: SvgPicture.asset(eSvgAssets.email,
                height: 18,
                width: 18,
                colorFilter: ColorFilter.mode(
                    appColor(context).darkText, BlendMode.srcIn)))
      ];

  List<MenuItem> businessClubItems() => [
        MenuItem(
            title: 'Business Listings',
            icon: SvgPicture.asset("assets/svg/business.svg",
                height: 18, width: 18)),
        MenuItem(
            title: 'Special Offers',
            icon: SvgPicture.asset("assets/svg/discount-shape.svg",
                height: 18, width: 18)),
        MenuItem(
            title: 'How to Join?',
            icon:
                SvgPicture.asset("assets/svg/bank.svg", height: 18, width: 18))
      ];

  List<MenuItem> travelGuideItems() => [
        MenuItem(
            title: 'Explore Points of Interest',
            icon: SvgPicture.asset("assets/svg/locationOut1.svg",
                height: 18, width: 18)),
        MenuItem(
            title: 'Travel Information',
            icon:
                SvgPicture.asset("assets/svg/note.svg", height: 18, width: 18))
      ];

  List<MenuItem> municipalityItems() => [
        MenuItem(
            title: 'Municipality Messages',
            icon: SvgPicture.asset(eSvgAssets.chat1, height: 18, width: 18)),
        MenuItem(
            title: 'The Mayor of Salamina',
            icon:
                SvgPicture.asset(eSvgAssets.accountTag, height: 18, width: 18)),
        MenuItem(
            title: 'Emergency Numbers',
            icon: SvgPicture.asset(eSvgAssets.calling, height: 18, width: 18))
      ];

  List<MenuItem> myAccountItems() => [
        MenuItem(
            title: 'My Profile',
            icon: SvgPicture.asset(
              "assets/svg/myAccount.svg",
              height: 18,
              width: 18,
            ),
            destination: ProfileDetailScreen()),
        MenuItem(
            title: 'Favourite Lists',
            icon: SvgPicture.asset(
              eSvgAssets.like,
              height: 18,
              width: 18,
            ),
            destination: FavScreenList()),
        MenuItem(
            title: 'My Reviews',
            icon: SvgPicture.asset(
              eSvgAssets.starOut,
              height: 18,
              width: 18,
            ),
            destination: ReviewScreen()),
        MenuItem(
            title: 'Select Language',
            icon: SvgPicture.asset(eSvgAssets.translate, height: 18, width: 18),
            destination: ChangeLanguageScreen()),
        MenuItem(
            title: 'My Membership',
            icon: SvgPicture.asset(
              "assets/svg/crown.svg",
              height: 18,
              width: 18,
            )),
      ];

  List<MenuItem> appDetailsItems() => [
        MenuItem(
            title: 'About Us',
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: 'Terms & Conditions',
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: 'Privacy Policy',
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: 'Cancellation Policy',
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18))
      ];

  List<MenuItem> customerSupportItems(context) => [
        MenuItem(
            title: 'FAQ',
            icon: SvgPicture.asset(
              "assets/svg/documentText.svg",
              height: 18,
              width: 18,
            )),
        MenuItem(
            title: 'Contact Us',
            icon: SvgPicture.asset(eSvgAssets.mail,
                colorFilter: ColorFilter.mode(
                    appColor(context).darkText, BlendMode.srcIn),
                height: 18,
                width: 18)),
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
    /*{
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
    },*/
  ];

  // List<Map<String, dynamic>> loginOptions = [
  //   {
  //     "image": eImageAssets.google,
  //     "onTap": (BuildContext context, LoginProvider value) =>
  //         value.signInWithGoogle(context)
  //   },
  //   {
  //     "image": eImageAssets.fbLogo,
  //     "onTap": (BuildContext context, LoginProvider value) =>
  //         value.signInWithFacebook(context)
  //   },
  //   {
  //     "image": eImageAssets.mobile,
  //     "onTap": (BuildContext context, dynamic value) =>
  //         route.pushNamed(context, routeName.loginWithPhone)
  //   }
  // ];

  /////

  var dashboardList = [
    {
      "title": appFonts.home,
      "icon": eSvgAssets.homeOut,
      "icon2": eSvgAssets.homeFill
    },
    {
      "title": "Business",
      "icon": eSvgAssets.bookingOut,
      "icon2": eSvgAssets.bookingFill
    },
    {
      "title": appFonts.offer,
      "icon": eSvgAssets.offerOut,
      "icon2": eSvgAssets.offerFill
    },
    {
      "title": appFonts.cart,
      "icon": eSvgAssets.cart,
      "icon2": eSvgAssets.cartFill
    },
    {
      "title": "More",
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
          "title": appFonts.termCondition,
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
        // {'title': appFonts.changePassword, 'icon': eSvgAssets.lock}
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
  List businessCategory = ["Restaurant", "Baar", "Cafe"];
  List priceRange = ["10-100", "100-1000", "10000-10,000"];

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
    }
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

  var timeSlotStartAtList = ["Days", "Start at", "End at"];

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
