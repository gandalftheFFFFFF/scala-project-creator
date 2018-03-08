#!/bin/bash

# if args is given; check for parent dir existance
if [ $# -gt 0 ]; then
  PARENT=$(dirname $1)
  CHILD=$(basename $1)
  if [ -d $PARENT ]; then
    if [ ! -f $CHILD ] && [ ! -d $CHILD ]; then
      WORKING_DIR=$(dirname $1)
    else
      echo "Error: Target directory or file already exists: $CHILD"
      exit 1
    fi
  else
    echo "Error: Parent dir does not exist: $PARENT"
    exit 1
  fi
else
  echo "Error: Please specify a project name"
  exit 1
fi

echo "Creating project in: $1"

PROJECT_ROOT=$WORKING_DIR/$CHILD
AKKA_VERSION="2.5.9"
AKKA_HTTP_VERSION="10.0.11"

mkdir -p $PROJECT_ROOT/src/main/scala
mkdir $PROJECT_ROOT/project

# Hello world program:
cat > $PROJECT_ROOT/src/main/scala/Main.scala <<- EOM
object Main extends App {
  println("Hello, world!")
}
EOM

# plugins.sbt:
cat > $PROJECT_ROOT/project/plugins.sbt <<- EOM
//addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "5.2.4")

//addSbtPlugin("io.spray" % "sbt-revolver" % "0.9.1")

//addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.6")

EOM

# build.sbt
cat > $PROJECT_ROOT/build.sbt <<- EOM
scalaVersion := "2.12.4"

val akkaVersion = "$AKKA_VERSION"
val akkaHttpVersion = "$AKKA_HTTP_VERSION"

libraryDependencies ++= Seq(
  //"com.typesafe.akka" %% "akka-actor" % akkaVersion,
  //"com.typesafe.akka" %% "akka-camel" % akkaVersion,
  //"com.typesafe.akka" %% "akka-slf4j" % akkaVersion,
  //"com.typesafe.akka" %% "akka-stream" % akkaVersion,

  //"com.typesafe.akka" %% "akka-http" % akkaHttpVersion,
  //"com.typesafe.akka" %% "akka-http-testkit" % akkaHttpVersion,
  //"com.typesafe.akka" %% "akka-http-spray-json" % akkaHttpVersion,
  //"com.typesafe.akka" %% "akka-http-jackson" % akkaHttpVersion,
  //"com.typesafe.akka" %% "akka-http-xml" % akkaHttpVersion,

  //"com.typesafe" % "config" % "1.3.1"
)
EOM

cat > $PROJECT_ROOT/project/build.properties <<- EOM
sbt.version=1.1.1

EOM

cat > $PROJECT_ROOT/.gitignore <<- EOM
*.class
*.log

# sbt specific
.cache/
.history/
.lib/
dist/*
target/
lib_managed/
src_managed/
project/boot/
project/plugins/project/

# Scala-IDE specific
.scala_dependencies
.worksheet
.idea

EOM

cat > $PROJECT_ROOT/.scalafmt.conf <<- EOM
style = defaultWithAlign
align.tokens = [ ":", "=", "=>", "->", "<-" ]
maxColumn = 120
rewrite.rules = [ "RedundantParens", "SortImports" ]

EOM



