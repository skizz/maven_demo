Proposal
--------

This covers some of the best practices that we have discussed.

1. All artifacts in a component have the same version number.
2. Parent versions are referenced by hard-coded versions
3. Only the parent pom of a component needs the version to be defined
4. Dependencies in the same component have the version defined as ${project.version}

Updated this to match.

Issue: Even if the parent version has been corrected, if one of the child POMs defines an older version, it is that one that is used and not the parent pom without warning. This leads to issues in dependent builds. Maven Enforcer plugin does NOT enforce this.

	[INFO] Reactor Build Order:
	[INFO] 
	[INFO] Component1
	[INFO] A
	[INFO] B
	[INFO] C
	[INFO] Component 2
	[INFO] D
	[INFO] E
	[INFO] F
	[INFO] G
	[INFO] Aggregator
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building Component1 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ parent ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    none
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building A 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ a ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    junit:junit:jar:4.8.2:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building B 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ b ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    junit:junit:jar:4.8.2:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building C 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ c ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    com.tw.maven_demo.component1:a:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component1:b:jar:1.0.1:compile
	[INFO]    junit:junit:jar:4.8.2:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building Component 2 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ parent ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    none
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building D 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ d ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    junit:junit:jar:3.8.1:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building E 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ e ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    junit:junit:jar:3.8.1:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building F 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ f ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    com.tw.maven_demo.component1:a:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component1:b:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component2:d:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component2:e:jar:1.0.1:compile
	[INFO]    junit:junit:jar:4.8.2:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building G 1.0.1
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ g ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    com.tw.maven_demo.component1:a:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component1:b:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component2:d:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component2:e:jar:1.0.1:compile
	[INFO]    com.tw.maven_demo.component2:f:jar:1.0.1:compile
	[INFO]    junit:junit:jar:4.8.2:test
	[INFO] 
	[INFO]                                                                         
	[INFO] ------------------------------------------------------------------------
	[INFO] Building Aggregator 1.0
	[INFO] ------------------------------------------------------------------------
	[INFO] 
	[INFO] --- maven-dependency-plugin:2.1:list (default-cli) @ aggregator ---
	[INFO] 
	[INFO] The following files have been resolved:
	[INFO]    none
	[INFO] 

Version Numbering
-----------------
	
Developers use the build part of the component for their local work. Build bumps the build part of the component.

so integration builds and the corresponding versions in git that the dev would use:
1.1.0 - 1.1.0-1
1.2.0 - 1.2.0-1
1.3.0 - 1.3.0-1
major bump
2.1.0 - 2.1.0-1
1.3 hotfix:
1.3.1 - 1.3.1-1