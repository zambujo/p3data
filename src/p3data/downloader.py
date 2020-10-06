import os

import click
import requests

from . import __version__


@click.command()
@click.version_option(version=__version__)
@click.argument('filename')
def main(filename):
    """Download datasets from p3.snf.ch"""

    raw_data_folder = 'rawdata'
    if not os.path.exists(raw_data_folder):
        os.makedirs(raw_data_folder)

    url_grant = "http://p3.snf.ch/P3Export/" + filename
    response = requests.get(url_grant)

    assert response.status_code == 200,\
        "status code for" + filename + " not ok"

    click.secho('Saving ' + url_grant + ' in ' +
                raw_data_folder + ' .....', fg="green")

    with open(os.path.join(raw_data_folder, filename), mode="wb") as file:
        file.write(response.content)

    click.secho('Done.', fg="green", bold=True)
