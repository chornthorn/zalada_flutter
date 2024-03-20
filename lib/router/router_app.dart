import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/authentication/change_password/page/change_password_page.dart';
import 'package:zalada_flutter/modules/authentication/forget_password/page/forget_password_page.dart';
import 'package:zalada_flutter/modules/authentication/login/pages/login_page.dart';
import 'package:zalada_flutter/modules/authentication/new_password/page/new_password.dart';
import 'package:zalada_flutter/modules/authentication/otp/page/otp_page.dart';
import 'package:zalada_flutter/modules/authentication/register/page/register_page.dart';
import 'package:zalada_flutter/modules/home/presenter/detail_category_page.dart';
import 'package:zalada_flutter/modules/home/presenter/hot_deals_see_all_page.dart';
import 'package:zalada_flutter/modules/home/presenter/see_all_categories_page.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/notifications/pages/notification_page.dart';
import 'package:zalada_flutter/modules/onboarding/presenter/onboarding_page.dart';
import 'package:zalada_flutter/modules/orders/presenter/address_page.dart';
import 'package:zalada_flutter/modules/orders/presenter/edit_address_page.dart';
import 'package:zalada_flutter/modules/orders/presenter/orders_page.dart';
import 'package:zalada_flutter/modules/orders/presenter/payment_method_page.dart';
import 'package:zalada_flutter/modules/product/presenter/product_detail_page.dart';
import 'package:zalada_flutter/modules/profile/presenter/about_page.dart';
import 'package:zalada_flutter/modules/profile/presenter/add_payment_page.dart';
import 'package:zalada_flutter/modules/profile/presenter/edite_profile_page.dart';
import 'package:zalada_flutter/modules/profile/presenter/payment_method.dart';
import 'package:zalada_flutter/modules/profile/presenter/privacy_policy_page.dart';
import 'package:zalada_flutter/modules/profile/presenter/view_order_page.dart';
import 'package:zalada_flutter/modules/splash/splash_page.dart';

class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: SplashPage.routePath,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: MainPage.routePath,
        builder: (context, state) => MainPage(),
      ),
      GoRoute(
        path: OnBoardingPage.routePath,
        builder: (context, state) => OnBoardingPage(),
      ),
      GoRoute(
        path: LoginPage.routePath,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: RegisterPage.routePath,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
          path: OTPPage.routePath,
          builder: (context, state) {
            final email = state.extra;
            return OTPPage(email: email as String);
          }),
      GoRoute(
        path: ForgetPasswordPage.routePath,
        builder: (context, state) => ForgetPasswordPage(),
      ),
      GoRoute(
        path: NewPasswordPage.routePath,
        builder: (context, state) => NewPasswordPage(),
      ),
      GoRoute(
        path: ProductDetailPage.routePath,
        builder: (context, state) => ProductDetailPage(),
      ),
      GoRoute(
        path: EditeProfilePage.routePath,
        builder: (context, state) => EditeProfilePage(),
      ),
      GoRoute(
        path: OrdersPage.routePath,
        builder: (context, state) => OrdersPage(),
      ),
      GoRoute(
        path: PaymentMethodPage.routePath,
        builder: (context, state) => PaymentMethodPage(),
      ),
      GoRoute(
        path: AddressPage.routePath,
        builder: (context, state) => AddressPage(),
      ),
      GoRoute(
        path: PaymentMethodProfilePage.routePath,
        builder: (context, state) => PaymentMethodProfilePage(),
      ),
      GoRoute(
        path: AddPaymentPage.routePath,
        builder: (context, state) => AddPaymentPage(),
      ),
      GoRoute(
        path: ChangePasswordPage.routePath,
        builder: (context, state) => ChangePasswordPage(),
      ),
      GoRoute(
        path: AboutPage.routePath,
        builder: (context, state) => AboutPage(),
      ),
      GoRoute(
        path: PrivacyPolicyPage.routePath,
        builder: (context, state) => PrivacyPolicyPage(),
      ),
      GoRoute(
        path: NotificationPage.routePath,
        builder: (context, state) => NotificationPage(),
      ),
      GoRoute(
        path: HotDealSeeAllPage.routePath,
        builder: (context, state) => HotDealSeeAllPage(),
      ),
      GoRoute(
        path: SeeAllCategoriesPage.routePath,
        builder: (context, state) => SeeAllCategoriesPage(),
      ),
      GoRoute(
          path: ViewOrderPage.routePath,
          builder: (context, state) {
            final type = state.extra;
            return ViewOrderPage(type: type as String);
          }),
      GoRoute(
        path: EditAddressPage.routePath,
        builder: (context, state) => EditAddressPage(),
      ),
      GoRoute(
          path: DetailCategoryPage.routePath,
          builder: (context, state) {
            final title = state.extra;
            return DetailCategoryPage(title: title as String);
          }),
    ],
  );
}
