import 'package:intl/intl.dart';

import '../config.dart';
import '../models/app_model/MenuItem.dart';
import '../models/app_model/my_business_app_model.dart';

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

  List<MenuItem> businessMenuList() => [
        MenuItem(
            title: 'Dashboard',
            icon: SvgPicture.asset(eSvgAssets.box, height: 18, width: 18)),
        MenuItem(
            title: 'My Business',
            icon:
                SvgPicture.asset("assets/svg/bank.svg", height: 18, width: 18)),
        MenuItem(
            title: 'Business Reviews',
            icon: SvgPicture.asset(eSvgAssets.starOut, height: 18, width: 18)),
        MenuItem(
            title: 'My Offers',
            icon: SvgPicture.asset(eSvgAssets.offerOut, height: 18, width: 18)),
        MenuItem(
            title: 'Offer Bookings',
            icon: SvgPicture.asset(eSvgAssets.emptyWallet,
                height: 18, width: 18)),
        MenuItem(
            title: 'Business Users',
            icon: SvgPicture.asset(eSvgAssets.people, height: 18, width: 18)),
        MenuItem(
            title: 'Subscription Plans',
            icon:
                SvgPicture.asset("assets/svg/crown.svg", height: 18, width: 18))
      ];

  List<Restaurant> restaurants() => [
        Restaurant(
            id: '1',
            name: 'Belair All Day Bar And Resto',
            imageUrl: eImageAssets.fs1,
            lastUpdate: '12/5/2005',
            logo: eImageAssets.noImageFound3),
        Restaurant(
            id: '2',
            name: 'Ouzeri Paralia',
            imageUrl: eImageAssets.fs2,
            lastUpdate: '12/5/2005',
            logo: eImageAssets.noImageFound3)
      ];

  // var durationList = [
  //   {"id": 0, "title": "Hour"},
  //   {"id": 1, "title": "Minuets"},
  // ];

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
            title: appFonts.travelGuide,
            icon: SvgPicture.asset(eSvgAssets.global, height: 18, width: 18)),

        MenuItem(
            title: appFonts.businessClub,
            icon: SvgPicture.asset("assets/svg/business.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.salaminaMunicipality,
            icon: SvgPicture.asset("assets/svg/municipal.svg",
                height: 18, width: 18)),
        // MenuItem(
        //     title: appFonts.myAccount,
        //     icon: SvgPicture.asset("assets/svg/myAccount.svg",
        //         height: 18, width: 18)),
        MenuItem(
            title: appFonts.customerSupport,
            icon: SvgPicture.asset(eSvgAssets.email,
                height: 18,
                width: 18,
                colorFilter: ColorFilter.mode(
                    appColor(context).darkText, BlendMode.srcIn))),
        MenuItem(
            title: appFonts.appDetails,
            icon: SvgPicture.asset(eSvgAssets.mobile, height: 18, width: 18)),
      ];

  List<MenuItem> businessClubItems() => [
        MenuItem(
            title: appFonts.businessListings,
            icon: SvgPicture.asset("assets/svg/business.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.specialOffers,
            icon: SvgPicture.asset("assets/svg/discount-shape.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.howToJoin,
            icon:
                SvgPicture.asset("assets/svg/bank.svg", height: 18, width: 18))
      ];

  List<MenuItem> travelGuideItems() => [
        MenuItem(
            title: appFonts.explorePointsOfInterest,
            icon: SvgPicture.asset("assets/svg/locationOut1.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.travelInformation,
            icon:
                SvgPicture.asset("assets/svg/note.svg", height: 18, width: 18))
      ];

  List<MenuItem> municipalityItems() => [
        MenuItem(
            title: appFonts.municipalityMessages,
            icon: SvgPicture.asset(eSvgAssets.chat1, height: 18, width: 18)),
        MenuItem(
            title: appFonts.theMayorOfSalamina,
            icon:
                SvgPicture.asset(eSvgAssets.accountTag, height: 18, width: 18)),
        MenuItem(
            title: appFonts.emergencyNumbers,
            icon: SvgPicture.asset(eSvgAssets.calling, height: 18, width: 18))
      ];

  List<MenuItem> myAccountItems() => [
        MenuItem(
            title: appFonts.myProfile,
            icon: SvgPicture.asset("assets/svg/myAccount.svg",
                height: 18, width: 18),
            destination: ProfileDetailScreen()),
        MenuItem(
            title: appFonts.favouriteList,
            icon: SvgPicture.asset(eSvgAssets.like, height: 18, width: 18),
            destination: FavScreenList()),
        MenuItem(
            title: appFonts.myReviews,
            icon: SvgPicture.asset(eSvgAssets.starOut, height: 18, width: 18),
            destination: ReviewScreen()),
        MenuItem(
            title: appFonts.selectLanguage,
            icon: SvgPicture.asset(eSvgAssets.translate, height: 18, width: 18),
            destination: ChangeLanguageScreen()),
        MenuItem(
            title: appFonts.myMembership,
            icon:
                SvgPicture.asset("assets/svg/crown.svg", height: 18, width: 18))
      ];

  List<MenuItem> appDetailsItems() => [
        MenuItem(
            title: appFonts.aboutUs,
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.termsConditions,
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.privacyPolicy,
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.cancellationPolicy,
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18))
      ];

  List<MenuItem> customerSupportItems(context) => [
        MenuItem(
            title: appFonts.faq,
            icon: SvgPicture.asset("assets/svg/documentText.svg",
                height: 18, width: 18)),
        MenuItem(
            title: appFonts.contactUs,
            icon: SvgPicture.asset(eSvgAssets.mail,
                colorFilter: ColorFilter.mode(
                    appColor(context).darkText, BlendMode.srcIn),
                height: 18,
                width: 18))
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
  ];

  var dashboardList = [
    {
      "title": appFonts.home,
      "icon": eSvgAssets.homeOut,
      "icon2": eSvgAssets.homeFill
    },
    {
      "title": appFonts.business,
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

  var profileList = [
    {
      "title": appFonts.myAccount,
      "data": [
        {
          "icon": "assets/svg/profileOut.svg",
          "title": appFonts.myProfile,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.like,
          "title": appFonts.favouriteList,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.starOut,
          "title": appFonts.myReviews,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.translate,
          "title": appFonts.appSettings,
          "isArrow": true
        },
        {
          "icon": "assets/svg/crown.svg",
          "title": appFonts.subscriptionPlans,
          "isArrow": true
        }
      ]
    },
    {
      "title": appFonts.generalInfo,
      "data": [
        {
          "title": appFonts.travelGuide,
          "icon": eSvgAssets.global,
          "isArrow": true
        },
        {
          "title": appFonts.businessClub,
          "icon": "assets/svg/business.svg",
          "isArrow": true
        },
        {
          "title": appFonts.salaminaMunicipality,
          "icon": "assets/svg/municipal.svg",
          "isArrow": true
        },
        {
          "title": appFonts.customerSupport,
          "icon": eSvgAssets.email,
          "isArrow": true
        },
        {
          "title": appFonts.appDetails,
          "icon": eSvgAssets.mobile,
          "isArrow": true
        },
      ]
    }
  ];

  //app setting
  List appSetting() => [
        {'title': appFonts.changeLanguage, 'icon': eSvgAssets.translate},
        // {'title': appFonts.changePassword, 'icon': eSvgAssets.lock}
      ];

  List get businessReviewList => [
        {
          "id": 1,
          "name": "Devon Lane",
          'rating': "4.0",
          "description": '“This is amazing service i have ever get”',
          "showReview": true,
          "createDate": "04-05-2025",
          'time': "12 min ago"
        },
        {
          "id": 2,
          "name": "Devon Lane",
          'rating': "4.0",
          "description": '“This is amazing service i have ever get”',
          "showReview": false,
          "createDate": "",
          'time': "12 min ago"
        },
        {
          "id": 3,
          "name": "Devon Lane",
          'rating': "4.0",
          "description": '“This is amazing service i have ever get”',
          "showReview": true,
          "createDate": "",
          'time': "12 min ago"
        },
        {
          "id": 4,
          "name": "Devon Lane",
          'rating': "4.0",
          "description": '“This is amazing service i have ever get”',
          "showReview": false,
          "createDate": "",
          'time': "12 min ago"
        },
      ];

  var editReviewList = [
    {"icon": eSvgAssets.bad, "title": appFonts.bad},
    {"icon": eSvgAssets.okay, "title": appFonts.okay},
    {"icon": eSvgAssets.good, "title": appFonts.good},
    {"icon": eSvgAssets.amazing, "title": appFonts.amazing},
    {"icon": eSvgAssets.excellent, "title": appFonts.excellent},
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

  var ratingList = [
    {"rate": appFonts.fiveRate, "icon": eSvgAssets.star5, "value": 5},
    {"rate": appFonts.fourRate, "icon": eSvgAssets.star4, "value": 4},
    {"rate": appFonts.threeRate, "icon": eSvgAssets.star3, "value": 3},
    {"rate": appFonts.twoRate, "icon": eSvgAssets.star2, "value": 2},
    {"rate": appFonts.oneRate, "icon": eSvgAssets.star1, "value": 1},
  ];

  var filterList = [appFonts.category, appFonts.rating, appFonts.distance];

  List experienceList = [
    {
      "id": 0,
      "title": appFonts.highestExperience,
    },
    {"id": 1, "title": appFonts.lowestExperience},
    {"id": 2, "title": appFonts.highestServed},
    {"id": 3, "title": appFonts.lowestServed},
  ];
  List businessCategory = ["Restaurant", "Bar", "Cafe"];
  List priceRange = ["10-100", "100-1000", "10000-10,000"];
  List offerType = ["Free Gift", "Coupon", "Voucher"];

  var businessReviewRating = [
    {"stars": 5, "percentage": 84},
    {"stars": 4, "percentage": 9},
    {"stars": 3, "percentage": 4},
    {"stars": 2, "percentage": 2},
    {"stars": 1, "percentage": 1},
  ];

  List reviewLowHighList = [
    {"id": 0, "title": appFonts.lowestRate},
    {"id": 1, "title": appFonts.highestRate},
  ];

  var selectList = [
    {"image": eSvgAssets.gallery, "title": "Choose From Gallery"},
    {"image": eSvgAssets.camera, "title": "Open Camera"}
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

  List get businessOfferList => [
        {
          "name": "Coffee House",
          "title": "Buy 1 Get 1 Free on all drinks",
          "tag": "5% OFF",
          "image": {"source": eImageAssets.appLogo},
          "expirationDate": DateTime.now().add(Duration(days: 10)),
          "isFavourite": true,
          "bookingsCount": "85"
        },
        {
          "name": "Pizza Planet",
          "title": "20% Off on orders above \$25",
          "tag": "Buy 1 GET 1",
          "image": {"source": eImageAssets.appLogo},
          "expirationDate": DateTime.now().add(Duration(days: 5)),
          "isFavourite": false,
          "bookingsCount": "85"
        },
        {
          "name": "Salon Bliss",
          "title": "Flat 30% Off on Haircuts",
          "tag": "10€ OFF",
          "image": {"source": eImageAssets.appLogo},
          "expirationDate": DateTime.now().add(Duration(days: 15)),
          "isFavourite": true,
          "bookingsCount": "85"
        }
      ];
}
