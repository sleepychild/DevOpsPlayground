#!/usr/bin/env python3

import os
from shutil import rmtree

def clear_builds(path):
    delete_list = ['scm-polling.log', 'nextBuildNumber', 'builds']
    elements = os.scandir(path)
    for element in elements:
        print(f'checking {element.name} {element.path}')
        if element.name in delete_list:
            print(f'delete: {element.path}')
            if element.is_dir():
                rmtree(element.path)
            else:
                os.unlink(element.path)
        elif element.is_dir():
            clear_builds(element.path)

clear_builds(os.path.join(*'sync/var/lib/jenkins/jobs'.split('/')))