# nginx_testing
Test whether your configuration file of NGINX is working properly.

All runtime envirnment is constructed by Docker:

    - Ubuntu: 20.04
    - Python: 3.8
    - Flask: latest
    - uWSGI: latest
    - NGINX: latest

Testing tool:

- [go-stress-testing](https://github.com/link1st/go-stress-testing)

Because the pure purpose of this project is to test the nginx config file, Flask in this project does nothing, except accepting all request comming from NGINX and return 'ok' and status code '200'.

-------

start:
```bash
>>> docker-compose up -d
```

stop/remove:
```bash
>>> docker-compose down --rmi all
```

run test:
```
>>> docker exec -i -t nginx_testing_1.0 /bin/bash
# cd 2021-03-25
# ./run.sh
```
output:
```
Restarted supervisord

 开始启动  并发数:7 请求数:2 请求参数: 
request:
 form:http 
 url:http://127.0.0.1:8964/pid/1/production_page 
 method:GET 
 headers:map[X-DeliverId:123 X-Signature:123] 
 data: 
 verify:statusCode 
 timeout:30s 
 debug:false 



─────┬───────┬───────┬───────┬────────┬────────┬────────┬────────┬────────┬────────┬────────
 耗时│ 并发数│ 成功数│ 失败数│   qps  │最长耗时│最短耗时│平均耗时│下载字节│字节每秒│ 错误码
─────┼───────┼───────┼───────┼────────┼────────┼────────┼────────┼────────┼────────┼────────
   1s│      6│      5│      3│   17.18│  804.22│    0.66│  407.38│     628│     627│200:5;503:3
   2s│      7│     10│      3│    9.96│ 1002.64│    0.66│  702.95│     638│     318│200:10;503:3
   2s│      7│     11│      3│    9.59│ 1002.64│    0.66│  730.03│     640│     318│200:11;503:3


*************************  结果 stat  ****************************
处理协程数量: 7
请求总数（并发数*请求数 -c * -n）: 14 总请求时间: 2.007 秒 successNum: 11 failureNum: 3
*************************  结果 end   ****************************
```
DIY test:
I believe you can make it!

If you want to test from outside the container, you can through the port 8964.