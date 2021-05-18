# cfn-guard-docker

First clone the repo and then build the container:

```
$ docker build --rm -t steynovich/cfn-guard:latest .
```

Note: compiling the Rust dependencies might take a while

Check the version of cfn-guard:
```
$ docker run --rm -i steynovich/cfn-guard:latest --version
```

Test the rule (should return zero):
```
$ docker run --rm -i steynovich/cfn-guard:latest test --rules-file /opt/rules/s3_enc.guard --test-data /opt/tests/s3_enc.tests.yaml
$ echo $?
0
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

Finally run cfn-guard on a invalid template:
```
$ cat fail.yaml | docker run --rm -i steynovich/cfn-guard:latest validate --rules /opt/rules/
Summary Report Overall File Status = FAIL
PASS/SKIP rules
FAILED rules
s3_bucket_encryption_check    FAIL
$ echo $?
5
```

As you can see, both executions return a different exit code. You can include this as a build step in your pipelines