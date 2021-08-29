# HOMEWORK M2

I have no idea what the homework was so I just played around with vagrant docker and node. From the vagrant documentation [this](https://www.vagrantup.com/docs/provisioning/docker) is how to run docker with the build in provisioner.

The vagrant file and conteiners are in the archive. I made a video but it's 100s of MB so here are pictures.

```bash
vagrant up
```

![alt text][img1]

The right pannel will show the responce from the guest port 80 forwarded to host port 8080.

```bash
watch -n -d "curl http://localhost:8080/"
```

![alt text][img2]

![alt text][img3]

Top panel shows the containers running. The two node apps are load balanced behind nginx so the ``` <p>This is container: ${os.hostname()}.</p> ``` line alternates between their CONTAINER ID's. 

![alt text][img4]

Moar images available in the img folder.

[img1]: img/vlcsnap-2021-05-16-18h05m47s243.png "vagrant up in bottom panel"
[img2]: img/vlcsnap-2021-05-16-18h17m11s185.png "Watching response from nginx in right pannel"
[img3]: img/vlcsnap-2021-05-16-18h19m26s978.png "The nginx container is up but the app conteiners are not so we get 502"
[img4]: img/vlcsnap-2021-05-16-18h37m57s982.png "All containers are up and the application is accessible"