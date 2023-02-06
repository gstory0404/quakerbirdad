package com.gstory.quakerbirdad.fullscreenad

import android.app.Activity
import android.util.Log
import com.gstory.quakerbirdad.QuakerBirdAdEvent
import com.youxiao.ssp.ad.bean.NextAdInfo
import com.youxiao.ssp.ad.bean.SSPAd
import com.youxiao.ssp.ad.core.AdClient
import com.youxiao.ssp.ad.listener.AdLoadAdapter


/**
 * @Author: gstory
 * @CreateDate: 2023/2/3 16:22
 * @Description: java类作用描述
 */

object FullScreenAd {
    private var TAG = "FullScreenAd"
    var mActivity: Activity? = null

    //广告所需参数
    private var mCodeId: String? = null

    private lateinit var adClient: AdClient

    fun init(mActivity: Activity, mCodeId: String?) {
        this.mActivity = mActivity
        this.mCodeId = mCodeId
        adClient = AdClient(mActivity)
        loadFullScreenAd()
    }

    private fun loadFullScreenAd() {
        adClient.requestFullScreenVideoAd(mCodeId, object : AdLoadAdapter() {
            /**
             * 广告信息加载成功回调
             */
            override fun onAdLoad(p0: SSPAd?) {
                Log.d(TAG, "广告信息加载成功回调")
            }

            /**
             * 广告点击回调
             */
            override fun onAdClick(p0: SSPAd?) {
                Log.d(TAG, "广告点击回调")
            }

            /**
             * 广告显示回调
             */
            override fun onAdShow(p0: SSPAd?) {
                Log.d(TAG, "广告显示回调")
                QuakerBirdAdEvent.sendContent(mutableMapOf(
                        "adType" to "fullScreenAd",
                        "onAdMethod" to "onShow",
                ))
            }

            /**
             * 广告隐藏或关闭回调
             */
            override fun onAdDismiss(p0: SSPAd?) {
                Log.d(TAG, "广告隐藏或关闭回调")
                QuakerBirdAdEvent.sendContent(mutableMapOf(
                        "adType" to "fullScreenAd",
                        "onAdMethod" to "onDismiss",
                ))
            }

            /**
             * 广告开始下载回调
             */
            override fun onStartDownload(p0: String?) {

            }

            /**
             * 下载完成回调
             */
            override fun onDownloadCompleted(p0: String?) {

            }

            /**
             * 下载应用开始安装回调
             */
            override fun onStartInstall(p0: String?) {

            }

            /**
             * 下载应用安装完成回调
             */
            override fun onInstallCompleted(p0: String?) {

            }

            /*** 获取广告失败回调
             * @param p0 错误码
             * @param p1 错误信息
             */
            override fun onError(p0: Int, p1: String?) {
                Log.d(TAG, "获取广告失败回调 $p0 $p1")
                QuakerBirdAdEvent.sendContent(mutableMapOf("adType" to "fullScreenAd", "onAdMethod" to "onError", "msg" to p1))
            }


            /**
             * 下一个广告信息
             */
            override fun onNext(p0: NextAdInfo?) {

            }

            /** * 状态回调
             ** @param p0 类型
             * @param p1 平台，见SdkData中的平台类型
             * @param p2 状态
             * @param p3 错误消息 (失败时有效)
             */
            override fun onStatus(p0: Int, p1: Int, p2: Int, p3: String?) {
                Log.d(TAG, "状态回调 $p0 $p1 $p2 $p3")
                QuakerBirdAdEvent.sendContent(mutableMapOf("adType" to "fullScreenAd", "onAdMethod" to "onStatus", "type" to p0, "platform" to p1, "status" to p2, "msg" to p3))

            }
        })
    }
}