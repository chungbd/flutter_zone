package com.example.barometer

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** BarometerPlugin */
public class BarometerPlugin(): FlutterPlugin, MethodCallHandler, SensorEventListener, StreamHandler {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val plugin = BarometerPlugin()
    plugin.mContext = flutterPluginBinding.applicationContext
    val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "barometer")
    channel.setMethodCallHandler(plugin)

    val eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "pressureStream")
    eventChannel.setStreamHandler(plugin)
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "barometer")
      val plugin = BarometerPlugin()
      plugin.mContext = registrar.activeContext()
      channel.setMethodCallHandler(plugin)
    }
  }

  lateinit var mContext: Context
  private lateinit var mSensorManager: SensorManager
  private lateinit var mSensor: Sensor
  private var mLastestReading: Double = 0.0
  private var mEventSink: EventChannel.EventSink? = null

  fun initializeBarometer(): Boolean {
    mSensorManager = mContext.getSystemService(Context.SENSOR_SERVICE) as SensorManager
    mSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_PRESSURE)

    mSensorManager.registerListener(this, mSensor, SensorManager.SENSOR_DELAY_NORMAL)
    return true

  }

  private fun getBarometer(): Double {
    return mLastestReading
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
      return
    }

    if (call.method == "getBarometer") {
      result.success(getBarometer())
      return
    }

    if (call.method == "initializeBarometer") {
      result.success(initializeBarometer())
      return
    }

    result.notImplemented()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }

  override fun onAccuracyChanged(p0: Sensor?, p1: Int) {

  }

  override fun onSensorChanged(p0: SensorEvent?) {
    if (p0 != null) {
      mLastestReading = p0.values[0].toDouble()
    }

    mEventSink?.success(mLastestReading)
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    mEventSink = events
  }

  override fun onCancel(arguments: Any?) {
    mEventSink = null
  }
}
