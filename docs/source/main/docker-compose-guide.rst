Docker Compose Deployment
=========================

Overview
--------

Docker Compose allows multiple related containers to be
defined and managed from a single configuration file.

The Docsy environment separates documentation generation
from web serving.

Architecture
------------

The builder container uses Python and Sphinx to generate
HTML documentation.

The generated documentation is written to a shared Docker
volume named site.

The Nginx container reads that volume and serves the HTML
documentation over HTTP.

Benefits
--------

This architecture provides:

* Separation of build and runtime responsibilities.
* Persistent documentation output.
* Reproducible deployment.
* Independent development and observability services.
* Simplified container lifecycle management.

Live Reload Verification
------------------------

This section was added while the development server
was running. Sphinx should rebuild the documentation
automatically.
