// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetImageModelCollection on Isar {
  IsarCollection<ImageModel> get imageModels => this.collection();
}

const ImageModelSchema = CollectionSchema(
  name: r'ImageModel',
  id: -4998388787585861710,
  properties: {
    r'imageId': PropertySchema(
      id: 0,
      name: r'imageId',
      type: IsarType.string,
    ),
    r'imageName': PropertySchema(
      id: 1,
      name: r'imageName',
      type: IsarType.byteList,
    )
  },
  estimateSize: _imageModelEstimateSize,
  serialize: _imageModelSerialize,
  deserialize: _imageModelDeserialize,
  deserializeProp: _imageModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _imageModelGetId,
  getLinks: _imageModelGetLinks,
  attach: _imageModelAttach,
  version: '3.1.0+1',
);

int _imageModelEstimateSize(
  ImageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageId.length * 3;
  bytesCount += 3 + object.imageName.length;
  return bytesCount;
}

void _imageModelSerialize(
  ImageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageId);
  writer.writeByteList(offsets[1], object.imageName);
}

ImageModel _imageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImageModel(
    imageId: reader.readString(offsets[0]),
    imageName: reader.readByteList(offsets[1]) ?? [],
  );
  object.id = id;
  return object;
}

P _imageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readByteList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _imageModelGetId(ImageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _imageModelGetLinks(ImageModel object) {
  return [];
}

void _imageModelAttach(IsarCollection<dynamic> col, Id id, ImageModel object) {
  object.id = id;
}

extension ImageModelQueryWhereSort
    on QueryBuilder<ImageModel, ImageModel, QWhere> {
  QueryBuilder<ImageModel, ImageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImageModelQueryWhere
    on QueryBuilder<ImageModel, ImageModel, QWhereClause> {
  QueryBuilder<ImageModel, ImageModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ImageModelQueryFilter
    on QueryBuilder<ImageModel, ImageModel, QFilterCondition> {
  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition> imageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageName',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageName',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageName',
        value: value,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageName',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageName',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageName',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageName',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageName',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterFilterCondition>
      imageNameLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageName',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ImageModelQueryObject
    on QueryBuilder<ImageModel, ImageModel, QFilterCondition> {}

extension ImageModelQueryLinks
    on QueryBuilder<ImageModel, ImageModel, QFilterCondition> {}

extension ImageModelQuerySortBy
    on QueryBuilder<ImageModel, ImageModel, QSortBy> {
  QueryBuilder<ImageModel, ImageModel, QAfterSortBy> sortByImageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.asc);
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterSortBy> sortByImageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.desc);
    });
  }
}

extension ImageModelQuerySortThenBy
    on QueryBuilder<ImageModel, ImageModel, QSortThenBy> {
  QueryBuilder<ImageModel, ImageModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterSortBy> thenByImageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.asc);
    });
  }

  QueryBuilder<ImageModel, ImageModel, QAfterSortBy> thenByImageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageId', Sort.desc);
    });
  }
}

extension ImageModelQueryWhereDistinct
    on QueryBuilder<ImageModel, ImageModel, QDistinct> {
  QueryBuilder<ImageModel, ImageModel, QDistinct> distinctByImageId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImageModel, ImageModel, QDistinct> distinctByImageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageName');
    });
  }
}

extension ImageModelQueryProperty
    on QueryBuilder<ImageModel, ImageModel, QQueryProperty> {
  QueryBuilder<ImageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ImageModel, String, QQueryOperations> imageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageId');
    });
  }

  QueryBuilder<ImageModel, List<int>, QQueryOperations> imageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageName');
    });
  }
}
