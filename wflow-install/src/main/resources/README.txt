README
======
For an introduction to Joget DX, please refer to https://community.joget.org

UPGRADING
=========
For details on upgrading from previous releases, please refer to https://www.joget.org/updates/upgrade


Prerequisites:
==============
- Java 8 and above
- MySQL 5.6 and above


Installation for Linux:
=======================
1. Create a new directory (e.g. /opt/joget) and extract the tar.gz bundle into that directory
2. Install the Java Runtime Environment (JRE) or Java Development Kit (JDK) version 8 and above
3. Install MySQL Server version 5.6 and above
4. Create an empty database 'jwdb' in the MySQL server
5. Execute the setup script to create the required database tables: ./setup.sh
6. Execute the bundled Apache Tomcat application server: ./tomcat.sh run
7. Access the App Center at http://localhost:8080/jw


Installation for Windows:
=========================
1. Create a new folder e.g. C:\Joget and extract the ZIP bundle
2. Install the Java Runtime Environment (JRE) or Java Development Kit (JDK) version 8 and above
3. Install MySQL Server version 5.6 and above
4. Create an empty database 'jwdb' in the MySQL server
5. Populate the jwdb database with the SQL script in data\jwdb-empty.sql
6. Edit wflow\app_datasource-default.properties to match your database settings
7. Edit tomcat-run.bat and change JAVA_HOME to your Java installation directory
8. Run tomcat-run.bat to start the bundled Apache Tomcat application server
9. Access the App Center at http://localhost:8080/jw
