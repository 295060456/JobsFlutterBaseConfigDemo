# 项目不能打Android包的原因总结及解决方案

## 一、报错信息

```shell
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':flutter_plugin_engagelab:verifyReleaseResources'.
> A failure occurred while executing com.android.build.gradle.tasks.VerifyLibraryResourcesTask$Action
   > Android resource linking failed
     ERROR:/Users/jobs/Documents/Github/flutter_tiyu_app/build/flutter_plugin_engagelab/intermediates/merged_res/release/values/values.xml:239: AAPT: error: resource android:attr/lStar not found.


* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 1m 18s
Running Gradle task 'assembleRelease'...                           79.4s

┌─ Flutter Fix ──────────────────────────────────────────────────────────────────────────────────────────┐
│ [!] Your project requires a newer version of the Kotlin Gradle plugin.                                 │
│ Find the latest version on https://kotlinlang.org/docs/releases.html#release-details, then update the  │
│ version number of the plugin with id "org.jetbrains.kotlin.android" in the plugins block of            │
│ /Users/jobs/Documents/Github/flutter_tiyu_app/android/settings.gradle.                                 │
│                                                                                                        │
│ Alternatively (if your project was created before Flutter 3.19), update                                │
│ /Users/jobs/Documents/Github/flutter_tiyu_app/android/build.gradle                                     │
│ ext.kotlin_version = '<latest-version>'                                                                │
└────────────────────────────────────────────────────────────────────────────────────────────────────────┘
Gradle task assembleRelease failed with exit code 1
➜  flutter_tiyu_app git:(merge_theme（黑金打包分支）) ✗ 
```

> **你的本机 Android 编译环境比项目/插件要求低**。`android:attr/lStar` 是 **Android 12(API 31)** 才有的属性；你的构建在 **低于 31 的 compileSdk** 下跑，AAPT 就找不到它，于是挂在 `flutter_plugin_engagelab` 的资源验证上。同时 Flutter 给出的提示也说明 **Kotlin Gradle 插件过旧**。同组的人能打包，说明他们本机已经升级到匹配版本，而你没跟上

## 二、解决过程

### 1、确保你本机真的装了 **Android 34** 平台

```shell
➜  Desktop sdkmanager --list | grep "platforms;android-34" -n || true
7:  platforms;android-34 | 3       | Android SDK Platform 34    | platforms/android-34
189:  platforms;android-34                                                            | 3                 | Android SDK Platform 34                                               
190:  platforms;android-34-ext10                                                      | 1                 | Android SDK Platform 34-ext10                                         
191:  platforms;android-34-ext11                                                      | 1                 | Android SDK Platform 34-ext11                                         
192:  platforms;android-34-ext12                                                      | 1                 | Android SDK Platform 34-ext12                                         
193:  platforms;android-34-ext8                                                       | 1                 | Android SDK Platform 34-ext8                                          
➜  Desktop 
```

> 已经装了 `android-34`，所以**SDK 不缺**

### 2、快速体检（看哪里没对齐）

> 在项目根终端里面执行

```shell
➜  Desktop /Users/jobs/Desktop/flutter_tiyu_app 
➜  flutter_tiyu_app git:(merge_theme（黑金打包分支）) ✗ # 看 compileSdk 是否被写死为 30/29 等
grep -R --line-number "compileSdkVersion" android | sed 's/^/FOUND: /'

# 看是否有 flutter.* 覆盖
grep -R --line-number "flutter.compileSdkVersion" android/gradle.properties || true
grep -R --line-number "flutter.targetSdkVersion"  android/gradle.properties || true

# 看 AGP/Kotlin 版本（新结构看 settings.gradle）
sed -n '1,120p' android/settings.gradle | sed -n '1,120p' | grep -E 'com.android|kotlin' -n

# 旧结构（根 build.gradle）
sed -n '1,120p' android/build.gradle | grep -E 'kotlin|com.android.tools.build:gradle' -n

# Gradle & JDK
./android/gradlew -v
java -version

FOUND: android/app/build.gradle:28:    compileSdk = flutter.compileSdkVersion
FOUND: Binary file android/.gradle/7.6.3/executionHistory/executionHistory.bin matches
21:    id "com.android.application" version "7.3.0" apply false
22:    id "org.jetbrains.kotlin.android" version "1.7.10" apply false
23://    id "org.jetbrains.kotlin.android" version "1.9.22" apply false

------------------------------------------------------------
Gradle 7.6.3
------------------------------------------------------------

Build time:   2023-10-04 15:59:47 UTC
Revision:     1694251d59e0d4752d547e1fd5b5020b798a7e71

Kotlin:       1.7.10
Groovy:       3.0.13
Ant:          Apache Ant(TM) version 1.10.11 compiled on July 10 2021
JVM:          17.0.16 (Homebrew 17.0.16+0)
OS:           Mac OS X 15.6.1 aarch64

openjdk version "17.0.16" 2025-07-15
OpenJDK Runtime Environment Homebrew (build 17.0.16+0)
OpenJDK 64-Bit Server VM Homebrew (build 17.0.16+0, mixed mode, sharing)
➜  flutter_tiyu_app git:(merge_theme（黑金打包分支）) ✗ 
```

