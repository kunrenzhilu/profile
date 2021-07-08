# mapreduce with virtualenv

Prerequisite: virtualenv. The ```conda create``` command doesn't contains ```relocatable``` option, so it won't work. 

Better the virtual env is created inside a well maintained docker. I have to tried on three difference servers to create a workable one.

## steps
1. ```virtualenv -p python3.* --always-copy venv```. Note that by default we don't include ```--system-site-packages```, generally after this command we create a clean virtual env with only pip, setuptools. 
2. ```source venv/bin/activate```, and then check ```which python``` and ```which pip```
3. ```optional: pip install --upgrade pip```
4. ```pip install -r requirements.txt```
5. ```deactivate``` and then ```virtualenv --relocatable venv```. Not that this relocatable command only works for virtual envs that are created by ```virtualenv```, won't work for ```python -m env ..```, otherwise the ```activate_this.py``` won't be created. Also this relocatable command **must** be run after installing packages, as required by the virtualenv doc.
6. ```cd venv && zip -r venv.zip *```. It's important to ```cd``` inside, otherwise the unzipped structure would become ```venv/bin ...```. With ```cd```, we would have a structure ```bin/, lib/, include/```. This is important since the ```--archives hdfd:///[host]/dir/venz.zip#venv``` option from hadoop would unzip the whole thing into a folder, making the final unzipped structure ```venv/bin ...```. Otherwise, it would be ```venv/venv/bin ...```.
7. Finally, at the mapper or reducer setting, use ```--mapper "venv/bin/python script.py"``` to use the python env. 
8. Reference:
https://henning.kropponline.de/2014/07/18/virtualenv-hadoop-streaming/
https://help.sap.com/viewer/50f26aa0f2044127bc5f6d5ad3d090fe/Cloud/en-US/2e689b4f76b8101480abd76da746ffe7.html
