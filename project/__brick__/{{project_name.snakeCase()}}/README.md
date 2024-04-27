# {{project_name.titleCase()}}

Built with [Flood](https://www.flooddev.com/)

## Workflow

### Setup

[Melos](https://melos.invertase.dev/) is a tool designed to manage Dart and Flutter projects with multiple packages, especially suited for big projects or projects which share common code across multiple apps.

To install Melos:
```
flutter pub global activate melos
```
Ensure your global pub cache is in your path, so you can run the `melos` command anywhere.

### Packaging

Bootstrapping in Melos is analogous to running flutter pub get for a regular Flutter project. While flutter pub get fetches and installs all the dependencies for a single Flutter project, Melos' bootstrapping process does something similar but on a larger scale for multi-package projects. It sets up your development environment by interlinking local package dependencies and populating them with their respective dependencies. This is especially useful for developing multiple interdependent packages within the same repository, ensuring they work seamlessly together.

To bootstrap your project with Melos, simply run:
```
melos bs
```

### Testing

Testing your multi-package projects is simplified using Melos. Instead of running tests for each package individually, Melos can run them all at once.

To test your packages using Melos:
```
melos test
```

It will execute tests for all the packages in your project. Make sure you've bootstrapped your project before testing.