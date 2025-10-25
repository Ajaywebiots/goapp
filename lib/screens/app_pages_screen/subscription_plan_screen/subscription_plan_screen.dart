import 'dart:developer';
import 'package:shimmer/shimmer.dart';
import '../../../config.dart';
import '../../../models/api_model/profile_detail_model.dart';
import '../../../services/api_service.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  bool isLoading = true;
  String? membershipType;
  String? status;
  String? joinDate;
  String? renewDate;
  bool hasSubscription = false;
  dynamic membershipId;

  ProfileDetailModel? profileDetailModel;

  @override
  void initState() {
    super.initState();
    fetchSubscriptionData();
  }

  Future<void> fetchSubscriptionData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);
    try {
      await apiServices
          .commonApi(
              "${api.subscriptions}$userId/subscriptions", [], ApiType.get,
              isToken: true)
          .then((value) async {
        if (value.data != null && value.data['membership'] != null) {
          final membership = value.data['membership'];

          setState(() {
            membershipType = membership['subscription'];
            membershipId = membership['membershipId'];
            hasSubscription = membership['subscription'] != null &&
                membership['subscription'].toString().toLowerCase() !=
                    'basic' &&
                membership['subscription'].toString().toLowerCase() != 'free' &&
                !membership['subscription']
                    .toString()
                    .toLowerCase()
                    .contains('basic / free');
            log("membershipId membershipId $membershipId");
            status = membership['status'] == 1 ? 'Active' : 'Inactive';

            if (membership['startDate'] != null) {
              final date = DateTime.parse(membership['startDate']);
              joinDate =
                  '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
            }

            if (membership['endDate'] != null) {
              final date = DateTime.parse(membership['endDate']);
              renewDate =
                  '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
            }

            isLoading = false;
          });
        } else {
          // Default if membership is null
          setState(() {
            membershipType = "Basic / Free";
            status = "Active";
            hasSubscription = false;
            isLoading = false;
          });
        }
      });
    } catch (e) {
      debugPrint('Error fetching subscription data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDetailProvider>(
        builder: (context, profileDetailPvr, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.black, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: const Text(
              'My Membership',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(children: [
                isLoading
                    ? _buildShimmerCard()
                    : _buildMembershipCard(
                        image: profileDetailPvr.profileImageUrl,
                        name:
                            "${profileDetailPvr.txtFName.text} ${profileDetailPvr.txtLName.text}"),
                const SizedBox(height: 28),
                ButtonCommon(
                    title: hasSubscription
                        ? 'Cancel Subscription'
                        : 'Upgrade Membership',
                    onTap: isLoading
                        ? () {}
                        : () {
                            if (hasSubscription) {
                              showDialog(
                                context: context,
                                builder: (context) => CancelMembershipDialog(
                                  hasSubscription,
                                  membershipId,
                                  isLoading,
                                  onCancelled: fetchSubscriptionData,

                                ),
                              );
                            } else {
                              route.pushNamed(
                                  context, routeName.payPalSubscriptionPage);
                            }
                          })
              ])));
    });
  }

  Widget _buildShimmerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            // Profile Image Shimmer
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            // Name Shimmer
            Container(
              width: 120,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 32),
            // Info Rows Shimmer
            _buildShimmerRow(),
            const SizedBox(height: 20),
            _buildShimmerRow(),
            const SizedBox(height: 20),
            _buildShimmerRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerRow() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Spacer(),
            Container(
              width: 100,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 1,
          color: const Color(0xFFE0E0E0),
        ),
      ],
    );
  }

  Widget _buildMembershipCard({String? image, name}) {
    log("status status $image");
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 11, 15, 26),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          if (image != null && image.isNotEmpty)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                color: Colors.grey[300],
              ),
              child: const Icon(Icons.person, size: 40, color: Colors.grey),
            ),
          SizedBox(height: Sizes.s5),

          // if (userName != null)
          Text(
            name,
            style: appCss.dmDenseMedium14.textColor(appColor(context).darkText),
          ),
          const SizedBox(height: 32),
          if (membershipType != null)
            _buildInfoRow(
              'Membership',
              membershipType!,
              showIcon: true,
            ),
          const SizedBox(height: 20),
          if (status != null)
            _buildInfoRow(
              'Status',
              status!,
              valueColor: status == 'Active'
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFFF44336),
            ),
          const SizedBox(height: 20),
          if (joinDate != null)
            _buildInfoRow(
              'Join Date',
              joinDate!,
            ),
          const SizedBox(height: 20),
          if (renewDate != null)
            _buildInfoRow(
              'Renew Date',
              renewDate!,
            ),
        ],
      ),
    );
  }

  Widget _buildUpgradeButton() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
                if (hasSubscription) {
                } else {}
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: appColor(context).primary,
          disabledBackgroundColor: Colors.grey[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          hasSubscription ? 'Cancel Subscription' : 'Upgrade Membership',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value,
      {Color? valueColor, bool showIcon = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style:
                  appCss.dmDenseRegular12.textColor(appColor(context).darkText),
            ),
            if (showIcon) ...[
              SvgPicture.asset("assets/svg/crown.svg"),
            ],
            Text(
              value,
              style: appCss.dmDenseMedium13
                  .textColor(valueColor ?? appColor(context).darkText),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 1,
          color: const Color(0xFF000000),
        ),
      ],
    );
  }
}

class CancelMembershipDialog extends StatefulWidget {
  bool? hasSubscription;
  final dynamic membershipId;
  bool? isLoading;
  final VoidCallback onCancelled;

  CancelMembershipDialog(
    this.hasSubscription,
    this.membershipId,
    this.isLoading, {
    super.key, required this.onCancelled,
  });

  @override
  State<CancelMembershipDialog> createState() => _CancelMembershipDialogState();
}

class _CancelMembershipDialogState extends State<CancelMembershipDialog> {
  Future<void> cancelSubscription() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final int? userId = pref.getInt(session.id);

    try {
      await apiServices
          .commonApi(
              "${api.subscriptions}$userId/subscription/${widget.membershipId}",
              [],
              ApiType.delete,
              isToken: true)
          .then((value) async {
        log("value value ${value.data}");
        route.pop(context);
        widget.onCancelled();
        showMessage(context, "Subscription Cancelled Successfully");
        // if (value.data != null) {
        //   // setState(() {
        //   //   widget.hasSubscription = false;
        //   //   widget.isLoading = false;
        //   //
        //   //   Navigator.pop(context);
        //   // });
        // }
      });
    } catch (e, s) {
      debugPrint('Error Cancel Subscription data: $e ------- $s');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Cancel Membership',
                style: appCss.dmDenseMedium18
                    .textColor(appColor(context).darkText),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: appColor(context).darkText))
            ]).padding(horizontal: 15, top: 20),
            const SizedBox(height: 30),
            Column(
              children: [
                Text(
                  'Are you sure you want to cancel your membership?',
                  textAlign: TextAlign.center,
                  style: appCss.dmDenseBold16.textColor(Color(0xff000000)),
                ),
                const SizedBox(height: 16),
                Text(
                  'Your membership will be still active until the renew date.',
                  textAlign: TextAlign.center,
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context).lightText),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1.5,
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          cancelSubscription();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).padding(horizontal: 20, bottom: 20),
          ],
        ),
      ),
    );
  }
}
