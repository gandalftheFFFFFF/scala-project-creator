
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
its absolute location when you want to execute it:

```
$ git clone git@github.com:nielspedersen/scala-project-creator.git
...
$ tree scala-project-creator/
scala-project-creator/
├── README.md
└── spc.sh
$ chmod +x scala-project-creator/spc.sh
```

Then either refer to that file, or create a symlink to a folder on your `PATH`:

```
$ ls scala-project-creator/
README.md  spc.sh*
$ ln -s scala-project-creator/spc.sh ~/bin/spc
$ cd
$ spc
Error: Please specify a project name
```

## Example

```
$ spc test-project
```
This will create a project in the current directory.

```
$ spc /home/niels/scala/test-project
$ ls
test-project
$ tree test-project
test-project/
├── build.sbt
├── project
│   └── plugins.sbt
└── src
    └── main
        └── scala
            └── Main.scala

4 directories, 3 files
```

This will create a new project in the specified location (so long as the parent
directory exists, and no file or directory is named `new-project`.

