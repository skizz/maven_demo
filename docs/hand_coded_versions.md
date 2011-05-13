Hand Coded Versions
===================

This is the standard maven approach. 

Use SNAPSHOTS locally while you are developing. 

Install a snapshot locally:

	$ tree local_repo/com/tw/maven_demo/component1/
	local_repo/com/tw/maven_demo/component1/
	├── a
	│   ├── 1.0-SNAPSHOT
	│   │   ├── _maven.repositories
	│   │   ├── a-1.0-SNAPSHOT.jar
	│   │   ├── a-1.0-SNAPSHOT.pom
	│   │   └── maven-metadata-local.xml
	│   └── maven-metadata-local.xml
	├── b
	│   ├── 1.0-SNAPSHOT
	│   │   ├── _maven.repositories
	│   │   ├── b-1.0-SNAPSHOT.jar
	│   │   ├── b-1.0-SNAPSHOT.pom
	│   │   └── maven-metadata-local.xml
	│   └── maven-metadata-local.xml
	├── c
	│   ├── 1.0-SNAPSHOT
	│   │   ├── _maven.repositories
	│   │   ├── c-1.0-SNAPSHOT.jar
	│   │   ├── c-1.0-SNAPSHOT.pom
	│   │   └── maven-metadata-local.xml
	│   └── maven-metadata-local.xml
	└── parent
	    ├── 1.0-SNAPSHOT
	    │   ├── _maven.repositories
	    │   ├── maven-metadata-local.xml
	    │   └── parent-1.0-SNAPSHOT.pom
	    └── maven-metadata-local.xml

	8 directories, 19 files
	
	
You might release snapshots sometimes since this means that other teams can work with in progress changes:

	$ mvn deploy
	...
	$ tree /tmp/test-snapshots/com/tw/maven_demo/component1/
	/tmp/test-snapshots/com/tw/maven_demo/component1/
	├── a
	│   ├── 1.0-SNAPSHOT
	│   │   ├── a-1.0-20110512.232702-1.jar
	│   │   ├── a-1.0-20110512.232702-1.jar.md5
	│   │   ├── a-1.0-20110512.232702-1.jar.sha1
	│   │   ├── a-1.0-20110512.232702-1.pom
	│   │   ├── a-1.0-20110512.232702-1.pom.md5
	│   │   ├── a-1.0-20110512.232702-1.pom.sha1
	│   │   ├── maven-metadata.xml
	│   │   ├── maven-metadata.xml.md5
	│   │   └── maven-metadata.xml.sha1
	│   ├── maven-metadata.xml
	│   ├── maven-metadata.xml.md5
	│   └── maven-metadata.xml.sha1
	├── b
	│   ├── 1.0-SNAPSHOT
	│   │   ├── b-1.0-20110512.232703-1.jar
	│   │   ├── b-1.0-20110512.232703-1.jar.md5
	│   │   ├── b-1.0-20110512.232703-1.jar.sha1
	│   │   ├── b-1.0-20110512.232703-1.pom
	│   │   ├── b-1.0-20110512.232703-1.pom.md5
	│   │   ├── b-1.0-20110512.232703-1.pom.sha1
	│   │   ├── maven-metadata.xml
	│   │   ├── maven-metadata.xml.md5
	│   │   └── maven-metadata.xml.sha1
	│   ├── maven-metadata.xml
	│   ├── maven-metadata.xml.md5
	│   └── maven-metadata.xml.sha1
	├── c
	│   ├── 1.0-SNAPSHOT
	│   │   ├── c-1.0-20110512.232704-1.jar
	│   │   ├── c-1.0-20110512.232704-1.jar.md5
	│   │   ├── c-1.0-20110512.232704-1.jar.sha1
	│   │   ├── c-1.0-20110512.232704-1.pom
	│   │   ├── c-1.0-20110512.232704-1.pom.md5
	│   │   ├── c-1.0-20110512.232704-1.pom.sha1
	│   │   ├── maven-metadata.xml
	│   │   ├── maven-metadata.xml.md5
	│   │   └── maven-metadata.xml.sha1
	│   ├── maven-metadata.xml
	│   ├── maven-metadata.xml.md5
	│   └── maven-metadata.xml.sha1
	└── parent
	    ├── 1.0-SNAPSHOT
	    │   ├── maven-metadata.xml
	    │   ├── maven-metadata.xml.md5
	    │   ├── maven-metadata.xml.sha1
	    │   ├── parent-1.0-20110512.232701-1.pom
	    │   ├── parent-1.0-20110512.232701-1.pom.md5
	    │   └── parent-1.0-20110512.232701-1.pom.sha1
	    ├── maven-metadata.xml
	    ├── maven-metadata.xml.md5
	    └── maven-metadata.xml.sha1

	8 directories, 45 files

Doing a release
---------------

