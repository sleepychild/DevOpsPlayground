# addrepo.elasticsearch:
#   pkgrepo.managed:
#     - humanname: ElasticSearch
#     - name: deb https://artifacts.elastic.co/packages/7.x/apt stable main
#     - dist: stable
#     - file: /etc/apt/sources.list.d/elasticsearch.list
#     - keyid: D88E42B4
#     - keyserver: pgp.mit.edu
#     - retry:
#         attempts: 10
#         until: True
#         interval: 60
#         splay: 10

addrepo.elasticsearch:
  cmd.script:
    - name: "Add Elastic Repo"
    - source: "/sync/scripts/elastic_repo.sh"
    - creates: 
      - /etc/apt/sources.list.d/elastic-7.x.list
    - retry:
        attempts: 10
        until: True
        interval: 60
        splay: 10
