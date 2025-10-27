plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.my_home"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.my_home"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug") // replace with release key later
        }
    }

    flavorDimensions += listOf("default")

    productFlavors {
        create("development") {
            dimension = "default"
            //app_ame is the same for all flavors, just chagne the come after 
            resValue("string", "app_name", "myHome dev")
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
        }
        create("production") {
            dimension = "default"
            resValue("string", "app_name", "myHome prod")
        }
    }
}

flutter {
    source = "../.."
}
