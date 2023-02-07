#获取OAID的SDK -keep class XI.CA.XI.**{*;}
-keep class XI.K0.XI.**{*;}
-keep class XI.XI.K0.**{*;}
-keep class XI.xo.XI.XI.**{*;}
-keep class com.asus.msa.SupplementaryDID.**{*;}
-keep class com.asus.msa.sdid.**{*;}
-keep class com.bun.lib.**{*;}
-keep class com.bun.miitmdid.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.opendeviceidlibrary.**{*;}
-keep class org.json.**{*;}
-keep public class com.netease.nis.sdkwrapper.Utils {
    public <methods>;
}
#基础模块
-keep class com.youxiao.ssp.base.listener.* {
    *;
}
-keep class com.youxiao.ssp.base.bean.ShareData { public <methods>; }
-keepclassmembers class * extends com.youxiao.ssp.base.core.JsBridge { public <methods>; }
-keep class com.youxiao.ssp.ad.core.AdClient { public <methods>; }
-keep class com.youxiao.ssp.ad.listener.* { *; }
-keep class com.youxiao.ssp.ad.bean.SSPAd { public <methods>; }
-keep class com.youxiao.ssp.ad.bean.NextAdInfo {
    public *;
}
-keep class com.youxiao.ssp.ad.bean.SSPContentItem {
    *** get*();
    }
-keep class com.youxiao.ssp.coupon.listener.* {
    *;
}
-keep class com.youxiao.ssp.base.activity.SSPWebActivity {
    public <methods>;
}
-keep class * extends com.youxiao.ssp.base.activity.SSPBaseActivity {
    public static <fields>; public static <methods>;
}
-keep class * extends com.youxiao.ssp.base.activity.SSPBaseFragmentActivity {
    public static <fields>; public static <methods>;
}
-keep class * extends android.support.v4.app.Fragment {
    public static <fields>; public static <methods>;
}
-keep class com.youxiao.ssp.core.SSPSdk {
    public <methods>;
}

#广告模块 (*** 纯电商优惠券SDK无需添加广告混淆配置 ***) -keepclassmembers class * extends android.app.Activity { public void *(android.view.View); }-keepclassmembers enum * { public static **[] values(); public static ** valueOf(java.lang.String); }-keep class com.baidu.mobads.** { *; } -keep class com.baidu.mobad.** { *; } -keep class com.qq.e.** { *; }-keep class android.support.v4.**{ public *; }-keep class android.support.v7.**{ public *; }-keep class com.bytedance.pangle.** {*;} -keep class com.bytedance.sdk.openadsdk.** { *; } -keep class com.bykv.vk.** {*;} -keep class com.ss.android.**{*;} -keep class com.bytedance.android.**{*;} -keep class com.byted.live.**{*;} -keep class org.chromium.** { *; }
-keep class aegon.chrome.** {*;}
-keep class com.kwai.**{*;}
-keep class com.kwad.**{ *;}
-keep class com.ksad.**{*;}
-keep class com.kuaishou.**{*;}
-keep class com.yxcorp.**{ *;}
-keepclasseswithmembernames class * {
    native <methods>;
}
-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**
-keep class com.yilan.sdk.**{*;}
-dontwarn javax.annotation.**
-dontwarn sun.misc.Unsafe
-dontwarn org.conscrypt.*
-dontwarn okio.**
-keep class com.fun.** {*;}
-keep class com.funshion.** {*;}
-keep class android.support.annotation.Keep
-keep @android.support.annotation.Keep class * {
    @android.support.annotation.Keep <init>(...);
    @ android.support.annotation.Keep <methods>;
    @android.support.annotation.Keep <fields>;
}
-keep class okhttp3.** {*;}
-keep class okio. {*;}
-keep class com.alibaba.fastjson.** {*;}
-keep class sun.misc.Unsafe { *; }
-dontwarn com.sigmob.** -keep class com.sigmob.**.**{*;}
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.mbridge.** {*; }
-keep interface com.mbridge.** {*; }
-keep class android.support.v4.** {*;}
-dontwarn com.mbridge.**
-keep class **.R$* {
    public static final int mbridge*;
}

#厂商广告平台 (*** 未接入厂商广告平台或纯电商优惠券SDK无需添加广告混淆配置 ***)
-keep class com.miui.** { *;}
-keep class com.xiaomi.** { *; }
-keep class * extends android.os.IInterface{ *; }
-keep class com.huawei.openalliance.ad.** { *; }
-keep class com.huawei.hms.ads.** { *; }
-keepattributes SourceFile, LineNumberTable
-dontwarn com.squareup.okhttp.**
-dontwarn okhttp3.**
-keep class com.vivo.*.** { *; }
-dontwarn com.bytedance.article.common.nativecrash.NativeCrashInit
-keep class com.androidquery.callback.** {*;}
-keep class com.ss.sys.ces.* {*;}
-keep class com.opos.** { *;}
-keep class com.heytap.msp.mobad.api.** {*;}
-keep class com.heytap.openid.** {*;}

# glide (未使用该库可忽略)
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep class * extends com.bumptech.glide.module.AppGlideModule {
    <init>(...);
}
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
    **[] $VALUES;
    public *;
}
-keep class com.bumptech.glide.load.data.ParcelFileDescriptorRewinder$InternalRewinder {
    *** rewind();
}