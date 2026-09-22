# WorkManager + Room — required for home_widget / Glance in release (R8 strips reflective constructors).
# https://issuetracker.google.com/issues/243257364
-keep class androidx.work.** { *; }
-keepclassmembers class androidx.work.** {
    <init>(...);
}
-keep class * extends androidx.work.Worker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}
-keep class androidx.work.impl.** { *; }

-keep class * extends androidx.room.RoomDatabase { *; }
-keep @androidx.room.Entity class *
-keepclassmembers class * extends androidx.room.RoomDatabase {
    <init>(...);
}

-keep class androidx.glance.** { *; }
-keepclassmembers class androidx.glance.** {
    <init>(...);
}
