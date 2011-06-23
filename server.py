import logging
import sys
import json

from vendor.bottle import bottle
from vendor.bottle.bottle import request
from vendor.bottle.bottle import route

bottle.debug(True)
log = logging.getLogger('servlet')
log.setLevel(logging.DEBUG)

# Example route:
#@route('/play')
#def play():
#    encoded_path = request.GET.get('path', '')
#    path = urllib.pathname2url(encoded_path)
#    if not os.path.exists(path): # False on empty string
#        return dict(success=False, reason="Path %s does not exist" % path)
#    return dict(success=True)


port = sys.argv[1] if len(sys.argv) > 1 else 8080
bottle.run(host='0.0.0.0', port=port)
