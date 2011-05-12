From the command line
---------------------

Each particular artifact has a version number "component version"

	mvn -Dgrandparent:version=9.9.9 \
		-DComponent1:A:version=1.0.1 \
		-DComponent1:A:version_range="[1.0.1,1.0.2)" \
		clean install

Problem with Eclipse? How do we do it there?

Using a local settings file
---------------------------

Use a local settings file that specifies the correct versions to use. Then specify this on the command line:

	mvn -s local-settings.xml clean install
	
with settings.xml:

	<?xml version="1.0"?>
	<settings>
		<profiles>
			<profile>
				<id>test</id>
				<activation>
					<activeByDefault>true</activeByDefault>
				</activation>
				<properties>
					<grandparent.version>9.9.9</grandparent.version>
					<Component1.A.version>1.9.1</Component1.A.version>
					<Component1.A.version_range>[1.9.1,1.9.2)</Component1.A.version_range>
				</properties>
			</profile>
		</profiles>
	</settings>

gives:

	[INFO] --- maven-dependency-plugin:2.1:tree (default-cli) @ F ---
	[INFO] com.tw:F:jar:1.0-SNAPSHOT
	[INFO] +- Component1:A:jar:1.9.1:compile
	[INFO] +- com.tw:B:jar:1.0-SNAPSHOT:compile
	[INFO] +- com.tw.component2:D:jar:1.0-SNAPSHOT:compile
	[INFO] +- com.tw.component2:E:jar:1.0-SNAPSHOT:compile
	[INFO] \- junit:junit:jar:4.8.2:test


Problems
--------

Transitive dependencies? 
Parents of parents? (see photo)
Only propagates properties one step

Release on Steroids only works if the magic is added to every POM. This is because the variable substitution happens too early and the local paths get added to the POM. That means that child POMS do not then get the correct local paths.
