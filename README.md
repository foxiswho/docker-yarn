# docker-yarn
docker yarn

```bash
docker run -it --rm --name -p 4000:4000 yarn -v www_app:/root/app
```

> www_app : 为你的项目目录
> /root/app : 容器内部目录
> 容器默认端口号: 4000
> 

# package 文件配置

package 中 `scripts` 内，必须增加 `"bestart": "vite --mode development"` 配置，yarn 默认启动命令为 `yarn bestart`

```json
{
  "scripts": {
    "bestart": "vite --mode development"
  }
}
```
