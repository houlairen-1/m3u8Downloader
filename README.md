# m3u8 downloader

> 针对一些视频文件不可直接下载的情况，可尝试获取m3u8链接，利用其进行下载。
>
> 该项目主要是为了节省时间，批量下载整部视频。



## 约定

- .

  - data	`ln -s src_dir data`

    - m3u8-list.csv	手动输入列表中所有视频的m3u8链接
      格式：

      ```csv
      to-do,nameid,m3u8
      ```

      ```c
      if(to-do == 1)
        ...
      else
        continue   	
      ```

    - log.md    记录执行的命令及时间

  - code

    - visit.sh	#shell script#

--------

