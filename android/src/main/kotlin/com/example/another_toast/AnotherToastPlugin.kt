package com.example.another_toast

import android.view.Gravity
import android.view.LayoutInflater
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import android.graphics.Color
import android.graphics.drawable.GradientDrawable

class AnotherToastPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel : MethodChannel
    private lateinit var context: android.content.Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "another_toast")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        if (call.method == "showToast") {
            val message = call.argument<String>("message") ?: "Hello from Toast!"
            val length = call.argument<String>("length") ?: "short"
            val backgroundColor = call.argument<String>("backgroundColor") ?: "#323232"
            val textColor = call.argument<String>("textColor") ?: "#FFFFFF"
            val fontSize = call.argument<Double>("fontSize") ?: 16.0
            val radius = call.argument<Double>("radius") ?: 16.0
            val gravity = call.argument<String>("gravity") ?: "bottom"

            val inflater = LayoutInflater.from(context)
            val layout = inflater.inflate(
                context.resources.getIdentifier("custom_toast", "layout", context.packageName),
                null
            )

            val textView = layout.findViewById<TextView>(
                context.resources.getIdentifier("toast_text", "id", context.packageName)
            )
            textView.text = message
            textView.setTextColor(Color.parseColor(textColor))
            textView.textSize = fontSize.toFloat()

            val backgroundDrawable = GradientDrawable()
            backgroundDrawable.setColor(Color.parseColor(backgroundColor))
            backgroundDrawable.cornerRadius = radius.toFloat()
            layout.background = backgroundDrawable

            val toast = Toast(context)
            toast.duration = if (length == "long") Toast.LENGTH_LONG else Toast.LENGTH_SHORT
            toast.view = layout

            when (gravity.lowercase()) {
                "top" -> toast.setGravity(Gravity.TOP or Gravity.CENTER_HORIZONTAL, 0, 150)
                "center" -> toast.setGravity(Gravity.CENTER, 0, 0)
                else -> toast.setGravity(Gravity.BOTTOM or Gravity.CENTER_HORIZONTAL, 0, 150)
            }

            toast.show()
            result.success("Custom Toast Shown")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}