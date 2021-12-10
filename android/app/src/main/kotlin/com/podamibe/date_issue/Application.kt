package com.podamibe.date_issue

import com.webengage.sdk.android.LocationTrackingStrategy
import com.webengage.sdk.android.WebEngageConfig
import com.webengage.webengage_plugin.WebengageInitializer
import io.flutter.app.FlutterApplication

class Application : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()

        val webEngageConfig: WebEngageConfig = WebEngageConfig.Builder()
            .setWebEngageKey("aa131c65") //aa131c65
            .setAutoGCMRegistrationFlag(false)
            .setLocationTrackingStrategy(LocationTrackingStrategy.ACCURACY_BEST)
            .setDebugMode(true) // only in development mode
            .build()
        WebengageInitializer.initialize(this, webEngageConfig)

    }
}