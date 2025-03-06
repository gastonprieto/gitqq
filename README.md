# GitQQ (Git Quick Quick)

A command-line tool to facilitate the use of Git with natural language and development best practices.

## Installation

```bash
# Clone the repository
git clone https://github.com/your-username/gitqq.git
cd gitqq

# Install dependencies
npm install

# Install globally (optional)
npm install -g .
```

## Multilingual Support

GitQQ supports multiple languages:

- English
- Spanish (Español)
- Portuguese (Português)

### Changing the Language

You can change the language using the config command:

```bash
# Show current language
gitqq config

# Change language
gitqq config language
```

The language preference is stored in a configuration file located at `~/.gitqq/config.json`.

## Available Commands

### Semantic Commit

The `commit` command allows you to create commits following the [Conventional Commits](https://www.conventionalcommits.org/) conventions, which facilitates automatic changelog generation and semantic versioning.

#### Semantic Commit Structure

```
<type>(<scope>)!: <description>

<body>

<footer>
```

Where:
- **type**: Indicates the type of change (feat, fix, docs, etc.)
- **scope**: (Optional) Indicates the section of code affected
- **!**: (Optional) Indicates a breaking change
- **description**: Brief description of the change
- **body**: (Optional) Detailed description of the change
- **footer**: (Optional) Additional information such as breaking changes or closed issues

#### Basic Usage

By default, the commit command runs in interactive mode, guiding you through the commit creation process:

```bash
# Basic form - will start interactive prompts
gitqq commit

# With a default message - will start interactive prompts with pre-filled message
gitqq commit "Initial message"
```

#### Non-Interactive Mode

If you prefer to use the command without prompts, you can use the `-n` or `--non-interactive` flag:

```bash
# Non-interactive mode with basic message
gitqq commit -n "Commit message"

# Specifying the type (default is "feat")
gitqq commit -n -t fix "Fixes authentication error"

# With scope
gitqq commit -n -t feat -s auth "Add Google authentication"

# With breaking change
gitqq commit -n -t feat -s api -b "Change API response structure"

# With detailed description
gitqq commit -n -t docs -d "Updates complete project documentation" "Update README"

# Custom complete message (always non-interactive)
gitqq commit -m "feat(auth)!: implement Google authentication

Detailed description of the change.

BREAKING CHANGE: This implementation is not compatible with previous versions."
```

#### Interactive Mode

The interactive mode (default) guides you through the commit creation process by prompting for each parameter:

1. Select the type of change from a list
2. Enter the scope of the change (optional)
3. Indicate if it's a breaking change
4. Write a short description
5. Provide a longer description (optional)

This mode is particularly helpful for users who are new to Conventional Commits or prefer a guided approach.

#### Available Commit Types

| Type | Description |
|------|-------------|
| feat | New features |
| fix | Bug fixes |
| docs | Documentation changes |
| style | Changes that do not affect the meaning of the code |
| refactor | Code changes that neither fix bugs nor add features |
| perf | Performance improvements |
| test | Adding or correcting tests |
| build | Changes that affect the build system or external dependencies |
| ci | Changes to CI configuration and scripts |
| chore | Other changes that don't modify src or test files |
| revert | Reverts a previous commit |

### Configuration

The `config` command allows you to manage the GitQQ configuration:

```bash
# Show current configuration
gitqq config

# Change language
gitqq config language

# Show current configuration details
gitqq config show
```

### Inicialización de Proyecto

El comando `init-project` permite inicializar rápidamente un nuevo repositorio Git con un commit inicial:

```bash
# Inicializar un nuevo repositorio Git
gitqq init-project
```

Este comando realiza las siguientes acciones:
1. Inicializa un nuevo repositorio Git
2. Crea un commit inicial vacío con el mensaje "(chore): initial commit"

Es útil para comenzar rápidamente un nuevo proyecto con una estructura de commits limpia.

### Formateo de Commits

El comando `format-commits` permite convertir commits existentes al formato de Commits Convencionales:

```bash
# Convertir commits desde un commit específico hasta HEAD
gitqq format-commits <hash-del-commit>
```

Características principales:
- Analiza cada commit desde el commit especificado hasta HEAD
- Sugiere automáticamente un formato convencional basado en el mensaje original
- Permite revisar y editar cada sugerencia
- Reescribe los mensajes de commit manteniendo el historial del repositorio

Este comando es especialmente útil para estandarizar el historial de commits de un proyecto o para preparar un proyecto para la generación automática de changelogs.

> **Nota**: Este comando reescribe el historial de Git. Si ya has compartido tu repositorio, necesitarás hacer un push forzado después de usar este comando, lo que puede causar problemas para otros colaboradores.

## Benefits of Using Semantic Commits

- **Automatic changelog generation**: Facilitates the creation of change documents between versions.
- **Automatic semantic versioning**: Allows automatic determination of the type of version change (major, minor, patch).
- **Clear communication**: Clearly communicates the nature of changes to team members and users.
- **Consistent structure**: Provides a consistent structure for commit history.
- **Facilitates collaboration**: Makes it easier for other developers to understand the changes made.

## Contributing

Contributions are welcome. Please make sure to follow the code and commit conventions of the project.

## License

This project is licensed under the ISC license - see the LICENSE file for details. 