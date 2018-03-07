import azure.functions

def main(req: azure.functions.HttpRequest) -> str:
    user = req.params.get('user', 'User')
    return f'Hello, {user}!'