> repo 里 `settings.gradle` 固定了 **AGP 7.3.0 + Kotlin 1.7.10**

### 3、一键体检并抓错（项目根执行）

> 体检结论：
>
> 现在卡在 **依赖解析失败**：你项目 `pubspec.yaml` 里把 `intl` 写成了 `^0.19.0`，但 `flutter_localizations`（来自 Flutter SDK）**强制要求 `intl 0.20.2`**。这不是编译器问题，而是**你的依赖下界太低**，导致 `pub get` 直接失败，后续当然也打不了包。

```shell
#!/bin/zsh
set -euo pipefail

cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

PROP=android/gradle.properties
[[ -f $PROP ]] || : > "$PROP"

grep -q '^flutter.compileSdkVersion=' "$PROP" \
  && sed -i '' 's/^flutter\.compileSdkVersion=.*/flutter.compileSdkVersion=34/' "$PROP" \
  || echo 'flutter.compileSdkVersion=34' >> "$PROP"

grep -q '^flutter.targetSdkVersion=' "$PROP" \
  && sed -i '' 's/^flutter\.targetSdkVersion=.*/flutter.targetSdkVersion=34/' "$PROP" \
  || echo 'flutter.targetSdkVersion=34' >> "$PROP"

echo "== gradle.properties =="
sed -n '1,120p' "$PROP" || true

echo "== clean =="
( cd android && ./gradlew clean )
flutter clean
flutter pub get

echo "== build --info =="
( cd android && ./gradlew :app:assembleRelease --info --stacktrace ) | tee gradle-release.log || true

echo "== aapt2 link lines =="
grep -nE "aapt2.*link|resource linking failed|lStar|AAPT" gradle-release.log || true

echo "== who pins compileSdkVersion low =="
grep -R --line-number "compileSdkVersion" android | grep -v "/build/" || true
```

> ```shell
> ➜  flutter_tiyu_app git:(merge_theme（黑金打包分支）) ✗ /Users/jobs/Desktop/d.sh 
> == gradle.properties ==
> org.gradle.jvmargs=-Xmx4G -XX:+HeapDumpOnOutOfMemoryError
> android.useAndroidX=true
> android.enableJetifier=true
> flutter.compileSdkVersion=34
> flutter.targetSdkVersion=34
> == clean ==
> 
> > Configure project :app
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :android_id
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :audio_session
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :captcha_plugin_flutter
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :connectivity_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :device_info_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :firebase_core
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :firebase_messaging
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :flutter_icmp_ping
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :flutter_inappwebview_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :flutter_plugin_android_lifecycle
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :flutter_plugin_engagelab
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :fluttertoast
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :htprotect
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :image_gallery_saver_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :image_picker_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :just_audio
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :network_info_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :openinstall_flutter_plugin
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :package_info_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :path_provider_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :permission_handler_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :share_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :shared_preferences_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :sqflite
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :url_launcher_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :vibration
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :video_player_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :wakelock_plus
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> > Configure project :webview_flutter_android
> WARNING:Using flatDir should be avoided because it doesn't support any meta-data formats.
> WARNING:Using flatDir2 should be avoided because it doesn't support any meta-data formats.
> 
> Deprecated Gradle features were used in this build, making it incompatible with Gradle 8.0.
> 
> You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.
> 
> See https://docs.gradle.org/7.6.3/userguide/command_line_interface.html#sec:command_line_warnings
> 
> BUILD SUCCESSFUL in 3s
> 35 actionable tasks: 1 executed, 34 up-to-date
> Cleaning Xcode workspace...                                      2,826ms
> Deleting .dart_tool...                                               4ms
> Deleting Generated.xcconfig...                                       0ms
> Deleting flutter_export_environment.sh...                            0ms
> Deleting .flutter-plugins-dependencies...                            0ms
> Resolving dependencies... 
> Note: intl is pinned to version 0.20.2 by flutter_localizations from the flutter SDK.
> See https://dart.dev/go/sdk-version-pinning for details.
> 
> 
> Because flutter_tiyu_app depends on flutter_localizations from sdk which depends on intl 0.20.2, intl 0.20.2 is required.
> So, because flutter_tiyu_app depends on intl ^0.19.0, version solving failed.
> 
> 
> You can try the following suggestion to make the pubspec resolve:
> * Try upgrading your constraint on intl: flutter pub add intl:^0.20.2
> Failed to update packages.
> ➜  flutter_tiyu_app git:(merge_theme（黑金打包分支）) ✗ 
> ```

