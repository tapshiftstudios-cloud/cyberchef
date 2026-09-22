package com.cyberchef.pantry

import android.appwidget.AppWidgetManager
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

class PantryWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: android.content.SharedPreferences,
    ) {
        val critical = widgetData.getInt("critical_count", 0)
        val warning = widgetData.getInt("warning_count", 0)
        val title = widgetData.getString("widget_title", null)
            ?: context.getString(R.string.app_name)
        val counts = widgetData.getString("widget_counts", null)
            ?: "$critical critical · $warning warning"

        for (widgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.pantry_widget).apply {
                setTextViewText(R.id.widget_title, title)
                setTextViewText(R.id.widget_counts, counts)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
