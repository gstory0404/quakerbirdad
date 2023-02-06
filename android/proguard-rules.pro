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