# OBP Readthedocs

[Open Book Publishers](https://www.openbookpublishers.com/)' docker implementation of [Readthedocs](http://readthedocs.org/).

## Installation

Create a `local_settings.py` file from `local_settings.example.py` and customise the constants.

Run `docker-compose up -d` and configure your domain to point to the container acting as the proxy (on port 80).
