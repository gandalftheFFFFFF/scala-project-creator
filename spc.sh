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
AKKA_VERSION="2.4.17"
AKKA_HTTP_VERSION="10.0.5"

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
//addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "5.1.0")
EOM

# build.sbt
cat > $PROJECT_ROOT/build.sbt <<- EOM
scalaVersion := "2.11.8"

libraryDependencies ++= Seq(
  //"com.typesafe.akka" %% "akka-actor" % "$AKKA_VERSION",
  //"com.typesafe.akka" %% "akka-camel" % "$AKKA_VERSION",
  //"com.typesafe.akka" %% "akka-slf4j" % "$AKKA_VERSION",
  //"com.typesafe.akka" %% "akka-stream" % "$AKKA_VERSION",

  //"com.typesafe.akka" %% "akka-http-core" % "$AKKA_HTTP_VERSION",
  //"com.typesafe.akka" %% "akka-http" % "$AKKA_HTTP_VERSION",
  //"com.typesafe.akka" %% "akka-http-testkit" % "$AKKA_HTTP_VERSION",
  //"com.typesafe.akka" %% "akka-http-spray-json" % "$AKKA_HTTP_VERSION",
  //"com.typesafe.akka" %% "akka-http-jackson" % "$AKKA_HTTP_VERSION",
  //"com.typesafe.akka" %% "akka-http-xml" % "$AKKA_HTTP_VERSION",
  
  //"com.typesafe" % "config" % "1.3.1"
)
EOM