We do a release of Component1. This means removing the SNAPSHOT marker from all the poms:

	diff --git a/base/Component1/A/pom.xml b/base/Component1/A/pom.xml
	index da0edff..eb225ae 100644
	--- a/base/Component1/A/pom.xml
	+++ b/base/Component1/A/pom.xml
	@@ -5,13 +5,13 @@
	   <parent>
	     <groupId>com.tw.maven_demo.component1</groupId>
	     <artifactId>parent</artifactId>
	-    <version>1.0-SNAPSHOT</version>
	+    <version>1.0</version>
	 	<relativePath>../pom.xml</relativePath>
	   </parent>
 
	   <groupId>com.tw.maven_demo.component1</groupId>
	   <artifactId>a</artifactId>
	-  <version>1.0-SNAPSHOT</version>
	+  <version>1.0</version>
	   <packaging>jar</packaging>
 
	   <name>A</name>
	diff --git a/base/Component1/B/pom.xml b/base/Component1/B/pom.xml
	index 24d6182..db3f12c 100644
	--- a/base/Component1/B/pom.xml
	+++ b/base/Component1/B/pom.xml
	@@ -5,13 +5,13 @@
	   <parent>
	     <groupId>com.tw.maven_demo.component1</groupId>
	     <artifactId>parent</artifactId>
	-    <version>1.0-SNAPSHOT</version>
	+    <version>1.0</version>
	 	<relativePath>../pom.xml</relativePath>
	   </parent>
 
	   <groupId>com.tw.maven_demo.component1</groupId>
	   <artifactId>b</artifactId>
	-  <version>1.0-SNAPSHOT</version>
	+  <version>1.0</version>
	   <packaging>jar</packaging>
	   <name>B</name>
 
	diff --git a/base/Component1/C/pom.xml b/base/Component1/C/pom.xml
	index fb9440c..4df10d2 100644
	--- a/base/Component1/C/pom.xml
	+++ b/base/Component1/C/pom.xml
	@@ -6,13 +6,13 @@
	   <parent>
	     <groupId>com.tw.maven_demo.component1</groupId>
	     <artifactId>parent</artifactId>
	-    <version>1.0-SNAPSHOT</version>
	+    <version>1.0</version>
	 	<relativePath>../pom.xml</relativePath>
	   </parent>
 
	   <groupId>com.tw.maven_demo.component1</groupId>
	   <artifactId>c</artifactId>
	-  <version>1.0-SNAPSHOT</version>
	+  <version>1.0</version>
	   <name>C</name>
 
	   <properties>
	@@ -24,12 +24,12 @@
	 	  <dependency>
	 	    <groupId>com.tw.maven_demo.component1</groupId>
	 	    <artifactId>a</artifactId>
	-	    <version>${project.version}</version>
	+	    <version>1.0</version>
	 	  </dependency>
	 	  <dependency>
	 	    <groupId>com.tw.maven_demo.component1</groupId>
	 	    <artifactId>b</artifactId>
	-	    <version>${project.version}</version>
	+	    <version>1.0</version>
	 	  </dependency>
 
	     <dependency>
	diff --git a/base/Component1/pom.xml b/base/Component1/pom.xml
	index 74b2fc8..664f056 100644
	--- a/base/Component1/pom.xml
	+++ b/base/Component1/pom.xml
	@@ -9,7 +9,7 @@
	 	</parent>
	 	<groupId>com.tw.maven_demo.component1</groupId>
	 	<artifactId>parent</artifactId>
	-	<version>1.0-SNAPSHOT</version>
	+	<version>1.0</version>
	 	<name>Component1</name>
	 	<packaging>pom</packaging>
	 	<modules>
	diff --git a/docs/hand_coded_versions.md b/docs/hand_coded_versions.md
	index 820535f..b37fd47 100644
	--- a/docs/hand_coded_versions.md
	+++ b/docs/hand_coded_versions.md
	@@ -102,3 +102,9 @@ You might release snapshots sometimes since this means that other teams can work
 
	 	8 directories, 45 files

Now we check this in, and also release to the maven repository. We might use a checkin comment tag to mark this.

	$ cd Component1
	$ mvn install
	...
	$ git commit -m "Release version 1.0 #deploy"
	...
	$ mvn deploy

Which deploys the following

	/tmp/test-releases/com/tw/maven_demo/component1/
	├── a
	│   ├── 1.0
	│   │   ├── a-1.0.jar
	│   │   ├── a-1.0.jar.md5
	│   │   ├── a-1.0.jar.sha1
	│   │   ├── a-1.0.pom
	│   │   ├── a-1.0.pom.md5
	│   │   └── a-1.0.pom.sha1
	│   ├── maven-metadata.xml
	│   ├── maven-metadata.xml.md5
	│   └── maven-metadata.xml.sha1
	├── b
	│   ├── 1.0
	│   │   ├── b-1.0.jar
	│   │   ├── b-1.0.jar.md5
	│   │   ├── b-1.0.jar.sha1
	│   │   ├── b-1.0.pom
	│   │   ├── b-1.0.pom.md5
	│   │   └── b-1.0.pom.sha1
	│   ├── maven-metadata.xml
	│   ├── maven-metadata.xml.md5
	│   └── maven-metadata.xml.sha1
	├── c
	│   ├── 1.0
	│   │   ├── c-1.0.jar
	│   │   ├── c-1.0.jar.md5
	│   │   ├── c-1.0.jar.sha1
	│   │   ├── c-1.0.pom
	│   │   ├── c-1.0.pom.md5
	│   │   └── c-1.0.pom.sha1
	│   ├── maven-metadata.xml
	│   ├── maven-metadata.xml.md5
	│   └── maven-metadata.xml.sha1
	└── parent
	    ├── 1.0
	    │   ├── parent-1.0.pom
	    │   ├── parent-1.0.pom.md5
	    │   └── parent-1.0.pom.sha1
	    ├── maven-metadata.xml
	    ├── maven-metadata.xml.md5
	    └── maven-metadata.xml.sha1

	8 directories, 33 files

Now let's look at Component2. Lots of build dependency problems caused by a mismatched version number. Finally I get that working which means that we are ready to bump the version of the dependencies from Component1.

The root cause was that the global pom was not properly set up. Releasing this fixed the problem.

