# cfn-guard-docker

First clone the repo and then build the container:

```
$ docker build --rm -t steynovich/cfn-guard:latest .
```

Note: compiling the Rust dependencies might take a while

```
$ docker run --rm -i steynovich/cfn-guard:latest --version
```

Now run cfn-guard on a valid template:
```
$ cat pass.yaml | docker run --rm -i steynovich/cfn-guard:latest validate --rules /opt/rules/
Summary Report Overall File Status = PASS
PASS/SKIP rules
s3_bucket_encryption_check    PASS
$ echo $?
0
```

Now run cfn-guard on a invalid template:
```
$ cat fail.yaml | docker run --rm -i steynovich/cfn-guard:latest validate --rules /opt/rules/
Summary Report Overall File Status = FAIL
PASS/SKIP rules
FAILED rules
s3_bucket_encryption_check    FAIL
$ echo $?
5
```