# image-serve

Образ для практической работы по Yandex practicum

## Description

Приложение `image-serve` написано на Go. Это HTTP-сервер для обслуживания запросов на получение файлов. Имя каталога, в котором он будет искать файлы, можно задать аргументом командной строки `image_path` (по умолчанию это `/data/images/`).

## Examples
Приложение image-serve должно отдавать файл, являющийся результатом работы `image-compress`:
```shell

curl -o compressed_x0p7mlw0.PNG http://localhost:18080/?image=compressed_umpesl1d.PNG
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  2259  100  2259    0     0   136k      0 --:--:-- --:--:-- --:--:--  137k 
```


