# Util
import platform

# Database
import pymysql.cursors
try:
    connection = pymysql.connect(host='mariadb',
                                user='root',
                                password='Pa55W0rd',
                                database='somedatabase',
                                charset='utf8mb4',
                                cursorclass=pymysql.cursors.DictCursor)
    cursor = connection.cursor()
except Exception as e:
    print(e)

# Web
from twisted.web.server import Site
from twisted.web.resource import Resource
from twisted.internet import reactor, endpoints

class index(Resource):
    isLeaf = True
    def render_GET(self, request):
        response_data = b'Welcome from ' + platform.node().encode()
        return response_data

root = Resource()
root.putChild(b'', index())
factory = Site(root)
endpoint = endpoints.TCP4ServerEndpoint(reactor, 3000)
endpoint.listen(factory)
reactor.run()