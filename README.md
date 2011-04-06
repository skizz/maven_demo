
Installing Snapshots
--------------------

> Maven versions can contain a string literal to signify that a project is 
> currently under active development. If a version contains the string “SNAPSHOT,” 
> then Maven will expand this token to a date and time value converted to UTC 
> (Coordinated Universal Time) when you install or release this component. For 
> example, if your project has a version of “1.0-SNAPSHOT” and you deploy this
> project’s artifacts to a Maven repository, Maven would expand this version to
> “1.0-20080207-230803-1” if you were to deploy a release at 11:08 PM on February
> 7th, 2008 UTC. In other words, when you deploy a snapshot, you are not making
> a release of a software component; you are releasing a snapshot of a component
> at a specific time.

> -- Maven: The Complete Reference -- version 0.7 -- 3.3.1.2. SNAPSHOT Versions
	
This does not work for installs.

	$ mvn install
	
	... lots of maven output
	
	$ tree ~/.m2/repository/com/tw/A/
	/Users/skizz/.m2/repository/com/tw/A/
	├── 1.0-SNAPSHOT
	│   ├── A-1.0-SNAPSHOT.jar
	│   ├── A-1.0-SNAPSHOT.pom
	│   ├── _maven.repositories
	│   └── maven-metadata-local.xml
	└── maven-metadata-local.xml

	1 directory, 5 files

However deployment *does* replace the SNAPSHOTs with timestamps. And you can deploy to a local repo using a file URL.

	<distributionManagement>
	  <repository>
	    <id>internal.repo</id>
	    <name>Testing Repository</name>
	    <url>file://${project.build.directory}/test-repo</url>
	  </repository>
	</distributionManagement>

Running 'mvn deploy' does the following:

	$ tree .../test-repo/
	.../test-repo/
	└── com
	    └── tw
	        └── C
	            ├── 1.0-SNAPSHOT
	            │   ├── C-1.0-20110406.051549-1.jar
	            │   ├── C-1.0-20110406.051549-1.jar.md5
	            │   ├── C-1.0-20110406.051549-1.jar.sha1
	            │   ├── C-1.0-20110406.051549-1.pom
	            │   ├── C-1.0-20110406.051549-1.pom.md5
	            │   ├── C-1.0-20110406.051549-1.pom.sha1
	            │   ├── maven-metadata.xml
	            │   ├── maven-metadata.xml.md5
	            │   └── maven-metadata.xml.sha1
	            ├── maven-metadata.xml
	            ├── maven-metadata.xml.md5
	            └── maven-metadata.xml.sha1


Snapshots and Releases
----------------------

We could specify local repositories that would allow SNAPSHOTS, and define remote repositories (e.g. Nexus) that do not as follows:

	<distributionManagement>
		<snapshotRepository>
			<id>snapshot.repo</id>
			<name>Test snapshot repository</name>
			<url>file://${project.build.directory}/test-snapshots</url>
		</snapshotRepository>
		<repository>
			<id>release.repo</id>
			<name>Test Release Repository</name>
			<url>file://${project.build.directory}/test-releases</url>
		</repository>
	</distributionManagement>

