package com.gstory.quakerbirdad.expressad

import android.app.Activity
import android.content.Context
import android.view.View
import android.widget.FrameLayout
import com.gstory.flutter_unionad.UIUtils
import com.gstory.quakerbirdad.LogUtil
import com.gstory.quakerbirdad.QuakerBirdAdConfig
import com.youxiao.ssp.ad.bean.NextAdInfo
import com.youxiao.ssp.ad.bean.SSPAd
import com.youxiao.ssp.ad.core.AdClient
import com.youxiao.ssp.ad.listener.AdLoadAdapter
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

/**
 * @Author: gstory
 * @CreateDate: 2023/2/5 14:11
 * @Description: 模板信息流视频广告
 */
internal class ExpressDrawAdView(
        var context: Context,
        var activity: Activity,
        messenger: BinaryMessenger,
        id: Int,
        params: Map<String?, Any?>
) : PlatformView {
    private val TAG = this.javaClass.name
    private var mContainer: FrameLayout? = null

    //广告所需参数
    private var mCodeId: String?

    private var channel: MethodChannel?
    private var adClient: AdClient? = null

    init {
        mCodeId = params["androidId"] as String?
        mContainer = FrameLayout(activity)
        channel = MethodChannel(messenger, QuakerBirdAdConfig.ExpressDrawAdView + "_" + id)
        loadBannerAd()
    }

    override fun getView(): View {
        return mContainer!!
    }

    override fun dispose() {
        mContainer?.removeAllViews()
        adClient?.release()
    }


    private fun loadBannerAd() {
        adClient = AdClient(activity)
        adClient?.requestExpressDrawFeedAd(mCodeId, object : AdLoadAdapter() {
            //广告信息加载成功回调
            override fun onAdLoad(p0: SSPAd?) {
                LogUtil.d("$TAG 广告信息加载成功")
                //获取到模板视频信息流广告，将其添加到显示的容器控件中
                mContainer?.removeAllViews()
                mContainer?.addView(p0?.view)
            }

            //广告点击回调
            override fun onAdClick(p0: SSPAd?) {
                LogUtil.d("$TAG 广告点击")
                channel?.invokeMethod("onClick", null)
            }

            //广告显示回调
            override fun onAdShow(p0: SSPAd?) {
                LogUtil.d("$TAG 广告显示")
                p0?.view?.post {
                    var map: MutableMap<String, Any?> = mutableMapOf("width" to UIUtils.px2dip(activity, p0.view.measuredWidth.toFloat()), "height" to UIUtils.px2dip(activity, p0.view.measuredHeight.toFloat()))
                    channel?.invokeMethod("onShow", map)
                }
            }

            //广告隐藏或关闭回调
            override fun onAdDismiss(p0: SSPAd?) {
                LogUtil.d("$TAG 广告隐藏或关闭")
                channel?.invokeMethod("onDismiss", null)
            }

            //广告开始下载回调
            override fun onStartDownload(p0: String?) {
                LogUtil.d("$TAG 广告开始下载")
            }

            //下载完成回调
            override fun onDownloadCompleted(p0: String?) {
                LogUtil.d("$TAG 下载完成")
            }

            //下载应用开始安装回调
            override fun onStartInstall(p0: String?) {
                LogUtil.d("$TAG 下载应用开始安装")
            }

            //下载应用安装完成回调
            override fun onInstallCompleted(p0: String?) {
                LogUtil.d("$TAG 下载应用安装完成")
            }

            //获取广告失败回调
            override fun onError(p0: Int, p1: String?) {
                LogUtil.d("$TAG 获取广告失败  $p1")
                channel?.invokeMethod("onError", mutableMapOf("msg" to "p1"))
            }

            /** * 状态回调
             ** @param p0 类型 *
             * @param p1 平台，见SdkData中的平台类型 *
             * @param p2 状态 *
             * @param p3 错误消息 (失败时有效)
             */
            override fun onStatus(p0: Int, p1: Int, p2: Int, p3: String?) {
                LogUtil.d("$TAG 广告状态  类型:$p0  平台:$p1  状态:$p2  错误消息(失败时有效):$p3")
                channel?.invokeMethod("onStatus", mutableMapOf("type" to p0, "platform" to p1, "status" to p2, "msg" to p3))
            }

            //下一个广告信息
            override fun onNext(p0: NextAdInfo?) {

            }
        })
    }
}