package com.gstory.quakerbirdad.rewardvideoad

import android.app.Activity
import android.util.Log
import com.gstory.quakerbirdad.QuakerBirdAdEvent
import com.youxiao.ssp.ad.bean.SSPAd
import com.youxiao.ssp.ad.core.AdClient
import com.youxiao.ssp.ad.listener.RewardVideoAdAdapter

/**
 * @Author: gstory
 * @CreateDate: 2023/2/3 17:44
 * @Description: java类作用描述
 */

object RewardVideoAd {

    private var TAG = this.javaClass.javaClass.name

    var mActivity: Activity? = null

    //广告所需参数
    private var mCodeId: String? = null

    private lateinit var adClient: AdClient

    fun init(mActivity: Activity, mCodeId: String?) {
        this.mActivity = mActivity
        this.mCodeId = mCodeId
        adClient = AdClient(mActivity)
        loadRewardAd()
    }

    private fun loadRewardAd() {
        adClient.requestRewardAd(mCodeId, object : RewardVideoAdAdapter() {
            /**
             * 加载激励视频广告成功回调
             */
            override fun loadRewardAdSuc(p0: SSPAd?) {
                Log.d(TAG, "加载激励视频广告成功回调")
            }

            /**
             * 加载激励视频广告失败回调
             * @param p0 错误信息
             */
            override fun loadRewardAdFail(p0: String?) {
                Log.d(TAG, "加载激励视频广告失败回调  $p0")
                QuakerBirdAdEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onError", "msg" to p0))
            }

            /**
             * 加载激励视频成功回调
             */
            override fun loadRewardVideoSuc() {
                Log.d(TAG, "加载激励视频成功回调")
                QuakerBirdAdEvent.sendContent(mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onShow"
                ))
            }

            /**
             * 加载激励视频失败回调
             * @param p0 错误码
             * @param p1 错误信息
             */
            override fun loadRewardVideoFail(p0: Int, p1: Int) {
                Log.d(TAG, "加载激励视频失败回调 $p0  $p1")
                QuakerBirdAdEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onError", "msg" to p1))
            }

            /**
             * 开始播放激励视频回调
             */
            override fun startPlayRewardVideo() {
                Log.d(TAG, "开始播放激励视频回调")
            }

            /**
             * 激励视频播放到一半回调
             */
            override fun playRewardVideoHalf() {
                Log.d(TAG, "激励视频播放到一半回调")
            }

            /**
             * 激励视频播放结束回调
             */
            override fun playRewardVideoCompleted(p0: Int) {
                Log.d(TAG, "激励视频播放结束回调  $p0")
            }

            /**
             * 激励 (支持服务端同步)
             */
            override fun onReward(type: Int) {
                Log.d(TAG, " 激励 (支持服务端同步)  $type")
                QuakerBirdAdEvent.sendContent(mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onReward",
                        "type" to type
                ))
            }

            /**
             * 点击激励视频回调
             */
            override fun rewardVideoClick() {
                QuakerBirdAdEvent.sendContent(mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onClick",
                ))
            }

            /**
             * 激励视频按钮点击回调
             */
            override fun rewardVideoButtonClick() {
                Log.d(TAG, "激励视频按钮点击回调")
            }

            /**
             * 激励视频关闭回调
             */
            override fun rewardVideoClosed() {
                Log.d(TAG, "激励视频关闭回调")
                QuakerBirdAdEvent.sendContent(mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onDismiss",
                ))
            }

            /** 状态回调
             ** @param p0 类型
             * @param p1 平台，见SdkData中的平台类型
             * @param p2 状态 *
             * @param p3 错误消息 (失败时有效)
             */
            override fun onStatus(p0: Int, p1: Int, p2: Int, p3: String?) {
                Log.d(TAG, "状态回调 $p0 $p1 $p2 $p3")
                QuakerBirdAdEvent.sendContent(mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onStatus", "type" to p0, "platform" to p1, "status" to p2, "msg" to p3))

            }
        })
    }
}