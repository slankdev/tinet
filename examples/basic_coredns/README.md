
# CoreDNS example

```
docker exec R1 dig -b 10.0.0.1 slank.dev +short
docker exec R1 dig -b 10.0.0.2 slank.dev +short

docker exec R1 dig -b 10.0.0.2 slank.dev
docker exec R1 dig -b 10.0.0.2 test1.ichihara.org
docker exec R1 dig -b 10.0.0.2 test2.ichihara.org
docker exec R1 dig -b 10.0.0.2 www.vim.org
docker exec R1 dig -b 10.0.0.2 emacs.org
docker exec R1 dig -b 10.0.0.2 sublimetext.com
```
