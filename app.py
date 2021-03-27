#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @author : microfat
# @time   : 03/27/21 15:03:17
# @File   : app.py

'''
'''

from flask import Flask

app = Flask(__name__)

HTTP_METHODS = ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH']

@app.route('/<path:name>', methods=HTTP_METHODS)
def gen(name):
    return 'ok'