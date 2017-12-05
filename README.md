
# spc

This is a short program that will create a new clean sbt project structure:

```
project_root/
  src/main/scala/Main.scala
  project/
    plugins.sbt
  build.sbt
```

Plugins that are included (but commented out): `sbteclipse`.

build.sbt includes all akka and akka.http libraries, also commented out as
default.

# Usage

Make the script executable and either place it on your path, or refer to
it's absolute location when you want to execute it.

## Example

```
$ spc test-project
```
This will create a project in the current directory.

```
$ spc /home/niels/scala/new-project
```

This will create a new project in the specified location (so long as the parent
directory exists, and no file or directory is named `new-project`.

