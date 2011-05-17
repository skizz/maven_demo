Proposal
--------

This covers some of the best practices that we have discussed.

1. All artifacts in a component have the same version number.
2. Parent versions are referenced by hard-coded versions
3. Only the parent pom of a component needs the version to be defined
4. Dependencies in the same component have the version defined as ${project.version}
5. For projects that refer to dependencies in another component, the dependency is specified to be ${<dependency-groupID>.version}, e.g. ${net.skype.cirrus.b.version}, and defined in a parent in that component

**Issue**: Even if the parent version has been corrected, if one of the child POMs defines an older version maven will use that and not the parent pom without warning. This leads to issues in dependent builds. Maven Enforcer plugin does NOT enforce this.

Version Numbering
-----------------
	
Developers use the build part of the component for their local work. Build bumps the build part of the component. So integration builds and the corresponding versions in git that the dev would use:

* 1.1.0 - 1.1.0-1
* 1.2.0 - 1.2.0-1
* 1.3.0 - 1.3.0-1
* major bump
* 2.1.0 - 2.1.0-1
* 1.3 hotfix:
* 1.3.1 - 1.3.1-1

<img src="proposal_viz/dependencies.svg" style="width:100%;"/>

If the last integration build of the dependency component resulted in a component version 1.2.3, the dependency version in git repository is [1.2.3,1.2.4)

* We suggest that instead if the component version is 1.2.X the dependency version is defined as [1.2.0,1.3.0). This means that developers will always pick up the latest version from git. While this will simplify the automated build process which will bump the maintenance version number.