If there are any snapshot releases they are deployed into the snapshot repo:

	/tmp/test-snapshots/
	└── com
	    └── tw
	        ├── A
	        │   ├── 1.1-SNAPSHOT
	        │   │   ├── A-1.1-20110406.055723-1.jar
	        │   │   ├── A-1.1-20110406.055723-1.jar.md5
	        │   │   ├── A-1.1-20110406.055723-1.jar.sha1
	        │   │   ├── A-1.1-20110406.055723-1.pom
	        │   │   ├── A-1.1-20110406.055723-1.pom.md5
	        │   │   ├── A-1.1-20110406.055723-1.pom.sha1
	        │   │   ├── maven-metadata.xml
	        │   │   ├── maven-metadata.xml.md5
	        │   │   └── maven-metadata.xml.sha1
	        │   ├── maven-metadata.xml
	        │   ├── maven-metadata.xml.md5
	        │   └── maven-metadata.xml.sha1
	        ├── B
	        │   ├── 1.1-SNAPSHOT
	        │   │   ├── B-1.1-20110406.055724-1.jar
	        │   │   ├── B-1.1-20110406.055724-1.jar.md5
	        │   │   ├── B-1.1-20110406.055724-1.jar.sha1
	        │   │   ├── B-1.1-20110406.055724-1.pom
	        │   │   ├── B-1.1-20110406.055724-1.pom.md5
	        │   │   ├── B-1.1-20110406.055724-1.pom.sha1
	        │   │   ├── maven-metadata.xml
	        │   │   ├── maven-metadata.xml.md5
	        │   │   └── maven-metadata.xml.sha1
	        │   ├── maven-metadata.xml
	        │   ├── maven-metadata.xml.md5
	        │   └── maven-metadata.xml.sha1
	        ├── C
	        │   ├── 1.1-SNAPSHOT
	        │   │   ├── C-1.1-20110406.055725-1.jar
	        │   │   ├── C-1.1-20110406.055725-1.jar.md5
	        │   │   ├── C-1.1-20110406.055725-1.jar.sha1
	        │   │   ├── C-1.1-20110406.055725-1.pom
	        │   │   ├── C-1.1-20110406.055725-1.pom.md5
	        │   │   ├── C-1.1-20110406.055725-1.pom.sha1
	        │   │   ├── maven-metadata.xml
	        │   │   ├── maven-metadata.xml.md5
	        │   │   └── maven-metadata.xml.sha1
	        │   ├── maven-metadata.xml
	        │   ├── maven-metadata.xml.md5
	        │   └── maven-metadata.xml.sha1
	        └── parent
	            ├── 1.1-SNAPSHOT
	            │   ├── maven-metadata.xml
	            │   ├── maven-metadata.xml.md5
	            │   ├── maven-metadata.xml.sha1
	            │   ├── parent-1.1-20110406.055721-1.pom
	            │   ├── parent-1.1-20110406.055721-1.pom.md5
	            │   └── parent-1.1-20110406.055721-1.pom.sha1
	            ├── maven-metadata.xml
	            ├── maven-metadata.xml.md5
	            └── maven-metadata.xml.sha1

Only non-snapshot releases are deployed into the release repo:

	/tmp/test-releases/
	└── com
	    └── tw
	        ├── A
	        │   ├── 1.0
	        │   │   ├── A-1.0.jar
	        │   │   ├── A-1.0.jar.md5
	        │   │   ├── A-1.0.jar.sha1
	        │   │   ├── A-1.0.pom
	        │   │   ├── A-1.0.pom.md5
	        │   │   └── A-1.0.pom.sha1
	        │   ├── maven-metadata.xml
	        │   ├── maven-metadata.xml.md5
	        │   └── maven-metadata.xml.sha1
	        ├── B
	        │   ├── 1.0
	        │   │   ├── B-1.0.jar
	        │   │   ├── B-1.0.jar.md5
	        │   │   ├── B-1.0.jar.sha1
	        │   │   ├── B-1.0.pom
	        │   │   ├── B-1.0.pom.md5
	        │   │   └── B-1.0.pom.sha1
	        │   ├── maven-metadata.xml
	        │   ├── maven-metadata.xml.md5
	        │   └── maven-metadata.xml.sha1
	        ├── C
	        │   ├── 1.0
	        │   │   ├── C-1.0.jar
	        │   │   ├── C-1.0.jar.md5
	        │   │   ├── C-1.0.jar.sha1
	        │   │   ├── C-1.0.pom
	        │   │   ├── C-1.0.pom.md5
	        │   │   └── C-1.0.pom.sha1
	        │   ├── maven-metadata.xml
	        │   ├── maven-metadata.xml.md5
	        │   └── maven-metadata.xml.sha1
	        └── parent
	            ├── 1.0.0
	            │   ├── parent-1.0.0.pom
	            │   ├── parent-1.0.0.pom.md5
	            │   └── parent-1.0.0.pom.sha1
	            ├── maven-metadata.xml
	            ├── maven-metadata.xml.md5
	            └── maven-metadata.xml.sha1

