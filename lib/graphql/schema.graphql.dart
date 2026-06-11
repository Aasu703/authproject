class Input$ProductFilterInput {
  factory Input$ProductFilterInput({
    String? category,
    double? minPrice,
    double? maxPrice,
  }) => Input$ProductFilterInput._({
    if (category != null) r'category': category,
    if (minPrice != null) r'minPrice': minPrice,
    if (maxPrice != null) r'maxPrice': maxPrice,
  });

  Input$ProductFilterInput._(this._$data);

  factory Input$ProductFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    if (data.containsKey('minPrice')) {
      final l$minPrice = data['minPrice'];
      result$data['minPrice'] = (l$minPrice as num?)?.toDouble();
    }
    if (data.containsKey('maxPrice')) {
      final l$maxPrice = data['maxPrice'];
      result$data['maxPrice'] = (l$maxPrice as num?)?.toDouble();
    }
    return Input$ProductFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get category => (_$data['category'] as String?);

  double? get minPrice => (_$data['minPrice'] as double?);

  double? get maxPrice => (_$data['maxPrice'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    if (_$data.containsKey('minPrice')) {
      final l$minPrice = minPrice;
      result$data['minPrice'] = l$minPrice;
    }
    if (_$data.containsKey('maxPrice')) {
      final l$maxPrice = maxPrice;
      result$data['maxPrice'] = l$maxPrice;
    }
    return result$data;
  }

  CopyWith$Input$ProductFilterInput<Input$ProductFilterInput> get copyWith =>
      CopyWith$Input$ProductFilterInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ProductFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$minPrice = minPrice;
    final lOther$minPrice = other.minPrice;
    if (_$data.containsKey('minPrice') !=
        other._$data.containsKey('minPrice')) {
      return false;
    }
    if (l$minPrice != lOther$minPrice) {
      return false;
    }
    final l$maxPrice = maxPrice;
    final lOther$maxPrice = other.maxPrice;
    if (_$data.containsKey('maxPrice') !=
        other._$data.containsKey('maxPrice')) {
      return false;
    }
    if (l$maxPrice != lOther$maxPrice) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$minPrice = minPrice;
    final l$maxPrice = maxPrice;
    return Object.hashAll([
      _$data.containsKey('category') ? l$category : const {},
      _$data.containsKey('minPrice') ? l$minPrice : const {},
      _$data.containsKey('maxPrice') ? l$maxPrice : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProductFilterInput<TRes> {
  factory CopyWith$Input$ProductFilterInput(
    Input$ProductFilterInput instance,
    TRes Function(Input$ProductFilterInput) then,
  ) = _CopyWithImpl$Input$ProductFilterInput;

  factory CopyWith$Input$ProductFilterInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProductFilterInput;

  TRes call({String? category, double? minPrice, double? maxPrice});
}

class _CopyWithImpl$Input$ProductFilterInput<TRes>
    implements CopyWith$Input$ProductFilterInput<TRes> {
  _CopyWithImpl$Input$ProductFilterInput(this._instance, this._then);

  final Input$ProductFilterInput _instance;

  final TRes Function(Input$ProductFilterInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? category = _undefined,
    Object? minPrice = _undefined,
    Object? maxPrice = _undefined,
  }) => _then(
    Input$ProductFilterInput._({
      ..._instance._$data,
      if (category != _undefined) 'category': (category as String?),
      if (minPrice != _undefined) 'minPrice': (minPrice as double?),
      if (maxPrice != _undefined) 'maxPrice': (maxPrice as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$ProductFilterInput<TRes>
    implements CopyWith$Input$ProductFilterInput<TRes> {
  _CopyWithStubImpl$Input$ProductFilterInput(this._res);

  TRes _res;

  call({String? category, double? minPrice, double? maxPrice}) => _res;
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
