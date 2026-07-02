// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tonary_database.dart';

// ignore_for_file: type=lint
class $PluginsTable extends Plugins with TableInfo<$PluginsTable, PluginRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PluginsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
    'vendor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vendorNameMeta = const VerificationMeta(
    'vendorName',
  );
  @override
  late final GeneratedColumn<String> vendorName = GeneratedColumn<String>(
    'vendor_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<String> tier = GeneratedColumn<String>(
    'tier',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capabilitiesMeta = const VerificationMeta(
    'capabilities',
  );
  @override
  late final GeneratedColumn<String> capabilities = GeneratedColumn<String>(
    'capabilities',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _manualUrlMeta = const VerificationMeta(
    'manualUrl',
  );
  @override
  late final GeneratedColumn<String> manualUrl = GeneratedColumn<String>(
    'manual_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcesMeta = const VerificationMeta(
    'sources',
  );
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
    'sources',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    vendor,
    vendorName,
    category,
    type,
    tier,
    description,
    tags,
    capabilities,
    color,
    manualUrl,
    sources,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plugins';
  @override
  VerificationContext validateIntegrity(
    Insertable<PluginRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('vendor')) {
      context.handle(
        _vendorMeta,
        vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta),
      );
    } else if (isInserting) {
      context.missing(_vendorMeta);
    }
    if (data.containsKey('vendor_name')) {
      context.handle(
        _vendorNameMeta,
        vendorName.isAcceptableOrUnknown(data['vendor_name']!, _vendorNameMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('tier')) {
      context.handle(
        _tierMeta,
        tier.isAcceptableOrUnknown(data['tier']!, _tierMeta),
      );
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('capabilities')) {
      context.handle(
        _capabilitiesMeta,
        capabilities.isAcceptableOrUnknown(
          data['capabilities']!,
          _capabilitiesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_capabilitiesMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('manual_url')) {
      context.handle(
        _manualUrlMeta,
        manualUrl.isAcceptableOrUnknown(data['manual_url']!, _manualUrlMeta),
      );
    }
    if (data.containsKey('sources')) {
      context.handle(
        _sourcesMeta,
        sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta),
      );
    } else if (isInserting) {
      context.missing(_sourcesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PluginRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PluginRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      vendor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor'],
      )!,
      vendorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor_name'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      tier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tier'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      capabilities: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}capabilities'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      manualUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manual_url'],
      ),
      sources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sources'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $PluginsTable createAlias(String alias) {
    return $PluginsTable(attachedDatabase, alias);
  }
}

