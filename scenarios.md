Working with properties with versions.

Each particular artifact has a version number "component version"

	mvn -Dparent:version=9.9.9 \
		-DA:A:version=1.0.1 \
		-DA:A:version_range="[1.0.1,1.0.2)" \
		clean install

Problem with Eclipse? How do we do it there?