### 4、查询

> 部分三方包可能还写死了 `intl <0.20`（老库比较常见）。先查一下到底是谁：

```shell
➜  flutter_tiyu_app git:(merge_theme（黑金打包分支）) ✗ dart pub deps | grep -n "intl"
Note: intl is pinned to version 0.20.2 by flutter_localizations from the flutter SDK.
See https://dart.dev/go/sdk-version-pinning for details.

Because flutter_tiyu_app depends on flutter_localizations from sdk which depends on intl 0.20.2, intl 0.20.2 is required.
So, because flutter_tiyu_app depends on intl ^0.19.0, version solving failed.


You can try the following suggestion to make the pubspec resolve:
* Try upgrading your constraint on intl: dart pub add intl:^0.20.2
```

> 问题现在非常直接：你的 `pubspec.yaml` 把 `intl` 写死在 `^0.19.0`，而 `flutter_localizations` 强制 **0.20.2**，导致 `pub get` 根本跑不通 → 后续打包必失败。先把依赖树解开

### 5、发现新问题

> 现在已经铁锤：**`flutter_plugin_engagelab` 这个子模块在用低于 31 的 compileSdk**，所以仍旧在它的 `verifyReleaseResources` 阶段爆 `android:attr/lStar not found`。你的 app 已经设到 34 了，但**插件自己没跟着提**。

* 定位 pub 缓存里的插件

  > 先确认项目用了这个插件

  ```shell
  # 说明 pub get 时已经把它下载到本地缓存。
  ➜  flutter_tiyu_app git:(69-xin-pu-jing) ✗ grep -n "flutter_plugin_engagelab" pubspec.lock
  718:  flutter_plugin_engagelab:
  721:      name: flutter_plugin_engagelab
  ```

* 找到本地缓存目录

  * Flutter/Dart 的 pub 包会缓存到：

    ```
    ~/.pub-cache/hosted/pub.dev/
    ```

  * 每个子目录就是一个具体的包版本，例如：

    ```
    flutter_plugin_engagelab-1.2.9+500500
    flutter_plugin_engagelab-1.3.1+510510
    ```

  * 确认版本与路径（列出所有版本的 `build.gradle`）

    ```shell
    ➜  flutter_tiyu_app git:(69-xin-pu-jing) ✗ ls -d ~/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-*/android/build.gradle
    /Users/jobs/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-1.2.9+500500/android/build.gradle
    /Users/jobs/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-1.3.1+510510/android/build.gradle
    ```

* 修正命令

  > 项目终端下，直接运行👇
  >
  > 这样处理后，**engagelab 插件的 lStar 报错会消失**，剩下就是 `intl` 版本对齐的问题。

  ```shell
  for f in \
  "$HOME/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-1.2.9+500500/android/build.gradle" \
  "$HOME/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-1.3.1+510510/android/build.gradle"
  do
    [[ -f "$f" ]] || continue
    echo "🔧 fix line in: $f"
    cp "$f" "$f.bak.$(date +%s)"
  
    # 把本文件里以 compileSdkVersion 开头的那一行，整行替换为：compileSdkVersion 'android-34'
    /usr/bin/sed -E -i '' "s/^([[:space:]]*)compileSdkVersion.*$/\1compileSdkVersion 'android-34'/" "$f"
  
    # （可选）把 targetSdkVersion 那行统一成 34，避免旧值
    /usr/bin/sed -E -i '' "s/^([[:space:]]*)targetSdkVersion[[:space:]]+[0-9]+/\1targetSdkVersion 34/" "$f"
  done
  ```

  * 正确的形式

    > ```shell
    > compileSdkVersion 'android-34'
    > ```

    ```shell
    ➜  android git:(merge_theme（黑金打包分支）) ✗ nl -ba ~/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-1.2.9+500500/android/build.gradle | sed -n '1,120p' | grep -nE 'compileSdk|targetSdk'
    nl -ba ~/.pub-cache/hosted/pub.dev/flutter_plugin_engagelab-1.3.1+510510/android/build.gradle | sed -n '1,120p' | grep -nE 'compileSdk|targetSdk'
    30:    30	    compileSdkVersion 'android-34'
    30:    30	    compileSdkVersion 'android-34'
    ```

    

  

  