class PluginRow extends DataClass implements Insertable<PluginRow> {
  final String id;
  final String name;
  final String vendor;
  final String? vendorName;
  final String category;
  final String type;
  final String tier;
  final String description;
  final String tags;
  final String capabilities;
  final String? color;
  final String? manualUrl;
  final String sources;
  final String? createdAt;
  final String? updatedAt;
  const PluginRow({
    required this.id,
    required this.name,
    required this.vendor,
    this.vendorName,
    required this.category,
    required this.type,
    required this.tier,
    required this.description,
    required this.tags,
    required this.capabilities,
    this.color,
    this.manualUrl,
    required this.sources,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['vendor'] = Variable<String>(vendor);
    if (!nullToAbsent || vendorName != null) {
      map['vendor_name'] = Variable<String>(vendorName);
    }
    map['category'] = Variable<String>(category);
    map['type'] = Variable<String>(type);
    map['tier'] = Variable<String>(tier);
    map['description'] = Variable<String>(description);
    map['tags'] = Variable<String>(tags);
    map['capabilities'] = Variable<String>(capabilities);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || manualUrl != null) {
      map['manual_url'] = Variable<String>(manualUrl);
    }
    map['sources'] = Variable<String>(sources);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  PluginsCompanion toCompanion(bool nullToAbsent) {
    return PluginsCompanion(
      id: Value(id),
      name: Value(name),
      vendor: Value(vendor),
      vendorName: vendorName == null && nullToAbsent
          ? const Value.absent()
          : Value(vendorName),
      category: Value(category),
      type: Value(type),
      tier: Value(tier),
      description: Value(description),
      tags: Value(tags),
      capabilities: Value(capabilities),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      manualUrl: manualUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(manualUrl),
      sources: Value(sources),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory PluginRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PluginRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      vendor: serializer.fromJson<String>(json['vendor']),
      vendorName: serializer.fromJson<String?>(json['vendorName']),
      category: serializer.fromJson<String>(json['category']),
      type: serializer.fromJson<String>(json['type']),
      tier: serializer.fromJson<String>(json['tier']),
      description: serializer.fromJson<String>(json['description']),
      tags: serializer.fromJson<String>(json['tags']),
      capabilities: serializer.fromJson<String>(json['capabilities']),
      color: serializer.fromJson<String?>(json['color']),
      manualUrl: serializer.fromJson<String?>(json['manualUrl']),
      sources: serializer.fromJson<String>(json['sources']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'vendor': serializer.toJson<String>(vendor),
      'vendorName': serializer.toJson<String?>(vendorName),
      'category': serializer.toJson<String>(category),
      'type': serializer.toJson<String>(type),
      'tier': serializer.toJson<String>(tier),
      'description': serializer.toJson<String>(description),
      'tags': serializer.toJson<String>(tags),
      'capabilities': serializer.toJson<String>(capabilities),
      'color': serializer.toJson<String?>(color),
      'manualUrl': serializer.toJson<String?>(manualUrl),
      'sources': serializer.toJson<String>(sources),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  PluginRow copyWith({
    String? id,
    String? name,
    String? vendor,
    Value<String?> vendorName = const Value.absent(),
    String? category,
    String? type,
    String? tier,
    String? description,
    String? tags,
    String? capabilities,
    Value<String?> color = const Value.absent(),
    Value<String?> manualUrl = const Value.absent(),
    String? sources,
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => PluginRow(
    id: id ?? this.id,
    name: name ?? this.name,
    vendor: vendor ?? this.vendor,
    vendorName: vendorName.present ? vendorName.value : this.vendorName,
    category: category ?? this.category,
    type: type ?? this.type,
    tier: tier ?? this.tier,
    description: description ?? this.description,
    tags: tags ?? this.tags,
    capabilities: capabilities ?? this.capabilities,
    color: color.present ? color.value : this.color,
    manualUrl: manualUrl.present ? manualUrl.value : this.manualUrl,
    sources: sources ?? this.sources,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  PluginRow copyWithCompanion(PluginsCompanion data) {
    return PluginRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      vendorName: data.vendorName.present
          ? data.vendorName.value
          : this.vendorName,
      category: data.category.present ? data.category.value : this.category,
      type: data.type.present ? data.type.value : this.type,
      tier: data.tier.present ? data.tier.value : this.tier,
      description: data.description.present
          ? data.description.value
          : this.description,
      tags: data.tags.present ? data.tags.value : this.tags,
      capabilities: data.capabilities.present
          ? data.capabilities.value
          : this.capabilities,
      color: data.color.present ? data.color.value : this.color,
      manualUrl: data.manualUrl.present ? data.manualUrl.value : this.manualUrl,
      sources: data.sources.present ? data.sources.value : this.sources,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PluginRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vendor: $vendor, ')
          ..write('vendorName: $vendorName, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('tags: $tags, ')
          ..write('capabilities: $capabilities, ')
          ..write('color: $color, ')
          ..write('manualUrl: $manualUrl, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    vendor,
    vendorName,
    category,
    type,
    tier,
    description,
    tags,
    capabilities,
    color,
    manualUrl,
    sources,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PluginRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.vendor == this.vendor &&
          other.vendorName == this.vendorName &&
          other.category == this.category &&
          other.type == this.type &&
          other.tier == this.tier &&
          other.description == this.description &&
          other.tags == this.tags &&
          other.capabilities == this.capabilities &&
          other.color == this.color &&
          other.manualUrl == this.manualUrl &&
          other.sources == this.sources &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PluginsCompanion extends UpdateCompanion<PluginRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> vendor;
  final Value<String?> vendorName;
  final Value<String> category;
  final Value<String> type;
  final Value<String> tier;
  final Value<String> description;
  final Value<String> tags;
  final Value<String> capabilities;
  final Value<String?> color;
  final Value<String?> manualUrl;
  final Value<String> sources;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<int> rowid;
  const PluginsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.vendor = const Value.absent(),
    this.vendorName = const Value.absent(),
    this.category = const Value.absent(),
    this.type = const Value.absent(),
    this.tier = const Value.absent(),
    this.description = const Value.absent(),
    this.tags = const Value.absent(),
    this.capabilities = const Value.absent(),
    this.color = const Value.absent(),
    this.manualUrl = const Value.absent(),
    this.sources = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PluginsCompanion.insert({
    required String id,
    required String name,
    required String vendor,
    this.vendorName = const Value.absent(),
    required String category,
    required String type,
    required String tier,
    required String description,
    required String tags,
    required String capabilities,
    this.color = const Value.absent(),
    this.manualUrl = const Value.absent(),
    required String sources,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       vendor = Value(vendor),
       category = Value(category),
       type = Value(type),
       tier = Value(tier),
       description = Value(description),
       tags = Value(tags),
       capabilities = Value(capabilities),
       sources = Value(sources);
  static Insertable<PluginRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? vendor,
    Expression<String>? vendorName,
    Expression<String>? category,
    Expression<String>? type,
    Expression<String>? tier,
    Expression<String>? description,
    Expression<String>? tags,
    Expression<String>? capabilities,
    Expression<String>? color,
    Expression<String>? manualUrl,
    Expression<String>? sources,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (vendor != null) 'vendor': vendor,
      if (vendorName != null) 'vendor_name': vendorName,
      if (category != null) 'category': category,
      if (type != null) 'type': type,
      if (tier != null) 'tier': tier,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (capabilities != null) 'capabilities': capabilities,
      if (color != null) 'color': color,
      if (manualUrl != null) 'manual_url': manualUrl,
      if (sources != null) 'sources': sources,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PluginsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? vendor,
    Value<String?>? vendorName,
    Value<String>? category,
    Value<String>? type,
    Value<String>? tier,
    Value<String>? description,
    Value<String>? tags,
    Value<String>? capabilities,
    Value<String?>? color,
    Value<String?>? manualUrl,
    Value<String>? sources,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<int>? rowid,
  }) {
    return PluginsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      vendor: vendor ?? this.vendor,
      vendorName: vendorName ?? this.vendorName,
      category: category ?? this.category,
      type: type ?? this.type,
      tier: tier ?? this.tier,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      capabilities: capabilities ?? this.capabilities,
      color: color ?? this.color,
      manualUrl: manualUrl ?? this.manualUrl,
      sources: sources ?? this.sources,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (vendorName.present) {
      map['vendor_name'] = Variable<String>(vendorName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (tier.present) {
      map['tier'] = Variable<String>(tier.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (capabilities.present) {
      map['capabilities'] = Variable<String>(capabilities.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (manualUrl.present) {
      map['manual_url'] = Variable<String>(manualUrl.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PluginsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vendor: $vendor, ')
          ..write('vendorName: $vendorName, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('tags: $tags, ')
          ..write('capabilities: $capabilities, ')
          ..write('color: $color, ')
          ..write('manualUrl: $manualUrl, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PresetsTable extends Presets with TableInfo<$PresetsTable, PresetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PresetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pluginIdMeta = const VerificationMeta(
    'pluginId',
  );
  @override
  late final GeneratedColumn<String> pluginId = GeneratedColumn<String>(
    'plugin_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paramsMeta = const VerificationMeta('params');
  @override
  late final GeneratedColumn<String> params = GeneratedColumn<String>(
    'params',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _useCasesMeta = const VerificationMeta(
    'useCases',
  );
  @override
  late final GeneratedColumn<String> useCases = GeneratedColumn<String>(
    'use_cases',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genreTagsMeta = const VerificationMeta(
    'genreTags',
  );
  @override
  late final GeneratedColumn<String> genreTags = GeneratedColumn<String>(
    'genre_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcesMeta = const VerificationMeta(
    'sources',
  );
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
    'sources',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pluginId,
    name,
    category,
    params,
    useCases,
    genreTags,
    notes,
    sources,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'presets';
  @override
  VerificationContext validateIntegrity(
    Insertable<PresetRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plugin_id')) {
      context.handle(
        _pluginIdMeta,
        pluginId.isAcceptableOrUnknown(data['plugin_id']!, _pluginIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pluginIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('params')) {
      context.handle(
        _paramsMeta,
        params.isAcceptableOrUnknown(data['params']!, _paramsMeta),
      );
    }
    if (data.containsKey('use_cases')) {
      context.handle(
        _useCasesMeta,
        useCases.isAcceptableOrUnknown(data['use_cases']!, _useCasesMeta),
      );
    } else if (isInserting) {
      context.missing(_useCasesMeta);
    }
    if (data.containsKey('genre_tags')) {
      context.handle(
        _genreTagsMeta,
        genreTags.isAcceptableOrUnknown(data['genre_tags']!, _genreTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_genreTagsMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('sources')) {
      context.handle(
        _sourcesMeta,
        sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta),
      );
    } else if (isInserting) {
      context.missing(_sourcesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PresetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PresetRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pluginId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plugin_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      params: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}params'],
      ),
      useCases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}use_cases'],
      )!,
      genreTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre_tags'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      sources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sources'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $PresetsTable createAlias(String alias) {
    return $PresetsTable(attachedDatabase, alias);
  }
}

class PresetRow extends DataClass implements Insertable<PresetRow> {
  final String id;
  final String pluginId;
  final String name;
  final String category;
  final String? params;
  final String useCases;
  final String genreTags;
  final String? notes;
  final String sources;
  final String? createdAt;
  const PresetRow({
    required this.id,
    required this.pluginId,
    required this.name,
    required this.category,
    this.params,
    required this.useCases,
    required this.genreTags,
    this.notes,
    required this.sources,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plugin_id'] = Variable<String>(pluginId);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || params != null) {
      map['params'] = Variable<String>(params);
    }
    map['use_cases'] = Variable<String>(useCases);
    map['genre_tags'] = Variable<String>(genreTags);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['sources'] = Variable<String>(sources);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  PresetsCompanion toCompanion(bool nullToAbsent) {
    return PresetsCompanion(
      id: Value(id),
      pluginId: Value(pluginId),
      name: Value(name),
      category: Value(category),
      params: params == null && nullToAbsent
          ? const Value.absent()
          : Value(params),
      useCases: Value(useCases),
      genreTags: Value(genreTags),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      sources: Value(sources),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory PresetRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PresetRow(
      id: serializer.fromJson<String>(json['id']),
      pluginId: serializer.fromJson<String>(json['pluginId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      params: serializer.fromJson<String?>(json['params']),
      useCases: serializer.fromJson<String>(json['useCases']),
      genreTags: serializer.fromJson<String>(json['genreTags']),
      notes: serializer.fromJson<String?>(json['notes']),
      sources: serializer.fromJson<String>(json['sources']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pluginId': serializer.toJson<String>(pluginId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'params': serializer.toJson<String?>(params),
      'useCases': serializer.toJson<String>(useCases),
      'genreTags': serializer.toJson<String>(genreTags),
      'notes': serializer.toJson<String?>(notes),
      'sources': serializer.toJson<String>(sources),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  PresetRow copyWith({
    String? id,
    String? pluginId,
    String? name,
    String? category,
    Value<String?> params = const Value.absent(),
    String? useCases,
    String? genreTags,
    Value<String?> notes = const Value.absent(),
    String? sources,
    Value<String?> createdAt = const Value.absent(),
  }) => PresetRow(
    id: id ?? this.id,
    pluginId: pluginId ?? this.pluginId,
    name: name ?? this.name,
    category: category ?? this.category,
    params: params.present ? params.value : this.params,
    useCases: useCases ?? this.useCases,
    genreTags: genreTags ?? this.genreTags,
    notes: notes.present ? notes.value : this.notes,
    sources: sources ?? this.sources,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  PresetRow copyWithCompanion(PresetsCompanion data) {
    return PresetRow(
      id: data.id.present ? data.id.value : this.id,
      pluginId: data.pluginId.present ? data.pluginId.value : this.pluginId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      params: data.params.present ? data.params.value : this.params,
      useCases: data.useCases.present ? data.useCases.value : this.useCases,
      genreTags: data.genreTags.present ? data.genreTags.value : this.genreTags,
      notes: data.notes.present ? data.notes.value : this.notes,
      sources: data.sources.present ? data.sources.value : this.sources,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PresetRow(')
          ..write('id: $id, ')
          ..write('pluginId: $pluginId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('params: $params, ')
          ..write('useCases: $useCases, ')
          ..write('genreTags: $genreTags, ')
          ..write('notes: $notes, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pluginId,
    name,
    category,
    params,
    useCases,
    genreTags,
    notes,
    sources,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PresetRow &&
          other.id == this.id &&
          other.pluginId == this.pluginId &&
          other.name == this.name &&
          other.category == this.category &&
          other.params == this.params &&
          other.useCases == this.useCases &&
          other.genreTags == this.genreTags &&
          other.notes == this.notes &&
          other.sources == this.sources &&
          other.createdAt == this.createdAt);
}

class PresetsCompanion extends UpdateCompanion<PresetRow> {
  final Value<String> id;
  final Value<String> pluginId;
  final Value<String> name;
  final Value<String> category;
  final Value<String?> params;
  final Value<String> useCases;
  final Value<String> genreTags;
  final Value<String?> notes;
  final Value<String> sources;
  final Value<String?> createdAt;
  final Value<int> rowid;
  const PresetsCompanion({
    this.id = const Value.absent(),
    this.pluginId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.params = const Value.absent(),
    this.useCases = const Value.absent(),
    this.genreTags = const Value.absent(),
    this.notes = const Value.absent(),
    this.sources = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PresetsCompanion.insert({
    required String id,
    required String pluginId,
    required String name,
    required String category,
    this.params = const Value.absent(),
    required String useCases,
    required String genreTags,
    this.notes = const Value.absent(),
    required String sources,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pluginId = Value(pluginId),
       name = Value(name),
       category = Value(category),
       useCases = Value(useCases),
       genreTags = Value(genreTags),
       sources = Value(sources);
  static Insertable<PresetRow> custom({
    Expression<String>? id,
    Expression<String>? pluginId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? params,
    Expression<String>? useCases,
    Expression<String>? genreTags,
    Expression<String>? notes,
    Expression<String>? sources,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pluginId != null) 'plugin_id': pluginId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (params != null) 'params': params,
      if (useCases != null) 'use_cases': useCases,
      if (genreTags != null) 'genre_tags': genreTags,
      if (notes != null) 'notes': notes,
      if (sources != null) 'sources': sources,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PresetsCompanion copyWith({
    Value<String>? id,
    Value<String>? pluginId,
    Value<String>? name,
    Value<String>? category,
    Value<String?>? params,
    Value<String>? useCases,
    Value<String>? genreTags,
    Value<String?>? notes,
    Value<String>? sources,
    Value<String?>? createdAt,
    Value<int>? rowid,
  }) {
    return PresetsCompanion(
      id: id ?? this.id,
      pluginId: pluginId ?? this.pluginId,
      name: name ?? this.name,
      category: category ?? this.category,
      params: params ?? this.params,
      useCases: useCases ?? this.useCases,
      genreTags: genreTags ?? this.genreTags,
      notes: notes ?? this.notes,
      sources: sources ?? this.sources,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pluginId.present) {
      map['plugin_id'] = Variable<String>(pluginId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (params.present) {
      map['params'] = Variable<String>(params.value);
    }
    if (useCases.present) {
      map['use_cases'] = Variable<String>(useCases.value);
    }
    if (genreTags.present) {
      map['genre_tags'] = Variable<String>(genreTags.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PresetsCompanion(')
          ..write('id: $id, ')
          ..write('pluginId: $pluginId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('params: $params, ')
          ..write('useCases: $useCases, ')
          ..write('genreTags: $genreTags, ')
          ..write('notes: $notes, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkflowRecipesTable extends WorkflowRecipes
    with TableInfo<$WorkflowRecipesTable, WorkflowRecipeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkflowRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
    'goal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pluginChainMeta = const VerificationMeta(
    'pluginChain',
  );
  @override
  late final GeneratedColumn<String> pluginChain = GeneratedColumn<String>(
    'plugin_chain',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<String> steps = GeneratedColumn<String>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeEstimateMeta = const VerificationMeta(
    'timeEstimate',
  );
  @override
  late final GeneratedColumn<String> timeEstimate = GeneratedColumn<String>(
    'time_estimate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genreTagsMeta = const VerificationMeta(
    'genreTags',
  );
  @override
  late final GeneratedColumn<String> genreTags = GeneratedColumn<String>(
    'genre_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _presetRefsMeta = const VerificationMeta(
    'presetRefs',
  );
  @override
  late final GeneratedColumn<String> presetRefs = GeneratedColumn<String>(
    'preset_refs',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcesMeta = const VerificationMeta(
    'sources',
  );
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
    'sources',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    goal,
    pluginChain,
    steps,
    difficulty,
    timeEstimate,
    genreTags,
    presetRefs,
    sources,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workflow_recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkflowRecipeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('goal')) {
      context.handle(
        _goalMeta,
        goal.isAcceptableOrUnknown(data['goal']!, _goalMeta),
      );
    } else if (isInserting) {
      context.missing(_goalMeta);
    }
    if (data.containsKey('plugin_chain')) {
      context.handle(
        _pluginChainMeta,
        pluginChain.isAcceptableOrUnknown(
          data['plugin_chain']!,
          _pluginChainMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pluginChainMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    } else if (isInserting) {
      context.missing(_stepsMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('time_estimate')) {
      context.handle(
        _timeEstimateMeta,
        timeEstimate.isAcceptableOrUnknown(
          data['time_estimate']!,
          _timeEstimateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timeEstimateMeta);
    }
    if (data.containsKey('genre_tags')) {
      context.handle(
        _genreTagsMeta,
        genreTags.isAcceptableOrUnknown(data['genre_tags']!, _genreTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_genreTagsMeta);
    }
    if (data.containsKey('preset_refs')) {
      context.handle(
        _presetRefsMeta,
        presetRefs.isAcceptableOrUnknown(data['preset_refs']!, _presetRefsMeta),
      );
    }
    if (data.containsKey('sources')) {
      context.handle(
        _sourcesMeta,
        sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta),
      );
    } else if (isInserting) {
      context.missing(_sourcesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkflowRecipeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkflowRecipeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      goal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal'],
      )!,
      pluginChain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plugin_chain'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}steps'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      timeEstimate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time_estimate'],
      )!,
      genreTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre_tags'],
      )!,
      presetRefs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preset_refs'],
      ),
      sources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sources'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $WorkflowRecipesTable createAlias(String alias) {
    return $WorkflowRecipesTable(attachedDatabase, alias);
  }
}

class WorkflowRecipeRow extends DataClass
    implements Insertable<WorkflowRecipeRow> {
  final String id;
  final String title;
  final String goal;
  final String pluginChain;
  final String steps;
  final String difficulty;
  final String timeEstimate;
  final String genreTags;
  final String? presetRefs;
  final String sources;
  final String? createdAt;
  const WorkflowRecipeRow({
    required this.id,
    required this.title,
    required this.goal,
    required this.pluginChain,
    required this.steps,
    required this.difficulty,
    required this.timeEstimate,
    required this.genreTags,
    this.presetRefs,
    required this.sources,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['goal'] = Variable<String>(goal);
    map['plugin_chain'] = Variable<String>(pluginChain);
    map['steps'] = Variable<String>(steps);
    map['difficulty'] = Variable<String>(difficulty);
    map['time_estimate'] = Variable<String>(timeEstimate);
    map['genre_tags'] = Variable<String>(genreTags);
    if (!nullToAbsent || presetRefs != null) {
      map['preset_refs'] = Variable<String>(presetRefs);
    }
    map['sources'] = Variable<String>(sources);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  WorkflowRecipesCompanion toCompanion(bool nullToAbsent) {
    return WorkflowRecipesCompanion(
      id: Value(id),
      title: Value(title),
      goal: Value(goal),
      pluginChain: Value(pluginChain),
      steps: Value(steps),
      difficulty: Value(difficulty),
      timeEstimate: Value(timeEstimate),
      genreTags: Value(genreTags),
      presetRefs: presetRefs == null && nullToAbsent
          ? const Value.absent()
          : Value(presetRefs),
      sources: Value(sources),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory WorkflowRecipeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkflowRecipeRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      goal: serializer.fromJson<String>(json['goal']),
      pluginChain: serializer.fromJson<String>(json['pluginChain']),
      steps: serializer.fromJson<String>(json['steps']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      timeEstimate: serializer.fromJson<String>(json['timeEstimate']),
      genreTags: serializer.fromJson<String>(json['genreTags']),
      presetRefs: serializer.fromJson<String?>(json['presetRefs']),
      sources: serializer.fromJson<String>(json['sources']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'goal': serializer.toJson<String>(goal),
      'pluginChain': serializer.toJson<String>(pluginChain),
      'steps': serializer.toJson<String>(steps),
      'difficulty': serializer.toJson<String>(difficulty),
      'timeEstimate': serializer.toJson<String>(timeEstimate),
      'genreTags': serializer.toJson<String>(genreTags),
      'presetRefs': serializer.toJson<String?>(presetRefs),
      'sources': serializer.toJson<String>(sources),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  WorkflowRecipeRow copyWith({
    String? id,
    String? title,
    String? goal,
    String? pluginChain,
    String? steps,
    String? difficulty,
    String? timeEstimate,
    String? genreTags,
    Value<String?> presetRefs = const Value.absent(),
    String? sources,
    Value<String?> createdAt = const Value.absent(),
  }) => WorkflowRecipeRow(
    id: id ?? this.id,
    title: title ?? this.title,
    goal: goal ?? this.goal,
    pluginChain: pluginChain ?? this.pluginChain,
    steps: steps ?? this.steps,
    difficulty: difficulty ?? this.difficulty,
    timeEstimate: timeEstimate ?? this.timeEstimate,
    genreTags: genreTags ?? this.genreTags,
    presetRefs: presetRefs.present ? presetRefs.value : this.presetRefs,
    sources: sources ?? this.sources,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  WorkflowRecipeRow copyWithCompanion(WorkflowRecipesCompanion data) {
    return WorkflowRecipeRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      goal: data.goal.present ? data.goal.value : this.goal,
      pluginChain: data.pluginChain.present
          ? data.pluginChain.value
          : this.pluginChain,
      steps: data.steps.present ? data.steps.value : this.steps,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      timeEstimate: data.timeEstimate.present
          ? data.timeEstimate.value
          : this.timeEstimate,
      genreTags: data.genreTags.present ? data.genreTags.value : this.genreTags,
      presetRefs: data.presetRefs.present
          ? data.presetRefs.value
          : this.presetRefs,
      sources: data.sources.present ? data.sources.value : this.sources,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkflowRecipeRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('goal: $goal, ')
          ..write('pluginChain: $pluginChain, ')
          ..write('steps: $steps, ')
          ..write('difficulty: $difficulty, ')
          ..write('timeEstimate: $timeEstimate, ')
          ..write('genreTags: $genreTags, ')
          ..write('presetRefs: $presetRefs, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    goal,
    pluginChain,
    steps,
    difficulty,
    timeEstimate,
    genreTags,
    presetRefs,
    sources,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkflowRecipeRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.goal == this.goal &&
          other.pluginChain == this.pluginChain &&
          other.steps == this.steps &&
          other.difficulty == this.difficulty &&
          other.timeEstimate == this.timeEstimate &&
          other.genreTags == this.genreTags &&
          other.presetRefs == this.presetRefs &&
          other.sources == this.sources &&
          other.createdAt == this.createdAt);
}

class WorkflowRecipesCompanion extends UpdateCompanion<WorkflowRecipeRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> goal;
  final Value<String> pluginChain;
  final Value<String> steps;
  final Value<String> difficulty;
  final Value<String> timeEstimate;
  final Value<String> genreTags;
  final Value<String?> presetRefs;
  final Value<String> sources;
  final Value<String?> createdAt;
  final Value<int> rowid;
  const WorkflowRecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.goal = const Value.absent(),
    this.pluginChain = const Value.absent(),
    this.steps = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.timeEstimate = const Value.absent(),
    this.genreTags = const Value.absent(),
    this.presetRefs = const Value.absent(),
    this.sources = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkflowRecipesCompanion.insert({
    required String id,
    required String title,
    required String goal,
    required String pluginChain,
    required String steps,
    required String difficulty,
    required String timeEstimate,
    required String genreTags,
    this.presetRefs = const Value.absent(),
    required String sources,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       goal = Value(goal),
       pluginChain = Value(pluginChain),
       steps = Value(steps),
       difficulty = Value(difficulty),
       timeEstimate = Value(timeEstimate),
       genreTags = Value(genreTags),
       sources = Value(sources);
  static Insertable<WorkflowRecipeRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? goal,
    Expression<String>? pluginChain,
    Expression<String>? steps,
    Expression<String>? difficulty,
    Expression<String>? timeEstimate,
    Expression<String>? genreTags,
    Expression<String>? presetRefs,
    Expression<String>? sources,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (goal != null) 'goal': goal,
      if (pluginChain != null) 'plugin_chain': pluginChain,
      if (steps != null) 'steps': steps,
      if (difficulty != null) 'difficulty': difficulty,
      if (timeEstimate != null) 'time_estimate': timeEstimate,
      if (genreTags != null) 'genre_tags': genreTags,
      if (presetRefs != null) 'preset_refs': presetRefs,
      if (sources != null) 'sources': sources,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkflowRecipesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? goal,
    Value<String>? pluginChain,
    Value<String>? steps,
    Value<String>? difficulty,
    Value<String>? timeEstimate,
    Value<String>? genreTags,
    Value<String?>? presetRefs,
    Value<String>? sources,
    Value<String?>? createdAt,
    Value<int>? rowid,
  }) {
    return WorkflowRecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      goal: goal ?? this.goal,
      pluginChain: pluginChain ?? this.pluginChain,
      steps: steps ?? this.steps,
      difficulty: difficulty ?? this.difficulty,
      timeEstimate: timeEstimate ?? this.timeEstimate,
      genreTags: genreTags ?? this.genreTags,
      presetRefs: presetRefs ?? this.presetRefs,
      sources: sources ?? this.sources,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (pluginChain.present) {
      map['plugin_chain'] = Variable<String>(pluginChain.value);
    }
    if (steps.present) {
      map['steps'] = Variable<String>(steps.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (timeEstimate.present) {
      map['time_estimate'] = Variable<String>(timeEstimate.value);
    }
    if (genreTags.present) {
      map['genre_tags'] = Variable<String>(genreTags.value);
    }
    if (presetRefs.present) {
      map['preset_refs'] = Variable<String>(presetRefs.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkflowRecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('goal: $goal, ')
          ..write('pluginChain: $pluginChain, ')
          ..write('steps: $steps, ')
          ..write('difficulty: $difficulty, ')
          ..write('timeEstimate: $timeEstimate, ')
          ..write('genreTags: $genreTags, ')
          ..write('presetRefs: $presetRefs, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SoundDesignNotesTable extends SoundDesignNotes
    with TableInfo<$SoundDesignNotesTable, SoundDesignNoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SoundDesignNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
    'topic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectRefsMeta = const VerificationMeta(
    'subjectRefs',
  );
  @override
  late final GeneratedColumn<String> subjectRefs = GeneratedColumn<String>(
    'subject_refs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evidenceLevelMeta = const VerificationMeta(
    'evidenceLevel',
  );
  @override
  late final GeneratedColumn<String> evidenceLevel = GeneratedColumn<String>(
    'evidence_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteTypeMeta = const VerificationMeta(
    'noteType',
  );
  @override
  late final GeneratedColumn<String> noteType = GeneratedColumn<String>(
    'note_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourcesMeta = const VerificationMeta(
    'sources',
  );
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
    'sources',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    topic,
    subjectRefs,
    body,
    evidenceLevel,
    noteType,
    sources,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sound_design_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<SoundDesignNoteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
        _topicMeta,
        topic.isAcceptableOrUnknown(data['topic']!, _topicMeta),
      );
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('subject_refs')) {
      context.handle(
        _subjectRefsMeta,
        subjectRefs.isAcceptableOrUnknown(
          data['subject_refs']!,
          _subjectRefsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectRefsMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('evidence_level')) {
      context.handle(
        _evidenceLevelMeta,
        evidenceLevel.isAcceptableOrUnknown(
          data['evidence_level']!,
          _evidenceLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_evidenceLevelMeta);
    }
    if (data.containsKey('note_type')) {
      context.handle(
        _noteTypeMeta,
        noteType.isAcceptableOrUnknown(data['note_type']!, _noteTypeMeta),
      );
    }
    if (data.containsKey('sources')) {
      context.handle(
        _sourcesMeta,
        sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta),
      );
    } else if (isInserting) {
      context.missing(_sourcesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SoundDesignNoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SoundDesignNoteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      topic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic'],
      )!,
      subjectRefs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_refs'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      evidenceLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evidence_level'],
      )!,
      noteType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_type'],
      ),
      sources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sources'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $SoundDesignNotesTable createAlias(String alias) {
    return $SoundDesignNotesTable(attachedDatabase, alias);
  }
}

class SoundDesignNoteRow extends DataClass
    implements Insertable<SoundDesignNoteRow> {
  final String id;
  final String topic;
  final String subjectRefs;
  final String body;
  final String evidenceLevel;
  final String? noteType;
  final String sources;
  final String createdAt;
  final String? updatedAt;
  const SoundDesignNoteRow({
    required this.id,
    required this.topic,
    required this.subjectRefs,
    required this.body,
    required this.evidenceLevel,
    this.noteType,
    required this.sources,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['topic'] = Variable<String>(topic);
    map['subject_refs'] = Variable<String>(subjectRefs);
    map['body'] = Variable<String>(body);
    map['evidence_level'] = Variable<String>(evidenceLevel);
    if (!nullToAbsent || noteType != null) {
      map['note_type'] = Variable<String>(noteType);
    }
    map['sources'] = Variable<String>(sources);
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  SoundDesignNotesCompanion toCompanion(bool nullToAbsent) {
    return SoundDesignNotesCompanion(
      id: Value(id),
      topic: Value(topic),
      subjectRefs: Value(subjectRefs),
      body: Value(body),
      evidenceLevel: Value(evidenceLevel),
      noteType: noteType == null && nullToAbsent
          ? const Value.absent()
          : Value(noteType),
      sources: Value(sources),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SoundDesignNoteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SoundDesignNoteRow(
      id: serializer.fromJson<String>(json['id']),
      topic: serializer.fromJson<String>(json['topic']),
      subjectRefs: serializer.fromJson<String>(json['subjectRefs']),
      body: serializer.fromJson<String>(json['body']),
      evidenceLevel: serializer.fromJson<String>(json['evidenceLevel']),
      noteType: serializer.fromJson<String?>(json['noteType']),
      sources: serializer.fromJson<String>(json['sources']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'topic': serializer.toJson<String>(topic),
      'subjectRefs': serializer.toJson<String>(subjectRefs),
      'body': serializer.toJson<String>(body),
      'evidenceLevel': serializer.toJson<String>(evidenceLevel),
      'noteType': serializer.toJson<String?>(noteType),
      'sources': serializer.toJson<String>(sources),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  SoundDesignNoteRow copyWith({
    String? id,
    String? topic,
    String? subjectRefs,
    String? body,
    String? evidenceLevel,
    Value<String?> noteType = const Value.absent(),
    String? sources,
    String? createdAt,
    Value<String?> updatedAt = const Value.absent(),
  }) => SoundDesignNoteRow(
    id: id ?? this.id,
    topic: topic ?? this.topic,
    subjectRefs: subjectRefs ?? this.subjectRefs,
    body: body ?? this.body,
    evidenceLevel: evidenceLevel ?? this.evidenceLevel,
    noteType: noteType.present ? noteType.value : this.noteType,
    sources: sources ?? this.sources,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  SoundDesignNoteRow copyWithCompanion(SoundDesignNotesCompanion data) {
    return SoundDesignNoteRow(
      id: data.id.present ? data.id.value : this.id,
      topic: data.topic.present ? data.topic.value : this.topic,
      subjectRefs: data.subjectRefs.present
          ? data.subjectRefs.value
          : this.subjectRefs,
      body: data.body.present ? data.body.value : this.body,
      evidenceLevel: data.evidenceLevel.present
          ? data.evidenceLevel.value
          : this.evidenceLevel,
      noteType: data.noteType.present ? data.noteType.value : this.noteType,
      sources: data.sources.present ? data.sources.value : this.sources,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SoundDesignNoteRow(')
          ..write('id: $id, ')
          ..write('topic: $topic, ')
          ..write('subjectRefs: $subjectRefs, ')
          ..write('body: $body, ')
          ..write('evidenceLevel: $evidenceLevel, ')
          ..write('noteType: $noteType, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    topic,
    subjectRefs,
    body,
    evidenceLevel,
    noteType,
    sources,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SoundDesignNoteRow &&
          other.id == this.id &&
          other.topic == this.topic &&
          other.subjectRefs == this.subjectRefs &&
          other.body == this.body &&
          other.evidenceLevel == this.evidenceLevel &&
          other.noteType == this.noteType &&
          other.sources == this.sources &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SoundDesignNotesCompanion extends UpdateCompanion<SoundDesignNoteRow> {
  final Value<String> id;
  final Value<String> topic;
  final Value<String> subjectRefs;
  final Value<String> body;
  final Value<String> evidenceLevel;
  final Value<String?> noteType;
  final Value<String> sources;
  final Value<String> createdAt;
  final Value<String?> updatedAt;
  final Value<int> rowid;
  const SoundDesignNotesCompanion({
    this.id = const Value.absent(),
    this.topic = const Value.absent(),
    this.subjectRefs = const Value.absent(),
    this.body = const Value.absent(),
    this.evidenceLevel = const Value.absent(),
    this.noteType = const Value.absent(),
    this.sources = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SoundDesignNotesCompanion.insert({
    required String id,
    required String topic,
    required String subjectRefs,
    required String body,
    required String evidenceLevel,
    this.noteType = const Value.absent(),
    required String sources,
    required String createdAt,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       topic = Value(topic),
       subjectRefs = Value(subjectRefs),
       body = Value(body),
       evidenceLevel = Value(evidenceLevel),
       sources = Value(sources),
       createdAt = Value(createdAt);
  static Insertable<SoundDesignNoteRow> custom({
    Expression<String>? id,
    Expression<String>? topic,
    Expression<String>? subjectRefs,
    Expression<String>? body,
    Expression<String>? evidenceLevel,
    Expression<String>? noteType,
    Expression<String>? sources,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topic != null) 'topic': topic,
      if (subjectRefs != null) 'subject_refs': subjectRefs,
      if (body != null) 'body': body,
      if (evidenceLevel != null) 'evidence_level': evidenceLevel,
      if (noteType != null) 'note_type': noteType,
      if (sources != null) 'sources': sources,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SoundDesignNotesCompanion copyWith({
    Value<String>? id,
    Value<String>? topic,
    Value<String>? subjectRefs,
    Value<String>? body,
    Value<String>? evidenceLevel,
    Value<String?>? noteType,
    Value<String>? sources,
    Value<String>? createdAt,
    Value<String?>? updatedAt,
    Value<int>? rowid,
  }) {
    return SoundDesignNotesCompanion(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      subjectRefs: subjectRefs ?? this.subjectRefs,
      body: body ?? this.body,
      evidenceLevel: evidenceLevel ?? this.evidenceLevel,
      noteType: noteType ?? this.noteType,
      sources: sources ?? this.sources,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (subjectRefs.present) {
      map['subject_refs'] = Variable<String>(subjectRefs.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (evidenceLevel.present) {
      map['evidence_level'] = Variable<String>(evidenceLevel.value);
    }
    if (noteType.present) {
      map['note_type'] = Variable<String>(noteType.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoundDesignNotesCompanion(')
          ..write('id: $id, ')
          ..write('topic: $topic, ')
          ..write('subjectRefs: $subjectRefs, ')
          ..write('body: $body, ')
          ..write('evidenceLevel: $evidenceLevel, ')
          ..write('noteType: $noteType, ')
          ..write('sources: $sources, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourceReferencesTable extends SourceReferences
    with TableInfo<$SourceReferencesTable, SourceReferenceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceReferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publisherMeta = const VerificationMeta(
    'publisher',
  );
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
    'publisher',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _retrievedAtMeta = const VerificationMeta(
    'retrievedAt',
  );
  @override
  late final GeneratedColumn<String> retrievedAt = GeneratedColumn<String>(
    'retrieved_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reliabilityMeta = const VerificationMeta(
    'reliability',
  );
  @override
  late final GeneratedColumn<String> reliability = GeneratedColumn<String>(
    'reliability',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    sourceType,
    url,
    publisher,
    author,
    retrievedAt,
    reliability,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_references';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceReferenceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('publisher')) {
      context.handle(
        _publisherMeta,
        publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('retrieved_at')) {
      context.handle(
        _retrievedAtMeta,
        retrievedAt.isAcceptableOrUnknown(
          data['retrieved_at']!,
          _retrievedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_retrievedAtMeta);
    }
    if (data.containsKey('reliability')) {
      context.handle(
        _reliabilityMeta,
        reliability.isAcceptableOrUnknown(
          data['reliability']!,
          _reliabilityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reliabilityMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceReferenceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceReferenceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      publisher: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}publisher'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      retrievedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}retrieved_at'],
      )!,
      reliability: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reliability'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $SourceReferencesTable createAlias(String alias) {
    return $SourceReferencesTable(attachedDatabase, alias);
  }
}

class SourceReferenceRow extends DataClass
    implements Insertable<SourceReferenceRow> {
  final String id;
  final String title;
  final String sourceType;
  final String? url;
  final String? publisher;
  final String? author;
  final String retrievedAt;
  final String reliability;
  final String? notes;
  const SourceReferenceRow({
    required this.id,
    required this.title,
    required this.sourceType,
    this.url,
    this.publisher,
    this.author,
    required this.retrievedAt,
    required this.reliability,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['retrieved_at'] = Variable<String>(retrievedAt);
    map['reliability'] = Variable<String>(reliability);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SourceReferencesCompanion toCompanion(bool nullToAbsent) {
    return SourceReferencesCompanion(
      id: Value(id),
      title: Value(title),
      sourceType: Value(sourceType),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      retrievedAt: Value(retrievedAt),
      reliability: Value(reliability),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory SourceReferenceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceReferenceRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      url: serializer.fromJson<String?>(json['url']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      author: serializer.fromJson<String?>(json['author']),
      retrievedAt: serializer.fromJson<String>(json['retrievedAt']),
      reliability: serializer.fromJson<String>(json['reliability']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'sourceType': serializer.toJson<String>(sourceType),
      'url': serializer.toJson<String?>(url),
      'publisher': serializer.toJson<String?>(publisher),
      'author': serializer.toJson<String?>(author),
      'retrievedAt': serializer.toJson<String>(retrievedAt),
      'reliability': serializer.toJson<String>(reliability),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SourceReferenceRow copyWith({
    String? id,
    String? title,
    String? sourceType,
    Value<String?> url = const Value.absent(),
    Value<String?> publisher = const Value.absent(),
    Value<String?> author = const Value.absent(),
    String? retrievedAt,
    String? reliability,
    Value<String?> notes = const Value.absent(),
  }) => SourceReferenceRow(
    id: id ?? this.id,
    title: title ?? this.title,
    sourceType: sourceType ?? this.sourceType,
    url: url.present ? url.value : this.url,
    publisher: publisher.present ? publisher.value : this.publisher,
    author: author.present ? author.value : this.author,
    retrievedAt: retrievedAt ?? this.retrievedAt,
    reliability: reliability ?? this.reliability,
    notes: notes.present ? notes.value : this.notes,
  );
  SourceReferenceRow copyWithCompanion(SourceReferencesCompanion data) {
    return SourceReferenceRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      url: data.url.present ? data.url.value : this.url,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      author: data.author.present ? data.author.value : this.author,
      retrievedAt: data.retrievedAt.present
          ? data.retrievedAt.value
          : this.retrievedAt,
      reliability: data.reliability.present
          ? data.reliability.value
          : this.reliability,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceReferenceRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('publisher: $publisher, ')
          ..write('author: $author, ')
          ..write('retrievedAt: $retrievedAt, ')
          ..write('reliability: $reliability, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    sourceType,
    url,
    publisher,
    author,
    retrievedAt,
    reliability,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceReferenceRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.sourceType == this.sourceType &&
          other.url == this.url &&
          other.publisher == this.publisher &&
          other.author == this.author &&
          other.retrievedAt == this.retrievedAt &&
          other.reliability == this.reliability &&
          other.notes == this.notes);
}

class SourceReferencesCompanion extends UpdateCompanion<SourceReferenceRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> sourceType;
  final Value<String?> url;
  final Value<String?> publisher;
  final Value<String?> author;
  final Value<String> retrievedAt;
  final Value<String> reliability;
  final Value<String?> notes;
  final Value<int> rowid;
  const SourceReferencesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.url = const Value.absent(),
    this.publisher = const Value.absent(),
    this.author = const Value.absent(),
    this.retrievedAt = const Value.absent(),
    this.reliability = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourceReferencesCompanion.insert({
    required String id,
    required String title,
    required String sourceType,
    this.url = const Value.absent(),
    this.publisher = const Value.absent(),
    this.author = const Value.absent(),
    required String retrievedAt,
    required String reliability,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       sourceType = Value(sourceType),
       retrievedAt = Value(retrievedAt),
       reliability = Value(reliability);
  static Insertable<SourceReferenceRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? sourceType,
    Expression<String>? url,
    Expression<String>? publisher,
    Expression<String>? author,
    Expression<String>? retrievedAt,
    Expression<String>? reliability,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (sourceType != null) 'source_type': sourceType,
      if (url != null) 'url': url,
      if (publisher != null) 'publisher': publisher,
      if (author != null) 'author': author,
      if (retrievedAt != null) 'retrieved_at': retrievedAt,
      if (reliability != null) 'reliability': reliability,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourceReferencesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? sourceType,
    Value<String?>? url,
    Value<String?>? publisher,
    Value<String?>? author,
    Value<String>? retrievedAt,
    Value<String>? reliability,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return SourceReferencesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      sourceType: sourceType ?? this.sourceType,
      url: url ?? this.url,
      publisher: publisher ?? this.publisher,
      author: author ?? this.author,
      retrievedAt: retrievedAt ?? this.retrievedAt,
      reliability: reliability ?? this.reliability,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (retrievedAt.present) {
      map['retrieved_at'] = Variable<String>(retrievedAt.value);
    }
    if (reliability.present) {
      map['reliability'] = Variable<String>(reliability.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceReferencesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('publisher: $publisher, ')
          ..write('author: $author, ')
          ..write('retrievedAt: $retrievedAt, ')
          ..write('reliability: $reliability, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavedItemsTable extends SavedItems
    with TableInfo<$SavedItemsTable, SavedItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rowIdMeta = const VerificationMeta('rowId');
  @override
  late final GeneratedColumn<int> rowId = GeneratedColumn<int>(
    'row_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _refTypeMeta = const VerificationMeta(
    'refType',
  );
  @override
  late final GeneratedColumn<String> refType = GeneratedColumn<String>(
    'ref_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<String> refId = GeneratedColumn<String>(
    'ref_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<String> savedAt = GeneratedColumn<String>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [rowId, refType, refId, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavedItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('row_id')) {
      context.handle(
        _rowIdMeta,
        rowId.isAcceptableOrUnknown(data['row_id']!, _rowIdMeta),
      );
    }
    if (data.containsKey('ref_type')) {
      context.handle(
        _refTypeMeta,
        refType.isAcceptableOrUnknown(data['ref_type']!, _refTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_refTypeMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_savedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rowId};
  @override
  SavedItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedItemRow(
      rowId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}row_id'],
      )!,
      refType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_type'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_id'],
      )!,
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saved_at'],
      )!,
    );
  }

  @override
  $SavedItemsTable createAlias(String alias) {
    return $SavedItemsTable(attachedDatabase, alias);
  }
}

class SavedItemRow extends DataClass implements Insertable<SavedItemRow> {
  final int rowId;
  final String refType;
  final String refId;
  final String savedAt;
  const SavedItemRow({
    required this.rowId,
    required this.refType,
    required this.refId,
    required this.savedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['row_id'] = Variable<int>(rowId);
    map['ref_type'] = Variable<String>(refType);
    map['ref_id'] = Variable<String>(refId);
    map['saved_at'] = Variable<String>(savedAt);
    return map;
  }

  SavedItemsCompanion toCompanion(bool nullToAbsent) {
    return SavedItemsCompanion(
      rowId: Value(rowId),
      refType: Value(refType),
      refId: Value(refId),
      savedAt: Value(savedAt),
    );
  }

  factory SavedItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedItemRow(
      rowId: serializer.fromJson<int>(json['rowId']),
      refType: serializer.fromJson<String>(json['refType']),
      refId: serializer.fromJson<String>(json['refId']),
      savedAt: serializer.fromJson<String>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowId': serializer.toJson<int>(rowId),
      'refType': serializer.toJson<String>(refType),
      'refId': serializer.toJson<String>(refId),
      'savedAt': serializer.toJson<String>(savedAt),
    };
  }

  SavedItemRow copyWith({
    int? rowId,
    String? refType,
    String? refId,
    String? savedAt,
  }) => SavedItemRow(
    rowId: rowId ?? this.rowId,
    refType: refType ?? this.refType,
    refId: refId ?? this.refId,
    savedAt: savedAt ?? this.savedAt,
  );
  SavedItemRow copyWithCompanion(SavedItemsCompanion data) {
    return SavedItemRow(
      rowId: data.rowId.present ? data.rowId.value : this.rowId,
      refType: data.refType.present ? data.refType.value : this.refType,
      refId: data.refId.present ? data.refId.value : this.refId,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedItemRow(')
          ..write('rowId: $rowId, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(rowId, refType, refId, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedItemRow &&
          other.rowId == this.rowId &&
          other.refType == this.refType &&
          other.refId == this.refId &&
          other.savedAt == this.savedAt);
}

class SavedItemsCompanion extends UpdateCompanion<SavedItemRow> {
  final Value<int> rowId;
  final Value<String> refType;
  final Value<String> refId;
  final Value<String> savedAt;
  const SavedItemsCompanion({
    this.rowId = const Value.absent(),
    this.refType = const Value.absent(),
    this.refId = const Value.absent(),
    this.savedAt = const Value.absent(),
  });
  SavedItemsCompanion.insert({
    this.rowId = const Value.absent(),
    required String refType,
    required String refId,
    required String savedAt,
  }) : refType = Value(refType),
       refId = Value(refId),
       savedAt = Value(savedAt);
  static Insertable<SavedItemRow> custom({
    Expression<int>? rowId,
    Expression<String>? refType,
    Expression<String>? refId,
    Expression<String>? savedAt,
  }) {
    return RawValuesInsertable({
      if (rowId != null) 'row_id': rowId,
      if (refType != null) 'ref_type': refType,
      if (refId != null) 'ref_id': refId,
      if (savedAt != null) 'saved_at': savedAt,
    });
  }

  SavedItemsCompanion copyWith({
    Value<int>? rowId,
    Value<String>? refType,
    Value<String>? refId,
    Value<String>? savedAt,
  }) {
    return SavedItemsCompanion(
      rowId: rowId ?? this.rowId,
      refType: refType ?? this.refType,
      refId: refId ?? this.refId,
      savedAt: savedAt ?? this.savedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowId.present) {
      map['row_id'] = Variable<int>(rowId.value);
    }
    if (refType.present) {
      map['ref_type'] = Variable<String>(refType.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<String>(refId.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<String>(savedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedItemsCompanion(')
          ..write('rowId: $rowId, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }
}

class $AppMetaTable extends AppMeta with TableInfo<$AppMetaTable, AppMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppMetaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppMetaRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppMetaTable createAlias(String alias) {
    return $AppMetaTable(attachedDatabase, alias);
  }
}

class AppMetaRow extends DataClass implements Insertable<AppMetaRow> {
  final String key;
  final String value;
  const AppMetaRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppMetaCompanion toCompanion(bool nullToAbsent) {
    return AppMetaCompanion(key: Value(key), value: Value(value));
  }

  factory AppMetaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppMetaRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppMetaRow copyWith({String? key, String? value}) =>
      AppMetaRow(key: key ?? this.key, value: value ?? this.value);
  AppMetaRow copyWithCompanion(AppMetaCompanion data) {
    return AppMetaRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppMetaRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppMetaRow &&
          other.key == this.key &&
          other.value == this.value);
}

class AppMetaCompanion extends UpdateCompanion<AppMetaRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppMetaCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppMetaCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppMetaRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppMetaCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppMetaCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppMetaCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$TonaryDatabase extends GeneratedDatabase {
  _$TonaryDatabase(QueryExecutor e) : super(e);
  $TonaryDatabaseManager get managers => $TonaryDatabaseManager(this);
  late final $PluginsTable plugins = $PluginsTable(this);
  late final $PresetsTable presets = $PresetsTable(this);
  late final $WorkflowRecipesTable workflowRecipes = $WorkflowRecipesTable(
    this,
  );
  late final $SoundDesignNotesTable soundDesignNotes = $SoundDesignNotesTable(
    this,
  );
  late final $SourceReferencesTable sourceReferences = $SourceReferencesTable(
    this,
  );
  late final $SavedItemsTable savedItems = $SavedItemsTable(this);
  late final $AppMetaTable appMeta = $AppMetaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    plugins,
    presets,
    workflowRecipes,
    soundDesignNotes,
    sourceReferences,
    savedItems,
    appMeta,
  ];
}

typedef $$PluginsTableCreateCompanionBuilder =
    PluginsCompanion Function({
      required String id,
      required String name,
      required String vendor,
      Value<String?> vendorName,
      required String category,
      required String type,
      required String tier,
      required String description,
      required String tags,
      required String capabilities,
      Value<String?> color,
      Value<String?> manualUrl,
      required String sources,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<int> rowid,
    });
typedef $$PluginsTableUpdateCompanionBuilder =
    PluginsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> vendor,
      Value<String?> vendorName,
      Value<String> category,
      Value<String> type,
      Value<String> tier,
      Value<String> description,
      Value<String> tags,
      Value<String> capabilities,
      Value<String?> color,
      Value<String?> manualUrl,
      Value<String> sources,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<int> rowid,
    });

class $$PluginsTableFilterComposer
    extends Composer<_$TonaryDatabase, $PluginsTable> {
  $$PluginsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendorName => $composableBuilder(
    column: $table.vendorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get capabilities => $composableBuilder(
    column: $table.capabilities,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manualUrl => $composableBuilder(
    column: $table.manualUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PluginsTableOrderingComposer
    extends Composer<_$TonaryDatabase, $PluginsTable> {
  $$PluginsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendorName => $composableBuilder(
    column: $table.vendorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get capabilities => $composableBuilder(
    column: $table.capabilities,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manualUrl => $composableBuilder(
    column: $table.manualUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PluginsTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $PluginsTable> {
  $$PluginsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get vendor =>
      $composableBuilder(column: $table.vendor, builder: (column) => column);

  GeneratedColumn<String> get vendorName => $composableBuilder(
    column: $table.vendorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get capabilities => $composableBuilder(
    column: $table.capabilities,
    builder: (column) => column,
  );

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get manualUrl =>
      $composableBuilder(column: $table.manualUrl, builder: (column) => column);

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PluginsTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $PluginsTable,
          PluginRow,
          $$PluginsTableFilterComposer,
          $$PluginsTableOrderingComposer,
          $$PluginsTableAnnotationComposer,
          $$PluginsTableCreateCompanionBuilder,
          $$PluginsTableUpdateCompanionBuilder,
          (
            PluginRow,
            BaseReferences<_$TonaryDatabase, $PluginsTable, PluginRow>,
          ),
          PluginRow,
          PrefetchHooks Function()
        > {
  $$PluginsTableTableManager(_$TonaryDatabase db, $PluginsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PluginsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PluginsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PluginsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> vendor = const Value.absent(),
                Value<String?> vendorName = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> tier = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> capabilities = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> manualUrl = const Value.absent(),
                Value<String> sources = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PluginsCompanion(
                id: id,
                name: name,
                vendor: vendor,
                vendorName: vendorName,
                category: category,
                type: type,
                tier: tier,
                description: description,
                tags: tags,
                capabilities: capabilities,
                color: color,
                manualUrl: manualUrl,
                sources: sources,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String vendor,
                Value<String?> vendorName = const Value.absent(),
                required String category,
                required String type,
                required String tier,
                required String description,
                required String tags,
                required String capabilities,
                Value<String?> color = const Value.absent(),
                Value<String?> manualUrl = const Value.absent(),
                required String sources,
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PluginsCompanion.insert(
                id: id,
                name: name,
                vendor: vendor,
                vendorName: vendorName,
                category: category,
                type: type,
                tier: tier,
                description: description,
                tags: tags,
                capabilities: capabilities,
                color: color,
                manualUrl: manualUrl,
                sources: sources,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PluginsTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $PluginsTable,
      PluginRow,
      $$PluginsTableFilterComposer,
      $$PluginsTableOrderingComposer,
      $$PluginsTableAnnotationComposer,
      $$PluginsTableCreateCompanionBuilder,
      $$PluginsTableUpdateCompanionBuilder,
      (PluginRow, BaseReferences<_$TonaryDatabase, $PluginsTable, PluginRow>),
      PluginRow,
      PrefetchHooks Function()
    >;
typedef $$PresetsTableCreateCompanionBuilder =
    PresetsCompanion Function({
      required String id,
      required String pluginId,
      required String name,
      required String category,
      Value<String?> params,
      required String useCases,
      required String genreTags,
      Value<String?> notes,
      required String sources,
      Value<String?> createdAt,
      Value<int> rowid,
    });
typedef $$PresetsTableUpdateCompanionBuilder =
    PresetsCompanion Function({
      Value<String> id,
      Value<String> pluginId,
      Value<String> name,
      Value<String> category,
      Value<String?> params,
      Value<String> useCases,
      Value<String> genreTags,
      Value<String?> notes,
      Value<String> sources,
      Value<String?> createdAt,
      Value<int> rowid,
    });

class $$PresetsTableFilterComposer
    extends Composer<_$TonaryDatabase, $PresetsTable> {
  $$PresetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pluginId => $composableBuilder(
    column: $table.pluginId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get params => $composableBuilder(
    column: $table.params,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get useCases => $composableBuilder(
    column: $table.useCases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genreTags => $composableBuilder(
    column: $table.genreTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PresetsTableOrderingComposer
    extends Composer<_$TonaryDatabase, $PresetsTable> {
  $$PresetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pluginId => $composableBuilder(
    column: $table.pluginId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get params => $composableBuilder(
    column: $table.params,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get useCases => $composableBuilder(
    column: $table.useCases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genreTags => $composableBuilder(
    column: $table.genreTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PresetsTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $PresetsTable> {
  $$PresetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pluginId =>
      $composableBuilder(column: $table.pluginId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get params =>
      $composableBuilder(column: $table.params, builder: (column) => column);

  GeneratedColumn<String> get useCases =>
      $composableBuilder(column: $table.useCases, builder: (column) => column);

  GeneratedColumn<String> get genreTags =>
      $composableBuilder(column: $table.genreTags, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PresetsTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $PresetsTable,
          PresetRow,
          $$PresetsTableFilterComposer,
          $$PresetsTableOrderingComposer,
          $$PresetsTableAnnotationComposer,
          $$PresetsTableCreateCompanionBuilder,
          $$PresetsTableUpdateCompanionBuilder,
          (
            PresetRow,
            BaseReferences<_$TonaryDatabase, $PresetsTable, PresetRow>,
          ),
          PresetRow,
          PrefetchHooks Function()
        > {
  $$PresetsTableTableManager(_$TonaryDatabase db, $PresetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PresetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PresetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PresetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pluginId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> params = const Value.absent(),
                Value<String> useCases = const Value.absent(),
                Value<String> genreTags = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> sources = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PresetsCompanion(
                id: id,
                pluginId: pluginId,
                name: name,
                category: category,
                params: params,
                useCases: useCases,
                genreTags: genreTags,
                notes: notes,
                sources: sources,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pluginId,
                required String name,
                required String category,
                Value<String?> params = const Value.absent(),
                required String useCases,
                required String genreTags,
                Value<String?> notes = const Value.absent(),
                required String sources,
                Value<String?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PresetsCompanion.insert(
                id: id,
                pluginId: pluginId,
                name: name,
                category: category,
                params: params,
                useCases: useCases,
                genreTags: genreTags,
                notes: notes,
                sources: sources,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PresetsTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $PresetsTable,
      PresetRow,
      $$PresetsTableFilterComposer,
      $$PresetsTableOrderingComposer,
      $$PresetsTableAnnotationComposer,
      $$PresetsTableCreateCompanionBuilder,
      $$PresetsTableUpdateCompanionBuilder,
      (PresetRow, BaseReferences<_$TonaryDatabase, $PresetsTable, PresetRow>),
      PresetRow,
      PrefetchHooks Function()
    >;
typedef $$WorkflowRecipesTableCreateCompanionBuilder =
    WorkflowRecipesCompanion Function({
      required String id,
      required String title,
      required String goal,
      required String pluginChain,
      required String steps,
      required String difficulty,
      required String timeEstimate,
      required String genreTags,
      Value<String?> presetRefs,
      required String sources,
      Value<String?> createdAt,
      Value<int> rowid,
    });
typedef $$WorkflowRecipesTableUpdateCompanionBuilder =
    WorkflowRecipesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> goal,
      Value<String> pluginChain,
      Value<String> steps,
      Value<String> difficulty,
      Value<String> timeEstimate,
      Value<String> genreTags,
      Value<String?> presetRefs,
      Value<String> sources,
      Value<String?> createdAt,
      Value<int> rowid,
    });

class $$WorkflowRecipesTableFilterComposer
    extends Composer<_$TonaryDatabase, $WorkflowRecipesTable> {
  $$WorkflowRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pluginChain => $composableBuilder(
    column: $table.pluginChain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeEstimate => $composableBuilder(
    column: $table.timeEstimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genreTags => $composableBuilder(
    column: $table.genreTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get presetRefs => $composableBuilder(
    column: $table.presetRefs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkflowRecipesTableOrderingComposer
    extends Composer<_$TonaryDatabase, $WorkflowRecipesTable> {
  $$WorkflowRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pluginChain => $composableBuilder(
    column: $table.pluginChain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeEstimate => $composableBuilder(
    column: $table.timeEstimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genreTags => $composableBuilder(
    column: $table.genreTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get presetRefs => $composableBuilder(
    column: $table.presetRefs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkflowRecipesTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $WorkflowRecipesTable> {
  $$WorkflowRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumn<String> get pluginChain => $composableBuilder(
    column: $table.pluginChain,
    builder: (column) => column,
  );

  GeneratedColumn<String> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timeEstimate => $composableBuilder(
    column: $table.timeEstimate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get genreTags =>
      $composableBuilder(column: $table.genreTags, builder: (column) => column);

  GeneratedColumn<String> get presetRefs => $composableBuilder(
    column: $table.presetRefs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WorkflowRecipesTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $WorkflowRecipesTable,
          WorkflowRecipeRow,
          $$WorkflowRecipesTableFilterComposer,
          $$WorkflowRecipesTableOrderingComposer,
          $$WorkflowRecipesTableAnnotationComposer,
          $$WorkflowRecipesTableCreateCompanionBuilder,
          $$WorkflowRecipesTableUpdateCompanionBuilder,
          (
            WorkflowRecipeRow,
            BaseReferences<
              _$TonaryDatabase,
              $WorkflowRecipesTable,
              WorkflowRecipeRow
            >,
          ),
          WorkflowRecipeRow,
          PrefetchHooks Function()
        > {
  $$WorkflowRecipesTableTableManager(
    _$TonaryDatabase db,
    $WorkflowRecipesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkflowRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkflowRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkflowRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> goal = const Value.absent(),
                Value<String> pluginChain = const Value.absent(),
                Value<String> steps = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> timeEstimate = const Value.absent(),
                Value<String> genreTags = const Value.absent(),
                Value<String?> presetRefs = const Value.absent(),
                Value<String> sources = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkflowRecipesCompanion(
                id: id,
                title: title,
                goal: goal,
                pluginChain: pluginChain,
                steps: steps,
                difficulty: difficulty,
                timeEstimate: timeEstimate,
                genreTags: genreTags,
                presetRefs: presetRefs,
                sources: sources,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String goal,
                required String pluginChain,
                required String steps,
                required String difficulty,
                required String timeEstimate,
                required String genreTags,
                Value<String?> presetRefs = const Value.absent(),
                required String sources,
                Value<String?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkflowRecipesCompanion.insert(
                id: id,
                title: title,
                goal: goal,
                pluginChain: pluginChain,
                steps: steps,
                difficulty: difficulty,
                timeEstimate: timeEstimate,
                genreTags: genreTags,
                presetRefs: presetRefs,
                sources: sources,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkflowRecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $WorkflowRecipesTable,
      WorkflowRecipeRow,
      $$WorkflowRecipesTableFilterComposer,
      $$WorkflowRecipesTableOrderingComposer,
      $$WorkflowRecipesTableAnnotationComposer,
      $$WorkflowRecipesTableCreateCompanionBuilder,
      $$WorkflowRecipesTableUpdateCompanionBuilder,
      (
        WorkflowRecipeRow,
        BaseReferences<
          _$TonaryDatabase,
          $WorkflowRecipesTable,
          WorkflowRecipeRow
        >,
      ),
      WorkflowRecipeRow,
      PrefetchHooks Function()
    >;
typedef $$SoundDesignNotesTableCreateCompanionBuilder =
    SoundDesignNotesCompanion Function({
      required String id,
      required String topic,
      required String subjectRefs,
      required String body,
      required String evidenceLevel,
      Value<String?> noteType,
      required String sources,
      required String createdAt,
      Value<String?> updatedAt,
      Value<int> rowid,
    });
typedef $$SoundDesignNotesTableUpdateCompanionBuilder =
    SoundDesignNotesCompanion Function({
      Value<String> id,
      Value<String> topic,
      Value<String> subjectRefs,
      Value<String> body,
      Value<String> evidenceLevel,
      Value<String?> noteType,
      Value<String> sources,
      Value<String> createdAt,
      Value<String?> updatedAt,
      Value<int> rowid,
    });

class $$SoundDesignNotesTableFilterComposer
    extends Composer<_$TonaryDatabase, $SoundDesignNotesTable> {
  $$SoundDesignNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topic => $composableBuilder(
    column: $table.topic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectRefs => $composableBuilder(
    column: $table.subjectRefs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evidenceLevel => $composableBuilder(
    column: $table.evidenceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteType => $composableBuilder(
    column: $table.noteType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SoundDesignNotesTableOrderingComposer
    extends Composer<_$TonaryDatabase, $SoundDesignNotesTable> {
  $$SoundDesignNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topic => $composableBuilder(
    column: $table.topic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectRefs => $composableBuilder(
    column: $table.subjectRefs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evidenceLevel => $composableBuilder(
    column: $table.evidenceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteType => $composableBuilder(
    column: $table.noteType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sources => $composableBuilder(
    column: $table.sources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SoundDesignNotesTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $SoundDesignNotesTable> {
  $$SoundDesignNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get subjectRefs => $composableBuilder(
    column: $table.subjectRefs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get evidenceLevel => $composableBuilder(
    column: $table.evidenceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get noteType =>
      $composableBuilder(column: $table.noteType, builder: (column) => column);

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SoundDesignNotesTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $SoundDesignNotesTable,
          SoundDesignNoteRow,
          $$SoundDesignNotesTableFilterComposer,
          $$SoundDesignNotesTableOrderingComposer,
          $$SoundDesignNotesTableAnnotationComposer,
          $$SoundDesignNotesTableCreateCompanionBuilder,
          $$SoundDesignNotesTableUpdateCompanionBuilder,
          (
            SoundDesignNoteRow,
            BaseReferences<
              _$TonaryDatabase,
              $SoundDesignNotesTable,
              SoundDesignNoteRow
            >,
          ),
          SoundDesignNoteRow,
          PrefetchHooks Function()
        > {
  $$SoundDesignNotesTableTableManager(
    _$TonaryDatabase db,
    $SoundDesignNotesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SoundDesignNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SoundDesignNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SoundDesignNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> topic = const Value.absent(),
                Value<String> subjectRefs = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> evidenceLevel = const Value.absent(),
                Value<String?> noteType = const Value.absent(),
                Value<String> sources = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SoundDesignNotesCompanion(
                id: id,
                topic: topic,
                subjectRefs: subjectRefs,
                body: body,
                evidenceLevel: evidenceLevel,
                noteType: noteType,
                sources: sources,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String topic,
                required String subjectRefs,
                required String body,
                required String evidenceLevel,
                Value<String?> noteType = const Value.absent(),
                required String sources,
                required String createdAt,
                Value<String?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SoundDesignNotesCompanion.insert(
                id: id,
                topic: topic,
                subjectRefs: subjectRefs,
                body: body,
                evidenceLevel: evidenceLevel,
                noteType: noteType,
                sources: sources,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SoundDesignNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $SoundDesignNotesTable,
      SoundDesignNoteRow,
      $$SoundDesignNotesTableFilterComposer,
      $$SoundDesignNotesTableOrderingComposer,
      $$SoundDesignNotesTableAnnotationComposer,
      $$SoundDesignNotesTableCreateCompanionBuilder,
      $$SoundDesignNotesTableUpdateCompanionBuilder,
      (
        SoundDesignNoteRow,
        BaseReferences<
          _$TonaryDatabase,
          $SoundDesignNotesTable,
          SoundDesignNoteRow
        >,
      ),
      SoundDesignNoteRow,
      PrefetchHooks Function()
    >;
typedef $$SourceReferencesTableCreateCompanionBuilder =
    SourceReferencesCompanion Function({
      required String id,
      required String title,
      required String sourceType,
      Value<String?> url,
      Value<String?> publisher,
      Value<String?> author,
      required String retrievedAt,
      required String reliability,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$SourceReferencesTableUpdateCompanionBuilder =
    SourceReferencesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> sourceType,
      Value<String?> url,
      Value<String?> publisher,
      Value<String?> author,
      Value<String> retrievedAt,
      Value<String> reliability,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$SourceReferencesTableFilterComposer
    extends Composer<_$TonaryDatabase, $SourceReferencesTable> {
  $$SourceReferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get retrievedAt => $composableBuilder(
    column: $table.retrievedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reliability => $composableBuilder(
    column: $table.reliability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SourceReferencesTableOrderingComposer
    extends Composer<_$TonaryDatabase, $SourceReferencesTable> {
  $$SourceReferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get retrievedAt => $composableBuilder(
    column: $table.retrievedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reliability => $composableBuilder(
    column: $table.reliability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourceReferencesTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $SourceReferencesTable> {
  $$SourceReferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get retrievedAt => $composableBuilder(
    column: $table.retrievedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reliability => $composableBuilder(
    column: $table.reliability,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SourceReferencesTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $SourceReferencesTable,
          SourceReferenceRow,
          $$SourceReferencesTableFilterComposer,
          $$SourceReferencesTableOrderingComposer,
          $$SourceReferencesTableAnnotationComposer,
          $$SourceReferencesTableCreateCompanionBuilder,
          $$SourceReferencesTableUpdateCompanionBuilder,
          (
            SourceReferenceRow,
            BaseReferences<
              _$TonaryDatabase,
              $SourceReferencesTable,
              SourceReferenceRow
            >,
          ),
          SourceReferenceRow,
          PrefetchHooks Function()
        > {
  $$SourceReferencesTableTableManager(
    _$TonaryDatabase db,
    $SourceReferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourceReferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourceReferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourceReferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String> retrievedAt = const Value.absent(),
                Value<String> reliability = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceReferencesCompanion(
                id: id,
                title: title,
                sourceType: sourceType,
                url: url,
                publisher: publisher,
                author: author,
                retrievedAt: retrievedAt,
                reliability: reliability,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String sourceType,
                Value<String?> url = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<String?> author = const Value.absent(),
                required String retrievedAt,
                required String reliability,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceReferencesCompanion.insert(
                id: id,
                title: title,
                sourceType: sourceType,
                url: url,
                publisher: publisher,
                author: author,
                retrievedAt: retrievedAt,
                reliability: reliability,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SourceReferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $SourceReferencesTable,
      SourceReferenceRow,
      $$SourceReferencesTableFilterComposer,
      $$SourceReferencesTableOrderingComposer,
      $$SourceReferencesTableAnnotationComposer,
      $$SourceReferencesTableCreateCompanionBuilder,
      $$SourceReferencesTableUpdateCompanionBuilder,
      (
        SourceReferenceRow,
        BaseReferences<
          _$TonaryDatabase,
          $SourceReferencesTable,
          SourceReferenceRow
        >,
      ),
      SourceReferenceRow,
      PrefetchHooks Function()
    >;
typedef $$SavedItemsTableCreateCompanionBuilder =
    SavedItemsCompanion Function({
      Value<int> rowId,
      required String refType,
      required String refId,
      required String savedAt,
    });
typedef $$SavedItemsTableUpdateCompanionBuilder =
    SavedItemsCompanion Function({
      Value<int> rowId,
      Value<String> refType,
      Value<String> refId,
      Value<String> savedAt,
    });

class $$SavedItemsTableFilterComposer
    extends Composer<_$TonaryDatabase, $SavedItemsTable> {
  $$SavedItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavedItemsTableOrderingComposer
    extends Composer<_$TonaryDatabase, $SavedItemsTable> {
  $$SavedItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavedItemsTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $SavedItemsTable> {
  $$SavedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get rowId =>
      $composableBuilder(column: $table.rowId, builder: (column) => column);

  GeneratedColumn<String> get refType =>
      $composableBuilder(column: $table.refType, builder: (column) => column);

  GeneratedColumn<String> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);
}

class $$SavedItemsTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $SavedItemsTable,
          SavedItemRow,
          $$SavedItemsTableFilterComposer,
          $$SavedItemsTableOrderingComposer,
          $$SavedItemsTableAnnotationComposer,
          $$SavedItemsTableCreateCompanionBuilder,
          $$SavedItemsTableUpdateCompanionBuilder,
          (
            SavedItemRow,
            BaseReferences<_$TonaryDatabase, $SavedItemsTable, SavedItemRow>,
          ),
          SavedItemRow,
          PrefetchHooks Function()
        > {
  $$SavedItemsTableTableManager(_$TonaryDatabase db, $SavedItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> rowId = const Value.absent(),
                Value<String> refType = const Value.absent(),
                Value<String> refId = const Value.absent(),
                Value<String> savedAt = const Value.absent(),
              }) => SavedItemsCompanion(
                rowId: rowId,
                refType: refType,
                refId: refId,
                savedAt: savedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> rowId = const Value.absent(),
                required String refType,
                required String refId,
                required String savedAt,
              }) => SavedItemsCompanion.insert(
                rowId: rowId,
                refType: refType,
                refId: refId,
                savedAt: savedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavedItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $SavedItemsTable,
      SavedItemRow,
      $$SavedItemsTableFilterComposer,
      $$SavedItemsTableOrderingComposer,
      $$SavedItemsTableAnnotationComposer,
      $$SavedItemsTableCreateCompanionBuilder,
      $$SavedItemsTableUpdateCompanionBuilder,
      (
        SavedItemRow,
        BaseReferences<_$TonaryDatabase, $SavedItemsTable, SavedItemRow>,
      ),
      SavedItemRow,
      PrefetchHooks Function()
    >;
typedef $$AppMetaTableCreateCompanionBuilder =
    AppMetaCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppMetaTableUpdateCompanionBuilder =
    AppMetaCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppMetaTableFilterComposer
    extends Composer<_$TonaryDatabase, $AppMetaTable> {
  $$AppMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppMetaTableOrderingComposer
    extends Composer<_$TonaryDatabase, $AppMetaTable> {
  $$AppMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppMetaTableAnnotationComposer
    extends Composer<_$TonaryDatabase, $AppMetaTable> {
  $$AppMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppMetaTableTableManager
    extends
        RootTableManager<
          _$TonaryDatabase,
          $AppMetaTable,
          AppMetaRow,
          $$AppMetaTableFilterComposer,
          $$AppMetaTableOrderingComposer,
          $$AppMetaTableAnnotationComposer,
          $$AppMetaTableCreateCompanionBuilder,
          $$AppMetaTableUpdateCompanionBuilder,
          (
            AppMetaRow,
            BaseReferences<_$TonaryDatabase, $AppMetaTable, AppMetaRow>,
          ),
          AppMetaRow,
          PrefetchHooks Function()
        > {
  $$AppMetaTableTableManager(_$TonaryDatabase db, $AppMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppMetaCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) =>
                  AppMetaCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$TonaryDatabase,
      $AppMetaTable,
      AppMetaRow,
      $$AppMetaTableFilterComposer,
      $$AppMetaTableOrderingComposer,
      $$AppMetaTableAnnotationComposer,
      $$AppMetaTableCreateCompanionBuilder,
      $$AppMetaTableUpdateCompanionBuilder,
      (AppMetaRow, BaseReferences<_$TonaryDatabase, $AppMetaTable, AppMetaRow>),
      AppMetaRow,
      PrefetchHooks Function()
    >;

class $TonaryDatabaseManager {
  final _$TonaryDatabase _db;
  $TonaryDatabaseManager(this._db);
  $$PluginsTableTableManager get plugins =>
      $$PluginsTableTableManager(_db, _db.plugins);
  $$PresetsTableTableManager get presets =>
      $$PresetsTableTableManager(_db, _db.presets);
  $$WorkflowRecipesTableTableManager get workflowRecipes =>
      $$WorkflowRecipesTableTableManager(_db, _db.workflowRecipes);
  $$SoundDesignNotesTableTableManager get soundDesignNotes =>
      $$SoundDesignNotesTableTableManager(_db, _db.soundDesignNotes);
  $$SourceReferencesTableTableManager get sourceReferences =>
      $$SourceReferencesTableTableManager(_db, _db.sourceReferences);
  $$SavedItemsTableTableManager get savedItems =>
      $$SavedItemsTableTableManager(_db, _db.savedItems);
  $$AppMetaTableTableManager get appMeta =>
      $$AppMetaTableTableManager(_db, _db.appMeta);
}
