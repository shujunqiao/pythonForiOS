#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os

_pwd = os.popen('pwd').read()
print "pwd:", _pwd

_ls = os.popen('ls').read()
print "_ls:", _ls

