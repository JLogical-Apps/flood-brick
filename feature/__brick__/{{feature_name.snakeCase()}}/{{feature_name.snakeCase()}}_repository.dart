import 'package:flood_core/flood_core.dart';
import '{{feature_name.snakeCase()}}.dart';
import '{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Repository with IsRepositoryWrapper {
  @override
  late Repository repository = Repository.forType<{{feature_name.pascalCase()}}Entity, {{feature_name.pascalCase()}}>(
    {{feature_name.pascalCase()}}Entity.new,
    {{feature_name.pascalCase()}}.new,
    entityTypeName: '{{feature_name.pascalCase()}}Entity',
    valueObjectTypeName: '{{feature_name.pascalCase()}}',
  ).adapting('{{feature_name.paramCase()}}');
}