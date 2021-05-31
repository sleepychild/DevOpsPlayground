# Util
import platform

# Database
import mariadb
import sys

try:
    conn = mariadb.connect(
        user="someuser",
        password="somepassword",
        host="mariadb",
        port=3306,
        database="somedatabase"
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

cur = conn.cursor()

# Web
from twisted.web.server import Site
from twisted.web.resource import Resource
from twisted.internet import reactor, endpoints

class index(Resource):
    isLeaf = True
    def render_GET(self, request):
        response_data = f'<p>Welcome from {platform.node()}</p>'
        cur.execute("SELECT somedata FROM sometable;")
        result = cur.fetchall()
        for res in result:
            response_data += f'<p>{res[0]}</p>' 
        return response_data.encode()

root = Resource()
root.putChild(b'', index())
factory = Site(root)
endpoint = endpoints.TCP4ServerEndpoint(reactor, 3000)
endpoint.listen(factory)
reactor.run()