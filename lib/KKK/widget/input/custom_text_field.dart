import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/font_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

const double _lineHeight = 0.8; // 底部线高
const double _textFontSize = 15.0;
const double _hintTextFontSize = 15.0;

/// 录入回调
typedef CustomInputCallBack = void Function(String value);
typedef CustomGetFocusNodeCallBack = void Function();
typedef CustomTextFieldTapCallback = void Function();

/// 录入完成回调（失去焦点或者点击键盘右下角按钮触发）
/// isSubmitted：是否通过onSubmitted方法触发
/// 直接使用回调范围更大，可判断外部三方键盘关闭按钮点击事件，如果有多个textField切换，也会走这个回调，按需使用
typedef CustomInputCompletionCallBack = void Function(String value, bool isSubmitted);

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.text = '',
      this.style,
      this.hintText = '',
      this.labelText,
      this.hintColor,
      this.textColor,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.focusNode,
      this.isPwd = false,
      this.leftWidget,
      this.rightWidget,
      this.maxLines = 1,
      this.maxLength = 30,
      this.isShowDeleteBtn = false,
      this.inputFormatters,
      this.inputCallBack,
      this.inputCompletionCallBack,
      this.getFocusNodeCallBack,
      this.pwdOpen,
      this.pwdClose,
      this.border,
      this.isDense = false,
      this.contentPadding,
      this.enabled = true,
      this.autofocus = false,
      this.leftWidgetConstraints,
      this.onTap,
      this.isCursorEnd = true,
      this.isRemoveHint = false,
      this.hintStyle})
      : super(key: key);

  final String? text;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String hintText;
  final Color? hintColor;
  final Color? textColor;
  final String? labelText; // top提示文字
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction; // 键盘右下角按钮类型
  final bool enabled;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isPwd; // 是否是密码，默认不是
  final Widget? leftWidget; // 左侧widget ，默认隐藏
  final Widget? rightWidget; // 右侧widget ，默认隐藏
  final int maxLines; // 最大行数，默认1
  final int maxLength; // 最大长度，默认20
  final bool isShowDeleteBtn; // 是否显示右侧删除按钮，默认不显示
  final List<TextInputFormatter>? inputFormatters;
  final CustomInputCallBack? inputCallBack;
  final CustomInputCompletionCallBack? inputCompletionCallBack;
  final CustomGetFocusNodeCallBack? getFocusNodeCallBack;
  final String? pwdOpen; // 自定义密码图片路径 睁眼
  final String? pwdClose; // 自定义密码图片路径 闭眼
  final InputBorder? border; // 边框样式
  final bool isDense; // 是否紧凑显示，默认false
  final bool isRemoveHint;

  final EdgeInsetsGeometry?
      contentPadding; // 当父组件固定高度时，文本一行显示文本过多会出现文字显示不全bug,可设置EdgeInsets.symmetric(vertical: 4)
  final CustomTextFieldTapCallback? onTap;

  //光标是否在最后
  final bool isCursorEnd;

  final BoxConstraints? leftWidgetConstraints; //左边图标约束

  @override
  State<CustomTextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<CustomTextField> {
  TextEditingController? _textController;
  FocusNode? _focusNode;
  bool _isFocused = false;
  bool? _isShowDelete;
  bool? _isHiddenPwdBtn; // 是否隐藏 右侧密码明文切换按钮 ，密码样式才显示（isPwd =true），
  bool? _pwdShow; // 控制密码 明文切换
  Widget? _pwdImg; // 自定义密码图片
  bool _isSubmitted = false; // 记录是否点击键盘右下角按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textController = widget.controller ?? TextEditingController();
    _textController!.text = widget.text ?? '';
    // 超过最大长度截取
    if ((widget.text ?? '').length > widget.maxLength) {
      _textController!.text = (widget.text ?? '').substring(0, widget.maxLength);
    }
    _focusNode = widget.focusNode ?? FocusNode();
    _isHiddenPwdBtn = !widget.isPwd;
    _pwdShow = widget.isPwd;

    _isShowDelete = _focusNode!.hasFocus && _textController!.text.isNotEmpty;
    _textController!.addListener(() {
      if (mounted) {
        setState(() {
          _isShowDelete = _textController!.text.isNotEmpty && _focusNode!.hasFocus;
        });
      }
    });
    _focusNode!.addListener(() {
      if (mounted) {
        setState(() {
          _isFocused = _focusNode!.hasFocus;
          _isShowDelete = _textController!.text.isNotEmpty && _focusNode!.hasFocus;
          // 录入完成回调，失去焦点并且不是点击键盘右下角时触发
          if (!_isFocused && !_isSubmitted) {
            widget.inputCompletionCallBack?.call(_textController!.text, false);
          }
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    /// 更新text的值，并处理光标
    /// https://github.com/flutter/flutter/issues/11416
    // var cursorPos = _textController!.selection;
    // // 更新text值到_textController
    // _textController!.text = widget.text ?? '';
    // // 超过最大长度截取
    // if ((widget.text ?? '').length > widget.maxLength) {
    //   _textController!.text =
    //       (widget.text ?? '').substring(0, widget.maxLength);
    // }
    // // log("neco 输入光标状态 ${cursorPos.start} ${_textController!.text.length}");
    // //暂时先不要了
    // if (cursorPos.start != _textController!.text.length) {
    //   // 光标保持在文本最后
    //   if(widget.isCursorEnd){   //https://jira.vgtech.org/browse/STAK-1028
    //     cursorPos = TextSelection.fromPosition(
    //         TextPosition(offset: _textController!.text.length));
    //   }
    // }
    // _textController!.selection = cursorPos;

    // 获取当前光标位置
    var cursorPos = _textController!.selection;

    // 更新 _textController 中的文本值
    _textController!.text = widget.text ?? '';

    // 如果文本超过最大长度，则截断文本
    if ((_textController!.text ?? '').length > widget.maxLength) {
      _textController!.text = _textController!.text!.substring(0, widget.maxLength);
    }

    // 检查光标位置是否有效
    if (cursorPos.start > _textController!.text.length) {
      // 如果光标位置超出文本末尾，则将其设置为末尾
      cursorPos = TextSelection.fromPosition(
        TextPosition(offset: _textController!.text.length),
      );
    }

// Set the cursor position
    _textController!.selection = cursorPos;
  }

  @override
  void dispose() {
    if (widget.controller != null) {
    } else {
      _textController!.dispose();
    }
    _focusNode!.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    if (widget.pwdOpen != null && widget.pwdClose != null) {
      if (widget.pwdOpen!.isNotEmpty && widget.pwdClose!.isNotEmpty) {
        _pwdImg = _pwdShow!
            ? ImageIcon(AssetImage(widget.pwdOpen!))
            : ImageIcon(AssetImage(widget.pwdClose!));
      } else {
        _pwdImg = Icon(_pwdShow! ? Icons.visibility : Icons.visibility_off);
      }
    } else {
      _pwdImg = Icon(_pwdShow! ? Icons.visibility : Icons.visibility_off);
//      _pwdImg = _pwdShow?Image.asset('assets/images/ic_pwd_close.png',width: 18.0,):Image.asset('assets/images/ic_pwd_open.png',width: 18.0,);
//      _pwdImg = _pwdShow?ImageIcon(AssetImage('assets/images/ic_pwd_close.png')):ImageIcon(AssetImage('assets/images/ic_pwd_open.png')) ;
    }

    // 默认颜色
    var textColor = widget.textColor ?? ThemeService().theme.colorScheme.onBackground;
    var textStyle =
        TextStyle(fontSize: _textFontSize, color: textColor, fontFamily: FontThemes.fontspringBold);
    var hintTextStyle = widget.hintStyle ??
        TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: _hintTextFontSize,
            color: widget.hintColor ?? AppThemes.onSurfaceVariant,
            fontFamily: FontThemes.fontspringBold);
    var underlineColor = AppThemes.tertiaryColor;

    var themeColor = ThemeService().primaryColor;
    var labelTextStyle = TextStyle(
        fontSize: _hintTextFontSize, color: themeColor, fontFamily: FontThemes.fontspringBold);

    return Theme(
      // 主题设置主要针对左侧图标和光标
      data: ThemeData(
        primaryColor: themeColor,
        // primarySwatch: MaterialColor(),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: _isFocused ? themeColor : widget.hintColor ?? AppThemes.onSurfaceVariant,
        ),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            textAlignVertical: TextAlignVertical.center,
            //文字剧中该处理
            focusNode: _focusNode,
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            controller: _textController,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            keyboardAppearance: ThemeService().isDarkMode ? Brightness.dark : Brightness.light,
            style: widget.style ?? textStyle,
            maxLines: widget.maxLines,
//            // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
//            inputFormatters: (widget.keyboardType == TextInputType.number || widget.keyboardType == TextInputType.phone) ?
//            [FilteringTextInputFormatter.allow(RegExp('[0-9]'))] : [BlacklistingTextInputFormatter(RegExp('[\u4e00-\u9fa5]'))],
            inputFormatters:
                widget.inputFormatters ?? [LengthLimitingTextInputFormatter(widget.maxLength)],
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: widget.contentPadding,
              prefixIcon: widget.leftWidget,
              prefixIconConstraints: widget.leftWidgetConstraints,
              labelText: widget.labelText,
              hintText: _isFocused && widget.isRemoveHint ? "" : widget.hintText,
              hintStyle: hintTextStyle,
              labelStyle: _isFocused ? labelTextStyle : hintTextStyle,
              isDense: widget.isDense,
              disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: _lineHeight)),
              enabledBorder: widget.border ??
                  const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: _lineHeight)),
              focusedBorder: widget.border ??
                  const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: _lineHeight)),
              // suffixIcon: Container(), //如果通过suffixIcon添加右侧自定义widget点击会弹出键盘
            ),
            obscureText: _pwdShow!,
            // 执行顺序为 onTap -> onChanged -> onEditingComplete -> onSubmitted
            // 点击输入框
            onTap: () {
              widget.onTap?.call();
              _isSubmitted = false;
              widget.getFocusNodeCallBack?.call();
            },
            // 每次输入框文字改变，均会执行
            onChanged: (value) {
              widget.inputCallBack?.call(_textController!.text);
            },
            // 输入完成，提交按钮点击后会先执行这里
            onEditingComplete: () {
              _focusNode!.unfocus();
            },
            // 提交按钮点击
            onSubmitted: (value) {
              _isSubmitted = true;
              widget.inputCompletionCallBack?.call(_textController!.text, true);
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Offstage(
                offstage: !widget.isShowDeleteBtn,
                child: _isShowDelete!
                    ? IconButton(
                        icon: const Icon(Icons.cancel, color: Color(0xFFC8C8C8), size: 20),
                        onPressed: () {
                          _textController!.text = '';
                          if (widget.inputCallBack != null) {
                            widget.inputCallBack!(_textController!.text);
                          }
                        })
                    : const Text(''),
              ),
              Offstage(
                  offstage: _isHiddenPwdBtn!,
                  child: IconButton(
                    icon: _pwdImg!,
                    padding: const EdgeInsets.only(left: 12),
                    color: const Color(0xFFC8C8C8),
                    iconSize: 18.0,
                    onPressed: () {
                      setState(() {
                        _pwdShow = !_pwdShow!;
                      });
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
