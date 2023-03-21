# Plex-Export-Docker

## Notice

Based on [RXWatcher/Plex-Export-Docker](https://github.com/RXWatcher/Plex-Export-Docker) and modified for my own personal use cases.

Sorry, but I have no wish to support this project or resolve issues I don't encounter myself.  
This was one of those late-night, somewhat hacky creation to solve a problem. Don't judge the quality 👀

The repositories mentioned below have been statically included in this one to allow for quick and easy modifications. Some fixes were also copied in from [UniverseDevel's fork](https://github.com/UniverseDevel/Plex-Export).  
As a result, no fixes will be automatically included in image rebuilds.  
Probably not a worry, though, as they've not been touched in some time.

---

A dockerized version of [Dachande663/Plex-Export](https://github.com/Dachande663/Plex-Export) with [dpDesignz/plex-export-responsive-skin](https://github.com/dpDesignz/plex-export-responsive-skin)

## Summary
This is a dockerized version of [Dachande663/Plex-Export](https://github.com/Dachande663/Plex-Export)

> Plex Export allows you to produce an HTML page with information on the media contained within your Plex library. This page can then be shared publicly without requiring access to the original Plex server.

The container is based on the php:alpine image.

## How to use

```sh
docker run --name plex-export \
  -p 8000:8080 \
  -v ./plexexport-data:/data \
  -e PLEX_URL=http://YourPlexIP:32400 \
  -e PLEX_TOKEN=YourPlexToken \
  ghcr.io/tigattack/plex-export:latest
```

## Environment variables

| Name| Optional| Default value|
| ------ | ------ |------ |
| PLEX_URL|  No| / |
| PLEX_TOKEN| No | / |
| PLEX_SECTIONS| Yes | all |
| PLEX_SORT_SKIP_WORDS | Yes | "" |
| CRON_SCHEDULE| Yes | `0 * * * *` |

#### PLEX_URL
It's recommended to use the internal URL in the format: `http://Plex_Meida_Server_IP:Port`
> ```sh 
> PLEX_URL=http://192.168.1.100:32400
> ```

#### PLEX_TOKEN
The token to authenticate Plex-Export with your Plex Media Server
> ```sh 
> PLEX_TOKEN=XXX
> ```
> To find the token visit https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token


#### PLEX_SECTIONS
The Plex-libraries you want to display
> E.g.: You have three libraries Movies, Tvshows and Videos, but you only want to display Movies and Tvshows.
> ```sh 
> PLEX_SECTIONS=Movies,Tvshows
> # Or refer to the libraries by ID:
> PLEX_SECTIONS=1,2
> ```

#### PLEX_SORT_SKIP_WORDS 
If you want to leave out certain words like "the" or "a" when sorting the website.
> ```sh 
> PLEX_SORT_SKIP_WORDS=a,the
> ```

#### CRON_SCHEDULE
Sets the interval on how often the website is refreshed. 
**WARNING:** Setting this option on a low value can cause strain on your server!

Use cron syntax.

> ```sh
> CRON_SCHEDULE="0 * * * *" # Every hour
```