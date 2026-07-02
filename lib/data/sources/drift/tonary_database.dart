import 'package:drift/drift.dart';

import 'connection.dart';

part 'tonary_database.g.dart';

// One table per core Tonary schema (`.claude/schemas/`). List/object fields are
// stored as JSON text columns; the mappers own encode/decode. See
// `.claude/architecture/data-layer.md`.

@DataClassName('PluginRow')
class Plugins extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get vendor => text()();
  TextColumn get vendorName => text().nullable()();
  TextColumn get category => text()();
  TextColumn get type => text()();
  TextColumn get tier => text()();
  TextColumn get description => text()();
  TextColumn get tags => text()(); // json array
  TextColumn get capabilities => text()(); // json array
  TextColumn get color => text().nullable()();
  TextColumn get manualUrl => text().nullable()();
  TextColumn get sources => text()(); // json array
  TextColumn get createdAt => text().nullable()();
  TextColumn get updatedAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('PresetRow')
class Presets extends Table {
  TextColumn get id => text()();
  TextColumn get pluginId => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get params => text().nullable()(); // json object
  TextColumn get useCases => text()(); // json array
  TextColumn get genreTags => text()(); // json array
  TextColumn get notes => text().nullable()();
  TextColumn get sources => text()(); // json array
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('WorkflowRecipeRow')
class WorkflowRecipes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get goal => text()();
  TextColumn get pluginChain => text()(); // json array
  TextColumn get steps => text()(); // json array of objects
  TextColumn get difficulty => text()();
  TextColumn get timeEstimate => text()();
  TextColumn get genreTags => text()(); // json array
  TextColumn get presetRefs => text().nullable()(); // json array
  TextColumn get sources => text()(); // json array
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SoundDesignNoteRow')
class SoundDesignNotes extends Table {
  TextColumn get id => text()();
  TextColumn get topic => text()();
  TextColumn get subjectRefs => text()(); // json array
  TextColumn get body => text()();
  TextColumn get evidenceLevel => text()();
  TextColumn get noteType => text().nullable()();
  TextColumn get sources => text()(); // json array
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('SourceReferenceRow')
class SourceReferences extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get sourceType => text()();
  TextColumn get url => text().nullable()();
  TextColumn get publisher => text().nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get retrievedAt => text()();
  TextColumn get reliability => text()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// The one user-writable table (User Saved Item).
@DataClassName('SavedItemRow')
class SavedItems extends Table {
  IntColumn get rowId => integer().autoIncrement()();
  TextColumn get refType => text()();
  TextColumn get refId => text()();
  TextColumn get savedAt => text()();
}

/// Key-value markers (e.g. the seed version guard).
@DataClassName('AppMetaRow')
class AppMeta extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@DriftDatabase(
  tables: [
    Plugins,
    Presets,
    WorkflowRecipes,
    SoundDesignNotes,
    SourceReferences,
    SavedItems,
    AppMeta,
  ],
)
class TonaryDatabase extends _$TonaryDatabase {
  TonaryDatabase() : super(openConnection());

  /// For tests: inject an in-memory or custom executor.
  TonaryDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}
