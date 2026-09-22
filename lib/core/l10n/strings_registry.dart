import '../enums/app_locale.dart';
import 'strings_base.dart';
import 'strings_en.dart';
import 'strings_tr.dart';
import 'strings_es.dart';
import 'strings_de.dart';
import 'strings_fr.dart';
import 'strings_pt.dart';
import 'strings_it.dart';
import 'strings_nl.dart';
import 'strings_pl.dart';
import 'strings_ru.dart';
import 'strings_ja.dart';
import 'strings_ko.dart';
import 'strings_zh.dart';
import 'strings_hi.dart';
import 'strings_id.dart';
import 'strings_vi.dart';
import 'strings_ar.dart';
import 'strings_uk.dart';
import 'strings_cs.dart';
import 'strings_ro.dart';
import 'strings_sv.dart';
import 'strings_da.dart';
import 'strings_fi.dart';
import 'strings_el.dart';
import 'strings_hu.dart';
import 'strings_ms.dart';
import 'strings_th.dart';

StringsBase stringsForLocale(AppLocale locale) {
  return switch (locale) {
    AppLocale.en => const StringsEn(),
    AppLocale.tr => const StringsTr(),
    AppLocale.es => const StringsEs(),
    AppLocale.de => const StringsDe(),
    AppLocale.fr => const StringsFr(),
    AppLocale.pt => const StringsPt(),
    AppLocale.it => const StringsIt(),
    AppLocale.nl => const StringsNl(),
    AppLocale.pl => const StringsPl(),
    AppLocale.ru => const StringsRu(),
    AppLocale.ja => const StringsJa(),
    AppLocale.ko => const StringsKo(),
    AppLocale.zh => const StringsZh(),
    AppLocale.hi => const StringsHi(),
    AppLocale.id => const StringsId(),
    AppLocale.vi => const StringsVi(),
    AppLocale.ar => const StringsAr(),
    AppLocale.uk => const StringsUk(),
    AppLocale.cs => const StringsCs(),
    AppLocale.ro => const StringsRo(),
    AppLocale.sv => const StringsSv(),
    AppLocale.da => const StringsDa(),
    AppLocale.fi => const StringsFi(),
    AppLocale.el => const StringsEl(),
    AppLocale.hu => const StringsHu(),
    AppLocale.ms => const StringsMs(),
    AppLocale.th => const StringsTh(),
  };
}
