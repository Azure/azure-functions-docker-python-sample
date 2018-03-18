import logging

import azure.functions as azf


def main(req: azf.HttpRequest) -> azf.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        return azf.HttpResponse(f"Hello {name}!")
    else:
        return azf.HttpResponse(
             "Please pass a name on the query string or in the request body",
             status_code=400
        )
