class Int32 {
  int _value;

  Int32(int value) : _value = value.toSigned(32);

  int get value => _value;

  set value(int newValue) {
    _value = newValue.toSigned(32);
  }

  @override
  String toString() {
    return _value.toString();
  }

  // 可以添加其他运算符重载方法来模拟 32 位整数的行为
  Int32 operator +(Int32 other) {
    return Int32((_value + other._value).toSigned(32));
  }

  Int32 operator -(Int32 other) {
    return Int32((_value - other._value).toSigned(32));
  }

  Int32 operator *(Int32 other) {
    return Int32((_value * other._value).toSigned(32));
  }

  Int32 operator <<(int shiftAmount) {
    if (shiftAmount < 0) {
      shiftAmount = 32 + shiftAmount;
    }
    return Int32((_value << shiftAmount).toSigned(32));
  }

  Int32 operator >>(int shiftAmount) {
    return Int32((_value >> shiftAmount).toSigned(32));
  }

  Int32 operator >>>(int shiftAmount) {
    int unsignedValue = _value & 0xFFFFFFFF; // 将值转换为无符号 32 位整数
    if (shiftAmount < 0) {
      shiftAmount = 32 + shiftAmount;
    }
    int result =
        (unsignedValue >> shiftAmount) & ((1 << (32 - shiftAmount)) - 1);
    return Int32(result);
  }

  Int32 operator ^(dynamic other) {
    if (other is int) {
      if (other < 0) {
        other = other & 0xFFFFFFFF;
      }
      return Int32((_value ^ other).toSigned(32));
    } else if (other is Int32) {
      return Int32((_value ^ other._value).toSigned(32));
    } else {
      throw ArgumentError('Invalid argument type');
    }
  }

  Int32 operator |(Int32 other) {
    return Int32((_value ^ other._value).toSigned(32));
  }

  Int32 operator &(dynamic other) {
    if (other is int) {
      if (other < 0) {
        other = other & 0xFFFFFFFF;
      }
      return Int32((_value & other).toSigned(32));
    } else if (other is Int32) {
      return Int32((_value & other._value).toSigned(32));
    } else {
      throw ArgumentError('Invalid argument type');
    }
  }
}
