import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/all_brithday_pages/all_brithday_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_album_page/director_album_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_album_page/director_create_album/director_create_album_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_manag_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_views_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/teacher_management/teacher_manag_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_notice_page/director_add_notice/director_add_notice_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_notice_page/director_notice_controller.dart';
import 'package:kidbox_mobile/pages/main_page_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_schedule_page/dir_schedule_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/home_page/director_home_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/home_pending_pages/home_pending_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_add_menu_pages/director_add_menu_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_edit_menu_pages/director_edit_menu_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_menu_pages/director_menu_controller.dart';
import 'package:kidbox_mobile/pages/language_page/language_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/log_in_page_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_director/director_add_group_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_director/login_director_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_nurse/nurse_login_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_parent/choose_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_parent/parent_login_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/login_sms_page/login_sms_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_album_page/nurse_album_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_album_page/nurse_create_album/nurse_create_album_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_all_brithday_pages/nurse_all_brithday_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_page/nurse_home_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_pending_pages/nurse_home_pending_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_managements/child_manag_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_medical_request_pages/nurse_medical_request_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_add_menu_pages/nurse_add_menu_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_edit_menu_pages/nurse_edit_menu_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_menu_pages/nurse_menu_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_notice_page/nurse_add_notice/nurse_add_notice_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_notice_page/nurse_notice_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_schedule_page/nur_schedule_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_home_page/parent_home_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_add_report_pages/parent_add_report_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_all_report_pages/parent_all_report_controller.dart';

import '../pages/parent_pages/parent_medical_request/parent_medical_request_controller.dart';

