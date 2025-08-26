import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import 'layouts/blog_details_layout.dart';

class LatestBlogDetailsScreen extends StatelessWidget {
  const LatestBlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestBLogDetailsProvider>(
        builder: (context, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBarCommon(title: language(context, "Latest blog")),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const BlogDetailsLayout())
                    .decorated(
                        color: appColor(context).whiteBg,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 2,
                              color: appColor(context)
                                  .darkText
                                  .withOpacity(0.06))
                        ],
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        border: Border.all(color: appColor(context).stroke))
                    .padding(vertical: Insets.i15, horizontal: Insets.i20)
              ])))));
    });
  }
}
