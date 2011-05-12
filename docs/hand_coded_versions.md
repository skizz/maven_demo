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