class DIService implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
    Get.lazyPut<LogInController>(() => LogInController(), fenix: true);
    Get.lazyPut<LoginDirectorController>(() => LoginDirectorController(),
        fenix: true);
    Get.lazyPut<LoginNurseController>(() => LoginNurseController(),
        fenix: true);
    Get.lazyPut<LoginSmsController>(() => LoginSmsController(), fenix: true);
    Get.lazyPut<ChooseController>(() => ChooseController(), fenix: true);
    Get.lazyPut<ParentLoginController>(() => ParentLoginController(),
        fenix: true);
    Get.lazyPut<RoleController>(() => RoleController(), fenix: true);
    Get.lazyPut<HomePendingController>(() => HomePendingController(),
        fenix: true);
    Get.lazyPut<MainPageController>(() => MainPageController(),
        fenix: true);
    Get.lazyPut<DirectorAlbumController>(() => DirectorAlbumController(),
        fenix: true);
    Get.lazyPut<DirectorNoticeController>(() => DirectorNoticeController(),
        fenix: true);
    Get.lazyPut<DirectorCreateAlbumController>(
        () => DirectorCreateAlbumController(),
        fenix: true);
    Get.lazyPut<DirectorAddNoticeController>(
        () => DirectorAddNoticeController(),
        fenix: true);
    Get.lazyPut<MainPageController>(() => MainPageController(),
        fenix: true);
    Get.lazyPut<DirectorHomeController>(() => DirectorHomeController(),
        fenix: true);
    Get.lazyPut<DirChildManageController>(() => DirChildManageController(),
        fenix: true);
    Get.lazyPut<DirTeacherManageController>(() => DirTeacherManageController(),
        fenix: true);
    Get.lazyPut<DirectorMenuController>(() => DirectorMenuController(),
        fenix: true);
    Get.lazyPut<DirectorEditMenuController>(() => DirectorEditMenuController(),
        fenix: true);
    Get.lazyPut<AddMenuController>(() => AddMenuController(), fenix: true);
    Get.lazyPut<DirViewsController>(() => DirViewsController(), fenix: true);
    Get.lazyPut<DirectorScheduleController>(() => DirectorScheduleController(),
        fenix: true);
    Get.lazyPut<DirectorAddGroupController>(() => DirectorAddGroupController(),
        fenix: true);
    Get.lazyPut<NurseHomePendingController>(() => NurseHomePendingController(),
        fenix: true);
    Get.lazyPut<NurseHomeController>(() => NurseHomeController(), fenix: true);
    Get.lazyPut<NurseAllBrithdayController>(() => NurseAllBrithdayController(),
        fenix: true);
    Get.lazyPut<NurseMedicalRequestController>(
        () => NurseMedicalRequestController(),
        fenix: true);
    Get.lazyPut<NurseAddMenuController>(() => NurseAddMenuController(),
        fenix: true);
    Get.lazyPut<NurseEditMenuController>(() => NurseEditMenuController(),
        fenix: true);
    Get.lazyPut<NurseMealMenuController>(() => NurseMealMenuController(),
        fenix: true);
    Get.lazyPut<NurChildManagController>(() => NurChildManagController(),
        fenix: true);
    Get.lazyPut<NurseScheduleController>(() => NurseScheduleController(),
        fenix: true);
    Get.lazyPut<NurseNoticeController>(() => NurseNoticeController(),
        fenix: true);
    Get.lazyPut<NurseAlbumController>(() => NurseAlbumController(),
        fenix: true);
    Get.lazyPut<NurseCreateAlbumController>(() => NurseCreateAlbumController(),
        fenix: true);
    Get.lazyPut<NurseAddNoticeController>(() => NurseAddNoticeController(),
        fenix: true);
    Get.lazyPut<DirectorAllBrithdayController>(
        () => DirectorAllBrithdayController(),
        fenix: true);
    Get.lazyPut<ParentHomeController>(() => ParentHomeController(),
        fenix: true);
    Get.lazyPut<ParentReportController>(() => ParentReportController(),
        fenix: true);
    Get.lazyPut<ParentAddReportController>(() => ParentAddReportController(),
        fenix: true);
    Get.lazyPut<ParentMedicalRequestController>(
        () => ParentMedicalRequestController(),
        fenix: true);
  }

  // static Future<void> init() async {
  //   // Controllers
  //   Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
  //   Get.lazyPut<LogInController>(() => LogInController(), fenix: true);
  //   Get.lazyPut<LoginDirectorController>(() => LoginDirectorController(),
  //       fenix: true);
  //   Get.lazyPut<LoginNurseController>(() => LoginNurseController(),
  //       fenix: true);
  //   Get.lazyPut<LoginSmsController>(() => LoginSmsController(), fenix: true);
  //   Get.lazyPut<ChooseController>(() => ChooseController(), fenix: true);
  //   Get.lazyPut<ParentLoginController>(() => ParentLoginController(),
  //       fenix: true);
  //   Get.lazyPut<RoleController>(() => RoleController(), fenix: true);
  //   Get.lazyPut<HomePendingController>(() => HomePendingController(),
  //       fenix: true);
  //   Get.lazyPut<MainPageDirectorController>(() => MainPageDirectorController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorAlbumController>(() => DirectorAlbumController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorNoticeController>(() => DirectorNoticeController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorCreateAlbumController>(
  //       () => DirectorCreateAlbumController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorAddNoticeController>(
  //       () => DirectorAddNoticeController(),
  //       fenix: true);
  //   Get.lazyPut<MainPageDirectorController>(() => MainPageDirectorController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorHomeController>(() => DirectorHomeController(),
  //       fenix: true);
  //   Get.lazyPut<DirChildManagController>(() => DirChildManagController(),
  //       fenix: true);
  //   Get.lazyPut<DirTeacherManagController>(() => DirTeacherManagController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorMenuController>(() => DirectorMenuController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorEditMenuController>(() => DirectorEditMenuController(),
  //       fenix: true);
  //   Get.lazyPut<AddMenuController>(() => AddMenuController(), fenix: true);
  //   Get.lazyPut<DirViewsController>(() => DirViewsController(), fenix: true);
  //   Get.lazyPut<DirectorScheduleController>(() => DirectorScheduleController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorAddGroupController>(() => DirectorAddGroupController(),
  //       fenix: true);
  //   Get.lazyPut<NurseHomePendingController>(() => NurseHomePendingController(),
  //       fenix: true);
  //   Get.lazyPut<NurseHomeController>(() => NurseHomeController(), fenix: true);
  //   Get.lazyPut<NurseAllBrithdayController>(() => NurseAllBrithdayController(),
  //       fenix: true);
  //   Get.lazyPut<NurseMedicalRequestController>(
  //       () => NurseMedicalRequestController(),
  //       fenix: true);
  //   Get.lazyPut<NurseAddMenuController>(() => NurseAddMenuController(),
  //       fenix: true);
  //   Get.lazyPut<NurseEditMenuController>(() => NurseEditMenuController(),
  //       fenix: true);
  //   Get.lazyPut<NurseMealMenuController>(() => NurseMealMenuController(),
  //       fenix: true);
  //   Get.lazyPut<NurChildManagController>(() => NurChildManagController(),
  //       fenix: true);
  //   Get.lazyPut<NurseScheduleController>(() => NurseScheduleController(),
  //       fenix: true);
  //   Get.lazyPut<NurseNoticeController>(() => NurseNoticeController(),
  //       fenix: true);
  //   Get.lazyPut<NurseAlbumController>(() => NurseAlbumController(),
  //       fenix: true);
  //   Get.lazyPut<NurseCreateAlbumController>(() => NurseCreateAlbumController(),
  //       fenix: true);
  //   Get.lazyPut<NurseAddNoticeController>(() => NurseAddNoticeController(),
  //       fenix: true);
  //   Get.lazyPut<DirectorAllBrithdayController>(
  //       () => DirectorAllBrithdayController(),
  //       fenix: true);
  //   Get.lazyPut<ParentHomeController>(() => ParentHomeController(),
  //       fenix: true);
  //   Get.lazyPut<ParentReportController>(() => ParentReportController(),
  //       fenix: true);
  //   Get.lazyPut<ParentAddReportController>(() => ParentAddReportController(),
  //       fenix: true);
  //   Get.lazyPut<ParentMedicalRequestController>(
  //       () => ParentMedicalRequestController(),
  //       fenix: true);
  // }
}
