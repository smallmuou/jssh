# jssh

jssh(javascript shell) is a command which can run javascript in shell. This is very usefull sometimes. Like you are newer to javascript, you can directly run javascript sample in shell.

### Depend
This tool depend on java. So you need install java first.

1. goto http://www.oracle.com/technetwork/java/javase/downloads/index.html
2. download sdk

### Install
1. Online 
<pre>
curl https://raw.githubusercontent.com/smallmuou/jssh/master/online-install.sh|sudo /bin/bash

source ~/.bash_profile
</pre>

2. Manual
<pre>
git clone https://github.com/smallmuou/jssh
cd jssh
sudo bash setup.sh install
</pre>

### Uninstall
<pre>
sudo bash setup.sh uninstall
</pre>

### Usage
the sample.js like follow.
<pre>
print("Hello jssh");

print("arg0 = " + $0);
print("arg1 = " + $1);
print("arg2 = " + $2);
print("arg length = " + $n);
</pre>
and run follow command:
<pre>
jssh sample.js 123 345
</pre>
and the output is:
<pre>
Hello jssh
arg0 = sample.js
arg1 = 123
arg2 = 345
arg length = 3
</pre>

* Comment
	* arg must be less than 9.
	* $0 - the name of js file
	* $1 - arg1
	* $2 - arg2
	* $3 - arg3
	* $4 - arg4
	* $5 - arg5
	* $6 - arg6
	* $7 - arg7
	* $8 - arg8
	* $9 - arg9
	* $n - arg length

### History
* 1.1.0
	* Support argument
* 1.0.0
	* Support run javascript in shell
	* Support Linux and Darwin

### License
This tool follows MIT License.
	
### Contact
lvyexuwenfa100@126.com