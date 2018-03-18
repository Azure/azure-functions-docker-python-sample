import datetime
import logging
import azure.functions as func

def main(timer: func.TimerRequest):
    
    stamp = datetime.datetime.now().timestamp()

    if(timer.past_due):
        logging.info('Python function is running late!')

    logging.info(f'Python timer trigger function ran! {stamp}')