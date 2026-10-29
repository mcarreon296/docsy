Monitoring and Operations
=========================

Overview
--------

The Docsy environment includes tools for monitoring
container health, application logs, and resource usage.

Dozzle
------

Dozzle provides a web interface for viewing Docker
container logs in real time.

Administrators can inspect application output and
troubleshoot container problems.

cAdvisor
--------

cAdvisor provides metrics about container resource usage.

Available metrics include:

* CPU utilization.
* Memory consumption.
* Network activity.
* Filesystem usage.

Docker Health Checks
--------------------

Docker Compose health checks determine whether services
are functioning correctly.

The builder health check verifies that the documentation
homepage exists.

The Nginx health check confirms that the web server
responds to HTTP requests.

The web server starts only after the builder becomes
healthy.
