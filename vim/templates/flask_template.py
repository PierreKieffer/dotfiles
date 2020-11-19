#!/usr/bin/env python3
import flask 
from flask import Flask, request
import json 
import os

os.environ["FLASK_APP"]="app"
os.environ["FLASK_ENV"]="dev"

app = Flask(__name__)

def check_auth(auth_header, token): 
    '''
    Check Authorizarion 
    '''
    if (auth_header == "Bearer {}".format(token)): 
        return True
    else :
        return False

@app.route("/get", methods=["GET"])
def get_handler(): 
    '''
    Method to handle GET request on /get
    '''
    check_token = check_auth(request.headers.get("Authorization"), "secret")

    if check_token : 

        '''
        Get url params
        '''
        url_param = request.args.get("param", None)

        '''
        Build response
        '''
        response_payload = json.dumps({})
        response = flask.Response(response_payload, status=200)
        response.headers["Content-Type"] = "application/json"
        return response

    else : 
        response = flask.Response(status=401)
        return response

@app.route("/post", methods=["POST"])
def post_handler(): 
    '''
    Method to handle POST requests on /post
    '''
    check_token = check_auth(request.headers.get("Authorization"), "secret")

    if check_token : 

        '''
        Extract request body
        '''
        post_payload = request.get_json()

        '''
        Build response
        '''
        response_payload = json.dumps({})
        response = flask.Response(response_payload, status=200)
        response.headers["Content-Type"] = "application/json"
        return response

    else : 
        response = flask.Response(status=401)
        return response

if __name__=="__main__":
    app.run(host="0.0.0.0", port=8080, threaded=True)

