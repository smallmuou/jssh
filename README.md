# jssh

jssh(javascript shell) is a command which can run javascript in shell. This is very usefull sometimes. Like you are newer to javascript, you can directly run javascript sample in shell.

### Depend
This tool depend on java. So you need install java first.

### Install
1. Online 
<pre>
curl https://raw.githubusercontent.com/smallmuou/jssh/master/online-install.sh|sudo /bin/sh
</pre>

2. Manual
<pre>
git clone https://github.com/smallmuou/jssh
cd jssh
chmod 777 setup.sh
sudo ./setup install
</pre>

### Uninstall
<pre>
sudo ./setup uninstall
</pre>

### Usage
<pre>
jssh sample.js
</pre>
and the output is:
<pre>
StarnetdeMacBook-Pro:jssh starnet$ jssh sample.js 
Hello jssh
</pre>

### History
* 1.0.0
	* Support run javascript in shell

### License
This tool follows MIT License.
	
### Contact
lvyexuwenfa100@126.com