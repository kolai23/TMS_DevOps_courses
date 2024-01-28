1. Создать вручную или через Packer образ VM с установленным Docker.
2. Настроить интеграцию Jenkins с GCP для создания агентов из этого образа.
3. Найти любое веб-приложение, которое мы вы хотели бы развернуть в облаке.
4. Реализовать pipeline, который:
- собирает Docker образ для приложения.
- публикует собранный образа в Google Container Registry.
- развертывает приложение в App Engine Flexible Environment из собранного образа с помощью gcloud app deploy --image-url=[HOSTNAME]/[PROJECT-ID]/[IMAGE].