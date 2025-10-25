// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "banner_new": "جديد",
  "Pages": "صفحات",
  "Readers": "قارئ",
  "explore_by_categories": "استكشف بالفئات",
  "search_any_books": "ابحث عن أي كتاب",
  "Recommended": "الموصى بها",
  "popular_books": "الأكثر شعبية",
  "Newest": "أحدث الكتب في المكتبة",
  "Home": "الصفحة الرئيسية",
  "library": "المكتبة",
  "profile": "الملف الشخصي",
  "author_books": "كتب أخرى للمؤلف {author}",
  "similar_books": "كتب مشابهة",
  "book_details_title": "تفاصيل الكتاب",
  "borrow_book": "استعارة الكتاب",
  "currently_borrowed": "الكتاب المستعار حاليا",
  "return_date": "موعد الإرجاع: {date}",
  "extend_loan": "تمديد الاستعارة",
  "waiting_list_status": "{count} أشخاص في قائمة الانتظار",
  "estimated_availability": "متوقع توفره خلال: {day} أيام",
  "availability_notification": "سيصلك إشعار فوري عند توفر الكتاب",
  "reserve_book": "حجز الكتاب",
  "cancel_reservation": "إلغاء الحجز",
  "ready_for_pickup": "جاهز للاستلام",
  "pickup_deadline": "يجب الاستلام خلال:",
  "time_remaining": "{hours} ساعة و {minutes} دقيقة",
  "pickup_instruction": "يمكنك استلام الكتاب من مكتب الاستلام الرئيسي",
  "book_overdue": "الكتاب متأخر!",
  "return_urgent": "يرجى إرجاع الكتاب في أقرب وقت لتجنب غرامات إضافية",
  "due_date": "تاريخ الاستحقاق",
  "current_fine": "الغرامة الحالية",
  "currently_unavailable": "غير متاح حالياً",
  "unavailable_description": "هذا الكتاب غير متاح للاستعارة أو الحجز في الوقت الحالي.",
  "notify_availability": "كن أول من يعلم عند توفر الكتاب مرة أخرى !",
  "notify_me_button": "أخبرني عند التوفر",
  "show_less": "إظهار أقل",
  "show_more": "إظهار المزيد",
  "rate_book_title": "قيم هذا الكتاب",
  "your_rating": "شكراً لك! تم تسجيل تقييمك",
  "rate_book_description": "هل قرأت هذا الكتاب من قبل؟ شارك تقييمك",
  "cancel": "إلغاء",
  "save": "حفظ",
  "add_to_list": "إضافة إلى قائمة",
  "create_new_list": "إنشاء قائمة جديدة",
  "create_new_list_description": "أدخل اسم القائمة",
  "saving_in_progress": "جاري الحفظ...",
  "no_lists_yet": "لا توجد قوائم بعد",
  "create_first_list": "ابدأ بإنشاء قائمة جديدة لتنظيم كتبك المفضلة",
  "successfully_operation": "تمت العملية بنجاح'",
  "operation_failed": "فشلت العملية: {message}",
  "borrow": {
    "title": "استعارة الكتاب",
    "select_duration": "اختر مدة الاستعارة:",
    "days_count": "{count} أيام",
    "recommended": "موصى به",
    "today": "اليوم",
    "custom_option": {
      "title": "تحديد يدوي",
      "description": "اختر المدة التي تناسبك"
    },
    "enter_days": "حدد عدد الأيام (1 - {max}):",
    "enter_number_hint": "أدخل رقم من 1 إلى {max}",
    "details": {
      "title": "تفاصيل الاستعارة:",
      "start_date": "تاريخ البداية",
      "return_date": "تاريخ الإرجاع",
      "duration": "مدة الاستعارة"
    },
    "warnings": {
      "important_info": "معلومات مهمة:",
      "pickup": "يجب استلام الكتاب خلال {hours} ساعة من التأكيد",
      "fine": "غرامة التأخير: {amount} ريال سعودي لكل يوم تأخير",
      "auto_charge": "سيتم احتساب الغرامة تلقائياً في حالة التأخير"
    },
    "actions": {
      "confirm": "تأكيد الاستعارة"
    }
  },
  "extend": {
    "title": "تمديد الاستعارة",
    "current_borrow_info": "معلومات الاستعارة الحالية",
    "borrow_date": "تاريخ الاستعارة",
    "current_due_date": "موعد الإرجاع الحالي",
    "days_remaining": "{count} أيام متبقية",
    "select_duration": "اختر فترة التمديد:",
    "days_option": "{count} أيام",
    "recommended": "موصى به",
    "custom_option_title": "تحديد يدوي",
    "custom_option_description": "اختر المدة التي تناسبك",
    "details_title": "تفاصيل التمديد:",
    "extension_by": "التمديد بـ",
    "days_count": "+{count} أيام",
    "new_due_date": "موعد الإرجاع الجديد",
    "total_days": "إجمالي الأيام",
    "total_days_value": "{current} من {max} يوم",
    "important_info": "معلومات مهمة:",
    "max_extensions": "الحد الأقصى للتمديدات: {count} مرات",
    "max_days_per_extension": "الحد الأقصى لكل تمديد: {days} يوم",
    "max_total_days": "الحد الأقصى الإجمالي: {days} يوم",
    "confirm": "تأكيد التمديد",
    "invalid_days": "لا يمكن التمديد بأكثر من {max} يوم",
    "success_message": "تم تمديد الاستعارة بنجاح! الموعد الجديد: {date}",
    "error_max_reached": "لقد وصلت للحد الأقصى من التمديدات",
    "error_total_exceeded": "سيتجاوز التمديد الحد الأقصى للاستعارة"
  },
  "book_state": {
    "borrowable": "متاح للاستعارة",
    "borrowed": "مستعار",
    "reservable": "قابل للحجز",
    "reserved": "محجوز",
    "unavailable": "غير متاح",
    "overdue": "متأخر"
  },
  "time_ago": {
    "now": "الآن",
    "days_ago_single": "منذ يوم",
    "days_ago_dual": "منذ يومين",
    "days_ago_plural": "منذ {count} أيام",
    "days_ago_many": "منذ {count} يوماً",
    "hours_ago_single": "منذ ساعة",
    "hours_ago_dual": "منذ ساعتين",
    "hours_ago_plural": "منذ {count} ساعات",
    "hours_ago_many": "منذ {count} ساعة",
    "minutes_ago_single": "منذ دقيقة",
    "minutes_ago_dual": "منذ دقيقتين",
    "minutes_ago_plural": "منذ {count} دقائق",
    "minutes_ago_many": "منذ {count} دقيقة"
  }
};
static const Map<String,dynamic> _en = {
  "banner_new": "New",
  "pages": "Pages",
  "Readers": "Readers",
  "explore_by_categories": "Explore by Categories",
  "search_any_books": "Search any book",
  "Recommended": "Recommended for you",
  "popular_books": "Most popular books",
  "Newest": "New Books in Library",
  "Home": "Home",
  "library": "Library",
  "profile": "Profile",
  "author_books": "Anthor Books for {author}",
  "similar_books": "Similar Books",
  "book_details_title": "Book Details",
  "borrow_book": "Borrow Book",
  "currently borrowed": "Your currently borrowed book",
  "return_date": "Return date: {date}",
  "extend_loan": "Extend Loan",
  "waiting_list_status": "{count} People on waiting list",
  "estimated_availability": "Expected availability: {day} days",
  "availability_notification": "You will receive an instant notification when the book becomes available",
  "reserve_book": "Reserve Book",
  "cancel_reservation": "Cancel Reservation",
  "ready_for_pickup": "Ready to pick up",
  "pickup_deadline": "Must be picked up within:",
  "time_remaining": "{hours} hours and {minutes} minutes",
  "pickup_instruction": "You can pick up the book from the main reception desk",
  "book_overdue": "Book is overdue!",
  "return_urgent": "Please return the book as soon as possible to avoid additional fines",
  "due_date": "Due date",
  "current_fine": "Current fine",
  "currently_unavailable": "Currently unavailable",
  "unavailable_description": "This book is not available for borrowing or reservation at the moment.",
  "notify_availability": "Be the first to know when it becomes available again !",
  "notify_me_button": "Notify When Available",
  "show_less": "Show Less",
  "show_more": "Show More",
  "rate_book_title": "Rate this book",
  "your_rating": "Thank you! Your rating has been recorded",
  "rate_book_description": "Have you read this book before? Share your rating",
  "cancel": "Cancel",
  "save": "Save",
  "add_to_list": "Add to List",
  "create_new_list": "Create new list",
  "create_new_list_description": "Please enter List Name",
  "saving_in_progress": "Saving...",
  "no_lists_yet": "No lists yet",
  "create_first_list": "Start by creating a new list to organize your favorite books",
  "successfully_operation": "Operation done successfully",
  "operation_failed": "Operation failed: {message}",
  "borrow": {
    "title": "Borrow Book",
    "select_duration": "Choose borrowing period:",
    "days_count": "{count} days",
    "recommended": "Recommended",
    "today": "Today",
    "custom_option": {
      "title": "Custom Duration",
      "description": "Choose your preferred period"
    },
    "enter_days": "Specify number of days (1 - {max}):",
    "enter_number_hint": "Enter a number from 1 to {max}",
    "details": {
      "title": "Borrowing Details:",
      "start_date": "Start Date",
      "return_date": "Return Date",
      "duration": "Borrowing Period"
    },
    "warnings": {
      "important_info": "Important Information:",
      "pickup": "Book must be picked up within {hours} hours of confirmation",
      "fine": "Late fee: {amount} SAR per day overdue",
      "auto_charge": "Fees will be automatically charged for late returns"
    },
    "actions": {
      "confirm": "Confirm Borrowing"
    }
  },
  "extend": {
    "title": "Extend Borrow",
    "current_borrow_info": "Current Borrow Information",
    "borrow_date": "Borrow Date",
    "current_due_date": "Current Due Date",
    "days_remaining": "{count} days remaining",
    "select_duration": "Choose extension period:",
    "days_option": "{count} days",
    "recommended": "Recommended",
    "custom_option_title": "Custom Duration",
    "custom_option_description": "Choose your preferred period",
    "details_title": "Extension Details:",
    "extension_by": "Extension By",
    "days_count": "+{count} days",
    "new_due_date": "New Due Date",
    "total_days": "Total Days",
    "total_days_value": "{current} of {max} days",
    "important_info": "Important Information:",
    "max_extensions": "Maximum extensions: {count} times",
    "max_days_per_extension": "Maximum per extension: {days} days",
    "max_total_days": "Maximum total: {days} days",
    "confirm": "Confirm Extension",
    "invalid_days": "Cannot extend more than {max} days",
    "success_message": "Borrow extended successfully! New due date: {date}",
    "error_max_reached": "You have reached the maximum number of extensions",
    "error_total_exceeded": "Extension would exceed maximum borrowing period"
  },
  "book_state": {
    "borrowable": "Borrowable",
    "borrowed": "Borrowable",
    "reservable": "Reservable",
    "reserved": "Reserved",
    "unavailable": "Unavailable",
    "overdue": "Overdue"
  },
  "time_ago": {
    "now": "Now",
    "days_ago_single": "1 day ago",
    "days_ago_dual": "2 days ago",
    "days_ago_plural": "{count} days ago",
    "days_ago_many": "{count} days ago",
    "hours_ago_single": "1 hour ago",
    "hours_ago_dual": "2 hours ago",
    "hours_ago_plural": "{count} hours ago",
    "hours_ago_many": "{count} hours ago",
    "minutes_ago_single": "1 minute ago",
    "minutes_ago_dual": "2 minutes ago",
    "minutes_ago_plural": "{count} minutes ago",
    "minutes_ago_many": "{count} minutes ago"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
