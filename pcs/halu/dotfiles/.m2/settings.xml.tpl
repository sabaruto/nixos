<?xml version="1.0" encoding="UTF-8"?>
<settings xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.2.0 http://maven.apache.org/xsd/settings-1.2.0.xsd" xmlns="http://maven.apache.org/SETTINGS/1.2.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <servers>
        <server>
            <username>t.aaronobelley@saltpay.co</username>
            <password>{{ op://Dev/jfrog/credential }}</password>
            <id>central</id>
        </server>
        <server>
            <username>t.aaronobelley@saltpay.co</username>
            <password>{{ op://Dev/jfrog/credential }}</password>
            <id>snapshots</id>
        </server>
    </servers>
	<mirrors>
    <mirror>
      <mirrorOf>*</mirrorOf>
      <name>main-maven-virtual</name>
      <url>https://saltpay.jfrog.io/artifactory/main-maven-virtual</url>
      <id>main</id>
    </mirror>
	</mirrors>
    <profiles>
        <profile>
            <repositories>
                <repository>
                    <snapshots>
                        <enabled>false</enabled>
                    </snapshots>
                    <id>central</id>
                    <name>main-maven-virtual</name>
                    <url>https://saltpay.jfrog.io/artifactory/main-maven-virtual</url>
                </repository>
                <repository>
                    <snapshots />
                    <id>snapshots</id>
                    <name>main-maven-virtual</name>
                    <url>https://saltpay.jfrog.io/artifactory/main-maven-virtual</url>
                </repository>
            </repositories>
            <pluginRepositories>
                <pluginRepository>
                    <snapshots>
                        <enabled>false</enabled>
                    </snapshots>
                    <id>central</id>
                    <name>main-maven-virtual</name>
                    <url>https://saltpay.jfrog.io/artifactory/main-maven-virtual</url>
                </pluginRepository>
                <pluginRepository>
                    <snapshots />
                    <id>snapshots</id>
                    <name>main-maven-virtual</name>
                    <url>https://saltpay.jfrog.io/artifactory/main-maven-virtual</url>
                </pluginRepository>
            </pluginRepositories>
            <id>artifactory</id>
        </profile>
    </profiles>
    <activeProfiles>
        <activeProfile>artifactory</activeProfile>
    </activeProfiles>
</settings>
